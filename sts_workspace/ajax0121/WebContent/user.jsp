<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/* 	var xhr= null;
	function check(val){
		xhr=new XMLHttpRequest();
		xhr.open("Get","user.do?userName="+val,true);
		xhr.onreadystatechange=callback;
		xhr.send(null);
	}
	function callback(){
		if(xhr.readyState==4){
			var v=xhr.responseText;
			document.getElementById("span1").innerHTML=v;
			
		}
	} */
	$(function(){
		$("#userName").keyup(function(){
		if($(this).val().length>=3){
				$.post("user.do",{userName:$(this).val()},function(data){
 					if(data.split(".")[0]==1){
						$("#span1").html(data.split(".")[1].fontcolor("red"));
					}else{
					$("#span1").html(data.split(".")[1].fontcolor("green"));
					} 
				});
		}
		});
	});
</script>
</head>
<body>
	用户名：<input type="text" name="userName" id="userName"><br/>
	<span id="span1"></span>
</body>
</html>