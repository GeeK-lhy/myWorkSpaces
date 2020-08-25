<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->

<script src="http://api.tianditu.gov.cn/api?v=4.0&tk=23dd028686b188c7e10b93f218494d76" type="text/javascript"></script>
<link href="http://www.12379.cn/html/new2018/css/map.css" rel="stylesheet" type="text/css" />
<link href="http://www.12379.cn/html/new2018/css/base.css" rel="stylesheet" type="text/css" />
<script src="http://www.12379.cn/html/new2018/js/jquery.min.js"></script>
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<!--[if IE 8]>
<script type="text/javascript" src="/html/new2018/js/jquery.js"></script>
<![endif]-->

<script>
    document.write("<s"+"cript type='text/javascript' src='http://www.12379.cn/html/new2018/new.js?"+Math.random()+"'></scr"+"ipt>");
            var now = new Date();
            var number = now.getYear().toString() + now.getMonth().toString() + now.getDate().toString() + now.getHours().toString() + now.getMinutes().toString() + now.getSeconds().toString();

		   document.write("\<script language=\"javascript\" type=\"text/javascript\" src=\"http://www.12379.cn/data/index_map_all.html?" + number + "\"><\/script\>"); 

</script>



<style>
/* 始终不显示滚动条 */
body {
	overflow-x: hidden; /*隐藏水平滚动条*/
	overflow-y: hidden; /*隐藏水平滚动条*/

}
.tdt-bottom {
    bottom: -30px;
}
.absolute {
    position: absolute;
    bottom: 45px;
}
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}

/* online */
#online_qq_tab a,.onlineMenu h3,.onlineMenu li.tli,.newpage{background:url(http://www.12379.cn/html/new2018/img/tubiao.png) no-repeat;}
#onlineService,.onlineMenu,.btmbg{border: 1px #00a0e9 solid;}

#online_qq_layer{z-index:9999;position:fixed;right:0px;bottom: 45px;}
*html,*html body{background-image:url(about:blank);background-attachment:fixed;}
*html #online_qq_layer{position:absolute;top:expression(eval(document.documentElement.scrollTop));}

#online_qq_tab{width:162px;position:relative;z-index:9;}
#online_qq_tab a{display:block;height:29px;overflow:hidden;line-height: 100px;}
#online_qq_tab a#floatShow{background-position:0px -30px;;}
#online_qq_tab a#floatHide{background-position:0px -1px;}

#onlineService{display:inline;margin-left:-1px;float:right;width:160px;background-position:0 0;padding:10px 0 10px 0;}


.wyzx{padding:8px 0 0 5px;height:57px;overflow:hidden;background:url(images/webZx_bg.jpg) no-repeat;}

