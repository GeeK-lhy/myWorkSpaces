<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
<script src="plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
function qiandao(){
	$.getJSON("http://localhost:8080/Test/record/saves.do",{},function(data){
		alert("签到成功")	
	}) 
}
function qiantui(){
	$.getJSON("http://localhost:8080/Test/record/exit.do",{},function(data){
		alert("签退成功")	
	}) 
}
</script>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
								<i class="ace-icon fa fa-check green"></i>
								欢迎使用 FH Admin 系统&nbsp;&nbsp;
								<strong class="green">
									&nbsp;
								<!-- 	<a href="http://www.fhadmin.org" target="_blank"><small>(&nbsp;www.fhadmin.org&nbsp;)</small></a> -->
								</strong>
							</div>
		<!-- /.main-content -->
		
		
		<DIV style="position:absolute;top:50%;left:50%;margin:0 0 ;border: 1px solid black"> <!--快捷窗口  -->
		
		<div style=" display: inline-block ;float:left ;width:100px;margin:20px 20px">
		<img alt="qiandao" src="qiandao.jpg" onclick="javascript:qiandao();" style="width:100px;height:100px;">
		&nbsp;&nbsp;签到
		</div>
		
		<div style=";float:left ;width:100px;margin:20px 20px">
		<img alt="qiaotui" src="qiantui.jpg" onclick="javascript:qiantui();" style="width:100px;height:100px;">
		&nbsp;&nbsp;签退
		</div>
		
		
		</DIV>

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
</body>
</html>