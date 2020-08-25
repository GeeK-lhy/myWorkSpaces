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
					
					<form action="accidenthandle/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ACCIDENTHANDLE_ID" id="ACCIDENTHANDLE_ID" value="${pd.ACCIDENTHANDLE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入消息标题" title="消息标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事发:</td>
								<td><input class="span10 date-picker" name="TIME" id="TIME" value="${pd.TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="事发" title="事发" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事发单位:</td>
								<td><input type="text" name="SOURCE" id="SOURCE" value="${pd.SOURCE}" maxlength="255" placeholder="这里输入事发单位" title="事发单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事故类型:</td>
								<td><input type="text" name="ACCIDENTTYPE" id="ACCIDENTTYPE" value="${pd.ACCIDENTTYPE}" maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事故等级:</td>
								<td><input type="text" name="GRADE" id="GRADE" value="${pd.GRADE}" maxlength="255" placeholder="这里输入事故等级" title="事故等级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事发地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入事发地址" title="事发地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">应急响应等级:</td>
								<td><input type="text" name="RESPONSEGRADE" id="RESPONSEGRADE" value="${pd.RESPONSEGRADE}" maxlength="255" placeholder="这里输入应急响应等级" title="应急响应等级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报送时间:</td>
								<td><input class="span10 date-picker" name="SENDTIME" id="SENDTIME" value="${pd.SENDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="报送时间" title="报送时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">伤亡情况:</td>
								<td><input type="text" name="CASUALTY" id="CASUALTY" value="${pd.CASUALTY}" maxlength="255" placeholder="这里输入伤亡情况" title="伤亡情况" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经济损失:</td>
								<td><input type="text" name="ECONOMICLOSS" id="ECONOMICLOSS" value="${pd.ECONOMICLOSS}" maxlength="255" placeholder="这里输入经济损失" title="经济损失" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事故原因:</td>
								<td><input type="text" name="REASON" id="REASON" value="${pd.REASON}" maxlength="255" placeholder="这里输入事故原因" title="事故原因" style="width:98%;"/></td>
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
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入消息标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#TIME").val()==""){
				$("#TIME").tips({
					side:3,
		            msg:'请输入事发',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TIME").focus();
			return false;
			}
			if($("#SOURCE").val()==""){
				$("#SOURCE").tips({
					side:3,
		            msg:'请输入事发单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SOURCE").focus();
			return false;
			}
			if($("#ACCIDENTTYPE").val()==""){
				$("#ACCIDENTTYPE").tips({
					side:3,
		            msg:'请输入事故类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCIDENTTYPE").focus();
			return false;
			}
			if($("#GRADE").val()==""){
				$("#GRADE").tips({
					side:3,
		            msg:'请输入事故等级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入事发地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#RESPONSEGRADE").val()==""){
				$("#RESPONSEGRADE").tips({
					side:3,
		            msg:'请输入应急响应等级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESPONSEGRADE").focus();
			return false;
			}
			if($("#SENDTIME").val()==""){
				$("#SENDTIME").tips({
					side:3,
		            msg:'请输入报送时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SENDTIME").focus();
			return false;
			}
			if($("#CASUALTY").val()==""){
				$("#CASUALTY").tips({
					side:3,
		            msg:'请输入伤亡情况',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CASUALTY").focus();
			return false;
			}
			if($("#ECONOMICLOSS").val()==""){
				$("#ECONOMICLOSS").tips({
					side:3,
		            msg:'请输入经济损失',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ECONOMICLOSS").focus();
			return false;
			}
			if($("#REASON").val()==""){
				$("#REASON").tips({
					side:3,
		            msg:'请输入事故原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REASON").focus();
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