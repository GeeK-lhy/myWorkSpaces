<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<style type="text/css">.BMap_cpyCtrl {display: none;}</style>
<style type="text/css">.anchorBL{display:none;}</style>
	<style type="text/css">
	
#allmap {width: 100%;height: 71%;overflow: hidden;margin:0;}
#l-map{height:71%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:71%;width:20%;float:left;}
</style>
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/custom.css" />
<script type="text/javascript" src="plugins/zoomimage/js/jquery.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/eye.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/utils.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/zoomimage.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/layout.js"></script>

<!-- isPDF -->
<!-- <script src="static/jsPDF-1.3.2/dist/jspdf.min.js"></script>
<script src="static/jsPDF-1.3.2/dist/jspdf.debug.js"></script>
<script src="static/jsPDF-1.3.2/libs/html2canvas/dist/html2canvas.js"></script> -->

<script src="static/pdf/docs/js/html2canvas.js"></script>
<script src="static/pdf/docs/js/jsPdf.debug.js"></script>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" >
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12" >
					 <div id="PDFDataDiv"> 
					
					<form action="sentaccident/sendMessage.do" name="Form" id="Form" method="post">
					   		
					    <input type="hidden" name="SENTACCIDENT_ID" id="SENTACCIDENT_ID" value="${pd.SENTACCIDENT_ID}"/>
					  	<input type="hidden" readonly="readonly" name="accidentType" id="ACCIDENTTYPE" value="${pd.ACCIDENTTYPE}"  maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;border: none;"	>
						<input type="hidden" name="receiveUser" id="RECEIVEUSER" value="${pd.RECEIVEUSER }">
					    <input type="hidden" name="sendUser" id="SENDUSER" value="${pd.SENDUSER }">
						<input type="hidden" name="address" id="ADDRESS" value="${pd.ADDRESS}">
						<input type="hidden" id="address" >
					<div id="div-div"style="position: absolute;left: 550px;top:5px" >
					<a class="btn btn-mini btn-primary" style="width: 100px;height: 30px" onclick="downloadPDF();">下载</a>
					<a class="btn btn-mini btn-danger" style="width: 100px;height: 30px" onclick="top.Dialog.close();">取消</a>
				
					</div>
				<div id="zhongxin" style="padding-top: 13px;">
				
					<div class="divClass" id="baseDiv" style="background-color: white;width:630px;height: 450px;border: double 5px seagreen;float: left;margin:30px 10px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
						 <tr><td colspan="4"><font size="3 "><b>事故基本信息:</b></font></td> </tr> 
						  <tr>
					    <td nowrap align="right" width="11%"><font size="3">事故标题:</font></td>
					    <td width="27%"><input type="text" name="title" id="TITLE" value="${pd.TITLE}" maxlength="255" readonly="readonly" placeholder="这里输入消息标题" title="消息标题" style="width:350px;border: none;" /></td>    	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>
  							
  						<tr>
					    <td nowrap align="right" width="11%"><font size="3">事发时间:</font></td>
					    <td width="27%"><input class="span10 date-picker" name="time" id="TIME" value="<fmt:formatDate value="${pd.TIME}" pattern="yyyy-MM-dd hh:mm:ss" />" type="text"  readonly="readonly" style="width:350px;border:none"  /></td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>	
  						<tr style="display: none;"><td><input type="text" name="sendUser" value="${userid}"></td></tr>
					  <tr>
					  	 <td width="11%"  align="right" nowrap><font size="3">应急响应等级:</font></td>
					  <td width="27%">
							<input type="text" readonly="readonly" name="responseGrade" id="RESPONSEGRADE" value="${pd.RESPONSEGRADE}" maxlength="255" placeholder="这里输入应急响应等级" title="应急响应等级" style="width:350px;border: none;"/></td>
					    </tr>
				  	<tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">事发单位:</font> </td>
					  	  <td width="27%"><input readonly="readonly" type="text" name="source" id="SOURCE" value="${pd.SOURCE}" maxlength="255" placeholder="这里输入事发单位" title="事发单位" style="width:350px;border: none;"  /></td>

					  </tr>

					 <tr>
					 <td width="11%"  align="right" nowrap><font size="3">事故类型:</font></td>
						 <td width="27%">
						 <input type="hidden" readonly="readonly" name="accidentType" id="ACCIDENTTYPE" value="${pd.ACCIDENTTYPE}"  maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;border: none;"	>
						 <c:if test="${pd.ACCIDENTTYPE == '1'}">
						<input type="text" readonly="readonly" value="火灾"  maxlength="255" style="width:350px;border: none;"	>
						</c:if>
						<c:if test="${pd.ACCIDENTTYPE == '2'}">
						<input type="text" readonly="readonly" value="爆炸"  maxlength="255" style="width:350px;border: none;"	>
						</c:if>
						<c:if test="${pd.ACCIDENTTYPE == '3'}">
						<input type="text" readonly="readonly" value="其他"  maxlength="255" style="width:350px;border: none;"	>
						</c:if>
					  	  </td>
					 </tr>
					 
					 <tr>
					 <td width="11%"  align="right" nowrap><font size="3">事故等级:</font></td>
						 	 <td width="27%">
						<input type="text" readonly="readonly"  name="grade" id="GRADE" value="${pd.GRADE}" maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;border: none;"	>

					  	  </td>
					 </tr>
					 
					  <tr>
					 <td width="11%"  align="right" nowrap><font size="3">报送时间:</font></td>
						 	 <td width="27%">
						<input type="text" readonly="readonly"  name="sendTime" id="SENDTIME" value="<fmt:formatDate value="${pd.SENDTIME}" pattern="yyyy-MM-dd hh:mm:ss" />"   style="width:350px;border: none;"	>

					  	  </td>
					 </tr> 
					 
					  </table>
					  <%-- <input type="hidden" name="receiveUser" id="RECEIVEUSER" value="${pd.RECEIVEUSER }">
					   <input type="hidden" name="sendUser" id="SENDUSER" value="${pd.SENDUSER }"> --%>
