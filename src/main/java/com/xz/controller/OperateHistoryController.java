package com.xz.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xz.service.OperateHistoryService;

@RequestMapping("operate")
@Controller
public class OperateHistoryController extends BaseController{

	private static final long serialVersionUID = 3275714765223850730L;
	
	@Autowired
	private OperateHistoryService operateHistoryService;
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		String msg = "";
		String outPut = "";
		try{
			Map<String,String> condition = new HashMap<String, String>();
			String operateUser = request.getParameter("operateUser");
			String createDateStart = request.getParameter("createDateStart");
			String createDateEnd = request.getParameter("createDateEnd");
			String start = request.getParameter("start");
			String limit = request.getParameter("limit");;
			if (StringUtils.isNotBlank(operateUser)) {
				condition.put("operateUser", operateUser);
			}
			if (createDateStart != null && !"".equals(createDateStart.trim())) {
				condition.put("createDateStart", createDateStart);
			}
			if (createDateEnd != null && !"".equals(createDateEnd.trim())) {
				condition.put("createDateEnd", createDateEnd);
			}
			if (start != null && !"".equals(start.trim())) {
				condition.put("start", start);
			}
			if (limit != null && !"".equals(limit.trim())) {
				condition.put("limit", limit);
			}
			try {
				outPut = operateHistoryService.getOperateList(condition);
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
			this.printData(response, outPut);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("listForLogin")
	public void listForLogin(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		String msg = "";
		String outPut = "";
		try{
			Map<String,String> condition = new HashMap<String, String>();
			String operateUser = request.getParameter("operateUser");
			String createDateStart = request.getParameter("createDateStart");
			String createDateEnd = request.getParameter("createDateEnd");
			String start = request.getParameter("start");
			String limit = request.getParameter("limit");;
			if (StringUtils.isNotBlank(operateUser)) {
				condition.put("operateUser", operateUser);
			}
			if (createDateStart != null && !"".equals(createDateStart.trim())) {
				condition.put("createDateStart", createDateStart);
			}
			if (createDateEnd != null && !"".equals(createDateEnd.trim())) {
				condition.put("createDateEnd", createDateEnd);
			}
			if (start != null && !"".equals(start.trim())) {
				condition.put("start", start);
			}
			if (limit != null && !"".equals(limit.trim())) {
				condition.put("limit", limit);
			}
			try {
				outPut = operateHistoryService.getOperateListForlogin(condition);
			} catch (Exception e) {
				e.printStackTrace();
				msg = e.getMessage();
			}
			this.printData(response, outPut);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
