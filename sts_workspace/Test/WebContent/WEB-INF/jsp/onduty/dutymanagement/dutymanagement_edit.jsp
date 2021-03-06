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
					
					<form action="dutymanagement/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DUTYMANAGEMENT_ID" id="DUTYMANAGEMENT_ID" value="${pd.DUTYMANAGEMENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">起始时间:</td>
								<td colspan="5"> <input class="span10 date-picker" name="START" id="START" value="${pd.START}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="起始时间" title="起始时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">结束时间:</td>
								<td colspan="5"><input class="span10 date-picker" name="END" id="END" value="${pd.END}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="结束时间" title="结束时间" style="width:98%;"/></td>
							</tr>
							<tr>
							<td>日期</td>
							<c:forEach items="${dateList}" var="d">
							
							<td>
								${d }
							</td>
							</c:forEach>
							</tr> 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">值班人员:</td>
							<c:forEach items="${members }" var="m">
								<td><input type="text" name="MEMBERS"  value="${m}" maxlength="2000" placeholder="这里输入值班人员" title="值班人员" style="width:98%;"readonly="readonly"/></td>
							</c:forEach>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">值班领导:</td>
								<c:forEach items="${leaders }" var="l">
								<td><input type="text" name="LEAD"  value="${l}" maxlength="1000" placeholder="这里输入值班领导" title="值班领导" style="width:98%;" /></td>
								</c:forEach>
							</tr>
							<tr>
								<td style="text-align: right;" colspan="10" >
								<!--  <a class="btn btn-mini btn-primary" onclick="save();">保存</a>  -->
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
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
		<script type="text/javascript">
		$(top.hangge());
		function save(){
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
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
	
	
		</script>
</body>
</html>