</div>

				<div class="divClass" id="addressDiv" style="background-color: white;width: 630px;height: 450px;border: double 5px seagreen;float: left;margin:30px 10px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr>
					 <td colspan="3"><font size="3"><b>事发地址GPS:</b></font> <span id="addressSpan"></span></td> 
					   </tr> 
						  <tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">经度：</font> </td>
					  	  <td width="27%">
					  	  <span class="input-icon"><input type="text" id="ZUOBIAO_Y" value="${pd.ZUOBIAO_Y }"  style="width:350px;" disabled="disabled">
					  	  <i class="ace-icon fa fa-fire"></i>
						</span>
						  </td>
					  	<!--   <td width="27%"><input name='address' type="text"style="width:350px; class="text" /></td> -->
					  </tr>
						<tr> 
						 <td  width="11%" nowrap align="right"> <font size="3">纬度：</font> </td>
					  	  <td width="27%">
					  	  	<span class="input-icon"><input type="text" id="ZUOBIAO_X" title=""  value="${pd.ZUOBIAO_X }" style="width:350px;" disabled="disabled">
					  	  	<i class="ace-icon fa fa-fire"></i>
							</span>
						  </td>
						</tr>


					  </table>
					
			<div id="allmap"></div>
				<!-- <input type="hidden" id="address" > -->
	 </div>
	 
	 				<div class="divClass" id="div3"style="background-color: white;width: 630px;height: 450px;border: double 5px seagreen;float: left;margin:10px 10px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3 "><b>事故具体信息:</b></font></td> </tr> 
		
					  <tr>
					    <td  width="11%" nowrap align="right"><font size="3">事故原因:</font></td>
					    <td colspan="3"><textarea  readonly="readonly"  cols="45" rows="3">${pd.REASON}</textarea>
					    <%--  <input type="hidden" name="reason" id="REASON"value="${pd.REASON}"> --%>
					    </td>
					    </tr>
					    
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">伤亡情况:</font></td>
					    <td colspan="3"><textarea  readonly="readonly"  cols="45" rows="3">${pd.CASUALTY}</textarea>
					    <%-- <input type="hidden" name="casualty" id="CASUALTY" value="${pd.CASUALTY}"> --%>
					    </td>
					    
					    </tr>
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">经济损失:</font></td>
					    <td colspan="3"><textarea readonly="readonly" cols="45" rows="3">${pd.ECONOMICLOSS}</textarea>
					  <%--  <input type="hidden" name="economicLoss" id="ECONOMICLOSS" value="${pd.ECONOMICLOSS}">  --%>
					    </td>
					    </tr> 
					  </table>

	 </div>
	 
	 
		 <div class="divClass"id="picDiv"style="background-color: white;width: 630px;height: 450px;border: double 5px seagreen;float: left;margin:10px 10px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3"><b>图片附件:</b></font></td> </tr> 
	
					  </table>
					<div id="picList" style="width: 620px;height: 400px;"></div>
			 </div>
			 
