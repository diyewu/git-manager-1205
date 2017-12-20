package com.xz.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xz.common.SessionConstant;
import com.xz.model.json.JsonModel;
import com.xz.service.WebService;

@RequestMapping("webctrl")
@Controller
public class WebController extends BaseController{
	@Autowired
	private WebService webService;
	@RequestMapping("login")
	@ResponseBody
	public JsonModel login(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		Map<String,String> condition = new HashMap<String, String>();
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
			List<Map<String, Object>> userInfo = webService.getUserInfoByNameandPwd(userName, userPwd);
			if (userInfo != null && userInfo.size() > 0) {
				String userId = userInfo.get(0).get("id")+"";
				String userRole = userInfo.get(0).get("user_role")+"";
				session.setAttribute(SessionConstant.WEB_USER_ID, userId);
				session.setAttribute(SessionConstant.WEB_USER_NAME, userName);
				session.setAttribute(SessionConstant.WEB_USER_ROLE, userRole);
			}else{
				msg = "用户名或密码错误！";
			}
		}
		
		return new JsonModel(msg == null, msg);
	}
}
