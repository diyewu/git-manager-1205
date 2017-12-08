package com.xz.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xz.common.Page;
import com.xz.entity.CategoryTreeBeanCk;
import com.xz.entity.ModuleStoreBean;
import com.xz.entity.UserLogin;
import com.xz.entity.UserRole;
import com.xz.service.UserService.CategoryTreeBeanCKRowMapper;
import com.xz.service.UserService.ModuleStoreBeanRowMapper;
import com.xz.service.UserService.UserRoleRowMapper;

@Service
@Transactional
public class WebUserService {
	
	@Autowired  
	private JdbcTemplate jdbcTemplate; 
	
	
	
	public List<CategoryTreeBeanCk> getTreeCKListAuthDo(String roleId) {//赋予权限
		List<CategoryTreeBeanCk> list = new ArrayList();
//		String sql = " select * from user_menu ORDER BY id desc ";
		StringBuilder sb = new StringBuilder();
		sb.append(" select a.id,a.parent_id,a.menu_url,a.menu_name,a.button,a.auth_leaf as leaf,b.menu_id as is_check ");
		sb.append(" from user_menu a left join (select menu_id from user_auth where role_id = ?) b on  a.id = b.menu_id ORDER BY id desc ");
		list = (List<CategoryTreeBeanCk>)jdbcTemplate.query(sb.toString(), new CategoryTreeBeanCKRowMapper(),roleId);
		return list;
	}
	public List<UserRole> getRoleList(Map<String, String> condition,StringBuilder sb){
		List<UserRole> list = new ArrayList<UserRole>();
		List<Object> params = new ArrayList<Object>();
		StringBuilder sbud = new StringBuilder(" select * from web_user_role where is_delete = 0 ");
		if (!condition.isEmpty()) { 
			if (condition.containsKey("roleName")) {
				sbud.append(" and role_name like ?");
				params.add("%"+condition.get("roleName")+"%");
			}
			list = (List<UserRole>) jdbcTemplate.query(sbud.toString(), new UserRoleRowMapper(), params.toArray(new Object[params.size()]));
			sb.append(list.size());
			if (condition.containsKey("start") && condition.containsKey("limit")) {
				sbud.append(" LIMIT ?,? ");
				int start = Integer.parseInt(condition.get("start"));
				int limit = Integer.parseInt(condition.get("limit"));
				params.add(start);
				params.add(limit);
			}
		}
		list = new ArrayList<UserRole>();
		list = (List<UserRole>) jdbcTemplate.query(sbud.toString(), new UserRoleRowMapper(), params.toArray(new Object[params.size()]));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	
	public Page<Map<String, Object>> getConsoleUserList(Map<String, String> condition){
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(0, 1000, false);
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		StringBuilder sbud = new StringBuilder("select a.id,a.user_name,a.user_password,a.is_delete,a.user_role as user_role_id,b.role_name as user_role,is_allow_weblogin from web_user_login a left join web_user_role b on a.user_role = b.id where 1 = 1 and a.is_delete = 0 and b.is_delete = 0 ");
		if (!condition.isEmpty()) { 
			if (condition.containsKey("userName")) {
				sbud.append(" and a.user_name like ?");
				params.add("%"+condition.get("userName")+"%");
			}
			if(condition.containsKey("userRole")){
				sbud.append(" and a.user_role = ?");
				params.add(condition.get("userRole"));
			}
			List<Map<String, Object>> countList = jdbcTemplate.queryForList(sbud.toString(),params.toArray());
			page.setTotalCount(countList.size());
			if (condition.containsKey("start") && condition.containsKey("limit")) {
				sbud.append(" LIMIT ?,? ");
				int start = Integer.parseInt(condition.get("start"));
				int limit = Integer.parseInt(condition.get("limit"));
				params.add(start);
				params.add(limit);
			}
			list = jdbcTemplate.queryForList(sbud.toString(),params.toArray());
		}
		page.setResult(list);
		return page;
	}
	
	public List<ModuleStoreBean> getRole(){
		return jdbcTemplate.query(" select id,role_name from web_user_role where is_delete = 0 ",new ModuleStoreBeanRowMapper());
	}
	
	public boolean isExitUser(String userName,String userId){
		int i = 0;
		List<Map<String, Object>> list  = new ArrayList<Map<String,Object>>();
		if (StringUtils.isBlank(userId)) {
			list = jdbcTemplate.queryForList("select count(1) as ct from web_user_login where user_name = ? and is_delete = 0 ",userName);
		}else{
			list = jdbcTemplate.queryForList("select count(1) as ct from web_user_login where user_name = ? and id <> ? and is_delete = 0 ",userName,userId);
		}
		if (list != null && list.size() > 0) {
			i = Integer.parseInt(list.get(0).get("ct")+"");
		}
		return i>0;
	}
	
	public void addUser(String userName,String userPwd,int role){
		String uuid = UUID.randomUUID().toString().replace("-", "");
		jdbcTemplate.update("insert into web_user_login(id,user_name,user_password,user_role)values(?,?,?,?)",uuid,userName,userPwd,role);
	}
	public void editUser(UserLogin user){
		if(StringUtils.isNotBlank(user.getId())){
			List<Object> params = new ArrayList<Object>();
			StringBuilder sb = new StringBuilder(" update web_user_login set id = ? ");
			params.add(user.getId());
			if(StringUtils.isNotBlank(user.getUserName())){
				sb.append(",user_name = ?");
				params.add(user.getUserName());
			}
			if(StringUtils.isNotBlank(user.getUserPassword())){
				sb.append(",user_password = ?");
				params.add(user.getUserPassword());
			}
			if(StringUtils.isNotBlank(user.getUserRole()+"")){
				sb.append(",user_role = ?");
				params.add(user.getUserRole());
			}
			sb.append(" where id = ?");
			params.add(user.getId());
			jdbcTemplate.update(sb.toString(), params.toArray(new Object[params.size()]));
			
			syncPwd(user.getId(), user.getUserName(), user.getUserPassword());
		}
	}
	
	public void syncPwd(String userId,String userName,String newUserPwd){
		String sql = "  select is_allow_weblogin,user_name from web_user_login where id = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,userId);
		String isAllow = "";
		if(list != null && list.size()>0){
			isAllow = list.get(0).get("is_allow_weblogin")+"";
			if("0".equals(isAllow)){//允许登陆
				String sql1 = " update base_user set login_pwd = ? where auth_type = 0 and  login_name = ?  ";
				jdbcTemplate.update(sql1,newUserPwd,userName);
			}
		}
	}
	public boolean checkUser(String name,String pwd){
		String sql = "  select * from web_user_login where user_name = ? and user_password=?";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,name,pwd);
		if(list != null && list.size()>0){
			return true;
		}
		return false;
	}
	
