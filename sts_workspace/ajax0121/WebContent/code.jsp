<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/* 	var xhr=null;
	function getCode(val){
		if(val.length==6){
		xrh=new XMLHttpRequest();
		xrh.open("Get","code.do?code="+val,true);
		xrh.onreadystatechange=callback;
		xrh.send(null);
		}
	}
	function callback(){
		if(xrh.readyState==4){
			var v=xrh.responseText.split(",");
			document.getElementById("province").value=v[0];
			document.getElementById("city").value=v[1];
		}	
	} */
	$(function(){
		$("#code").keyup(function(){
			if($(this).val().length==6){
			$.get("code.do",{code:$(this).val()},function(data){
				$("#province").val(data.split(",")[0]);
				$("#city").val(data.split(",")[1]);
			});
			}
		});
		
	});
</script>
</head>
<body>
	邮编：<input type="text" name="code" id="code" ><br/>
	省份：<input type="text" name="province" id="province"><br/>
	城市：<input type="text" name="city" id="city">
</body>
</html>