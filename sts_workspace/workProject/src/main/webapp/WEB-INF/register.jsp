<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div>
			<a href="/workProject/">退出</a>
		</div>
	<form action="register" method="POST" width="80%" >
		<table>
		<tr>
			<td>用户名：</td>
			<td>
				<input name="account_name" id="account_name" type="text" width="20px">
			</td> 
			
		</tr>	
			<tr>
			<td>姓名：</td>
			<td>
				<input name="user_name" id="user_name" type="text" width="20px">
			</td> 
			
		</tr>
		<tr>
			<td>密码：</td>
			<td>
				<input name="user_password" id="user_password" type="password" width="20px">
			</td> 
			
		</tr>
			<tr>
			<td>联系方式：</td>
			<td>
				<input name="contant"  type="text" width="20px">
			</td> 
			
		</tr>
		<tr>
			<td>地址：</td>
			<td>
				<input  name="address" type="text" width="20px">
			</td> 
			
		</tr>
		
		<tr>
		
			<td colspan="2">
					<button  type="submit" >注册</button>
			</td> 
			
		</tr>
		</table>
	
	
	
	</form>

</body>
</html>