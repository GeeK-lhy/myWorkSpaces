<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>周报管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="js/md5.min.js"></script>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script>
$(function(){
	 $("#loginButton").click(function(){
		var v=$("#account_name").val();
		var p=$("#user_password").val();
		if(v=="" || p==""){
			alert("请输入用户名和密码")
		}else{
		 $.post("login",{"account_name":$("#account_name").val(),"user_password":$("#user_password").val()},function(data){
			if(data=="用户名密码正确"){
				window.location.href="toIndex";
			}else
			 alert(data)
		 }); 
		}
	 });
})

/* function login(){
	var account_name=$("#account_name").val();
	var user_password=$("#user_password").val();
	$.post("login",{"account_name":account_name,"user_password":user_password},function(data){
	   if(data!=null)
		alert(data);
});	 */


	

</script>
</head>
 
<body leftmargin="0" topmargin="10" bgcolor="#FFFFFF" marginheight="0" marginwidth="0">
	

	<div style="background-color:whitesmoke;height: 850px">
		<div style="background:url('images/background2.jpg');background-color: white;width: 1350px;height: 550px;border: double 5px seagreen;float: left;margin:50px 50px">		
			<div style="margin:150px 50px">
			<form  id="form1">
	<table align="center">
			 <tr>
			 <td ><font color="white">用户名:</font></td>
			 <td ><input type="text" name="account_name" id="account_name"></td>
			 </tr>	
			 <tr>		
			  <td ><font color="white">密码:</font>:</td>
			 <td ><input type="password" name="user_password"id="user_password"></td>
			 </tr>
			 <tr>
				<td colspan="2">
		     	<div >
	       	 		<button  type="reset" onclick="reset()">重置</button>
	       	 	</div>
	       	 	</td>
	       	 	<td>
	       	 		<div>
	       	 		<button id="loginButton" type="button">登录</button>
	       	 		</div>
	       	 	</td>
	       	 	<td >
	       	 		<div>
	       	 		<a href="toRegister">注册</a>
	       	 	</div>
	       	 	</td>
	 		
	 		</tr>
			</table>
		</form>
		</div>
	</div>
</div>
</body></html>