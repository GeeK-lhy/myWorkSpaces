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
					
					<form action="gradehandler/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GRADEHANDLER_ID" id="GRADEHANDLER_ID" value="${pd.GRADEHANDLER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">名字:</td>
								<td><input type="text" name="GRADENAME" id="GRADENAME" value="${pd.GRADENAME}" maxlength="255" placeholder="这里输入名字" title="名字" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性质:</td>
								<td><input type="text" name="GRADETYPE" id="GRADETYPE" value="${pd.GRADETYPE}" maxlength="255" placeholder="这里输入性质" title="性质" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">等级:</td>
								<td><input type="text" name="degree" id="degree" value="${pd.degree}" maxlength="255" placeholder="这里输入等级" title="产能" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="GRADEADDRESS" id="GRADEADDRESS" value="${pd.GRADEADDRESS}" maxlength="255" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="GRADEPHONENUM" id="GRADEPHONENUM" value="${pd.GRADEPHONENUM}" maxlength="255" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
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
			if($("#GRADENAME").val()==""){
				$("#GRADENAME").tips({
					side:3,
		            msg:'请输入名字',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADENAME").focus();
			return false;
			}
			if($("#GRADETYPE").val()==""){
				$("#GRADETYPE").tips({
					side:3,
		            msg:'请输入性质',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADETYPE").focus();
			return false;
			}
			if($("#GRADECAPACITY").val()==""){
				$("#GRADECAPACITY").tips({
					side:3,
		            msg:'请输入产能',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADECAPACITY").focus();
			return false;
			}
			if($("#GRADEADDRESS").val()==""){
				$("#GRADEADDRESS").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADEADDRESS").focus();
			return false;
			}
			if($("#GRADEPHONENUM").val()==""){
				$("#GRADEPHONENUM").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADEPHONENUM").focus();
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