package com.xz.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WebService {
	@Autowired  
	private JdbcTemplate jdbcTemplate; 
	
	public List<Map<String, Object>> getUserInfoByNameandPwd(String name,String pwd){
		String sql = "  select * from web_user_login where user_name = ? and user_password = ? and is_delete =0";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,name,pwd);
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}
	
	
}
