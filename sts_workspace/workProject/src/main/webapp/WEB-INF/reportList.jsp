<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="js/md5.min.js"></script>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
 
<!--  <script>
 $(function(){
 	 $("#updateReport").click(function(){
		$.post("toDetails",{"report_id":$("#reportDetails").attr("value")},)
	 }); 
})
 

	

</script> -->
</head>
<body>
		<div>
			<a href="/workProject/">退出</a>
		</div>
	<form>

		<div>
		<table align="center" border=1 width="90%">
			<tr>
			<td colspan="10" align="right"> <a href="javascript:history.back(-1)">返回上一页</a></td>
			</tr>
			<tr>
			<td>序号</td>
			<td>标题</td>
			<td>计划起始时间</td>
			<td>计划结束时间</td>
			<td>实际开始时间</td>
			<td>实际结束时间</td>
			<td>报送时间</td>
			<td>负责人</td>
			<td>工号</td>
			<td>操作</td>
			</tr>
			<c:forEach items="${list}" var="wr"  varStatus="state">
			<tr>
			<td>${state.count}</td>
			<td> ${wr.title } </td>
<%-- 			<td>${wr.plan_btime}</td>
			<td>${wr.plan_etime }</td> --%>

			<td><fmt:formatDate value="${wr.plan_btime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td><fmt:formatDate value="${wr.plan_etime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td><fmt:formatDate value="${wr.actual_btime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td><fmt:formatDate value="${wr.actual_etime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td><fmt:formatDate value="${wr.report_time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
<%-- 			<td>${wr.actual_btime}</td>
			<td>${wr.actual_etime }</td>
			<td>${wr.report_time }</td> --%>

			<td>${wr.manager}</td>
			<td>${wr.manager_id}</td>
			<td>
				<a href="toDetails?report_id=${wr.report_id}" >详情</a> 
	<%-- 			<a href="javascript:return voild(0)" id="updateReport" value="${wr.report_id}">更新</a> --%>
				<a href="delete?report_id=${wr.report_id}" >删除</a>
			</td>
			
			</tr>
			</c:forEach>

		</table>
		</div>
	</form>

</body>
</html>