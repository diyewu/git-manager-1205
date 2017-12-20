package com.xz.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Joiner;
import com.xz.common.ServerResult;
import com.xz.entity.AppMenu;

@Service
@Transactional
public class WebAndAppService {
	
	@Autowired  
	private JdbcTemplate jdbcTemplate; 
	
	public List<Map<String, Object>> getUserInfoByNameandPwd(String name,String pwd){
		String sql = "  select * from web_user_login where user_name = ? and user_password = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,name,pwd);
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}
	public int checkPhoneId(String phoneId,int allowSize,String webUserId){
		int code = 0;
		String sql = "select * from web_user_login_phone where web_user_id = ?";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,webUserId);
		//第一次使用,新增记录
		String insertSql = " insert into web_user_login_phone(phone_id,web_user_id,create_date)values(?,?,NOW()) ";
		if(list == null || list.size() == 0){
			jdbcTemplate.update(insertSql,phoneId,webUserId);
		}else{//当前存在记录
			boolean containPhoneId = false;
			int nowSize = list.size();
			if(nowSize == allowSize){
				for(int i=0;i<nowSize;i++){
					if(phoneId.equals(list.get(i).get("phone_id"))){
						containPhoneId = true;
						break;
					}
				}
				if(!containPhoneId){
					code = ServerResult.RESULT_CHECK_PHONE_ERROE;
				}
			}else if(nowSize < allowSize){
				jdbcTemplate.update(insertSql,phoneId,webUserId);
			}
		}
		return code;
	}
	
	
	
	public List<AppMenu> getMenu(String roleId){
		StringBuilder sb = new StringBuilder();
		sb.append(" select a.id,	a.menu_name,	a.parent_id,	a.leaf	,b.web_user_role_id as is_check from ");
		sb.append(" (SELECT	id,	pac.attribute_condition AS menu_name,	pac.attribute_id AS parent_id,	pac.leaf,	pac.id AS is_check FROM 	project_attribute_condition pac  ");
		sb.append(" union  ");
		sb.append(" SELECT id,	pa.attribute_name AS menu_name,		pa.project_id AS parent_id,		0 AS leaf,		pa.id AS is_check	FROM 		project_attribute pa	WHERE		pa.attribute_active = 1 ");
		sb.append(" union  ");
		sb.append(" SELECT id,	pm.project_name AS menu_name,	NULL AS parent_id,	0 AS leaf,	pm.id AS is_check	FROM	project_main pm	 ");
		sb.append(" )a left JOIN (  ");
		sb.append(" select * from project_condition_auth pca 	where pca.web_user_role_id = ?  ");
		sb.append(" ) b on a.id = b.condition_id where a.is_check is not null ORDER BY a.id DESC  ");
//		List<Map<String, Object>> list = jdbcTemplate.queryForList(sb.toString(),roleId);
		List<AppMenu> list = (List<AppMenu>)jdbcTemplate.query(sb.toString(), new AppMenuRowMapper(),roleId);
		return list;
	}
	
	public static class AppMenuRowMapper implements RowMapper<AppMenu> {
		@Override
		public AppMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
			AppMenu tree = new AppMenu();
			tree.setId(rs.getString("id"));
			tree.setMenuName(rs.getString("menu_name"));
			tree.setParent_id(rs.getString("parent_id"));
			tree.setLeaf(rs.getInt("leaf")==0?false:true );
			tree.setChecked(rs.getString("is_check") == null?false:true);
			return tree;
		}
	}
	
	public List<Map<String,Object>> getMapInfo(String projectId,Map<String,List<String>> param){
		String attriSql = " select attribute_index from project_attribute where id = ? ";
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		StringBuilder sb = new StringBuilder();
		String attriAllSql = " select pa.attribute_name,pat.alias_name,pa.attribute_index"
				+ " from project_attribute pa left join project_attribute_type pat"
				+ " on pa.attribute_type = pat.id where pa.project_id = ? ";
		List<Map<String, Object>> attributeList = jdbcTemplate.queryForList(attriAllSql, projectId);
		if(attributeList == null || attributeList.size() == 0){
			return null;
		}
		List<String> conditionIdList = new ArrayList<String>();
		if (param != null && param.size() > 0) {
			String tempSql = "";
			sb.append(" select ");
			String aliasName = "";
			for (int i = 0; i < attributeList.size(); i++) {
				aliasName = (String)attributeList.get(i).get("alias_name");
				if(StringUtils.isNotBlank(aliasName)){
					if("detail_address".equals(aliasName) || "latitude".equals(aliasName) || "longitude".equals(aliasName) ){
						sb.append(" pd.ext"+attributeList.get(i).get("attribute_index") +" as " + aliasName +",");
					}
				}
			}
			sb.append(" pd.id ");
			sb.append(" from project_detail  pd ");
			sb.append(" where project_id = ? ");
			for (Map.Entry<String,List<String>> entry : param.entrySet()) {  
//				sb = new StringBuilder();
//			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
				list = jdbcTemplate.queryForList(attriSql, entry.getKey());
				tempSql = "and ext_index in(select attribute_condition from project_attribute_condition where id in (?) )";
			    if(list != null && list.size()>0){
			    	tempSql = tempSql.replace("_index", list.get(0).get("attribute_index")+"");
			    	conditionIdList = entry.getValue();
			    	if(conditionIdList != null && conditionIdList.size()>0){
			    		tempSql = tempSql.replace("?", Joiner.on(",").join(conditionIdList));
			    		sb.append(tempSql);
//			    		sqlParam.add(Joiner.on(",").join(conditionIdList));
			    	}
			    }
			}
			resultList = jdbcTemplate.queryForList(sb.toString(), projectId);
			if(resultList != null && resultList.size()>0){
				Map<String, Object> resultmap = new HashMap<String, Object>();
				String longitude = "";
				String latitude = "";
				String key = "";
				DecimalFormat df = new DecimalFormat("#.00");
				double longitudeF = 0;
				double latitudeF = 0;
				Set<String> set = new HashSet<String>();
				
				for (int i = 0; i < resultList.size(); i++) {
					resultmap = resultList.get(i);
					longitude = resultmap.get("longitude")+"";
					latitude = resultmap.get("latitude")+"";
					try {
						longitudeF = Double.parseDouble(longitude);
						latitudeF = Double.parseDouble(latitude);
					} catch (Exception e) {
						e.printStackTrace();
						continue;
					}
					key = df.format(longitudeF) +","+ df.format(latitudeF);
					set.add(key);
				}
				Map<String,Object> tMap = new HashMap<String, Object>();
				List<String> dList = new ArrayList<String>();
				for (int i = 0; i < resultList.size(); i++) {
					resultmap = resultList.get(i);
					longitude = resultmap.get("longitude")+"";
					latitude = resultmap.get("latitude")+"";
					try {
						longitudeF = Double.parseDouble(longitude);
						latitudeF = Double.parseDouble(latitude);
					} catch (Exception e) {
						e.printStackTrace();
						continue;
					}
					key = df.format(longitudeF) +","+ df.format(latitudeF);
					for(String setkey:set){
						dList = new ArrayList<String>();
						if(setkey.equals(key)){
							if(tMap.containsKey(setkey)){
								dList = (List<String>) tMap.get(setkey);
								dList.add(resultmap.get("id")+"");
							}else{
								dList.add(resultmap.get("id")+"");
								tMap.put(setkey, dList);
							}
						}
					}
				}
				if(tMap != null && !tMap.isEmpty()){
					Map<String,Object> sMap = new HashMap<String, Object>();
					List<Map<String,Object>> sList = new ArrayList<Map<String,Object>>();
					for (Map.Entry<String,Object> entry : tMap.entrySet()) {
//						System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
						String[] ads = entry.getKey().split(",");
						longitude = ads[0];
						latitude = ads[1];
						sMap.put("longitude", longitude);
						sMap.put("latitude", latitude);
						sMap.put("id", StringUtils.join((List<String>)entry.getValue(), ","));
						sMap.put("detail_address", "");
						sList.add(sMap);
						sMap = new HashMap<String, Object>();
					}
					return sList;
				}
			}
		}
		return null;
	}
	
	
	public List<Map<String, Object>> getMapInfo_bak(String projectId,Map<String,List<String>> param){
		String attriSql = " select attribute_index from project_attribute where id = ? ";
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		StringBuilder sb = new StringBuilder();
		String attriAllSql = " select pa.attribute_name,pat.alias_name,pa.attribute_index"
				+ " from project_attribute pa left join project_attribute_type pat"
				+ " on pa.attribute_type = pat.id where pa.project_id = ? ";
		List<Map<String, Object>> attributeList = jdbcTemplate.queryForList(attriAllSql, projectId);
		if(attributeList == null || attributeList.size() == 0){
			return null;
		}
		List<String> conditionIdList = new ArrayList<String>();
		if (param != null && param.size() > 0) {
			String tempSql = "";
			sb.append(" select ");
			String aliasName = "";
			for (int i = 0; i < attributeList.size(); i++) {
				aliasName = (String)attributeList.get(i).get("alias_name");
				if(StringUtils.isNotBlank(aliasName)){
					if("detail_address".equals(aliasName) || "latitude".equals(aliasName) || "longitude".equals(aliasName) ){
						sb.append(" pd.ext"+attributeList.get(i).get("attribute_index") +" as " + aliasName +",");
					}
				}
			}
			sb.append(" pd.id ");
			sb.append(" from project_detail  pd ");
			sb.append(" where project_id = ? ");
			List<Object> sqlParam = new ArrayList<Object>();
			for (Map.Entry<String,List<String>> entry : param.entrySet()) {  
//				sb = new StringBuilder();
//			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
				list = jdbcTemplate.queryForList(attriSql, entry.getKey());
				tempSql = "and ext_index in(select attribute_condition from project_attribute_condition where id in (?) )";
			    if(list != null && list.size()>0){
			    	tempSql = tempSql.replace("_index", list.get(0).get("attribute_index")+"");
			    	conditionIdList = entry.getValue();
			    	if(conditionIdList != null && conditionIdList.size()>0){
			    		tempSql = tempSql.replace("?", Joiner.on(",").join(conditionIdList));
			    		sb.append(tempSql);
//			    		sqlParam.add(Joiner.on(",").join(conditionIdList));
			    	}
			    }
			}
			resultList = jdbcTemplate.queryForList(sb.toString(), projectId);
			if(resultList != null && resultList.size()>0){
				return resultList;
			}
		}
		return null;
	}
	
	public List<Map<String, Object>> getCoordinateInfo(String detailId){
		String attrSql = " SELECT pat.alias_name, attribute_index FROM project_attribute_type pat LEFT JOIN ( SELECT * FROM project_attribute WHERE project_id = ( SELECT project_id FROM project_detail WHERE id = ? )) pa ON pa.attribute_type = pat.id WHERE pat.alias_name IS NOT NULL ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(attrSql, detailId);
		if(list == null || list.size()==0){
			return null;
		}
		Map<String, Object> attrMap = new HashMap<String, Object>();
		StringBuilder sb = new StringBuilder();
		sb.append(" select ");
		for (int i = 0; i < list.size(); i++) {
			attrMap = list.get(i);
			if(StringUtils.isNotBlank(attrMap.get("attribute_index")==null?null:attrMap.get("attribute_index")+"")){
				sb.append(" ext"+attrMap.get("attribute_index")+" as "+attrMap.get("alias_name")+",");
			}else{
				sb.append(" 'null' as "+attrMap.get("alias_name")+",");
			}
		}
		sb.append(" id from project_detail where id = ? ");
		return jdbcTemplate.queryForList(sb.toString(), detailId);
	}
	
	
}
