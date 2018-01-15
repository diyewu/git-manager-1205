package com.xz.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.xz.common.SessionConstant;
import com.xz.entity.AppMenu;
import com.xz.model.json.JsonModel;
import com.xz.service.AppService;
import com.xz.service.WebService;
import com.xz.utils.AgingCache;
import com.xz.utils.MailSam;
import com.xz.utils.RandomText;

@RequestMapping("webctrl")
@Controller
public class WebController extends BaseController{
	@Autowired
	private WebService webService;
	
	@Autowired
	private AppService appService;
	private static String smtp = "smtp.qq.com";  
	private static String port = "587";  
	private static String user = "194973883@qq.com"; 
	private static String pwd="uwyuantqcphvcaeg";  
	/**
	 * 登陆
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public JsonModel login(HttpServletRequest request,HttpServletResponse response){
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String imgCode = request.getParameter("imgCode");
		String msg = null;
		HttpSession session = request.getSession(); 
		String serverCode = (String) session.getAttribute(SessionConstant.WEB_IMG_CODE);
		if(StringUtils.isNotBlank(imgCode)){
			if(!imgCode.toLowerCase().equals(serverCode)){
				msg = "验证码错误！";
			}
		}else{
			msg = "验证码为空！";
		}
		if(msg == null){
			if(StringUtils.isBlank(userName)){
				msg = "用户名为空！";
			}
		}
		if(msg == null){
			if(StringUtils.isBlank(userPwd)){
				msg = "用户密码为空！";
			}
		}
		if(msg == null){
			List<Map<String, Object>> userInfo = appService.getUserInfoByNameandPwd(userName, userPwd);
			if (userInfo != null && userInfo.size() > 0) {
				String userId = userInfo.get(0).get("id")+"";
				String userRole = userInfo.get(0).get("user_role")+"";
				String userRealName = userInfo.get(0).get("real_name")+"";
				
				String enableTime = userInfo.get(0).get("enable_time")+"";
				String disableTime = userInfo.get(0).get("disable_time")+"";
				if(StringUtils.isNotBlank(enableTime) && StringUtils.isNotBlank(disableTime)){
					Date d = new Date();
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					try {
						df.parse(enableTime);
						df.parse(disableTime);
						if(d.getTime() < df.parse(enableTime).getTime() || d.getTime() > df.parse(disableTime).getTime() ){
							msg = "您好，您的账户已经失效，如需继续使用，请联系管理员。";
						}
					} catch (ParseException e) {
					}
				}else{
					msg = "您好，您的账户已经失效，如需继续使用，请联系管理员。";
				}
				if(msg == null){
					session.setAttribute(SessionConstant.WEB_USER_ID, userId);
					session.setAttribute(SessionConstant.WEB_USER_NAME, userName);
					session.setAttribute(SessionConstant.WEB_USER_ROLE, userRole);
					session.setAttribute(SessionConstant.WEB_USER_REAL_NAME, userRealName);
				}
			}else{
				msg = "用户名或密码错误！";
			}
		}
		
		return new JsonModel(msg == null, msg);
	}
	/**
	 * 根据用户角色获取项目列表信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getObjectListByUserRole")
	@ResponseBody
	public JsonModel getObjectListByUserRole(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String msg = null;
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(StringUtils.isNotBlank(userRole)){
			list = webService.getObjectList(userRole);
		}else{
			msg = "尚未登陆！";
		}
		return new JsonModel(msg == null,msg,list);
	}
	
	/**
	 * 根据用户角色获取筛选条件，动态展示在地图上
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getObjectDetail")
	@ResponseBody
	public JsonModel getObjectDetail(HttpServletRequest request,HttpServletResponse response){
		long start = System.currentTimeMillis();	
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String msg = null;
		List<AppMenu> list = new ArrayList<AppMenu>();
		if(StringUtils.isNotBlank(userRole)){
			list = appService.getMenulist(userRole);
		}else{
			msg = "尚未登陆！";
		}
		long end = System.currentTimeMillis();
		System.out.println("getObjectDetail="+(end - start));
		return new JsonModel(msg == null,msg,list);
	}
	
	/**
	 * 根据用户选择的条件获取地图点信息
	 * @param request
	 * @return
	 */
	@RequestMapping("getMapInfo")
	@ResponseBody
	public JsonModel getMapInfoByMenu(HttpServletRequest request){
		long start = System.currentTimeMillis();
		String msg = null;
		String jsonIds = request.getParameter("jsonIds");
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(StringUtils.isNotBlank(jsonIds)){
			JSONArray projectArray = JSONArray.parseArray(jsonIds);
			info = appService.analyzeJson(projectArray, "status");
		}else{
			msg = "参数有误！";
		}
		long end = System.currentTimeMillis();
		System.out.println("getMapInfoByMenu="+(end - start));
		return new JsonModel(msg == null,msg,info);
	}
	
