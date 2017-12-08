package com.xz.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.xz.common.Page;
import com.xz.entity.CustomConfig;
import com.xz.service.PeojectServices;

@RequestMapping("projectmgr")
@Controller
public class ProjectMgrController extends BaseController {
	@Autowired  
    private CustomConfig customConfig; 
	
	@Autowired
	private PeojectServices peojectServices;
	
	
	ExecutorService threadPool = Executors.newCachedThreadPool();
	class RecCallable implements Callable{
		HttpServletRequest request;
		private File file;
		private String title;
		private String path;
		private String createUser;
		RecCallable(HttpServletRequest request,File file,String title,String path,String createUser) {
			this.request =request;
	    	this.file = file;
	    	this.title = title;
	    	this.path = path;
	    	this.createUser = createUser;
	    }
	    @Override
	    public Object call() throws Exception {
	    	String resp = "";
	    	try {
	    		peojectServices.importProjectData(request, file, title, path,createUser);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	return resp;
	    }
	}
	/*
	 * 采用spring提供的上传文件的方法
	 */
	@RequestMapping("springUpload")
	public void springUpload(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
    	String msg = null;
    	Map<String, String> map = new HashMap<String, String>();
    	ObjectMapper mapper = new ObjectMapper();
		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
//					String path = "E:/springUpload" + file.getOriginalFilename();
					System.out.println("_____"+customConfig.getClientFileUpladPath());
					String path=customConfig.getClientFileUpladPath()+File.separator+new Date().getTime()+file.getOriginalFilename();
					// 上传
					file.transferTo(new File(path));
					if((file.getOriginalFilename()).contains(".xls")){//上传EXCEL文件
						//线程处理
						File tfile = new File(path);
						RecCallable cb = new RecCallable(multiRequest, tfile, null, path, null);
						threadPool.submit(cb);
//						peojectServices.importProjectData(request, tfile, null, path,null);
//						peojectServices.importProjectData(request, tfile, null, path, null);
					}
				}

			}
		}
		long endTime = System.currentTimeMillis();
		System.out.println("方法三的运行时间：" + String.valueOf(endTime - startTime) + "ms");
		map.put("success", "true");
		if (msg == null) {
			map.put("i_type", "success");
			map.put("i_msg", "");
		} else {
			map.put("i_type", "error");
			map.put("i_msg", "保存失败：" + msg);
		}
//		printData(response, mapper.writeValueAsString(map));
		writeJson(map, response);
	}
    
    @RequestMapping("listImport")
    public void listImport(HttpServletRequest request,HttpServletResponse response){
		String startParam = request.getParameter("start");
		String limitParam = request.getParameter("limit");
		String projectName = request.getParameter("projectName");
		String startDate = request.getParameter("createDateStart");
		String endDate = request.getParameter("createDateEnd");
		int start = 0;
		int limit = 20;
		if(StringUtils.isNotBlank(startParam)){
			start = Integer.parseInt(startParam);
		}
		if(StringUtils.isNotBlank(limitParam)){
			limit = Integer.parseInt(limitParam);
		}
		Page<Map<String, Object>> page = peojectServices.getProjectMain(projectName, start, limit, startDate, endDate);
		resultSuccess(null, page.getResult(), page.getTotalCount(),response);
	}
    @RequestMapping("listAttr")
    public void listAttr(HttpServletRequest request,HttpServletResponse response){
    	String startParam = request.getParameter("start");
    	String limitParam = request.getParameter("limit");
    	String projectId = request.getParameter("projectId");
    	int start = 0;
    	int limit = 100;
    	if(StringUtils.isNotBlank(startParam)){
    		start = Integer.parseInt(startParam);
    	}
    	if(StringUtils.isNotBlank(limitParam)){
    		limit = Integer.parseInt(limitParam);
    	}
    	Page<Map<String, Object>> page = peojectServices.getProjectAttr(projectId, start, limit);
    	resultSuccess(null, page.getResult(), page.getTotalCount(),response);
    }
}
