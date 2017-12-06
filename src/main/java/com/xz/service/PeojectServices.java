package com.xz.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xz.utils.ExcelReadUtils;
import com.xz.utils.SortableUUID;


@Service
@Transactional
public class PeojectServices {
	@Autowired  
	private JdbcTemplate jdbcTemplate; 
	
	@Autowired
	private OperateHistoryService operateHistoryService;
	
	@Transactional
	public void importProjectData(HttpServletRequest request,File file,String title,String path,String createUser){
		ArrayList<ArrayList<Object>> list = new ArrayList<ArrayList<Object>>();
		String msg = null;
		String type = "5";//导入项目数据
		try {
			 list = ExcelReadUtils.readAllRows(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (list == null || list.size() == 0) {
			msg = "请检查上传附件内容，数据为空！";
			insertOperateHistory(request, type, msg);
			return;
		}
		if(StringUtils.isBlank(title)){
			title = list.get(0).get(0)+"";
		}
		if(StringUtils.isBlank(title)){
			msg = "格式有误，请确认第一行第一列为项目标题！";
			insertOperateHistory(request, type, msg);
			return;
		}
		//插入项目主表数据
		String projectId = SortableUUID.randomUUID();
		String mainSql = " insert into project_main(id,project_name,create_time,create_user_id,file_path)values(?,?,NOW(),?,?) ";
		jdbcTemplate.update(mainSql, projectId,title,createUser,path);
		
		//插入项目属性表数据
		ArrayList<Object> attrList = list.get(1);
		if(attrList == null || attrList.size() == 0){
			insertOperateHistory(request, type, msg);
			msg = "格式有误，请确认第二行数据不能为空！";
			return;
		}
		int attrSize = attrList.size();
		String attrSql = " insert into project_attribute(id,project_id,attribute_name,attribute_index)VALUES(?,?,?,?) ";
		for (int i = 0; i < attrSize; i++) {
			jdbcTemplate.update(attrSql, SortableUUID.randomUUID(),projectId,attrList.get(i)+"",i+1);
		}
		//插入项目详细数据,从第三行还是为详细数据
		List<String> params = new ArrayList<String>();
		List<String> marks = new ArrayList<String>();
		marks.add("?");
		marks.add("?");
		StringBuilder sb = new StringBuilder(); 
		attrList = new ArrayList<Object>();
		for(int i=0;i<list.size();i++){
			if(i>2){//从第三行开始
				attrList = list.get(i);
				if(attrList != null && attrList.size() != 0){
					sb = new StringBuilder();
					sb.append(" insert into project_detail(id,project_id ");
					for(int k =0;k<attrList.size();k++){
						sb.append(",ext"+(k+1));
						params.add(attrList.get(k)+"");
						marks.add("?");
					}
					System.out.println(params);
					sb.append(")values("+StringUtils.join(marks.toArray(), ",")+")");
					jdbcTemplate.update(sb.toString(), params.toArray());
				}else{
					msg = "格式有误，请确认第三行数据不能为空！";
					insertOperateHistory(request, type, msg);
					return;
				}
			}
		}
		
		
		
	}
	public void insertOperateHistory(HttpServletRequest request,String type,String msg){
		HttpSession session=request.getSession();
		operateHistoryService.insertOH(request,(String)session.getAttribute("userId") , type, msg,msg==null?1:0);
	}
}
