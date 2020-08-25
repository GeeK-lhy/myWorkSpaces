<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
		 setInterval(function(){
             location.reload();
         },500);
		$("#btn_add").click(function(){
			window.open("addBook.jsp","_self");
		});
		$(".trs").hover(function(){
			$(this).css("background-color","#edefec");
		},function(){
			$(this).css("background-color","white");
		});
		$(".btn_delete").click(function(){
			var value=$(this).attr("value");
			if(confirm("您确定要删除吗")){
				window.open("delete.do?isbn="+value,"_self");
			}
		});
		
		
		$("#btn_delete").click(function(){
			var ck=$("input:checked");
			if(ck.size()==0){
				alert("请选择要删除的图书");
				return;
			}
			if(confirm("你确定要删除吗")){
				$("#form1").submit();
			}
			
		});
	});
	</script>
</head>
<body>
	当前在线人数：${count }<br/>
	当前登录人数：${fn:length(loginMap)}<br/>
	<form id="form1" action="delete.do" method="post">
	 <table border=1 width="60%" align="center">
	 <tr>
	 <td>序号</td>
	 <td>书号</td>
	 <td>书名</td>
	 <td>价格</td>
	 <td>操作</td>
	 </tr>
	 <c:forEach items="${selectBook}" var="selectbook" varStatus="state" >
	 <tr >
	 <td>${state.count}</td>
	 <td>${selectbook.isbn}</td>
	 <td>${selectbook.bookName}</td>
	 <td>${selectbook.price}</td>
 	 <td><a href="edit.do?isbn=${selectbook.isbn}">编辑  |</a><a value="${selectbook.isbn}" class="btn_delete"  href="javascript:return void(0)">删除  </a>
	 <input type="checkbox" value="${selectbook.isbn}" name="isbn"> 
	 </td>

	 </tr>
	 </c:forEach>
	 </table>
	 <div style="position: absolute;left: 280px;">
 	<a href="bookList.do">返回图书列表</a>
	 <input type="button" value="添加图书" id="btn_add"/>
	  <input type="button" value="批量删除" id="btn_delete"/>
	  
	  
	</div>
	</form>
</body>
</html>