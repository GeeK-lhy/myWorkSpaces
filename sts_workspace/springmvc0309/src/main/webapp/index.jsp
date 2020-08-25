<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="example/first" method="post">
		这是index页面：<br/>
		userName : <input type="text" name="userName"><br/>
		password :<input type="password" name="password"><br/>
		<input type="submit" value="提交">
			
		</form>
		<br/>
		<form action="example/save" method="post">
	
		书号 : <input type="text" name="isbn"><br/>
		书名 :<input type="text" name="bookName"><br/>
		价格	 ： <input type="text" name="price"><br/>
		<input type="submit" value="提交">
			
		</form>
</body>
</html>