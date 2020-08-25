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
					
					<form action="drillplan/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DRILLPLAN_ID" id="DRILLPLAN_ID" value="${pd.DRILLPLAN_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">方案标题:</td>
								<td><input type="text" name="DRILLTITLE" id="DRILLTITLE" value="${pd.DRILLTITLE}" maxlength="255" placeholder="这里输入方案标题" title="方案标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">演练内容:</td>
								<td><input type="text" name="DRILLCONTENT" id="DRILLCONTENT" value="${pd.DRILLCONTENT}" maxlength="1000" placeholder="这里输入演练内容" title="演练内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">演练开时间:</td>
								<td><input class="span10 date-picker" name="DRILLSTARTTIME" id="DRILLSTARTTIME" value="${pd.DRILLSTARTTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="演练开时间" title="演练开时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">演练截至时间:</td>
								<td><input class="span10 date-picker" name="DRILLENDTIME" id="DRILLENDTIME" value="${pd.DRILLENDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="演练截至时间" title="演练截至时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">演练人员分配:</td>
								<td><input type="text" name="DRILLPERSON" id="DRILLPERSON" value="${pd.DRILLPERSON}" maxlength="1000" placeholder="这里输入演练人员分配" title="演练人员分配" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">演练安排状态:</td>
								<td><input type="number" name="DRILLSTATE" id="DRILLSTATE" value="${pd.DRILLSTATE}" maxlength="32" placeholder="这里输入演练安排状态" title="演练安排状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
		//保存
		function save(){
			if($("#DRILLTITLE").val()==""){
				$("#DRILLTITLE").tips({
					side:3,
		            msg:'请输入方案标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DRILLTITLE").focus();
			return false;
			}
			if($("#DRILLCONTENT").val()==""){
				$("#DRILLCONTENT").tips({
					side:3,
		            msg:'请输入演练内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DRILLCONTENT").focus();
			return false;
			}
			if($("#DRILLSTARTTIME").val()==""){
				$("#DRILLSTARTTIME").tips({
					side:3,
		            msg:'请输入演练开时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DRILLSTARTTIME").focus();
			return false;
			}
			if($("#DRILLENDTIME").val()==""){
				$("#DRILLENDTIME").tips({
					side:3,
		            msg:'请输入演练截至时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DRILLENDTIME").focus();
			return false;
			}
			if($("#DRILLPERSON").val()==""){
				$("#DRILLPERSON").tips({
					side:3,
		            msg:'请输入演练人员分配',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DRILLPERSON").focus();
			return false;
			}
			if($("#DRILLSTATE").val()==""){
				$("#DRILLSTATE").tips({
					side:3,
		            msg:'请输入演练安排状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DRILLSTATE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>