	/**
	 * 根据用户点击地图的点传递project_detail的ID获取详细信息
	 * @param request
	 * @return
	 */
	@RequestMapping("getCoordinateInfo")
	@ResponseBody
	public JsonModel getCoordinateInfo(HttpServletRequest request){
		String coordinateId = request.getParameter("ids");
		String msg = null;
		List<Map<String, Object>> resplist = new ArrayList<Map<String,Object>>();
		if(StringUtils.isNotBlank(coordinateId)){
			try {
				resplist = appService.getCoordinateInfoByIds(coordinateId);
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
		}else{
			msg = "参数有误！";
		}
		return new JsonModel(msg == null,msg,resplist);
	}
	
	/**
	 * 根据用户角色获取全部地图点信息,地图初始化时加载
	 * @param request
	 * @return
	 */
//	@RequestMapping("getMapInfoByUserRole")
//	@ResponseBody
	public JsonModel getMapInfoByUserRole_bak(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String msg = null;
		List<AppMenu> list = new ArrayList<AppMenu>();
		if(StringUtils.isNotBlank(userRole)){
			list = appService.getMenulist(userRole);
		}else{
			msg = "尚未登陆！";
		}
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(list != null && list.size()>0){
			ObjectMapper mapper = new ObjectMapper();
			try {
				String jsonIds = mapper.writeValueAsString(list);
				if(StringUtils.isNotBlank(jsonIds)){
					JSONArray projectArray = JSONArray.parseArray(jsonIds);
					info = appService.analyzeJson(projectArray, "is_check");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
		}
		
		return new JsonModel(msg == null,msg,info);
	}
	/**
	 * 根据用户角色获取全部地图点信息,地图初始化时加载
	 * @param request
	 * @return
	 */
	@RequestMapping("getMapInfoByUserRole")
	@ResponseBody
	public JsonModel getMapInfoByUserRole(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String msg = null;
		List<AppMenu> list = new ArrayList<AppMenu>();
		if(StringUtils.isNotBlank(userRole)){
			list = appService.getMenulist(userRole);
		}else{
			msg = "尚未登陆！";
		}
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(list != null && list.size()>0){
			ObjectMapper mapper = new ObjectMapper();
			try {
				String jsonIds = mapper.writeValueAsString(list);
				System.out.println(jsonIds);
				if(StringUtils.isNotBlank(jsonIds)){
					JSONArray projectArray = JSONArray.parseArray(jsonIds);
					info = appService.analyzeJson(projectArray, "is_check");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
		}
		
		return new JsonModel(msg == null,msg,info);
	}
	/**
	 * 根据用户角色和项目编号获取全部地图点信息,地图初始化时加载
	 * @param request
	 * @return
	 */
	@RequestMapping("getMapInfoByUserRoleAndProjectId")
	@ResponseBody
	public JsonModel getMapInfoByUserRoleAndProjectId(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String projectId = request.getParameter("projectId");
		String msg = null;
		List<AppMenu> list = new ArrayList<AppMenu>();
		if(StringUtils.isBlank(projectId)){
			msg = "参数错误！";
		}
		if(msg == null){
			if(StringUtils.isNotBlank(userRole) ){
				list = appService.getMenulistByProjectId(userRole,projectId);
			}else{
				msg = "尚未登陆！";
			}
		}
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(list != null && list.size()>0){
			ObjectMapper mapper = new ObjectMapper();
			try {
				String jsonIds = mapper.writeValueAsString(list);
				System.out.println(jsonIds);
				if(StringUtils.isNotBlank(jsonIds)){
					JSONArray projectArray = JSONArray.parseArray(jsonIds);
					info = appService.analyzeJson(projectArray, "is_check");
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
		}
		
		return new JsonModel(msg == null,msg,info);
	}
	
	/**
	 * 根据用户选择的坐标点，获取该坐标点的下一级坐标
	 * @param request
	 * @return
	 */
	@RequestMapping("getNextMapInfoByKey")
	@ResponseBody
	public JsonModel getNextMapInfoByKey(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String cacheKey = request.getParameter("cacheKey");
		String key = request.getParameter("key");
		String currentLevel = request.getParameter("currentLevel");
		String msg = null;
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(StringUtils.isNotBlank(userRole)){
			List<Map<String, Object>> tlist = (List<Map<String, Object>>)AgingCache.getCacheInfo(cacheKey).getValue();
			info = appService.generateCod(key,tlist, cacheKey,currentLevel);
		}else{
			msg = "尚未登陆！";
		}
		
		return new JsonModel(msg == null,msg,info);
	}
	
	/**
	 * 返回上一级坐标
	 * @param request
	 * @return
	 */
	@RequestMapping("getPreMapInfoByKey")
	@ResponseBody
	public JsonModel getPreMapInfoByKey(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		
		String cacheKey = request.getParameter("cacheKey");
		String key = request.getParameter("key");
		String currentLevel = request.getParameter("currentLevel");
		
		String msg = null;
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(StringUtils.isNotBlank(userRole)){
			info = appService.turnback(cacheKey, key, currentLevel);
		}else{
			msg = "尚未登陆！";
		}
		
		return new JsonModel(msg == null,msg,info);
	}
	
	/**
	 * 忘记密码填写用户名
	 * @param request
	 * @return
	 */
	@RequestMapping("forgetPwdCheckNameAndCode")
	@ResponseBody
	public JsonModel forgetPwdCheckNameAndCode(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String sessionUserName = (String)session.getAttribute(SessionConstant.WEB_USER_NAME);
		
		String webUserName = request.getParameter("userName");
		String code = request.getParameter("code");
		String sessionIMgCode = session.getAttribute(SessionConstant.WEB_IMG_CODE)+"";
		String msg = null;
		if(StringUtils.isBlank(sessionUserName)){
			msg = "登陆超时，请重新登陆";
		}
		if(msg == null){
			if(!sessionUserName.equals(webUserName)){
				msg = "用户名填写错误！";
			}
		}
		if(msg == null){
			if(!sessionIMgCode.equals(code)){
				msg = "验证码填写错误！";
			}
		}
		return new JsonModel(msg == null,msg);
	}
	/**
	 * 发送验证码
	 * @param request
	 * @return
	 */
	@RequestMapping("forgetPwdMailCode")
	@ResponseBody
	public JsonModel forgetPwdMailCode(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String sessionUserName = (String)session.getAttribute(SessionConstant.WEB_USER_NAME);
		String email = request.getParameter("email");
		
		String msg = null;
		if(StringUtils.isBlank(sessionUserName)){
			msg = "登陆超时，请重新登陆";
		}
		if(StringUtils.isBlank(email)){
			msg = "请填写邮箱地址";
		}
		if(msg == null){
			String randomCode = RandomText.getRandomString(8);
			session.removeAttribute(SessionConstant.WEB_USER_RANDOM_CODE);
			session.setAttribute(SessionConstant.WEB_USER_RANDOM_CODE, randomCode);
			String content="尊敬的用户：<br/>您的验证码为："+randomCode+"（60分钟内有效，区分大小写），为了保证您的账户安全，请勿向任何人提供此验证码。";
			try {
				MailSam.send(smtp, port, user, pwd, email, "旭中咨询", content);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		return new JsonModel(msg == null,msg);
	}
	/**
	 * 验证 邮箱验证码
	 * @param request
	 * @return
	 */
	@RequestMapping("forgetPwdCheckMailCode")
	@ResponseBody
	public JsonModel forgetPwdCheckMailCode(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String sessionUserName = (String)session.getAttribute(SessionConstant.WEB_USER_NAME);
		String code = request.getParameter("code");
		String sessionCode = (String)session.getAttribute(SessionConstant.WEB_USER_RANDOM_CODE);
		String msg = null;
		if(StringUtils.isBlank(sessionUserName)){
			msg = "登陆超时，请重新登陆";
		}
		if(StringUtils.isBlank(code)){
			msg = "请填写验证码";
		}
		if(msg == null){
			if(!code.equals(sessionCode)){
				msg = "验证码填写错误";
			}
		}
		return new JsonModel(msg == null,msg);
	}
	/**
	 * 更新密码
	 * @param request
	 * @return
	 */
	@RequestMapping("forgetPwdUpdatePwd")
	@ResponseBody
	public JsonModel forgetPwdUpdatePwd(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String sessionUserName = (String)session.getAttribute(SessionConstant.WEB_USER_NAME);
		String webUserId =  (String)session.getAttribute(SessionConstant.WEB_USER_ID);
		String pwd = request.getParameter("pwd");
		String msg = null;
		if(StringUtils.isBlank(sessionUserName)){
			msg = "登陆超时，请重新登陆";
		}
		if(StringUtils.isBlank(pwd)){
			msg = "密码不能为空！";
		}
		if(msg == null){
			try {
				appService.updateWebUserPwdById(pwd, webUserId);
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
		}
		return new JsonModel(msg == null,msg);
	}
	
}
