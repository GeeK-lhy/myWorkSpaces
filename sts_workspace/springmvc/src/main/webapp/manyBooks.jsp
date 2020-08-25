<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="example/mantBooks" method="post">
		<span>isbn:</span>&nbsp;<input type="text" name="books[0].isbn"><br/>
		bookName:<input type="text" name="books[0].bookName"><br/>
		<span>price:</span>&nbsp; <input type="text" name="books[0].price"><br/>
		<span>isbn2:</span>&nbsp;<input type="text" name="books[1].isbn"><br/>
		bookName2:<input type="text" name="books[1].bookName"><br/>
		<span>price2:</span>&nbsp;<input type="text" name="books[1].price"><br/>
		
		<input type="submit" value="提交">
	</form>
</body>
</html>