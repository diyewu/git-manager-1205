    Ext.QuickTips.init();
   	Ext.onReady(function(){
   		Ext.override(Ext.menu.DateMenu, {  
   		    render : function() {  
   		        Ext.menu.DateMenu.superclass.render.call(this);  
   		        if (Ext.isGecko || Ext.isSafari || Ext.isChrome) {  
   		            this.picker.el.dom.childNodes[0].style.width = '178px';  
   		            this.picker.el.dom.style.width = '178px';  
   		        }  
   		    }  
   		}); 
   		
//   	var qrUrl = path + "/setting!";
   		var order;
   		var _pageSize = 20;
   		var reader = new Ext.data.JsonReader({
   			idProperty : 'id',
   			root : 'data',
   			fields : [ {
   				name : 'id',
   				type : 'string'
   			},  {
   				name : 'project_name',
   				type : 'string'
   			}, {
   				name : 'create_time',
   				type : 'string'
   			}, {
   				name : 'real_name',
   				type : 'string'
   			}]
   		});
        store = new Ext.data.Store({
			url : path +"/projectmgr/listImport",
			reader : reader
		});
		store.load({params:{start:0,limit:20}})
//				callback: function(records, options, success){  
//			         //该数组存放将要勾选的行的record  
//			         var arr = [];  
//			         for (var i = 0; i < records.length; i++) {
//			        	 if(records.data.is_checked == 0){
//			        		 arr.push(records[i]);  
//			        	 }
//			         }  
//			         grid.getSelectionModel().select(arr);//选中指定行  
//	            } 
//		);
		
//		store.load({  
//	        callback: function(records, options, success){   
//	        	 //该数组存放将要勾选的行的record  
//		         var arr = [];  
//		         for (var i = 0; i < records.length; i++) {
//		        	 if(records[i].data.is_checked == 0){
//		        		 arr.push(i);  
//		        	 }
//		         }  
//		         grid.getSelectionModel().selectRows(arr);
//	        }     
//	    });  
		
		var pagingBar = new Ext.PagingToolbar({
			store : store,
			displayInfo : true,
			pageSize : _pageSize,
			beforePageText : '第',
			afterPageText : '页，共{0}页',
			displayMsg : '第{0}到{1}条记录，共{2}条',
			emptyMsg : "没有记录"
		});
		var sm = new Ext.grid.CheckboxSelectionModel();
        var column=new Ext.grid.ColumnModel( 
            [ 
            	new Ext.grid.RowNumberer(),
            	sm,
            	{header:"项目名称",align:'center',dataIndex:"project_name",sortable:true}, 
	            {header:"创建时间",align:'center',dataIndex:"create_time",sortable:true},
	            {header:"创建人",align:'center',dataIndex:"real_name",sortable:true},
	            {header:"操作",align:'center',dataIndex:"id",
	            renderer: function (value, meta, record) {
			            	var setBtn = "<input id = 'bt_set_" + record.get('id')
			            	+ "' onclick=\"showAttrWin('" + record.get('id')
			            	+ "');\" type='button' value='设置' width ='15px'/>&nbsp;&nbsp;";
						  var deleteBtn = "<input id = 'bt_delete_" + record.get('id')
							+ "' onclick=\"deleteRom('" + record.get('id')
							+ "');\" type='button' value='删除' width ='15px'/>";
										            			
//            				var resultStr = String.format(formatStr);
            				return "<div>" + setBtn+deleteBtn + "</div>";
        				  } .createDelegate(this)
	            } 
            ] 
        ); 
        
        var initDate = new Date();
    	initDate.setDate(1);
    	initDate.setHours(0, 0, 0, 0);
    	
    	var endTimeField = new ClearableDateTimeField({
    		id:"createDateEnd",
    		editable : false,
    		width : 160
    	});
    	
    	var beginTimeField = new ClearableDateTimeField({
    		id:"createDateStart",
    		editable : false,
//    		value : initDate,
    		width : 160,
    		//fieldLabel : '创建时间',
    	}); 
    	this.beginTimeField = beginTimeField;
    	
    	this.endTimeField = endTimeField;
    	beginTimeField.on('change', function(o, v) {
    		// if (v) {
    		// endTimeField.setMinValue(v);
    		// var max = new Date();
    		// max.setFullYear(v.getFullYear());
    		// max.setMonth(v.getMonth() + 1);
    		// max.setDate(0);
    		// endTimeField.setMaxValue(max);
    		// }
    	});
    	beginTimeField.fireEvent('change', beginTimeField, initDate);
    	endTimeField.on('change', function(o, v) {
    		// beginTimeField.setMaxValue(v);
    		// var min = new Date();
    		// min.setFullYear(v.getFullYear());
    		// min.setMonth(v.getMonth());
    		// min.setDate(1);
    		// beginTimeField.setMinValue(min);
    	});
    	
    	
        
        var tbar = new Ext.Toolbar({  
            renderTo : Ext.grid.GridPanel.tbar,// 其中grid是上边创建的grid容器  
            items :['导入数据年月：', {
		  		  id : 'searchMonth',
		  		  emptyText : "请输入年月，6位数字",
		  		  xtype : 'textfield',
		  		  width : 115,
		  		  listeners : {
		  			  specialkey : function(f, e) {
		  				  if (e.getKey() == e.ENTER) {
		  					  self.searchItem(f);
		  				  }
		  			  }
		  		  }
		  	},'&nbsp;&nbsp;创建时间：',
		  	beginTimeField,'至',
		  	endTimeField, {
				text : '查询',
				iconCls : 'Magnifier',
				handler : function() {
					reloadData();
				}
			}, {
				text : '重置',
				iconCls : 'Reload',
				handler : function() {
					Ext.getCmp('searchMonth').setValue("");
					Ext.getCmp('createDateStart').setValue("");
					Ext.getCmp('createDateEnd').setValue("");
//					Ext.getCmp('editDateStart').setValue("");
//					Ext.getCmp('editDateEnd').setValue("");
				}
			},{
				text : '导入新数据',
				iconCls : 'Add',
				handler : function() {
					showEditRom();
				}
			}/*,{
				text : '设置比较年月',
				iconCls : 'Cog',
				handler : function() {
					setImportDatabaseMonth(0);					
				}
			},{
				text : '取消设置年月',
				iconCls : 'Cancel',
				handler : function() {
//					showEditRom();
					setImportDatabaseMonth(1);
				}
			}*/]

        });  
        grid = new Ext.grid.EditorGridPanel({ 
			region:'center',
			border:false,
//			autoHeight:true,
			viewConfig: {
	            forceFit: true, //让grid的列自动填满grid的整个宽度，不用一列一列的设定宽度。
	            emptyText: '系统中还没有任务'
	        },
	        sm:sm,
            cm:column, 
            store:store, 
            autoExpandColumn:0, 
            loadMask:true, 
            frame:true, 
            autoScroll:true, 
            tbar:tbar,
            bbar:pagingBar
        });
        
	
      
  	var mainPanel = new Ext.Panel({
  		region:"center",
		layout:'border',
		border:false,
		items:[grid],
	});
	
   var viewport=new Ext.Viewport({
       //enableTabScroll:true,
       layout:"border",
       items:[
           mainPanel
   	   ]
   });
   });
   
   function reloadData(){
		var beginTime = this.beginTimeField.getValue();
		var endTime = this.endTimeField.getValue();
		if (!beginTime && !endTime) {
			var _bt = new Date();
			_bt.setDate(1);
			_bt.setHours(0, 0, 0, 0);
//			this.beginTimeField.setValue(_bt);
			beginTime = _bt;
		}
		if (beginTime && endTime) {
			if (beginTime.getTime() >= endTime.getTime()) {
				Ext.Msg.alert('提示', '创建开始时间不能晚于结束时间');
				return false;
			}
		}
		var beginTimeStr = '', endTimeStr = '';
		if (beginTime)
			beginTimeStr = beginTime.format('Y-m-d H:i:s');
		if (endTime)
			endTimeStr = endTime.format('Y-m-d H:i:s');
		
		var searchMonth = document.getElementById('searchMonth').value ;
		var createDateStart = document.getElementById('createDateStart').value ;
		var createDateEnd = document.getElementById('createDateEnd').value ;
		if("请输入年月，6位数字" == searchMonth){
			searchMonth = "";
		}
		store.baseParams['searchMonth'] = searchMonth;
		store.baseParams['createDateStart'] = createDateStart;
		store.baseParams['createDateEnd'] = createDateEnd;
		store.reload({
			params: {start:0,limit:10},
//			callback: function(records, options, success){
////				console.log(records);
//				//该数组存放将要勾选的行的record  
//		         var arr = [];  
//		         for (var i = 0; i < records.length; i++) {
//		        	 if(records[i].data.is_checked == 0){
//		        		 arr.push(i);  
//		        	 }
//		         }  
//		         grid.getSelectionModel().selectRows(arr);
//			},
			scope: store
		});
	}
	
	
	
	function deleteRom(id){
		Ext.Msg.confirm('删除数据', '确认?',function (button,text){if(button == 'yes'){
			Ext.Ajax.request( {
				  url : qrUrl + "deleteImportById.action",
				  method : 'post',
				  params : {
					  id:id
				  },
				  success : function(response, options) {
				   var o = Ext.util.JSON.decode(response.responseText);
				   //alert(o.i_type);
				   if(o.i_type && "success"== o.i_type){
//					   Ext.Msg.alert('提示', '删除成功'); 
					   reloadData();
				   }else{
				   	   Ext.Msg.alert('提示', o.i_msg); 
				   }
				  },
				  failure : function() {
					  Ext.Msg.alert('提示', '删除失败'); 
				  }
	 		});
		}});
		
	}
	
    function showEditRom(_romId,_romOriginalName,_romVersion,_romType,_romComment){
    	var winHeight='';
    	var isHid =null;
    	var imisHid =null;
    	if(typeof(_romId) == "undefined" || _romId  == ""){
    		winHeight = 400;
    		isHid = false;
    		imisHid = true;
    	}else{
    		winHeight = 400;
    		isHid = true;
    		imisHid = false;
    	}
    	var uxfile = new Ext.ux.form.FileUploadField({
    		width: 200,
    		hidden:imisHid,
			hideLabel:imisHid,
			id : 'showFileName',
			name : 'uploadFile',
			fieldLabel : '文件名'
    	});
    	uxfile.setValue(_romOriginalName);
    	
    	var _fileForm = new Ext.FormPanel({
    		layout : "fit",
    		frame : true,
    		border : false,
    		autoHeight : true,
    		waitMsgTarget : true,
    		defaults : {
    			bodyStyle : 'padding:10px'
    		},
    		margins : '0 0 0 0',
    		labelAlign : "left",
    		labelWidth : 80,
    		fileUpload : true,
    		items : [{  
                xtype:'hidden',  
                fieldLabel: 'id',  
                name: 'id',  
                value: _romId 
            },{
    			xtype : 'fieldset',
    			title : '选择文件',
    			autoHeight : true,
    			//hidden:isHid,
    			items : [{
    				id : 'sampleUploadFileId',
    				name : 'uploadFile',
    				xtype : "textfield",
    				fieldLabel : '文件',
    				inputType : 'file',
    				anchor : '96%',
					hidden:isHid,
					hideLabel:isHid 
    			},uxfile]
    		}, {
    			xtype : 'fieldset',
    			title : '设置参数',
    			autoHeight : true,
    			items : [{
    				width:150,
    				xtype : 'textfield',
    				id:'importTitle',
    				name : 'importTitle',
    				fieldLabel : '标题',
//    				regex : /^\d{8}$/, //正则表达式在/...../之间
//    				regexText:"版本号只能填写8位数字，如20150101", //正则表达式错误提示  
    				value:_romVersion,
    			}/*,co,co1*/,{
    				id:'_romCommentEdit',
    				width:400,
    				height:70,
    				xtype : 'textarea',
    				name : 'importComment',
    				anchor: "96.7%",
    				value:typeof(_romComment) == "undefined"?"":_romComment.replace(/<br>/ig, "\n"),
    				fieldLabel : '说明',
    			}]
    		}]
    	});
    	
    	var _importPanel = new Ext.Panel({
    		layout : "fit",
    		layoutConfig : {
    			animate : true
    		},
    		items : [_fileForm],
    		buttons : [{
    			id : "btn_import_wordclass",
    			text : "保存",
    			handler : function() {
    				var vers = document.getElementById('importTitle').value ;
//    		        var reg = /^\d{8}$/;     
//    				if(vers.match(reg) == null){  
//    					Ext.Msg.alert("error", "版本号只能填写8位数字，如20150101");
//    					return;
//    				}
    				if(typeof(_romId) == "undefined" || _romId  == ""){
	    				if (!Ext.getCmp("sampleUploadFileId").getValue()) {
	    					Ext.Msg.alert("error", "请选择你要上传的文件");
	    					return;
	    				} else {
	    					this.disable();
	    					var btn = this;
	    					// 开始上传
	    					var sampleForm = _fileForm.getForm();
	    					sampleForm.submit({
	    						url : path +'/projectmgr/springUpload',
	    						params : {  
//	    		                    searchc : '1231223',  
	    		                },  
	    						success : function(form, action) {
	    							btn.enable();
	    							var data = Ext.decode(action.response.responseText);
	    							console.log(data);
	    							if(data.i_type == "success"){
	    								Ext.Msg.alert("success",'上传成功！请耐心等待导入结果，详情请查询“操作记录”信息',function(){  
		    								newWin.close();
		    								reloadData();
	    								});
	    							}else{
	    								Ext.Msg.alert("Error",data.i_msg,function(){  
	    						            //关闭后执行  
	    									newWin.close();
		    								reloadData();
	    						        });  
	    								
	    							}
	    						},
	    						failure : function(form, action) {
	    							Ext.Msg.alert("Error",'上传失败！',function(){  
		    							newWin.close();
		    							reloadData();
	    							});
	    						}
	    					});
	    				}
    				}else{
						var sampleForm = _fileForm.getForm();
    					this.disable();
    					var btn = this;
						sampleForm.submit({
							params : {}	,
							url : path +'/deviceqr!updateRom.action?id='+_romId,
							success : function(form, action) {
							   btn.enable();
	    	            	   var data = Ext.decode(action.response.responseText);
	    	            	   if(data.i_type == "success"){
	    	            		   Ext.Msg.alert("success",'保存成功！',function(){  
		    	            		   newWin.close();
		    	            		   reloadData();
	    	            		   });
	    	            	   }else{
	    	            		   Ext.Msg.alert("Error",data.i_msg,function(){
		    	            		   newWin.close();
		    	            		   reloadData();
	    	            		   });
	    	            	   }
							},
							failure : function(form, action) {
								Ext.Msg.alert("Error",'保存失败！',function(){
									newWin.close();
									reloadData();
								});
							}
						});
    				}
    			}
    		}]
    	});
    	
    	newWin = new Ext.Window({
    		width : 520,
    		title : '导入数据',
    		height : winHeight,
    		defaults : {// 表示该窗口中所有子元素的特性
    			border : false
    			// 表示所有子元素都不要边框
    		},
    		plain : true,// 方角 默认
    		modal : true,
    		shim : true,
    		collapsible : true,// 折叠
    		closable : true, // 关闭
    		closeAction: 'close',
    		resizable : false,// 改变大小
    		draggable : true,// 拖动
    		minimizable : false,// 最小化
    		maximizable : false,// 最大化
    		animCollapse : true,
    		constrainHeader : true,
    		autoHeight : false,
    		items : [_importPanel]
    	});
		newWin.show();
    }
    function showAttrWin(projectId){
    	var sa_pageSize = 100;
    	var sareader = new Ext.data.JsonReader({
   			idProperty : 'id',
   			root : 'data',
   			fields : [ {
   				name : 'id',
   				type : 'string'
   			},  {
   				name : 'project_name',
   				type : 'string'
   			}, {
   				name : 'create_time',
   				type : 'string'
   			}, {
   				name : 'real_name',
   				type : 'string'
   			}]
   		});
       var sastore = new Ext.data.Store({
			url : path +"/projectmgr/listImport",
			reader : sareader
		});
       sastore.load({params:{start:0,limit:20}})
		
		var sapagingBar = new Ext.PagingToolbar({
			store : sastore,
			displayInfo : true,
			pageSize : sa_pageSize,
			beforePageText : '第',
			afterPageText : '页，共{0}页',
			displayMsg : '第{0}到{1}条记录，共{2}条',
			emptyMsg : "没有记录"
		});
		var sasm = new Ext.grid.CheckboxSelectionModel();
        var sacolumn=new Ext.grid.ColumnModel( 
            [ 
            	new Ext.grid.RowNumberer(),
            	sasm,
            	{header:"项目名称",align:'center',dataIndex:"project_name",sortable:true}, 
	            {header:"创建时间",align:'center',dataIndex:"create_time",sortable:true},
	            {header:"创建人",align:'center',dataIndex:"real_name",sortable:true},
	            {header:"操作",align:'center',dataIndex:"id",
	            renderer: function (value, meta, record) {
		              var setBtn = "<input id = 'bt_set_" + record.get('id')
		            	+ "' onclick=\"setProject('" + record.get('id')
		            	+ "');\" type='button' value='设置' width ='15px'/>&nbsp;&nbsp;";
					  var deleteBtn = "<input id = 'bt_delete_" + record.get('id')
						+ "' onclick=\"deleteRom('" + record.get('id')
						+ "');\" type='button' value='删除' width ='15px'/>";
									            			
	//            				var resultStr = String.format(formatStr);
	    				return "<div>" + setBtn+deleteBtn + "</div>";
					  } .createDelegate(this)
	            } 
            ] 
        ); 
    	
        
        var sagrid_ = new Ext.grid.EditorGridPanel({ 
			region:'center',
			border:false,
			autoHeight:true,
			viewConfig: {
	            forceFit: true, //让grid的列自动填满grid的整个宽度，不用一列一列的设定宽度。
	            emptyText: '系统中还没有任务'
	        },
	        sm:sasm,
            cm:sacolumn, 
            store:sastore, 
            autoExpandColumn:0, 
            loadMask:true, 
            frame:true, 
            autoScroll:true, 
            bbar:sapagingBar
        });
    	
    	var safileForm = new Ext.FormPanel({
    		layout : "fit",
    		frame : true,
    		border : false,
    		autoHeight : true,
    		waitMsgTarget : true,
    		defaults : {
    			bodyStyle : 'padding:10px'
    		},
    		margins : '0 0 0 0',
    		labelAlign : "left",
    		labelWidth : 80,
    		fileUpload : true,
    		items : [
    			sagrid_
    		]
    	});
    	
    	var sa_importPanel = new Ext.Panel({
    		layout : "fit",
    		layoutConfig : {
    			animate : true
    		},
    		items : [safileForm]
    	});
    	
    	var sanewWin = new Ext.Window({
    		width : 800,
    		title : '设置项目属性',
    		height : 600,
    		defaults : {// 表示该窗口中所有子元素的特性
    			border : false
    			// 表示所有子元素都不要边框
    		},
    		plain : true,// 方角 默认
    		modal : true,
    		shim : true,
    		collapsible : true,// 折叠
    		closable : true, // 关闭
    		closeAction: 'close',
    		resizable : false,// 改变大小
    		draggable : true,// 拖动
    		minimizable : false,// 最小化
    		maximizable : false,// 最大化
    		animCollapse : true,
    		constrainHeader : true,
    		autoHeight : false,
    		items : [sa_importPanel]
    	});
    	sanewWin.show();
    }
    