	public void updatePwd(String userId,String userName,String newUserPwd){
//		String md5Pwd = Md5Util.generatePassword(newUserPwd);
		jdbcTemplate.update("update web_user_login set user_password = ? where id =? ",newUserPwd,userId);
		syncPwd(userId, userName, newUserPwd);
	}
	public void DeleteRoleAuth(String roleId){
		jdbcTemplate.update("delete from web_user_auth where role_id =?",roleId);
	}
	public void addRoleAuth(String roleId,String menuId){
		jdbcTemplate.update("insert into web_user_auth (role_id,menu_id) values(?,?)",roleId,menuId);
	}
	public void addRole(String roleName){
		jdbcTemplate.update("insert into web_user_role(role_name)values(?)",roleName);
	}
	public boolean isExitRole(String roleName){
		int i = 0;
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from web_user_role where role_name = ? and is_delete = 0 ",roleName);
		if(list != null){
			i = list.size();
		}
		return i>0;
	}
	
	public void deleteUserByRoleId(String roleId){
		if(StringUtils.isNotBlank(roleId)){
			jdbcTemplate.update("update web_user_login set is_delete = 1 where user_role =?",roleId);
		}
	}
	public void deleteRole(String roleId){
		if(StringUtils.isNotBlank(roleId)){
			jdbcTemplate.update("update web_user_role set is_delete = 1 where id =?",roleId);
		}
	}
	public void deleteUser(String userId){
		if(StringUtils.isNotBlank(userId)){
			jdbcTemplate.update("update web_user_login set is_delete = 1 where id =?",userId);
		}
	}
	
	public void editRole(String roleId,String roleName){
		if(StringUtils.isNotBlank(roleId)){
			List<Object> params = new ArrayList<Object>();
			StringBuilder sb = new StringBuilder(" update web_user_role set id = ? ");
			params.add(roleId);
			if(StringUtils.isNotBlank(roleName)){
				sb.append(",role_name = ?");
				params.add(roleName);
			}
			sb.append(" where id = ?");
			params.add(roleId);
			jdbcTemplate.update(sb.toString(), params.toArray(new Object[params.size()]));
		}
	}
}