<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入消息标题" title="消息标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事发时间:</td>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">发送人:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.name}" maxlength="255" placeholder="这里输入发送人" title="发送人" style="width:98%;"/></td>
							</tr>
							
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">发送人:</td>
								<td><input type="text"   value="${pd.SENDUSER}" maxlength="255" placeholder="这里输入发送人" title="发送人" style="width:98%;"/></td>
							</tr>
							
							<tr >
								<td style="width:75px;text-align: right;padding-top: 13px;">报送领导:</td>
								<td colspan="3"><input id="receivename" name='receivename' type="text" class="text" style="width:350px;" size="20" /><span id="span1" style="color:red"></span>
							</tr>
							
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">接收人:</td>
								<td><input type="text" name="RECEIVEUSER"  value="${pd.RECEIVEUSER}" maxlength="255" placeholder="这里输入接收人" title="接收人" style="width:98%;"/></td>
							</tr>
	<%-- 						<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报告状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入报告状态" title="报告状态" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="text-align: center;" colspan="10">
								<c:if test="${userRoleId eq'5' }">
									<a class="btn btn-mini btn-primary" onclick="handIn();">上报</a>
								</c:if>
								<c:if test="${userRoleId!='5' }">
									<input type="hidden" value="${sessionScope.sessionUser.unit }" >
									<a class="btn btn-mini btn-primary" onclick="handIn();">上报</a>
								</c:if>
									<a href="javascript:return void(0)"  onclick="sendFhsms('${pd.userName}')" id="suggest" class="btn btn-mini btn-primary">返回意见</a>
								 <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> 
							
								</td>
							</tr>
						</table>
</body>
</html>