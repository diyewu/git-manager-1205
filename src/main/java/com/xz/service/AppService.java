package com.xz.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Joiner;
import com.xz.common.ServerResult;
import com.xz.entity.AppMenu;
import com.xz.entity.AreaBean;
import com.xz.model.json.JsonModel;

@Service
@Transactional
public class AppService {
	
	@Autowired  
	private JdbcTemplate jdbcTemplate; 
	
	private static List<String> keyList = new ArrayList<String>();
	private static Map<String,String> lvlMap = new HashMap<String, String>();
	private static Map<String,String> preMap = new HashMap<String, String>();
	private static Map<Integer,Integer> levelMap = new HashMap<Integer,Integer>();
	static{
		keyList.add("research_no");
		keyList.add("question_type");
		keyList.add("longitude");
		keyList.add("latitude");
		levelMap.put(1, 2);
		levelMap.put(2, 4);
		levelMap.put(3, 6);
		levelMap.put(4, 9);
		levelMap.put(5, 12);
		
		
		
		
		
		
		
		
		lvlMap.put("first_area", "second_area");
		lvlMap.put("second_area", "third_area");
		lvlMap.put("third_area", "forth_area");
		
		preMap.put("second_area", "first_area");
		preMap.put("third_area", "second_area");
		preMap.put("forth_area", "third_area");
	}
	public static Map<String,List<Map<String, Object>>> cacheMap = new HashMap<String, List<Map<String,Object>>>();
	
