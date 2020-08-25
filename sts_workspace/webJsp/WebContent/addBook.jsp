<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$("#btn_add").click(function(){
			var s1=$("#nametext").val();
			var s2=$("#pricetext").val();
			if(s1!=""&& s2!=""){
				if(! isNaN(s2)){
				window.open("addBook.do?bookName="+s1+"&price="+s2,"_self");
				}
					else{
					$("#pricetext").val("");
					alert("请输入正确的价格数字");
			    }
			}  
			else {
                alert("请输入内容");
            }
		});

	});
	
	</script>
</head>
<body> 
	当前在线人数：${count }<br/>
当前登录人数：${fn:length(loginMap)}<br/>
<!-- <form action="addBook.do"> -->
	<table>
		<tr>
		<td>书名：</td>
		<td><input id="nametext" type="text" name="bookName" width="40px"></td>
		</tr>
		<td>价格：</td>
		<td><input id="pricetext" type="text" name="price" width="40px"></td>
		</tr>
		<tr>
		<td colspan="2" align="right"><input type="button" value="添加" id="btn_add"></td>
		</tr>
	</table>
<!-- 	</form> -->
</body>
</html>