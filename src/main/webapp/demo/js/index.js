new Vue({
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
        cascaderData:[{//三级联动数据
            id:1,
            value:'1',
            children:[{
                id:11,
                value:'11',
                children:[{
                    id:111,
                    value:'111',
                    status:false
                },{
                    id:112,
                    value:'112',
                    status:false,
                },{
                    id:113,
                    value:'113',
                    status:false
                },{
                    id:114,
                    value:'114',
                    status:false
                },{
                    id:115,
                    value:'115',
                    status:false
                }]
            },{
                id:12,
                value:'12',
                children:[{
                    id:121,
                    value:'111',
                    status:false
                },{
                    id:122,
                    value:'112',
                    status:false
                },{
                    id:123,
                    value:'113',
                    status:false
                },{
                    id:124,
                    value:'114',
                    status:false
                },{
                    id:125,
                    value:'115',
                    status:false
                }]
            },{
                id:13,
                value:'13',
                children:[{
                    id:131,
                    value:'111',
                    status:false
                },{
                    id:132,
                    value:'112',
                    status:false
                },{
                    id:133,
                    value:'113',
                    status:false
                },{
                    id:134,
                    value:'114',
                    status:false
                },{
                    id:135,
                    value:'115',
                    status:false
                }]
            },{
                id:14,
                value:'14',
                children:[{
                    id:141,
                    value:'111',
                    status:false
                },{
                    id:142,
                    value:'112',
                    status:false
                },{
                    id:143,
                    value:'113',
                    status:false
                },{
                    id:144,
                    value:'114',
                    status:false
                },{
                    id:145,
                    value:'115',
                    status:false
                }]
            },{
                id:15,
                value:'15',
                children:[{
                    id:151,
                    value:'111',
                    status:false
                },{
                    id:152,
                    value:'112',
                    status:false
                },{
                    id:153,
                    value:'113',
                    status:false
                },{
                    id:154,
                    value:'114',
                    status:false
                },{
                    id:155,
                    value:'155',
                    status:false
                }] 
            }]
        },{
            id:2,
            value:'1',
            children:[{
                id:21,
                value:'21',
                children:[{
                    id:211,
                    value:'111',
                    status:false
                },{
                    id:212,
                    value:'112',
                    status:false
                },{
                    id:213,
                    value:'113',
                    status:false
                },{
                    id:214,
                    value:'114',
                    status:false
                },{
                    id:215,
                    value:'115',
                    status:false
                }]
            },{
                id:22,
                value:'22',
                children:[{
                    id:221,
                    value:'111',
                    status:false
                },{
                    id:222,
                    value:'112',
                    status:false
                },{
                    id:223,
                    value:'113',
                    status:false
                },{
                    id:224,
                    value:'114',
                    status:false
                },{
                    id:225,
                    value:'115',
                    status:false
                }]
            },{
                id:23,
                value:'23',
                children:[{
                    id:231,
                    value:'111',
                    status:false
                },{
                    id:232,
                    value:'112',
                    status:false
                },{
                    id:233,
                    value:'113',
                    status:false
                },{
                    id:234,
                    value:'234',
                    status:false
                },{
                    id:235,
                    value:'235',
                    status:false
                }]
            },{
                id:24,
                value:'24',
                children:[{
                    id:241,
                    value:'241',
                    status:false
                },{
                    id:242,
                    value:'242',
                    status:false
                },{
                    id:243,
                    value:'243',
                    status:false
                },{
                    id:244,
                    value:'244',
                    status:false
                },{
                    id:245,
                    value:'245',
                    status:false
                }]
            },{
                id:25,
                value:'25',
                children:[{
                    id:251,
                    value:'251',
                    status:false
                },{
                    id:252,
                    value:'252',
                    status:false
                },{
                    id:253,
                    value:'253',
                    status:false
                },{
                    id:254,
                    value:'254',
                    status:false
                },{
                    id:255,
                    value:'255',
                    status:false
                }]
            },{
                id:26,
                value:'26',
                children:[{
                    id:261,
                    value:'261',
                    status:false
                },{
                    id:262,
                    value:'262',
                    status:false
                },{
                    id:263,
                    value:'263',
                    status:false
                },{
                    id:264,
                    value:'264',
                    status:false
                },{
                    id:265,
                    value:'265',
                    status:false
                }] 
            },{
                id:27,
                value:'27',
                children:[{
                    id:271,
                    value:'271',
                    status:false
                },{
                    id:272,
                    value:'272',
                    status:false
                },{
                    id:273,
                    value:'273',
                    status:false
                },{
                    id:274,
                    value:'274',
                    status:false
                },{
                    id:275,
                    value:'275',
                    status:false
                }] 
            }]
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
    	//地图search框

    	
    	//三级菜单关联操作
    	cascadeClose :function(){
            this.cascaderStatus = false
            this.firstIndex = ''
            this.secondIndex = ''
        },
        //联动关闭
        cascadeOpen: function(){
            this.cascaderStatus = true
        },
        //联动打开
        firstClick :function(index){
            console.log(index)
            this.firstIndex = index
            if(this.secondIndex!==''){
                this.secondIndex=''
            }
            this.selectedIndex = []
        },
        //选择第一级菜单
        secondClick :function(index){
            this.selectedIndex = []
            console.log(this.secondIndex)
            if(this.secondIndex!==''&&this.firstIndex!==''){
                // console.log(this.cascaderData[this.firstIndex])
                this.cascaderData[this.firstIndex].children[this.secondIndex].children.map((v)=>{
                    v.status = false
                })
            }
            this.secondIndex = index
            // this.cascaderData[firstIndex].children[index].map((v)=>{
            //     console.log(v)
            // })
        },
         //选择第二级菜单
        thirdClick :function(item,index){
            console.log(item)
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
         //选择第三级菜单
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
