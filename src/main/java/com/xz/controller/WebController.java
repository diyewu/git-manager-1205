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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xz.common.ServerResult;
import com.xz.common.SessionConstant;
import com.xz.entity.AppMenu;
import com.xz.model.json.AppJsonModel;
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
	
	@RequestMapping("getObjectDetail")
	@ResponseBody
	public JsonModel getObjectDetail(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(); 
		String userRole = session.getAttribute(SessionConstant.WEB_USER_ROLE)+"";
		String msg = null;
		List<AppMenu> list = new ArrayList<AppMenu>();
		if(StringUtils.isNotBlank(userRole)){
			list = appService.getMenulist(userRole);
		}else{
			msg = "尚未登陆！";
		}
		return new JsonModel(msg == null,msg,list);
	}
	
	
	@RequestMapping("getMapInfo")
	@ResponseBody
	public JsonModel getMapInfoByMenu(HttpServletRequest request){
		String msg = null;
		String jsonIds = request.getParameter("jsonIds");
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(StringUtils.isNotBlank(jsonIds)){
			JSONArray projectArray = JSONArray.parseArray(jsonIds);
			String projectId = "";
			Map<String,List<String>> param = new HashMap<String, List<String>>();
			List<String> conditionList = new ArrayList<String>();
			boolean projectStatus = false;
			boolean attrStatus = false;
			boolean detailStatus = false;
			for (int k = 0; k < projectArray.size(); k++) {
				param = new HashMap<String, List<String>>();
				JSONObject jsonObject = projectArray.getJSONObject(k);
				projectStatus =jsonObject.containsKey("status")?(Boolean) jsonObject.get("status"):false;
				if(projectStatus){
					projectId = jsonObject.get("id")+"";
					JSONArray array = jsonObject.getJSONArray("children");
					if(array != null && array.size()>0){
						for (int i = 0; i < array.size(); i++) {
							conditionList = new ArrayList<String>();
							JSONObject attrObject = array.getJSONObject(i);
							attrStatus = attrObject.containsKey("status")?(Boolean) attrObject.get("status"):false;
							if(attrStatus){
								String AttriId = attrObject.getString("id");
								JSONArray conditionArray = attrObject.getJSONArray("children");
								for(int m =0;m<conditionArray.size();m++){
									JSONObject conditionObject = conditionArray.getJSONObject(m);
//									conditionList.add(conditionObject.get("condition_id")+"");
									detailStatus = conditionObject.containsKey("status")?(Boolean) conditionObject.get("status"):false;
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
						list = appService.getMapInfo(projectId, param);
						if (list != null && list.size() > 0) {
							info.addAll(list);
						}
					}
				}
			}
		}else{
			msg = "参数有误！";
		}
		return new JsonModel(msg == null,msg,info);
	}
	
	
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
}
