<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		 $.post("login",{"account_name":$("#account_name").val(),"user_password":$("#user_password").val()},function(data){
			if(data=="用户名密码正确"){
				$.post("toIndex",{"account_name":v},function(){})
			}else
			 alert(data)
		 }); 
		
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
		<div>
			<a href="/workProject/">退出</a>
		</div>
	<div style="background-color:whitesmoke;height: 850px">
		<div style="background:url('images/indexBack.jpg');background-color: white;width: 1350px;height: 550px;border: double 5px seagreen;float: left;margin:50px 50px">		
			<div style="margin:150px 50px">
	<table align="center">
			 <tr>
			 <td ><a href="tosubmitReport"><font color="black" size="200px" >周 报 上 报:</font></a></td>
		
			 </tr>			
			  <td ><a href="selectReports"><font color="black" size="200px">周 报 查 询:</font></a></td>
			 </tr>
			 		
			 </tr>			
			  <td ><a href="toSelectByConditions"><font color="black" size="200px">条件查 询:</font></a></td>
			 </tr>
			<c:if test="${role==1}">
			<tr>			
			  <td ><a href="touserLimit"><font color="yellow" size="200px">权 限 管 理:</font></a></td>
			 </tr>
			 </c:if>
			</table>
		
		</div>
	</div>
</div>
</body></html>