.btmbg{height:12px;overflow:hidden;background-position:-131px 0;}
#onlineService div{
margin-left: 20px;
margin-top: 10px;
width:200px;
}
#onlineService {background: #ffffff;}
#onlineService div dt{
    float: left;
}
#onlineService div dt img{
    width:31px;
}
#onlineService div dt{
margin-top: 5px;
    width: 15px;
    height: 15px;
}
#onlineService div dd{
    float: left;
	margin-top: 5px;
    margin-left: 20px;
}
.onlineService_red dt{background-color: #FF0000;}
.onlineService_orange dt{background-color: #FFA500}
.onlineService_yellow dt{background-color: #edd405}
.onlineService_blue dt{background-color: #0000FF}
.onlineService_unknown dt{background-color: #999999}
.onlineService_red dt{background-color: #FF0000;}
.onlineService_orange dt{background-color: #FFA500}
.onlineService_yellow dt{background-color: #edd405}
.onlineService_blue dt{background-color: #0000FF}
.onlineService_unknown dt{background-color: #999999}
.PcPoPmarket{z-index:1000;position:fixed;right:0px;bottom:0px;width:350px;height:238px;overflow:hidden;background:url(bg_open.png) no-repeat;}
*html .PcPoPmarket{position:absolute;}
.popTop{position:absolute;height:30px;overflow:hidden;bottom: 210px;z-index: 999999;width: 300px;background-color: #fff;
    left: 9px;filter:alpha(Opacity=90);-moz-opacity:0.9;opacity:0.9;}
.popTop h2{color:#ff0000;font-size:14px;float:left;padding:8px 0 0 10px;line-height:20px;}
.popBtn{width:18px;height:18px;overflow:hidden;cursor:pointer;float:right;margin-left:1px;margin-top:7px;display:inline;background:url(http://www.12379.cn/html/new2018/img/buttons.png) no-repeat;}
.popClose{margin-right:10px;width:15px;background-position:-39px 0}
.popClose:hover{background-position:-39px -20px}
.popShow{background-position:0px 0}
.popShow:hover{background-position:0px -20px}
.popHide{background-position:-19px 0}
.popHide:hover{background-position:-19px -20px}
.poplist{padding:10px;}
.poplist li{font-size:14px;height:28px;line-height:28px;}
</style>
<title></title>

<script language="javascript">
        var m1="mapDiv";
	var m2="minmap";
        var map;
	var map2;
            //加载基本地图和导航
		function loadMap(){
			try {
	            map = new T.Map(m1); //初始化地图对象
                    map.enableDrag();
	        	map.centerAndZoom(new T.LngLat(101.22458648681652,35.10902786254877), 4);//设置显示地图的中心点和级别
	        	//map.enableHandleMouseScroll(); //允许鼠标双击放大地图   
				
	        	
				map2 = new T.Map(m2); //初始化地图对象
	        	map2.centerAndZoom(new T.LngLat(0,0), 1);//设置显示地图的中心点和级别
				$("#minmap").css("position","");
	        	
	        }catch(err) {
	        /* 	alert('图加载不成功，请稍候再试！你可以先使用其他功能！'+err); */
	        }
	    }
		//alert(lx.area.points[0].region);

		//绘制
		function drawArea(){
				 
				//alert(alertData.length);
				var color;
		        for(var i = 0;i < alertData_new.length;i++){ 
				    var icode=alertData_new[i].identifier;
                                     var desc=alertData_new[i].areaDesc;
                    
                    color=alertData_new[i].severity;
                    if(color=="unknown"){color="#999999";}
                    if(color=="yellow"){color="#FFFF00";}
                    if(color=="orange"){color="#FFA500";}
                    if(color=="blue"){color="#0000ff";}
                    if(color=="red"){color="#FF0000";}
                    
					var style = { 
					color : color, 
					opacity : 0.9, 
					weight:0,
		        	fillOpacity : 0.9, //透明度 
		        	lineStyle : "" //虚线 
					}
					var city=icode.substring(2,4);
					var county=icode.substring(4,6);

					if(city=="00"&&county=="00"&&desc!="000000000000"){
						continue;
					}

					   var poinsts=alertData_new[i].points;
					   var pointArr2 = poinsts.split(","); 
					   var pointsz2 = []; 
					   for(var t = 0;t < pointArr2.length - 1;t++){ 
						//console.log(style);
						var p = pointArr2[t].trim(); 
						var pArr = p.split(" "); 
						var point = new T.LngLat(pArr[0],pArr[1]); 
						//console.log(pArr[0]+"----------"+pArr[1]);
						pointsz2.push(point);		 
					   }
						var poly2 = new T.Polygon(pointsz2,style); 
                                                 //console.log(desc+"-----");
                                                 if(desc=="000000000000"){
					        map2.addOverLay(poly2);
					        }else{
                                                 map.addOverLay(poly2);
					        }
						poly2.data=alertData_new[i];
						//console.log(pointArr2);
						poly2.addEventListener("click", onClick);
				           }
			}
alertData.sort(function(a,b){  
    if(a.sendTime<b.sendTime){  
        return 1;  
    }else if(a.sendTime>b.sendTime){  
        return -1;  
    }else{  
        if(a.sendTime<b.sendTime){  
            return -1;  
        }else if(a.sendTime>b.sendTime){  
            return 1;  
        }  
        return 0;  
    }  
});  
		function onClick(e){
			var polygon=this;
			var alertDatas=polygon.data;
			//console.log(e.lnglat);
			var config={
				minWidth:450,
				maxWidth:460,
				closeOnClick:true
			};
			//var lnglat = new T.LngLat(101.22, 35.9);
			var lnglat=e.lnglat;
                  function cutstr(str,m,n,s){
			if(str.length>n){
				str=str.substring(m,m+n)+s;
			}
			return str;
		}
			
            //创建信息窗口对象
            var infoWin = new T.InfoWindow('',config);
            infoWin.setLngLat(lnglat);
            //设置信息窗口要显示的内容

var idcode2="";
					var idcode=alertDatas.identifier;
					idcode = idcode.substring(0,6);
                                         var html="";
                    for(var j=0;j<alertData.length;j++){
                    idcode2=alertData[j].identifier;
                    idcode2=idcode2.substring(0,6);
                    if(idcode==idcode2){
			color=alertData[j].severity;
var link='http://www.12379.cn/html/new2018/alarmcontent.shtml?file='+alertData[j].identifier+'.html';
if(alertDatas.areaDesc=="000000000000"){
link="#";
}
                    if(color=="unknown"){color="#999999";}
                    if(color=="yellow"){color="#edd405";}
                    if(color=="orange"){color="#FFA500";}
                    if(color=="blue"){color="#0000FF";}
                    if(color=="red"){color="#FF0000";}
					html+='<div><div class="summary"><dl><dt><span class="map_red" style="background:'+color+'"></span><a href='+link+' title="'+alertData[j].headline+'"><h2 style="color:'+color+'">'+cutstr(alertData[j].headline,0,18,"...")+'</h2></a><span class="map_time">'+alertData[j].sendTime.substring(0,19)+'</span><div class="clear"></div></dt><dd><p>'+alertData[j].description+'</p></dd></dl></div><div class="map_title"><ul></ul></div></div>';
					}
                    }

       
            infoWin.setContent(html);

            //向地图上添加信息窗口
 if(alertDatas.areaDesc=="000000000000"){
        map2.addOverLay(infoWin);
 }else{
       map.addOverLay(infoWin);
 }
		}
		function init(s){
			if(s!=0){
			var tmp=m1;
			m1=m2;
			m2=tmp;
			}
		    loadMap();//加载地图。
			drawArea();
		}
		$(function(){
			init(0);
		});
		function showDiv(innerCall){
    if(document.getElementById('minmap')==null)return;
		document.getElementById('minmap').style.width = 300+'px';
		document.getElementById('minmap').style.height = 200+'px';
		document.getElementById('popTop').style.bottom = 210+'px';
		document.getElementById('popTop').style.width = 300+'px';
		document.getElementById('showvod').style.display = 'none';
		document.getElementById('hidevod').style.display = 'block';	
}

function hideDiv(innerCall){
    if(document.getElementById('minmap')==null)return;
	
	document.getElementById('minmap').style.width = 226 + 'px';
	document.getElementById('minmap').style.height = 30 + 'px';
	document.getElementById('popTop').style.bottom = 41+'px';
         document.getElementById('popTop').style.width = 226 + 'px';
	document.getElementById('hidevod').style.display = 'none';
	document.getElementById('showvod').style.display = 'block';
}

function closeDiv(innerCall){
    if(document.getElementById('minmap')==null)return;
	document.getElementById('minmap').style.display = 'none';
        document.getElementById('popTop').style.display = 'none';
}
$(top.hangge());
        </script>
<style type="text/css">
body {
	margin: 0px;
}
#mapDiv{
		height:600px;
		margin: 10px;
		border: 1px solid #ccc;
		margin: 0 auto;
	}
#minmap{
	    width:300px;
		height:200px;
		/**top:378px;**/
		bottom:40px;
		left:8px;
		position:absolute;
		z-index:99999;
		border:1px solid blue;
		/**background-color:green;**/
    filter: alpha(opacity:90);
    opacity: 0.9;
	}
</style>
</head>

<body>
      <div class="banner" >
			<div class="logo"hidden="hidden"><img src="http://www.12379.cn/html/new2018/img/logo.png" /></div>
			<div class="title"hidden="hidden">国家突发事件预警信息发布网</div>
			<div class="switch"hidden="hidden"><a class="ash"  href="http://www.12379.cn/index.shtml" onclick="">颜色</a><a href="http://www.12379.cn/tb/index.shtml" class="white" onclick="">图标</a></div>
			<div class="search"hidden="hidden">
				<input id="searchkeydeH" type="text" onchange="this.id='searchkeyH';"  onfocus="if(this.value==this.defaultValue){this.value=''}" onblur="if(this.value==''){this.value=this.defaultValue}" type="text" value="请输入地名搜索预警信息" onfocus="if(this.value==this.defaultValue){this.value=''}" onblur="if(this.value==''){this.value=this.defaultValue}" />
				<div class="ico"><img src="http://www.12379.cn/html/new2018/img/search.png"  onclick="searchH();"/></div>
		</div>
<script type="text/javascript">

//修改详情网页查询 Turbcms后台升级
function searchH(){
	var keyvalue;
	var objInput = document.getElementById("searchkeyH");
	if(objInput==null)
		keyvalue='';
	else
	    keyvalue = objInput.value;
    if(keyvalue!=''){
        var url=encodeURI("http://www.12379.cn/html/new2018/search.shtml?query="+keyvalue);
    	 window.parent.location.href=url; ///ais/wwwroot/gjyjxxfbw
    }else{
    window.parent.location.href="http://www.12379.cn/html/search.shtml?query=";
}}
</script>
<div class="nav" >
		            <!--通用导航-->
			<div class="nav_left"hidden="hidden">
<a id="home" href="http://www.12379.cn/index.shtml" style="width:105px;"><img src="http://www.12379.cn/html/new2018/img/home.png" /><span>首页</span></a>
<a href="/html/tfsj/index.shtml "><img src="http://www.12379.cn/html/new2018/img/early.png" /><span>突发事件</span></a>
<a class="xiala" href="#" target=_blank style="border-right: 2px #717171 solid;padding: 0px;display: inline-block;
    height: 20px;" 
><img src="http://www.12379.cn/images/yq.png" style="height:25px;"  />
                <ul>
                    <li myurl="https://voice.baidu.com/act/newpneumonia/newpneumonia?fraz=partner&paaz=gjyj">国内实时疫情</li>
<li myurl="http://www.12379.cn/yq/index.shtml">国际实时疫情</li>
                </ul>
</a>

<!-- <a href="/html/zfyj/index.shtml"><img src="/html/new2018/img/Meet.png" /><span>政府应急</span></a> -->
<a href="http://www.12379.cn/html/tzgg/index.shtml" style="border:0;"><img src="/html/new2018/img/notice.png" /><span>通知公告</span></a>
<a href="http://www.12379.cn/html/flzc/index.shtml" style="border-left: 2px #717171 solid;"><img src="http://www.12379.cn/html/new2018/img/Law.png" /><span>法律政策</span></a>
<a href="http://www.12379.cn/html/gywm.shtml" style="border:0;"><img src="http://www.12379.cn/html/new2018/img/notice.png" /><span>关于我们</span></a>

</div>

    <style>
        .xiala {
            position: relative;
        }
        
        .xiala ul {
            position: absolute;
            top: 0;
            left: 0;
            display: inline-block;
            width: 100%;
            height: 20px;
            padding-top: 33px;
            z-index: 1000000;
            display: none;
        }
        
        .xiala ul li {
            height: 45px;
            line-height: 45px;
            text-align: center;
            width: 100%;
            font-size: 14px;
            background: #f7f8fa;
        }
    </style>
    <script>
        $(".xiala").mouseover(function() {
            $(".xiala ul").show()
        })
        $(".xiala ul").mouseout(function() {
            $(".xiala ul").hide()
        })
        $(".xiala ul li").click(function() { 
            window.open($(this).attr("myurl"))
            return false
        })
    </script>

            <!--预警信息-->
			<div class="nav_right"> <a id="orange"><img src="http://www.12379.cn/html/new2018/img/orange.png" /></a><a id="red"><img src="http://www.12379.cn/html/new2018/img/red.png" /></a><a id="blue"><img src="http://www.12379.cn/html/new2018/img/blue.png" /></a>
				<div class="early_warning" id="early_warning" style="display: none">
							<h2>重要预警</h2>
							<span class="line"></span>
							<ul id="the_severity">
								
						</ul>
							<div class="more"><a href="http://www.12379.cn/html/new2018/important.shtml">更多>></a></div>
					</div>
				<div class="early_warning ew1" id="ew1" style="display: none;    background: url(http://www.12379.cn/html/new2018/img/gjyj.png) no-repeat center center;">
							<h2>国家预警</h2>
							<span class="line"></span>
							<ul id="roll">
								
						</ul>


					</div>
				<div class="early_warning ew2" id="ew2" style="display:none;">
							<h2>最新预警</h2>
							<span class="line"></span>
							<ul id="thefour">
								
						</ul>
<div class="more"><a href="http://www.12379.cn/html/new2018/more.shtml">更多>></a></div>

					</div>
		</div>
		
<script>

 	$.getJSON("prediction/toData.do",{"url":"http://www.12379.cn/data/index_roll_4.html"},function(data){
		var  alertData1=data.alertData;
	earlyWarning(alertData1); 
        
    }); 

	function earlyWarning(alerroll) {
        for (var i = 0; i < alerroll.length; i++) {
             var alertdatas = alerroll[i];	
             var datas='<li><span class="'+alerroll[i].severity+'"></span><a href="'+'http://www.12379.cn/html/new2018/alarmcontent.shtml?file='+alerroll[i].identifier+'.html">'+cutstr(alerroll[i].headline,0,30,"...")+'</a><span>'+cutstr(alerroll[i].sendTime,5,5,"")+'</span></li>';
             $("#roll").append(datas);
             
		   
        }
    }
$.getJSON("prediction/toData.do",{"url":"http://www.12379.cn/data/index_list_4.html"},function(data){
    	var  alertData1=data.alertData2;
    
	earlyWarning3(alertData1);
        
    });

	function earlyWarning3(alerroll) {
        for (var i = 0; i < alerroll.length; i++) {
             var alertdatas = alerroll[i];	
             var datas='<li><span class="'+alerroll[i].severity+'"></span><a href="'+'http://www.12379.cn/html/new2018/alarmcontent.shtml?file='+alerroll[i].identifier+'.html">'+cutstr(alerroll[i].headline,0,30,"...")+'</a><span>'+cutstr(alerroll[i].sendTime,5,5,"")+'</span></li>';
             $("#thefour").append(datas);
		   
        }
    }
$.getJSON("prediction/toData.do",{"url":"http://www.12379.cn/data/index_severitylist_4.html"},function(data){
    	var  alertData1=data.alertData2;
	earlyWarning2(alertData1);
        
    });

	function earlyWarning2(alerroll) {
        for (var i = 0; i < alerroll.length; i++) {
             var alertdatas = alerroll[i];	
             var datas='<li><span class="'+alerroll[i].severity+'"></span><a href="'+'http://www.12379.cn/html/new2018/alarmcontent.shtml?file='+alerroll[i].identifier+'.html">'+cutstr(alerroll[i].headline,0,30,"...")+'</a><span>'+cutstr(alerroll[i].sendTime,5,5,"")+'</span></li>';
             $("#the_severity").append(datas);
		   
        }
    }

	function cutstr(str,m,n,s){
			if(str.length>n){
				str=str.substring(m,m+n)+s;
			}
			return str;
		} 
	

</script>

</div>
<div class="classification" hidden="hidden">
<div class="classification_title"><span id="classification_time"></span>,当前生效预警&nbsp;<span id="take" style="color:red"></span>&nbsp;条<a href="http://www.12379.cn/html/new2018/search_list.shtml?query=&details=&category=">列表>></a></div>
<table height="110" border="0" align="center" cellspacing="0" style="display:none" id="onlineService_ico">
<tr style="background-color: #ead9d9;">
    <td align="center" valign="middle" onclick="branch_list()">预警&nbsp;<span id="total"></span></td>
    <td align="center" valign="middle" onclick="branch_list('000000')">国家级&nbsp;<span id="country"></span></td>
    <td align="center" valign="middle" onclick="branch_list('110000')">省级&nbsp;<span id="province"></span></td>
    <td align="center" valign="middle" onclick="branch_list('111100')">市级&nbsp;<span id="city"></span></td>
    <td align="center" valign="middle" onclick="branch_list('111111')">县级&nbsp;<span id="county"></span></td>
  </tr>
  <tr style="background-color: #fff1f1;">
    <td align="center" valign="middle" onclick="colour_list('red')" id="red_1" style="background-color: #FF0000;color:#ffffff">红&nbsp;</td>
    <td align="center" valign="middle"  onclick="details_list('000000','red')" id="red_2">&nbsp;</td>
    <td align="center" valign="middle"  onclick="details_list('110000','red')" id="red_3">&nbsp;</td>
    <td align="center" valign="middle"  onclick="details_list('111100','red')" id="red_4">&nbsp;</td>
    <td align="center" valign="middle"  onclick="details_list('111111','red')" id="red_5">&nbsp;</td>
  </tr>
  <tr style="background-color: #fff9ef;">
    <td align="center" valign="middle" onclick="colour_list('orange')" id="orange_1" style="background-color: #FFA500;color:#ffffff">橙&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('000000','orange')" id="orange_2">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('110000','orange')" id="orange_3">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111100','orange')" id="orange_4">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111111','orange')" id="orange_5">&nbsp;</td>
  </tr>
  <tr style="background-color: #fdfeec;">
    <td align="center" valign="middle" onclick="colour_list('yellow')" id="yellow_1" style="background-color: #edd405;color:#ffffff">黄&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('000000','yellow')" id="yellow_2">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('110000','yellow')" id="yellow_3">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111100','yellow')" id="yellow_4">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111111','yellow')" id="yellow_5">&nbsp;</td>
  </tr>
  <tr style="background-color: #f0f7fc;">
    <td align="center" valign="middle" onclick="colour_list('blue')" id="blue_1" style="background-color: #0000FF;color:#ffffff">蓝&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('000000','blue')" id="blue_2">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('110000','blue')" id="blue_3">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111100','blue')" id="blue_4">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111111','blue')" id="blue_5">&nbsp;</td>
  </tr>
  <tr style="background-color: #f2f2f2;">
    <td align="center" valign="middle" onclick="colour_list('unknown')" id="unknown_1" style="background-color: #999999;color:#ffffff">未知&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('000000','unknown')" id="unknown_2">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('110000','unknown')" id="unknown_3">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111100','unknown')" id="unknown_4">&nbsp;</td>
    <td align="center" valign="middle" onclick="details_list('111111','unknown')" id="unknown_5">&nbsp;</td>
  </tr>

</table>
<div class="ico_list">
<div id="online_qq_tab_ico">
		<a id="floatShow_ico" style="display:block;" href="javascript:void(0);"></a> 
		<a id="floatHide_ico" style="display:none;" href="javascript:void(0);"></a>
	</div>

</div>
</div>

<div id="mapDiv" style="position:relative;width:100%;">
<div id="popTop" class="popTop">
		<h2>世界地图</h2>
		<span class="popBtn popClose" onclick="closeDiv()"></span>
		<span class="popBtn popShow" onclick="showDiv()" id="showvod" style="display: none;"></span>
		<span class="popBtn popHide" onclick="hideDiv()" id="hidevod" style="display: block;"></span>
	</div>
<div id="minmap" onclick="location='/sjdt/index.shtml'"></div>
</div>
<div class="absolute"><div hidden="hidden" class="tdt-control-copyright tdt-control"><div style="height:24px"><img style="background-color:transparent;background-image:url(http://api.tianditu.gov.cn/v4.0/image/logo.png);filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image,src=http://api.tianditu.gov.cn/v4.0/image/logo.png);MozOpacity:1;opacity:1;" src="http://api.tianditu.gov.cn/v4.0/image/logo.png" width="53px" height="22px" opacity="0"><div style="display:inline;position:relative;bottom:4px;white-space:nowrap;padding:0 0 0 3px;">GS(2018)1432号 - 甲测资字1100471</div></div></div></a></div>
<div class="footer" hidden="hidden" style="margin-top:0">Copyright&copy;国家预警信息发布中心 <a href="http://www.beian.miit.gov.cn" target="_brank" style="color: #717171;"> 京ICP证05004897号</a> 京公网安备11041400161号</div>
<div id="online_qq_layer">
<div id="online_qq_tab">
		<a id="floatShow" style="display:none;" href="javascript:void(0);">展开</a> 
		<a id="floatHide" style="display:block;" href="javascript:void(0);">收起</a>
	</div>
<div id="onlineService">
	
	<div class="onlineService_red"><dl><dt></dt><dd>红色预警</dd><div class="clear"></div></dl></dl></div>
	<div class="onlineService_orange"><dl><dt></dt><dd>橙色预警</dd><div class="clear"></div></dl></dl></div> 
	<div class="onlineService_yellow"><dl><dt></dt><dd>黄色预警</dd><div class="clear"></div></dl></dl></div>
	<div class="onlineService_blue"><dl><dt></dt><dd>蓝色预警</dd><div class="clear"></div></dl></dl></div>
	<div class="onlineService_unknown"><dl><dt></dt><dd>未知预警</dd><div class="clear"></div></dl></dl></div>		
	</div>
</div>





</body>
</html>
<script>
    // 计算页面的实际高度，iframe自适应会用到
    function calcPageHeight(doc) {
        var height  = Math.max($(window).height()) 
        return height
    }
    window.onload = function() {
        var height = calcPageHeight(document)
        $("#mapDiv").height(height-169);    }
	$(window).resize(function () {          //当浏览器大小变化时
        var height = calcPageHeight(document);
		$("#mapDiv").height(height-169);
});
$(document).ready(function(){
  $("#red").click(function(){
  $("#ew2").hide(1000);
  $("#ew1").hide(1000);
  $("#early_warning").show(1000);
  });
  $("#blue").click(function(){
  $("#early_warning").hide(1000);
  $("#ew1").hide(1000);
  $("#ew2").show(1000);
  });
  $("#orange").click(function(){
  $("#early_warning").hide(1000);
  $("#ew2").hide(1000);
  $("#ew1").show(1000);
  });
var myDate = new Date();
myDate.getYear(); //获取当前年份(2位)
myDate.getFullYear(); //获取完整的年份(4位,1970-????)
myDate.getMonth(); //获取当前月份(0-11,0代表1月)
myDate.getDate(); //获取当前日(1-31)
myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
myDate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
myDate.getHours(); //获取当前小时数(0-23)
myDate.getMinutes(); //获取当前分钟数(0-59)
myDate.getSeconds(); //获取当前秒数(0-59)
myDate.getMilliseconds(); //获取当前毫秒数(0-999)
myDate.toLocaleDateString(); //获取当前日期
var mytime=myDate.toLocaleTimeString(); //获取当前时间
myDate.toLocaleString( ); //获取日期与时间
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "H+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
var mycars=new Array();
var mycars2=new Array();
var mycars3=new Array();
var mycars4=new Array();

var j=0;
var x=0;
var z=0;
var y=0;
for(var i = 0;i < alertData.length;i++){ 
var area="";
var area2="";
var area3="";
var area4="";
                                     var desc=alertData[i].areaDesc;
                                     area=desc.substring(0,6);
                                     area2=desc.substring(2,6);
                                     area3=desc.substring(2,4);
                                     area4=desc.substring(4,6);
                                     if(area=="000000"){
                                      mycars[j]=alertData[i];
                                      j++;
                                      }else{
                                     if(area2=="0000"){
                                     mycars2[x]=alertData[i];
                                     x++;
                                   }else if(area4=="00" && area3!="00"){
                                     mycars3[z]=alertData[i];
                                     z++;
 }else if(area4!="00"){
                                     mycars4[y]=alertData[i];
                                     y++;
 }
}
}
function datas(alertData){
var list=alertData;
var data = [];
for(var i = 0; i < list.length; i++) {
    if(!data[list[i].severity]) {
        var arr = [];
        arr.push(list[i]);
        data[list[i].severity] = arr;
    }else {
        data[list[i].severity].push(list[i])
    }
}
return data;
}
function count_red(counts){
//console.log(counts.red);
    if(counts.red==null){
    return 0;
    }else{
    return counts.red.length;
}
}
function count_orange(counts){
//console.log(counts.blue);
    if(counts.orange==null){
    return 0;
    }else{
    return counts.orange.length;
}
}
function count_yellow(counts){
//console.log(counts.red);
    if(counts.yellow==null){
    return 0;
    }else{
    return counts.yellow.length;
}
}
function count_blue(counts){
//console.log(counts.blue);
    if(counts.blue==null){
    return 0;
    }else{
    return counts.blue.length;
}
}
function count_unknown(counts){
//console.log(counts.unknown);
    if(counts.unknown==null){
    return 0;
    }else{
    return counts.unknown.length;
}
}
var time = new Date().Format("yyyy-MM-dd HH:mm");
document.getElementById("classification_time").innerHTML = '截止'+time;
document.getElementById("take").innerHTML = alertData.length;
document.getElementById("total").innerHTML = alertData.length;
document.getElementById("country").innerHTML = mycars.length;
document.getElementById("province").innerHTML = mycars2.length;
document.getElementById("city").innerHTML = mycars3.length;
document.getElementById("county").innerHTML = mycars4.length;
console.log(datas(alertData).red);
if(datas(alertData).red==undefined){

document.getElementById("red_1").innerHTML = 0;
}else{
document.getElementById("red_1").innerHTML = datas(alertData).red.length;
}
document.getElementById("red_2").innerHTML = count_red(datas(mycars));
document.getElementById("red_3").innerHTML = count_red(datas(mycars2));
document.getElementById("red_4").innerHTML = count_red(datas(mycars3));
document.getElementById("red_5").innerHTML = count_red(datas(mycars4));
if(datas(alertData).orange==undefined){

document.getElementById("orange_1").innerHTML = 0;
}else{
document.getElementById("orange_1").innerHTML = datas(alertData).orange.length;
}

document.getElementById("orange_2").innerHTML = count_orange(datas(mycars));
document.getElementById("orange_3").innerHTML = count_orange(datas(mycars2));
document.getElementById("orange_4").innerHTML = count_orange(datas(mycars3));
document.getElementById("orange_5").innerHTML = count_orange(datas(mycars4));
if(datas(alertData).yellow==undefined){

document.getElementById("yellow_1").innerHTML = 0;
}else{
document.getElementById("yellow_1").innerHTML = datas(alertData).yellow.length;
}

document.getElementById("yellow_2").innerHTML = count_yellow(datas(mycars));
document.getElementById("yellow_3").innerHTML = count_yellow(datas(mycars2));
document.getElementById("yellow_4").innerHTML = count_yellow(datas(mycars3));
document.getElementById("yellow_5").innerHTML = count_yellow(datas(mycars4));
if(datas(alertData).blue==undefined){

document.getElementById("blue_1").innerHTML = 0;
}else{
document.getElementById("blue_1").innerHTML = datas(alertData).blue.length;
}
document.getElementById("blue_2").innerHTML = count_blue(datas(mycars));
document.getElementById("blue_3").innerHTML = count_blue(datas(mycars2));
document.getElementById("blue_4").innerHTML = count_blue(datas(mycars3));
document.getElementById("blue_5").innerHTML = count_blue(datas(mycars4));
if(datas(alertData).unknown==undefined){

document.getElementById("unknown_1").innerHTML = 0;
}else{
document.getElementById("unknown_1").innerHTML = datas(alertData).unknown.length;
}
document.getElementById("unknown_2").innerHTML = count_unknown(datas(mycars));
document.getElementById("unknown_3").innerHTML = count_unknown(datas(mycars2));
document.getElementById("unknown_4").innerHTML = count_unknown(datas(mycars3));
document.getElementById("unknown_5").innerHTML = count_unknown(datas(mycars4));


});
$(document).ready(function(){

	$("#floatShow").bind("click",function(){
	
		$("#onlineService").animate({height:"show", opacity:"show"}, "normal" ,function(){
			$("#onlineService").show();
		});
		
		$("#floatShow").attr("style","display:none");
		$("#floatHide").attr("style","display:block");
		
		return false;
	});
	
	$("#online_qq_layer").bind("click",function(){
	
		$("#onlineService").animate({height:"hide", opacity:"hide"}, "normal" ,function(){
			$("#onlineService").hide();
		});
		
		$("#floatShow").attr("style","display:block");
		$("#floatHide").attr("style","display:none");
		
		return false;
	});
$("#floatShow_ico").bind("click",function(){

		$("#onlineService_ico").animate({height:"show", opacity:"show"}, "normal" ,function(){
			$("#onlineService_ico").show();
		});
		
		$("#floatShow_ico").attr("style","display:none");
		$("#floatHide_ico").attr("style","display:block");
		
		return false;
	});
	
	$("#floatHide_ico").bind("click",function(){
	
		$("#onlineService_ico").animate({height:"hide", opacity:"hide"}, "normal" ,function(){
			$("#onlineService_ico").hide();
		});
		
		$("#floatShow_ico").attr("style","display:block");
		$("#floatHide_ico").attr("style","display:none");
		
		return false;
	});
  
});
function branch_list(objInput){
	if(objInput==null)
		keyvalue='';
	else
	    keyvalue = objInput;
    if(keyvalue!=''){
        var url=encodeURI("http://www.12379.cn/html/new2018/branch_list.shtml?query="+keyvalue);
    	 window.parent.location.href=url; ///ais/wwwroot/gjyjxxfbw
    }else{
    window.parent.location.href="http://www.12379.cn/html/new2018/branch_list.shtml?query=";
}}
function colour_list(objInput){
	if(objInput==null)
		keyvalue='';
	else
	    keyvalue = objInput;
    if(keyvalue!=''){
        var url=encodeURI("http://www.12379.cn/html/new2018/colour_list.shtml?query="+keyvalue);
    	 window.parent.location.href=url; ///ais/wwwroot/gjyjxxfbw
    }else{
    window.parent.location.href="http://www.12379.cn/html/new2018/colour_list.shtml?query=";
}}
function details_list(objInput,details){
	if(objInput==null)
		keyvalue='';
	else
	    keyvalue = objInput;
    if(keyvalue!=''){
        var url=encodeURI("http://www.12379.cn/html/new2018/cobr_list.shtml?query="+keyvalue+"&details="+details);
    	 window.parent.location.href=url; ///ais/wwwroot/gjyjxxfbw
    }else{
    window.parent.location.href="http://www.12379.cn/html/new2018/cobr_list.shtml?query=";
}}

</script>