function removeByValue(arr, val) {
  for(var i=0; i<arr.length; i++) {
    if(arr[i] == val) {
      arr.splice(i, 1);
      break;
    }
  }
}


function setImportDatabaseMonth(value){

	var gcm = grid.getSelectionModel();
	var dids = '';
	var rows = gcm.getSelections();
//	var delectArray = new Array();
////	delectArray = grid.getStore().data.items;
//	for(var i =0;i<grid.getStore().data.items.length;i++){
//		delectArray.push(grid.getStore().data.items[i].data.id);
//	}
    if (rows.length > 0) {
		for ( var i = 0; i < rows.length; i++) {
			var row = rows[i];
			dids = dids + row.data.id + ','; // 拼装ID串
//			removeByValue(delectArray,row.data.id);
		}
	}else{
		Ext.Msg.alert('提示', '请勾选要操作的记录');
		return;
	}
	Ext.Msg.confirm('确认设置', '确认?',function (button,text){if(button == 'yes'){
		Ext.Ajax.request( {
			  url : qrUrl + "saveCompareMonth.action",
			  method : 'post',
			  params : {
			   ids : dids,
//			   deids:delectArray.join(",")
			   value:value
			  },
			  success : function(response, options) {
			   var o = Ext.util.JSON.decode(response.responseText);
			   if(o.i_type && "success"== o.i_type){
				   Ext.Msg.alert('提示', '设置成功'); 
			   }else{
			   	   Ext.Msg.alert('提示', o.i_msg); 
			   }
			  },
			  failure : function() {
			  	
			  }
 		});
	}});
    

}