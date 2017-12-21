	$(document).ready(function() { 
    	$('#myContainer').hide();
        $('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
        
    	$(".js-silder").silder({
			auto: true,//自动播放，传入任何可以转化为true的值都会自动轮播
			speed: 20,//轮播图运动速度
			sideCtrl: true,//是否需要侧边控制按钮
			bottomCtrl: true,//是否需要底部控制按钮
			defaultView: 0,//默认显示的索引
			interval: 3000,//自动轮播的时间，以毫秒为单位，默认3000毫秒
			activeClass: "active",//小的控制按钮激活的样式，不包括作用两边，默认active
		});
    	getObjectList();//加载项目数据
		
    }); 
    
	function getObjectList(){
		$.post(path+"/webctrl/getObjectListByUserRole/", 
		{
		},
		function(result){
			if(result.success == true){//登陆成功
				$.each(result.data, function (index, obj) {
	               var lis = "";
	               trs = "<li id=\""+obj.id+"\"><span class=\"text\">"+obj.menu_name+"&nbsp;&nbsp;</span></li>";
	               $(".first-info-list").append(trs);
	           });
			}else {
				window.location.href="login.jsp"; 
			}
		},'json');
	}
	
	
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
	    {"input" : "suggestId"
	    ,"location" : map
	    ,"onSearchComplete" : function(e) {
	    	//console.log(e);
	    }
	});
	
	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
	var _value = e.fromitem.value;
	var value = "";
	if (e.fromitem.index > -1) {
	        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	    }    
	    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
	
	    value = "";
	if (e.toitem.index > -1) {
	        _value = e.toitem.value;
	        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	    }    
	    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
	    //G("searchResultPanel").innerHTML = str;
	});
	
	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
	    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	    setPlace(myValue);
	});
	
	var myGeo = new BMap.Geocoder();// 将地址解析结果显示在地图上,并调整地图视野
	function setPlace(detailAddress){// 创建地址解析器实例
		myGeo.getPoint(detailAddress, function(point){
			console.log(point);
			if (point) {
			    map.centerAndZoom(point, 14);
			    //map.addOverlay(new BMap.Marker(point));
			}else{
				alert("没有查询到相关信息");
			}
		}, "上海");
	}
	
	function searchPlace(){
		var input = $("#suggestId").val();
		setPlace(input);
	}





