<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		这是B页面的数据:
		<br/>
		page:<%=pageContext.getAttribute("page_info",pageContext.PAGE_SCOPE) %></br>
		request:<%=request.getAttribute("request_info") %><br/>
		session:<%=session.getAttribute("session_info") %><br/>
		全局:<%=application.getAttribute("application_info") %>
</body>
</html>