	public List<Map<String, Object>> getUserInfoByNameandPwd(String name,String pwd){
		String sql = "  select * from web_user_login where user_name = ? and user_password = ? and is_delete = 0 ";
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
	
	public List<AppMenu> getMenulist(String roleId){
		List<AppMenu> newList = new ArrayList<AppMenu>();
		List<AppMenu>  l = new ArrayList<AppMenu>();
		l = this.getMenu(roleId);
		Map<String,AppMenu> map = new LinkedHashMap<String,AppMenu>(); 
		Map<String,AppMenu> map1 = new LinkedHashMap<String,AppMenu>(); 
		for(AppMenu t:l){//list转换成map
			map.put(t.getId(), t);
			map1.put(t.getId(), t);
		}
		AppMenu c1 = null;
		AppMenu c2 = null;
		Iterator it = map.keySet().iterator();//遍历map
		while (it.hasNext()) {
			c1 = new AppMenu();
			c1 = map.get(it.next());
			if(c1.getId() == null ||"null".equals(c1.getId())){//第一级节点
				
			}else{
				if(map1.containsKey(c1.getParent_id())){//
					c2 = new AppMenu();
					c2 = map1.get(c1.getParent_id());
					if(c2.getChildren() != null){
						c2.getChildren().add(c1);
					}else{
						List<AppMenu> childrens = new ArrayList<AppMenu>();
						childrens.add(c1);
						c2.setChildren(childrens);
					}
					map1.remove(c1.getId());
				}
			}
		}
		
		Iterator i = map1.keySet().iterator();
		while (i.hasNext()) {
			newList.add((AppMenu)map.get(i.next()));
		}
		return newList;
	}
	
	
	public List<AppMenu> getMenu(String roleId){
		StringBuilder sb = new StringBuilder();
		sb.append(" select a.id,	a.menu_name,	a.parent_id,	a.leaf	,b.web_user_role_id as is_check from ");
		sb.append(" (SELECT	id,	pac.attribute_condition AS menu_name,	pac.attribute_id AS parent_id,	pac.leaf,	pac.id AS is_check FROM 	project_attribute_condition pac  ");
		sb.append(" union  ");
		sb.append(" SELECT id,	pa.attribute_name AS menu_name,		pa.project_id AS parent_id,		0 AS leaf,		pa.id AS is_check	FROM 		project_attribute pa	WHERE		pa.attribute_active = 1 ");
		sb.append(" union  ");
		sb.append(" SELECT id,	pm.project_name AS menu_name,	NULL AS parent_id,	0 AS leaf,	pm.id AS is_check	FROM	project_main pm	 ");
		sb.append(" )a inner JOIN (  ");
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
	
	public List<Map<String,Object>> getMapInfo(String projectId,Map<String,
			List<String>> param,String cacheKey,String currentLevel){
		if(StringUtils.isBlank(cacheKey)){
			String attriSql = " select attribute_index from project_attribute where id = ? ";
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
			StringBuilder sb = new StringBuilder();
			String attriAllSql = " select pa.attribute_name,pat.alias_name,pa.attribute_index"
					+ " from project_attribute pa left join project_attribute_type pat"
					+ " on pa.attribute_type = pat.id and pat.type = 0 where pa.project_id = ? ORDER BY pat.id ";
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
						/**
						 * keyList={first_area,second_area,third_area,forth_area,latitude,longitude}
						 */
						if(keyList.contains(aliasName)){
							sb.append(" pd.ext"+attributeList.get(i).get("attribute_index") +" as " + aliasName +",");
						}
					}
				}
				sb.append(" pd.id ");
				sb.append(" from project_detail  pd ");
				sb.append(" where project_id = ? ");
				for (Map.Entry<String,List<String>> entry : param.entrySet()) {  
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
					String tkey = UUID.randomUUID().toString().replaceAll("-", "");
					cacheMap.put(tkey, resultList);
					List<Map<String, Object>> cod = generateCod(null,resultList,tkey,currentLevel);
					return cod;
				}
			}
		}else{
			List<Map<String, Object>> cod = generateCod(null,cacheMap.get(cacheKey),cacheKey,currentLevel);
			return cod;
		}
		return null;
	}
	public List<Map<String,Object>> generateCod(String currentKey,List<Map<String, Object>> resultList,
			String cacheKey,String currentLevel ){
		Map<String,AreaBean> areaMap = new HashMap<String, AreaBean>();
		int currentLevelInt = Integer.parseInt(currentLevel);
		AreaBean areaBean = new AreaBean();
		double longitudeF = 0;
		double latitudeF = 0;
		Map<String, Object> resultmap = new HashMap<String, Object>();
		List<Map<String,Object>> sList = new ArrayList<Map<String,Object>>();
		Map<String, Object> smap = new HashMap<String, Object>();
		String researchNo = "";
		String tempKey = "";
		String nextLevelKey = "";
		String id = "";
		for (int i = 0; i < resultList.size(); i++) {
			areaBean = new AreaBean();
			resultmap = resultList.get(i);
			if(resultmap.containsKey("research_no")){
				researchNo = resultmap.get("research_no")+"";
				if(StringUtils.isNotBlank(currentKey)){//从第二级开始
					tempKey = StringUtils.substring(researchNo, 0, levelMap.get(currentLevelInt));
					if(currentLevelInt != 5){//2.3.4
						if(currentKey.equals(tempKey)){//匹配,找下一级
							nextLevelKey = StringUtils.substring(researchNo, 0, levelMap.get(currentLevelInt+1));
							id = resultmap.get("id")+"";
							try {
								longitudeF = resultmap.get("longitude")==null?0:Double.parseDouble(resultmap.get("longitude")+"");
								latitudeF = resultmap.get("latitude")==null?0:Double.parseDouble(resultmap.get("latitude")+"");
							} catch (Exception e) {}
							if(longitudeF == 0 || latitudeF == 0){
								continue;
							}
							if(areaMap.containsKey(nextLevelKey)){
								areaBean = areaMap.get(nextLevelKey);
								areaBean.setTotalLongitude(areaBean.getTotalLongitude()+longitudeF);
								areaBean.setTotalLatitude(areaBean.getTotalLatitude()+latitudeF);
								areaBean.setCount(areaBean.getCount()+1);
								areaBean.setIds(areaBean.getIds()+","+id);
							}else{
								areaBean.setTotalLongitude(longitudeF);
								areaBean.setTotalLatitude(latitudeF);
								areaBean.setCount(1);
								areaBean.setIds(id);
							}
							areaMap.put(nextLevelKey, areaBean);
						}else{
							continue;
						}
					}else{//第五级
						if(currentKey.equals(tempKey)){//匹配,找下一级
							try {
								longitudeF = resultmap.get("longitude")==null?0:Double.parseDouble(resultmap.get("longitude")+"");
								latitudeF = resultmap.get("latitude")==null?0:Double.parseDouble(resultmap.get("latitude")+"");
							} catch (Exception e) {}
							if(longitudeF == 0 || latitudeF == 0){
								continue;
							}
							smap = new HashMap<String, Object>();
							smap.put("key",resultmap.get("question_type") );
							smap.put("currentLevel", currentLevelInt+1);
							smap.put("nextLevel", "");
							smap.put("preKey", currentKey);
							smap.put("preLevel", currentLevelInt);
							smap.put("cacheKey", cacheKey);
							smap.put("text", "问题分类:"+resultmap.get("question_type"));
							smap.put("longitude", longitudeF);
							smap.put("latitude", latitudeF);
							smap.put("ids", resultmap.get("id"));
							smap.put("totalitem", 1);
							sList.add(smap);
						}
					}
				}else{//第一级
					tempKey = StringUtils.substring(researchNo, 0, levelMap.get(currentLevelInt+1));
					id = resultmap.get("id")+"";
					try {
						longitudeF = resultmap.get("longitude")==null?0:Double.parseDouble(resultmap.get("longitude")+"");
						latitudeF = resultmap.get("latitude")==null?0:Double.parseDouble(resultmap.get("latitude")+"");
					} catch (Exception e) {}
					if(longitudeF == 0 || latitudeF == 0){
						continue;
					}
					if(areaMap.containsKey(tempKey)){
						areaBean = areaMap.get(tempKey);
						areaBean.setTotalLongitude(areaBean.getTotalLongitude()+longitudeF);
						areaBean.setTotalLatitude(areaBean.getTotalLatitude()+latitudeF);
						areaBean.setCount(areaBean.getCount()+1);
						areaBean.setIds(areaBean.getIds()+","+id);
					}else{
						areaBean.setTotalLongitude(longitudeF);
						areaBean.setTotalLatitude(latitudeF);
						areaBean.setCount(1);
						areaBean.setIds(id);
					}
					areaMap.put(tempKey, areaBean);
				}
			}else{
				break;
			}
		}
		if(currentLevelInt != 5){
			if(areaMap != null && !areaMap.isEmpty()){
				Map<String,Object> sMap = new HashMap<String, Object>();
				for (Map.Entry<String,AreaBean> entry : areaMap.entrySet()) {
					areaBean = new AreaBean();
					areaBean = entry.getValue();
					sMap.put("key", entry.getKey());
					if(StringUtils.isNotBlank(currentKey)){
						sMap.put("currentLevel", currentLevelInt+1);
						sMap.put("nextLevel", currentLevelInt+2);
						sMap.put("preKey", StringUtils.substring(currentKey, 0,levelMap.get(currentLevelInt)));
						sMap.put("preLevel", currentLevelInt);
					}else{
						sMap.put("currentLevel", 1);
						sMap.put("nextLevel", 2);
						sMap.put("preKey", "");
						sMap.put("preLevel", 0);
					}
					sMap.put("cacheKey", cacheKey);
					sMap.put("text", entry.getKey());
					sMap.put("longitude", areaBean.getTotalLongitude()/areaBean.getCount());
					sMap.put("latitude", areaBean.getTotalLatitude()/areaBean.getCount());
					sMap.put("ids", areaBean.getIds());
					sMap.put("totalitem", areaBean.getCount());
					sList.add(sMap);
					sMap = new HashMap<String, Object>();
				}
			}
//			System.out.println(sList);
		}
		return sList;
	}
	public List<Map<String, Object>> turnback(String cacheKey,String key,String currentLevel){
		List<Map<String, Object>> resultList = cacheMap.get(cacheKey);
		Map<String, Object> map = new HashMap<String, Object>();
		int currentLevelInt = Integer.parseInt(currentLevel);
		String fatherKey = "";
		int fatherLvl = currentLevelInt - 1;
		String tempKey = "";
		String researchNo = "";
		for(int i=0;i<resultList.size();i++){
			map = resultList.get(i);
			researchNo = map.get("research_no")+"";
			tempKey = StringUtils.substring(researchNo, 0, levelMap.get(currentLevelInt));
			if(key.equals(tempKey)){
				if(fatherLvl != 0){
					fatherKey = StringUtils.substring(researchNo, 0, levelMap.get(fatherLvl));
				}else{
					fatherKey = "";
				}
				break;
			}
		}
		List<Map<String, Object>> list = this.generateCod(fatherKey, resultList, cacheKey, fatherLvl+"");
		return list;
	}
	
	
	
	public List<Map<String,Object>> getMapInfo_bak20180102(String projectId,Map<String,List<String>> param){
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
//						e.printStackTrace();
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
//						e.printStackTrace();
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
	
	/**
	 * status  is_check
	 * @param projectArray
	 * @param checkFlag
	 * @return
	 */
	public List<Map<String, Object>> analyzeJson(JSONArray projectArray,String checkFlag){
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String projectId = "";
		Map<String,List<String>> param = new HashMap<String, List<String>>();
		List<String> conditionList = new ArrayList<String>();
		boolean projectStatus = false;
		boolean attrStatus = false;
		boolean detailStatus = false;
		for (int k = 0; k < projectArray.size(); k++) {
			param = new HashMap<String, List<String>>();
			JSONObject jsonObject = projectArray.getJSONObject(k);
			if("status".equals(checkFlag)){
				projectStatus =jsonObject.containsKey(checkFlag)?(Boolean) jsonObject.get(checkFlag):false;
			}else{
//				projectStatus = jsonObject.containsKey(checkFlag)?(Boolean) jsonObject.get(checkFlag):false;
				projectStatus = true;
			}
			if(projectStatus){
				projectId = jsonObject.get("id")+"";
				JSONArray array = jsonObject.getJSONArray("children");
				if(array != null && array.size()>0){
					for (int i = 0; i < array.size(); i++) {
						conditionList = new ArrayList<String>();
						JSONObject attrObject = array.getJSONObject(i);
						if("status".equals(checkFlag)){
							attrStatus = attrObject.containsKey(checkFlag)?(Boolean) attrObject.get(checkFlag):false;
						}else{
							attrStatus = true;
						}
						if(attrStatus){
							String AttriId = attrObject.getString("id");
							JSONArray conditionArray = attrObject.getJSONArray("children");
							for(int m =0;m<conditionArray.size();m++){
								JSONObject conditionObject = conditionArray.getJSONObject(m);
//								conditionList.add(conditionObject.get("condition_id")+"");
								if("status".equals(checkFlag)){
									detailStatus = conditionObject.containsKey(checkFlag)?(Boolean) conditionObject.get(checkFlag):false;
								}else{
									detailStatus = true;
								}
								if(detailStatus){
									conditionList.add(conditionObject.get("id")+"");
								}
							}
							if (conditionList != null && conditionList.size() > 0) {
								param.put(AttriId, conditionList);
							}
						}
					}
				}
				if (param != null && param.size() > 0) {
					list = this.getMapInfo(projectId, param, null,"0");
					if (list != null && list.size() > 0) {
						info.addAll(list);
					}
				}
			}
		}
		return info;
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
	
	
	public List<Map<String, Object>> getCoordinateInfoByIds(String coordinateId){
		List<String> coordinateIdList = new ArrayList<String>();
		if(coordinateId.contains(",")){
			coordinateIdList = Arrays.asList(coordinateId.split(","));  
		}else{
			coordinateIdList.add(coordinateId);
		}
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> resplist = new ArrayList<Map<String,Object>>();
		for(String id:coordinateIdList){
			list = this.getCoordinateInfo(id);
			resplist.addAll(list);
		}
		return resplist;
	}
	
	
	public List<Map<String, Object>> getCoordinateInfo(String detailId){
		String attrSql = " SELECT pa.id, pat.alias_name, pa.attribute_index, pa.attribute_name FROM project_attribute_type pat LEFT JOIN ( SELECT * FROM project_attribute WHERE project_id = ( SELECT project_id FROM project_detail WHERE id = ? )) pa ON pa.attribute_info_type = pat.id WHERE pat.type = 1 ORDER BY alias_name; ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(attrSql, detailId);
		if(list == null || list.size()==0){
			return null;
		}
		Map<String, Object> attrMap = new HashMap<String, Object>();
		StringBuilder sb = new StringBuilder();
		sb.append(" select ");
		for (int i = 0; i < list.size(); i++) {
			attrMap = list.get(i);
			if(attrMap.get("attribute_name") != null && StringUtils.isNotBlank(attrMap.get("attribute_name")+"")){
				sb.append(" ext"+attrMap.get("attribute_index")+" as "+attrMap.get("alias_name")+"_key,");
				sb.append("'"+attrMap.get("attribute_name")+"' as "+attrMap.get("alias_name")+"_value,");
			}else{
				sb.append(" 'null' as "+attrMap.get("alias_name")+"_key,");
				sb.append("'null' as "+attrMap.get("alias_name")+"_value,");
			}
		}
		sb.append(" id from project_detail where id = ? ");
		return jdbcTemplate.queryForList(sb.toString(), detailId);
	}
	public List<Map<String, Object>> getCoordinateInfo_bak20180107(String detailId){
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
	
	
	public List<Map<String, Object>> getImgPath(String id){
		String sql = " select img_path from project_detail where id = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, id);
		return list;
	}
	
	
}
