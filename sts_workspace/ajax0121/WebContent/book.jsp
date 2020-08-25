<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("#isbn").keyup(function(){
			$.get("book.do",{isbn:$(this).val()},function(data){
		 		if(data.isbn==undefined){
		 			$("#bookName").val("");
		 			$("#price").val("");
		 			$("#span1").html("查无此书");
		 		}else{
		 			$("#bookName").val(data.bookName);
		 			$("#price").val(data.price);
		 			$("#span1").html("信息如下：");
		 		}
			});
			
		});
	});
</script>
</head>
<body>
	书号：<input type="text" name="isbn" id="isbn"><span id="span1"></span><br/>
	书名：<input type="text" name="bookName" id="bookName"><br/>
	价格：<input type="text" name="pricr" id="price"> <br/>
		
</body>
</html>