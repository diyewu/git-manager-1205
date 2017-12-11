package com.xz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xz.common.ServerResult;
import com.xz.entity.AppLoginBean;
import com.xz.model.json.AppJsonModel;
import com.xz.model.json.JsonModel;
import com.xz.service.WebAndAppService;
import com.xz.utils.AgingCache;



/**
 *
 * @author dean
 */
@RequestMapping("app")
@Controller
public class WebAndAppController extends BaseController{
	@Autowired
	private WebAndAppService webAndAppService;
	
	@RequestMapping("login")
	@ResponseBody
	public AppJsonModel login(HttpServletRequest request){
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String phoneId = request.getHeader("phoneId");
		String token = "";
		String msg = "success";
		int code = 0;
		Map<String,String> resultMap = new HashMap<String, String>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(StringUtils.isBlank(userName) || StringUtils.isBlank(userPwd) || StringUtils.isBlank(phoneId)){
			code = ServerResult.RESULT_ERROE_PARAM;
			msg = ServerResult.RESULT_ERROE_PARAM_MSG;
		}
		if(code == 0){
			try {
				list = webAndAppService.getUserInfoByNameandPwd(userName, userPwd);
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
				code = ServerResult.RESULT_SERVER_ERROR;
			}
		}
		//TODO  判断当前手机是否允许登陆
		//TODO  判断当前是否已经登陆
		if(code == 0){// 服务器无异常
			if(list != null && list.size()>0){
				token = UUID.randomUUID().toString().replaceAll("-", "");
				String userId = list.get(0).get("id")+"";
				String roleId = list.get(0).get("user_role")+"";
				String realName = list.get(0).get("real_name")+"";
				resultMap.put("token", token);
				resultMap.put("real_name", realName);
				AppLoginBean appLoginBean = new AppLoginBean();
				appLoginBean.setToken(token);
				appLoginBean.setUserId(userId);
				appLoginBean.setUserRoleId(roleId);
				AgingCache.putCacheInfo(phoneId, appLoginBean,30);
			}else{
				code = ServerResult.RESULT_ERROE_USER_LOGIN;
				msg = ServerResult.RESULT_ERROE_USER_LOGIN_MSG;
			}
		}
		return new AppJsonModel(code, msg, resultMap);
	}
	
	@RequestMapping("getMenu")
	@ResponseBody
	public AppJsonModel getMenu(HttpServletRequest request){
		String token = request.getHeader("token");
		String phoneId = request.getHeader("phoneId");
		String msg = "success";
		int code = 0;
		List<String> paramList = new ArrayList<String>();
		paramList.add(token);
		paramList.add(phoneId);
		AppLoginBean appLoginBean = new AppLoginBean();
		code = globalCheck(paramList, token, phoneId,appLoginBean);
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(code == 0){
			try {
				list = webAndAppService.getMenu(appLoginBean.getUserRoleId());
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
				code = ServerResult.RESULT_SERVER_ERROR;
			}
		}
		return new AppJsonModel(code, ServerResult.getCodeMsg(code, msg), list);
	}
	
	
	@RequestMapping("getMapInfo")
	@ResponseBody
	public AppJsonModel getMapInfoByMenu(HttpServletRequest request){
		String token = request.getHeader("token");
		String phoneId = request.getHeader("phoneId");
		String jsonIds = request.getParameter("jsonIds");
		String msg = "success";
		int code = 0;
		List<String> paramList = new ArrayList<String>();
		paramList.add(token);
		paramList.add(phoneId);
		paramList.add(jsonIds);
		AppLoginBean appLoginBean = new AppLoginBean();
		code = globalCheck(paramList, token, phoneId,appLoginBean);
		
		List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
		if(code == 0){
			//TODO 根据jsonIds解析树形json
			
			String json = "[{\"attributes\":[{\"attribute_id\":\"00151280833338700003\",\"conditions\":[{\"condition_id\":\"442\"},{\"condition_id\":\"443\"}]},{\"attribute_id\":\"00151280833339000011\",\"conditions\":[{\"condition_id\":\"448\"},{\"condition_id\":\"449\"}]}],\"project_id\":\"00151280833337500000\"}]";
			JSONArray projectArray = JSONArray.parseArray(json);
			String projectId = "";
			Map<String,List<String>> param = new HashMap<String, List<String>>();
			List<String> conditionList = new ArrayList<String>();
			for (int k = 0; k < projectArray.size(); k++) {
				param = new HashMap<String, List<String>>();
				JSONObject jsonObject = projectArray.getJSONObject(k);
				projectId = jsonObject.get("project_id")+"";
				JSONArray array = jsonObject.getJSONArray("attributes");
				if(array != null && array.size()>0){
					for (int i = 0; i < array.size(); i++) {
						conditionList = new ArrayList<String>();
						JSONObject attrObject = array.getJSONObject(i);
						String AttriId = attrObject.getString("attribute_id");
						JSONArray conditionArray = attrObject.getJSONArray("conditions");
						for(int m =0;m<conditionArray.size();m++){
							JSONObject conditionObject = conditionArray.getJSONObject(m);
							conditionList.add(conditionObject.get("condition_id")+"");
						}
						param.put(AttriId, conditionList);
					}
				}
//				info = webAndAppService.getMapInfo(projectId, param);
				info.addAll(webAndAppService.getMapInfo(projectId, param));
			}
		}
		return new AppJsonModel(code, ServerResult.getCodeMsg(code, msg), info);
	}
	
	
	
	
}