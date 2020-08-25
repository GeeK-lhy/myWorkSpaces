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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$.get("city.do",{pid:""},function(data){
			for(var i=0;i<data.length;i++){
			$("#country").append($("<option>").html(data[i].name).val(data[i].id));
			}
			$("#country").change();
	});
		$("#country").change(function(){
			$("#province").empty();
			$.get("city.do",{pid:$(this).val()},function(data){
				for(var i=0;i<data.length;i++){
				$("#province").append($("<option>").html(data[i].name).val(data[i].id));
				}
				$("#province").change()
			});
		});
		$("#province").change(function(){
			$("#city").  empty();
		$.get("city.do",{pid:$(this).val()},function(data1){
			for(var i=0;i<data1.length;i++){
				$("#city").append($("<option>").html(data1[i].name).val(data1[i].id));
				}	
			$("#city").change()
		    });
	  });
		$("#city").change(function(){
			$("#district").empty();
		$.get("city.do",{pid:$(this).val()},function(data1){
			for(var i=0;i<data1.length;i++){
				$("#district").append($("<option>").html(data1[i].name).val(data1[i].id));
				}	
		    });
	  });
		
	});
	
</script>
</head>
<body>
	<div style="text-align: right;float: left;">
 	国家：<select name="country" id="country">
 	 </select></br>
 	</br>
 	省份：<select name="province" id="province"></select></br>
 	</br>
 	城市：<select name="city" id="city"></select></br>
 	</br>
 	区、县：<select name="district" id="district"></select>
	</div>
</body>
</html>