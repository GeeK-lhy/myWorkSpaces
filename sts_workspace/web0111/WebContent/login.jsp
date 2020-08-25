<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Utf-8" import="java.util.*"  errorPage="erro.jsp"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<!-- 这是html注释 -->
<%--这是隐式注释 --%>
<%! int i=9;
	int c=1;%>
<%!public int add(int a,int b){System.out.println("a:"+a+" b:"+b);
	return (a+b);} %>
<body>
	<%@include file="common.jsp" %>
	<form action="login.do" method="post">
	 userName:<input type="text" name="userName"><br/>
	 password:<input type="text" name="password"><br/>
	 <input type="submit" value="提交">
		</form>
		<%!int j; %>
	当前时间是：<%=new java.util.Date()%>
	<%session.setAttribute("name", "lhy");%>
	</body>	
</html>