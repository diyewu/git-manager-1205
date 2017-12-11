package com.xz.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Joiner;

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
	
	
	public List<Map<String, Object>> getMenu(String roleId){
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
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sb.toString(),roleId);
		return list;
	}
	
	public List<Map<String, Object>> getMapInfo(String projectId,Map<String,List<String>> param){
		String attriSql = " select attribute_index from project_attribute where id = ? ";
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		StringBuilder sb = new StringBuilder();
		List<String> conditionIdList = new ArrayList<String>();
		if (param != null && param.size() > 0) {
			String tempSql = "";
			sb.append(" select pd.* from project_detail  pd ");
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
	
	
}