var vm = new Vue({
    el: '#myContainer',
    data: {
        resultFlag: false,
        subFlag: 0,
        mainFlag: 0,
        selected: 1,
        expand: 0,
        cascaderStatus:false,//三级联动的开关
        firstIndex:'',//一级的坐标
        secondIndex:'',//二级的坐标
        show:false,
        selectedIndex:[],//最终结果的数组
      //三级联动数据
        cascaderData:[{
    		"checked":false,
    		"children":[
    			{
    				"checked":false,
    				"children":[
    					{
    						"checked":false,
    						"children":null,
    						"id":"2048",
    						"leaf":true,
    						"value":"吴秋明",
    						"parent_id":"00151382364464901262005056c00001"
    					}
    				],
    				"id":"00151382364464901262005056c00001",
    				"leaf":false,
    				"value":"检查人员",
    				"parent_id":"00151382364464001251005056c00001"
    			}
    		],
    		"id":"00151382364464001251005056c00001",
    		"leaf":false,
    		"value":"2017年10月上海城管小区问题清单",
    		"parent_id":null
    	}]
        
    },
    mounted() {
    	// 百度地图API功能
    	map = new BMap.Map("allmap",{enableMapClick:false});    // 创建Map实例
    	map.centerAndZoom(new BMap.Point(121.47, 31.23), 12);  // 初始化地图,设置中心点坐标和地图级别
    	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    	map.addControl(new BMap.NavigationControl({enableGeolocation:true}));
    	map.addControl(new BMap.OverviewMapControl());
    	map.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
    	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    	//===================
    	var xy = [
    		{'x':121.48123,'y':31.23123},
    		{'x':121.4723,'y':31.25123},
    		{'x':121.48223,'y':31.33123},
    		{'x':121.46623,'y':31.35123},
    		{'x':121.23123,'y':31.36123},
    		{'x':121.25123,'y':31.22123},
    		{'x':121.36123,'y':31.28123},
    		{'x':121.45123,'y':31.12123},
    		{'x':121.5623,'y':31.8123},
    		{'x':121.45623,'y':31.73123},
    		{'x':121.38123,'y':31.63123}
    	];
    	var markers = [];
    	var pt = null;
    	for (var i in xy) {
    	   pt = new BMap.Point(xy[i].x , xy[i].y);
    	   var marker = new BMap.Marker(pt);
    	   marker.addEventListener("click", showInfo)
    	   markers.push(marker);
    	}
    	//生成一个marker数组，然后调用markerClusterer类即可。
    	var markerClusterer = new BMapLib.MarkerClusterer(map,
    		{
    			markers:markers,
    			girdSize : 100,
    			styles : [{
    	            url:'./img/blue.png',
    	            size: new BMap.Size(92, 92),
    	        	textColor: '#fff',  //文字颜色
    	        	textSize: 20,  //字体大小
    				backgroundColor : '#E64B4E'
    			}],
    		});
    	markerClusterer.setMaxZoom(13);
    	markerClusterer.setGridSize(100);
	},
    methods: {
    	//三级菜单关联操作
    	cascadeClose :function(){//联动关闭
            this.cascaderStatus = false
            this.firstIndex = ''
            this.secondIndex = ''
        },
        
        cascadeOpen: function(){//联动打开
            this.cascaderStatus = true
        },
        
        firstOver :function(item,index){//选择第一级菜单
            this.firstIndex = index
            this.cascaderData[this.firstIndex].children.map((v)=>{
            	$.each(this.selectedIndex, function(idx, obj) {
            	    if(obj.id == v.id){
            	    	v.status == true;
            	    }
            	});
            })
            if(this.secondIndex!==''){
                this.secondIndex=''
            }
        },
        
        secondOver :function(item,index){//选择第二级菜单
            //this.selectedIndex = []
            if(this.secondIndex!==''&&this.firstIndex!==''){
                this.cascaderData[this.firstIndex].children[this.secondIndex].children.map((v)=>{
                	$.each(this.selectedIndex, function(idx, obj) {
                	    if(obj.id == v.id){
                	    	v.status == true;
                	    }
                	});
                })
            }
            
            this.secondIndex = index
            // this.cascaderData[firstIndex].children[index].map((v)=>{
            //     console.log(v)
            // })
        },
         
        firstClick :function(item,index){//选择第一级菜单
        	if(item.status){
        		item.status = false
        		this.selectedIndex.map((v,i)=>{
        			if(v.id==item.id){
        				this.selectedIndex.splice(i,1)
        			}
        		})
        	}else{
        		this.selectedIndex.push(item)
        		item.status = true
        	}
        },
        
        secondClick :function(item,index){//选择第二级菜单
        	//this.selectedIndex = []
        	if(item.status){
        		item.status = false
        		this.selectedIndex.map((v,i)=>{
        			if(v.id==item.id){
        				this.selectedIndex.splice(i,1)
        			}
        		})
        	}else{
        		this.selectedIndex.push(item)
        		item.status = true
        	}
        },
        
        thirdClick :function(item,index){//选择第三级菜单
        	if(item.status){   
        		item.status = false
        		this.selectedIndex.map((v,i)=>{
        			if(v.id==item.id){
        				this.selectedIndex.splice(i,1)
        			}
        		})
        	}else{
        		this.selectedIndex.push(item)
        		item.status = true
        	}
        },
         
        out: function (current) {
            setTimeout(() => {
                if (this.mainFlag == 1) {
                    this.subFlag = 0;
                    this.mainFlag = 0;
                    this.expand = 0;
                }
            }, 300);
        },
        over: function (current) {
            this.selected = 1;
            this.mainFlag = 1;
            this.subFlag = current;
            this.expand = current;
        },
        subOver: function (current) {
            this.mainFlag = 0;
            this.subFlag = current;
        },
        subOut: function (current) {
            this.subFlag = 0;
            this.expand = 0;
        },
        cbSelect: function(e) {
            var that = $(e.target).parent('.condition-item');
            if(that.hasClass('selected')){
                that.removeClass('selected');
            }else{
                that.addClass('selected');
            }
        },
        smcbSelect: function(e) {
            var that = $(e.target).parent('li');
            if(that.hasClass('selected')){
                that.removeClass('selected');
            }else{
                that.addClass('selected');
            }
        },
        expander: function(){
            if ($('.expander').hasClass("fadeIn")) {
                $('.content').css("width", "73%");
                $('.expander').css("right", "26.2%");
                $('.expander').css("background",
                    "url('img/map-expander.png') 100% 0% no-repeat");
                $('.expander').removeClass("fadeIn");
                $('.expander').addClass("fadeOut");
            } else {
                $('.content').css("width", "100%");
                $('.expander').css("right", "0");
                $('.expander').css("background",
                    "url('img/map-expander.png') 35% 0% no-repeat");
                $('.expander').removeClass("fadeOut");
                $('.expander').addClass("fadeIn");
            }
        },
        showDetail: function(total){
            layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                area: ['40rem', '30rem'],
                shadeClose: true,
                scrollbar: false, 
                content: $('.detail')
            });
            $(".js-silder").silder({
                auto: true,//自动播放，传入任何可以转化为true的值都会自动轮播
                speed: 20,//轮播图运动速度
                sideCtrl: true,//是否需要侧边控制按钮
                bottomCtrl: true,//是否需要底部控制按钮
                defaultView: 0,//默认显示的索引
                interval: 3000,//自动轮播的时间，以毫秒为单位，默认3000毫秒
                activeClass: "active",//小的控制按钮激活的样式，不包括作用两边，默认active
            });
            $('.silder-ctrl-con').each((idx,val) => {
                idx >= 5 ? $(val).remove() : val
            });
        }
    }
})



function showInfo(e){
//	console.log(marker);
	console.log(e.point.lat+","+e.point.lng);
}