</div>

				
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
			 </div>  
			 <input type="hidden" name="economicLoss" id="ECONOMICLOSS" value="${pd.ECONOMICLOSS}"> 
			<input type="hidden" name="casualty" id="CASUALTY" value="${pd.CASUALTY}">
			<input type="hidden" name="reason" id="REASON"value="${pd.REASON}">
				
					<div id=mapDiv></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=40GWXiduhOft266lK4N1dopL"></script>
	
	<script type="text/javascript">
	$(top.hangge());
	var dg;
	$(document).ready(function(){
		dg = frameElement.lhgDG;
	});
	
	function success(){
		if(dg.curWin.document.forms[0]){
			dg.curWin.document.forms[0].action = dg.curWin.location+"";
			dg.curWin.document.forms[0].submit();
		}else{
			dg.curWin.location.reload();
		}
		dg.cancel();
	}


	</script>
	
	
<script type="text/javascript">
		$(top.hangge());
		
		
		var pic="${pd.PICADDRESS}";
		var pics=[];
		pics=pic.split(",");
		for(var i=0;i<pics.length;i++){
			if(pics[i]!=""){
			var div=$("<div style='width=210px;height=180px;margin:4px 4px;float: left'>")
			var a=$("<a class='bwGal'></a>")
			a.prop("href","uploadFiles/uploadImgs/"+pics[i])
			var img=$("<img width='210px' height='180px'>");
			img.prop("src","uploadFiles/uploadImgs/"+pics[i]);
			a.append(img)
			div.append(a)
			$("#picList").append(div);
			}
		}
		function downloadPDF(){
/*         var pdf = new jsPDF('p','mm',"a4");
	  
	           pdf.internal.scaleFactor = 2;
	           var options = {
	               pagesplit: true, //设置是否自动分页
	              "background": '#FFFFFF'   //如果导出的pdf为黑色背景，需要将导出的html模块内容背景 设置成白色。
	          };
	           var printHtml = $("#addressDiv").get(0);   // 页面某一个div里面的内容，通过id获取div内容
	           pdf.addHTML(printHtml,0,10,options,function() {
	              pdf.save('目标.pdf');
	          });  */
	          html2canvas($("#zhongxin"), {
	        	 // allowTaint: true,//允许跨域
			       useCORS: true, 
			       loggin:true,
			    /*    allowTaint: false, */
			       foreignObjectRendering: true,    //在浏览器支持的情况下使用ForeignObject模式渲染图片
                   taintTest: true,
			        height: document.getElementById("zhongxin").scrollHeight,
			       width: document.getElementById("zhongxin").scrollWidth,//为了使横向滚动条的内容全部展示，这里必须指定
			        background: "#FFFFFF",//如果指定的div没有设置背景色会默认成黑色,这里是个坑
			        scale: 2,
			        onrendered:function(canvas) {
		
			            var contentWidth = canvas.width;
			            var contentHeight = canvas.height;
			 
			            //一页pdf显示html页面生成的canvas高度;
			            var pageHeight = contentWidth / 595.28 * 841.89;
			            //未生成pdf的html页面高度
			            var leftHeight = contentHeight;
			            //pdf页面偏移
			            var position = 0;
			            //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
			            var imgWidth = 555.28;
			            var imgHeight = 555.28/contentWidth * contentHeight;
			     
			            var pageData = canvas.toDataURL('image/jpeg', 1.0);
			        
			            var pdf = new jsPDF('l', 'pt', 'a4');
			            
			            //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
			            //当内容未超过pdf一页显示的范围，无需分页
			            if (leftHeight < pageHeight) {
			                pdf.addImage(pageData, 'JPEG', 20, 10, imgWidth+300, imgHeight+150 );
			            } else {
			                while(leftHeight > 0) {
			                    pdf.addImage(pageData, 'JPEG', 20, position, imgWidth, imgHeight)
			                    leftHeight -= pageHeight;
			                    position -= 841.89;
			                    //避免添加空白页
			                    if(leftHeight > 0) {
			                        pdf.addPage();
			                    }
			                }
			            }
			          
			           // layer.close(layer.index);//关闭遮罩层
			           
			            pdf.save('目标.pdf');
			        }
			    }) 
			 
		}
		
	</script>
