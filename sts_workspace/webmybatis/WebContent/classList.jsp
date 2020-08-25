<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1" width="90%">
			<tr>
				<td>序号</td>
				<td>班级名称</td>
				<td>备注</td>
				<td>班级人数</td>
				<td>人员姓名</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${list }" var="c" varStatus="state">
			<tr>
				<td>${state.count }</td>
				<td>${c.className }</td>
				<td>${c.descript }</td>
				<td>${fn:length(c.students) }</td>
				<td>
				<c:forEach items="${c.students}" var="s">
				${s.studentName }&nbsp;
				</c:forEach>
				</td>
				<td>操作</td>
			</tr>
			</c:forEach>
		
		</table>
</body>
</html>