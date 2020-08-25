<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="example/javascript/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(function(){
		$.getJSON("example/getJsons",{},function(data){
			for(var i=0;i<data.length;i++){
				$("#isbn").append($("<option>").html(data[i].bookName));
			}
		})
	})
</script>
</head>
<body>
		<form action="example/first">
		这是index页面：<br/>
		userName : <input type="text" name="userName"><br/>
		password :<input type="password" name="password"><br/>
		<input type="submit" value="提交">
		</form>
		
				<form action="example/save" method="post">
	
		书号 : <input type="text" name="isbn"><br/>
		书名 :<input type="text" name="bookName"><br/>
		价格	 ： <input type="text" name="price"><br/>
		<input type="submit" value="提交">
			
		</form>
		<form >
		<select id="isbn" style="width:200px">
		
		</select>
		
		<br/>
		<input type="button" value="确定" id="btn">
			
		</form>
	
</body>
</html>