<script type="text/javascript">

// 百度地图API功能
function G(id) {
    return document.getElementById(id);
}

var zb_x="${pd.ZUOBIAO_X}";
var zb_y="${pd.ZUOBIAO_Y}";
var points=new BMap.Point(zb_y,zb_x);
var map = new BMap.Map("allmap");
//var map = new BMap.Map("allmap");
var gc = new BMap.Geocoder();
gc.getLocation(points, function(rs){
   var addComp = rs.addressComponents;
	var streetNumber=addComp.streetNumber 
	var addressRemark="${pd.ADDRESSREMARK}"
	if(streetNumber!="")
	$("#addressSpan").html(addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber+","+addressRemark)
  else{
	if( addressRemark!="")
	$("#addressSpan").html(addComp.city + ", " + addComp.district+","+addressRemark);
	else
		$("#addressSpan").html(addComp.city + ", " + addComp.district);
	}
});

map.centerAndZoom(points,20);                   // 初始化地图,设置城市和地图级别。
map.addOverlay(new BMap.Marker(points)); 



/*  var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
    {"input" : "suggestId"
    ,"location" : map
});  */
map.enableScrollWheelZoom(); 
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
   //G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
    
    setPlace();
});

function setPlace(){
    map.clearOverlays();    //清除地图上所有覆盖物
    function myFun(){
        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
        map.centerAndZoom(pp, 18);
        map.addOverlay(new BMap.Marker(pp));    //添加标注
    }
    var local = new BMap.LocalSearch(map, { //智能搜索
      onSearchComplete: myFun
    });
    local.search(myValue);
}



map.addControl(new BMap.ScaleControl());                    // 添加默认比例尺控件
map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));                    // 左上
map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));                    // 右上
map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));                    // 左下
map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT}));                    // 右下

map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}));  //右上角，仅包含平移和缩放按钮
map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT, type: BMAP_NAVIGATION_CONTROL_PAN}));  //左下角，仅包含平移按钮
map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, type: BMAP_NAVIGATION_CONTROL_ZOOM}));  //右下角，仅包含缩放按钮

map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用02..+
function showInfo(e){
	 
 	document.getElementById("ZUOBIAO_X").value = e.point.lat;
    document.getElementById("ZUOBIAO_Y").value = e.point.lng;
 
}
map.addEventListener("click", showInfo);
</script>
</body>
	<style type="text/css">
	li {list-style-type:none;}
	</style>
	<ul class="navigationTabs">
           <li><a></a></li>
           <li></li>
       </ul>
</html>