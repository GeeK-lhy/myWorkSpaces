<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
		/* 		 setInterval(function(){
			         location.reload();
			     },500); */
			});
	</script>
</head>
<body>
	当前在线人数：${count }
	<br/>
	当前登录人数：${fn:length(loginMap)}<br/>
	<form action="login.do">
	<table align="center">
	 <tr>
	 <td>用户名:</td>
	 <td><input type="text" name="userName" /></td>
	 </tr>
	  <tr>
	 <td>密码:</td>
	 <td><input type="password" name="password" /></td>
	 </tr>
	 <tr>
	 <td colspan="2" align="right"> <input type="submit" value="登录"></td>
	 </tr>
	</table>
	</form>
</body>
</html>