package com.xz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xz.common.SessionConstant;
import com.xz.model.json.JsonModel;
import com.xz.service.AppService;
import com.xz.service.WebService;

@RequestMapping("webctrl")
@Controller
public class WebController extends BaseController{
	@Autowired
	private WebService webService;
	
	@Autowired
	private AppService appService;
	
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
				session.setAttribute(SessionConstant.WEB_USER_ID, userId);
				session.setAttribute(SessionConstant.WEB_USER_NAME, userName);
				session.setAttribute(SessionConstant.WEB_USER_ROLE, userRole);
				session.setAttribute(SessionConstant.WEB_USER_REAL_NAME, userRealName);
			}else{
				msg = "用户名或密码错误！";
			}
		}
		
		return new JsonModel(msg == null, msg);
	}
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
}
