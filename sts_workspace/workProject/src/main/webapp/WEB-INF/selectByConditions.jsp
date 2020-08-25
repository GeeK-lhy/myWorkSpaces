<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script type="text/javascript" src="js/md5.min.js"></script>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-1.11.1.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
			<a href="/workProject/">退出</a>
		</div>
	<form action="selectByConditions">
	<div>	
	
		<table frame=void>
			<tr>
				<td>用户姓名：</td>
				<td><input type="text" width="200px" name="user_name" id="account_name"></td>
			</tr>
				<tr>
				<td>标题：</td>
				<td><input type="text" width="200px" name="title" id=></td>
			</tr>
			<tr >
			<td colspan="2"><input type="submit" value="查询"></td>
			</tr>
			
		</table>
	</div>
	</form>
</body>
</html>