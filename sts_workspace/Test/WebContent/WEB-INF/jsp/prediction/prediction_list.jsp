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
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						
						<div id="weather" style="width: 1200px;height: 500px;margin:50px 100px;border: double 5px deepskyblue;float: center;background-color: #E8CCFF">	
						
						
						</div>
			
					
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
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
<!-- 	<script type="text/javascript" src="static/js/jquery-1.11.1.js"></script> -->
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		$(function(){

			$.ajax({
				url:"https://www.tianqiapi.com/free/week?appid=91661884&appsecret=3Vv1CXug",
				type:"GET",	
				success:function(result){
					var v=result.data
					$("#weather").append($("<div>").append($("<span style='font-size: x-large'>").html(result.city)))
					$.each(v,function(i,item){
						var div= $("<div style='float:left;margin:20px 20px'>")
						var t=$("<table>")
						var d=new Date(item.date)
						var tr1=$("<tr>");
						var td1=$("<td>");
						td1.append($("<span>").html(getWeek(d)))
						tr1.append(td1);
						t.append(tr1)
						 var tr2=$("<tr>");
						tr2.append($("<td >").append($("<span>").html(item.date)))						
							t.append(tr2)
 						var tr3=$("<tr>");
					
						tr3.append($("<td>").append($("<img>").attr("src","static/images/weather/"+item.wea_img+".png")))
							t.append(tr3)
						var tr4=$("<tr>");
						tr4.append($("<td >").append($("<span>").html(item.tem_night+"-"+item.tem_day+"℃")))
							t.append(tr4)
						var tr5=$("<tr>");
						tr5.append($("<td>").append($("<span>").html(item.wea)))
						t.append(tr5)
						var tr6=$("<tr>");
						tr6.append($("<td>").append($("<span>").html(item.win+"-"+item.win_speed)))
			/*			 $.each(item,function(m,n){
							var tr=$("<tr>");
							var td=$("<td>");
							td.append($("<span>").html(n))
							tr.append(td);
							t.append(tr)
						})  
						*/
						t.append(tr6)  
						
					
						div.append(t)
						
						$("#weather").append(div)
					}) 
					
				}
			});
		});
		function getWeek(date) {
		     var week;     
		     if(date.getDay() == 0) week = "星期日"     
		     if(date.getDay() == 1) week = "星期一"     
		     if(date.getDay() == 2) week = "星期二"     
		     if(date.getDay() == 3) week = "星期三"     
		     if(date.getDay() == 4) week = "星期四"     
		     if(date.getDay() == 5) week = "星期五"     
		     if(date.getDay() == 6) week = "星期六"     
		     return week;
		  }  
/*   	 $.getJSON("prediction/toData.do",{"url":"http://www.12379.cn/data/index_roll_4.html"},function(data){
		alert(data.alertData[0].description)
	 }) */  
		

	</script>


</body>
</html>