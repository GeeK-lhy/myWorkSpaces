<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	select{width: 100px}
</style>
<script type="text/javascript"src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("#province").load("zone.do",{id:""},function(){
			$("#province").change();
		});
		
		$("#province").change(function(){
			$("#city").load("zone.do",{id:$(this).val()},function(){
				$("#city").change();
			});
		});
		$("#city").change(function(){
			$("#district").load("zone.do",{id:$(this).val()});
		});
		$("#btn").click(function(){
			$.ajax({
			url:"zone1.do",
			type:"POST",
			data:"id=23",
			success:function(data){
			alert(data);	
			},
			error:function(xhr){
				alert("error:"+xhr.status);
			}
				
			})
		});
	});
</script>
</head>
<body>
	<div style="text-align: right;float: left;">
 	省份：<select name="province" id="province"></select></br>
 	</br>
 	城市：<select name="city" id="city"></select></br>
 	</br>
 	区、县：<select name="district" id="district"></select><br/>
 	<input type="button" id="btn" value="按钮">
 	</div>
</body>
</html>