<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>主页</title>
<script src="js/jquery-3.2.1.min.js"></script>
<link href="plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=plEzfOG4jm58EGxEsHw4kCPoG3UjOcNv"></script>
<!--<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>-->
<script src="plugins/layer/layer.js"></script>
<script src="js/common.js"></script>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/index_cascade.css">
<link rel="stylesheet" type="text/css"
	href="plugins/earthmap/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="plugins/earthmap/css/layerown.css" />
<script type="text/javascript" src="plugins/earthmap/js/layerown.js"></script>
<link rel="stylesheet" type="text/css"
	href="plugins/earthmap/css/component.css" />
<link rel="stylesheet" type="text/css" href="plugins/slider/slider.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/loader.css"> -->


<!-- <link href="css/industry_map.css" rel="stylesheet" /> -->
<script type="text/javascript" src="js/textIconOverlay.js"></script>
<script type="text/javascript" src="js/maplib.js"></script>


<!--[if IE]>
 		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
<script type="text/javascript">         
    var map ;
    var path = "<%=path%>";
    
	</script>
</head>
<jsp:include page="permission.jsp">
	<jsp:param name="pathName" value="index" />
</jsp:include>
<body style="overflow:hidden;" class="demo-1">

	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
		<div class="load_title">
			拼命加载中<br> <span>请稍后</span>
		</div>
	</div>
	<!--页面加载end-->
	<div id="container" class="container intro-effect-push">
		<header class="header" style="z-index:10;top:0;left:0;">
			<div class="video-class" id="playearthmap">
				<video autoplay muted style="width:100%" onended="endPlay();";>
					<source src="img/dfmz.mp4" type="video/mp4">
				</video>
			</div>
		</header>
		<button class="trigger" data-info="跳过">
			<span>跳过</span>
		</button>
		<div class="myContainer" id="myContainer">
			<transition name="fade">
			<div class="selectedContainer" v-if="cascaderStatus">
				<transition name="fade">
				<div class="selectedResult"
					:style="{width:firstIndex!==''?(secondIndex!==''?'99%':'66%'):'33%'}">
					<div class="selectedResultBtn" @click="cascadeClose()">确定</div>
					<div class="selectedResultContainer">
						<div class="selectedResultWrap"	:style="{width:selectedIndex.length*100+50+'px'}">
							<span class="selectedResultWrapText">结果：</span> <span
								class="selectedResultWrapItem" v-for="(v,i) in selectedIndex">{{v.value}}</span>
						</div>
					</div>
				</div>
				</transition>

				<div class="selectedLine"
					:style="{borderRight:firstIndex!==''?'1px solid #ddd':''}">
					<div class="selectedItem" :style="{color:firstIndex===i?'#3086c3':''}"
						@click="firstClick(v,i)" @mouseenter="firstOver(v,i)" v-for="(v,i) in cascaderData">
						<input style="width:auto;height:auto;margin:auto;padding:auto;float:none"
							:checked="v.status" type="checkbox">{{v.value}}
					</div>
				</div>
				<transition name="fade">
				<div class="selectedLine"
					:style="{borderRight:secondIndex!==''?'1px solid #ddd':'',left:'33%'}"
					v-if="firstIndex!==''">
					<div class="selectedItem"
						:style="{color:secondIndex===i?'#3086c3':''}"
						@click="secondClick(v,i)" @mouseenter="secondOver(v,i)"
						v-for="(v,i) in cascaderData[firstIndex].children">
						<input style="width:auto;height:auto;margin:auto;padding:auto;float:none"
							:checked="v.status" type="checkbox">{{v.value}}
					</div>
				</div>
				</transition>

				<transition name="fade">
				<div class="selectedLine" style="left:66%"
					v-if="firstIndex!==''&&secondIndex!==''">
					<div @click="thirdClick(v,i)" class="selectedItem"
						:style="{color:v.status?'#3086c3':''}"
						v-for="(v,i) in cascaderData[firstIndex].children[secondIndex].children">
						<input style="width:auto;height:auto;margin:auto;padding:auto;float:none"
							:checked="v.status" type="checkbox">{{v.value}}
					</div>
				</div>
				</transition>

				<!-- <div style="width:150px;float:left" v-if="cascaderData[firstIndex].children[secondIndex].children">
                        <div @click="thirdClick(v)" v-for="(v,i) in cascaderData">
                            {{v.id}}
                        </div>
                    </div> -->
			</div>
			</transition>



			<div class="region-list slide-transition sh" style="display: none;"
				v-show="subFlag == 'region'" @mouseenter="subOver('region')"
				@mouseleave="subOut('region')">
				<ul class="first-info-list">
					<li>所有</li>
				</ul>
			</div>

			<div class="myHeader" id="myHeader">
				<a href="" class="logo"></a> <input type="text" id="suggestId"
					placeholder="输入详细地址查询" class="search-input"
					@click="resultFlag = !resultFlag"> <a class="search-btn"
					onclick="searchPlace();"><i class="fa fa-search"
					aria-hidden="true"></i></a>

				<div class="region-box" @mouseenter="over('region')"
					@mouseleave="out('region')">
					<a href="javascript:;" id="regionTab" class="region"
						:class="{'expand':expand=='region'}" @click=""> <span>项目</span>
						<i class="fa fa-sort-desc" aria-hidden="true"></i>
					</a>
				</div>

				<div class="filter-box" @click.stop="cascadeOpen()">
					<a href="javascript:;" class="filter price"> <span>更多</span>
					</a>
				</div>
				<div class="condition-box slide-transition" style="display:none;"
					v-show="subFlag=='more'" @mouseenter="subOver('more')"
					@mouseleave="subOut('more')">
					<div class="condition-row">
						<div class="condition-title">
							<span>测试测试</span>
						</div>
						<div class="condition-colon">：</div>
						<div class="condition-body">
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
						</div>
					</div>
					<div class="condition-row">
						<div class="condition-title">
							<span>测试测试</span>

						</div>
						<div class="condition-colon">：</div>
						<div class="condition-body">
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
							<div class="condition-item" @click="cbSelect($event)">
								<div class="checkbox checkbox-lg">
									<span class="check"></span>
								</div>
								<span class="condition-txt">测试</span>
							</div>
						</div>
					</div>

				</div>
				<div class="login-register">
					<i class="fa fa-user" aria-hidden="true"></i>
					<div class="typeUserInfo">
						<div class="no-login">
							<a class="login login-user-btn btn-login ">周润发</a> <a href=""
								target="_blank" class="register"></a>
						</div>
						<div class="logged" style="display: none;">
							<a class="user-name" href=""></a> <a href="" class="">退出</a>
						</div>
					</div>
				</div>
				<a class="go-to-list"><i class="fa fa-list-ul"
					aria-hidden="true"></i>联系管理员</a>
			</div>
			<div id="allmap" class="content"></div>
			<div class="expander fadeOut" @click="expander()"></div>
			<div class="list-container">
				<div class="overlay" style="display: none;"></div>
				<div class="list-header">
					<span class="total-count">共<em>888</em>条信息
					</span>
					<!-- 
                    <span class="sort" data-dianji="time/排序">开盘时间<i class="fa fa-arrow-down" aria-hidden="true"></i></span>
                    <span class="sort" data-dianji="price/排序">价格<i class="fa fa-arrow-up" aria-hidden="true"></i></span>
                    <span class="sort on" data-dianji="default/排序">默认</span>
                     -->
				</div>
				<div class="item-wrap" style="overflow-x:hidden;overflow-y:auto;">
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="1617">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/lujinsheshanyuanzibs/">南龙谭苑小区</a>
								</span> <span class="villa-name">松江区</span>
								<!-- <span class="sale-status" data-status="在售">正常</span> -->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/测试图片详情"></i>
							</div>
							<div>
								<span>检查人员：赵苏鸣</span> <span class="price">详情</span>
							</div>
							<div>
								<span>经度：121.239</span>
							</div>
							<div>
								<span>纬度：31.015</span>
							</div>
						</div>
						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="1474">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/xiangyitiandi/">XXXXXX</a>
								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注香溢花城"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>
						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="1616">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/lujinsheshanyuanzi/">XXXXXX</a>
								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/测试图片详情"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>
						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="349">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/shanghaivillabs/">XXXXXX</a>
								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注上海villa"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>饭店测试</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>
						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="1618">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/yuzhoufu/">XXXXXX</a>
								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注禹洲府"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>
						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="1253">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/jindishijia/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注金地世家"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="1268">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/biyunyilingbs/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注碧云壹零（饭店）"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>饭店测试</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="73">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/mingtianhuachengerqi/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注XXXXXX"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="127">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/zhengrongguolingbs/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/XXXXXX"></i>
							</div>
							<div>
								<span>115-360m²</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>饭店测试</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="160">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/hongqiaozhengrongfu/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/关注虹桥正荣府"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="390">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/jiabaomengzhiyuanjingting/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/XXXXXX"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
					<div class="list-item" @click="showDetail()"
						data-dianji="go-to-detail" data-id="768">
						<img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;"
							src="img/mz.jpg">
						<div class="right-info">
							<div>
								<span class="title"> <a target="_blank"
									href="/detail/yuanchangxingfuli/">XXXXXX</a>

								</span> <span class="villa-name">饭店</span>
								<!--<span class="sale-status" data-status="在售">在售</span>-->
								<i class="iconfont favor-icon" style="display: none;"
									data-dianji="favor/XXXXXX"></i>
							</div>
							<div>
								<span>XXXXXX</span> <span class="price">XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
							<div>
								<span>XXXXXX</span>
							</div>
						</div>

						<hr>
					</div>
				</div>
			</div>
			<div class="detail" style="display:none;overflow:hidden;">
				<div class="imgBox">
					<div class="js-silder">
						<div class="silder-scroll">
							<div class="silder-main">
								<div class="silder-main-img">
									<img src="img/1.jpg" alt="">
								</div>
								<div class="silder-main-img">
									<img src="img/2.jpg" alt="">
								</div>
								<div class="silder-main-img">
									<img src="img/3.jpg" alt="">
								</div>
								<div class="silder-main-img">
									<img src="img/4.jpg" alt="">
								</div>
								<div class="silder-main-img">
									<img src="img/5.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="houseInfo" style="margin: 0.3rem 0.85rem;">
					<span class="title" style="font-weight:bolder;font-size:0.9rem;">
						<a target="_blank" href="">南龙谭苑小区</a>
					</span> <span class="villa-name">松江区</span>
					<!-- <span class="sale-status" data-status="在售"></span> -->
					<i class="iconfont favor-icon" style="display: none;"
						data-dianji="favor/关注路劲佘山院子（别墅）"></i>
					<div class="inlineText">
						<span><span class="tag">检查人员</span><span>赵苏鸣</span></span><span
							class="afterSpan"><span class="tag">完成时间：</span><span>2017-11-18
								00:00:00</span></span>
					</div>
					<div class="inlineText">
						<span><span class="tag">调研编号：</span><span class="price">0701163pp</span></span><span
							class="afterSpan"><span class="tag">地址：</span><span>岳阳街道中山二路125弄</span></span>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="js/vue.min.js"></script>
<script src="js/index.js"></script>
<script src="plugins/earthmap/js/classie.js"></script>
<script src="plugins/slider/wySilder.min.js" type="text/javascript"></script>
</html>