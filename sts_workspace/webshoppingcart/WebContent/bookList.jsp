<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$(".pageAction").click(function(){
			$("#hd_page").val($(this).attr("value"));
			$("#form2").submit();
		});
		$(".addGoods").click(function(){
			$.post("cart.do",{isbn:$(this).attr("value")},function(){
				alert("添加成功 ");
			});
		});
		
	});
</script>
</head>
<body>
	<from>
		<table align="center" border=1 width="80%">
			<tr>
			<td>序号</td>
			<td>书号</td>
			<td>书名</td>
			<td>价格</td>
			<td>操作</td>
			</tr>
			<c:forEach items="${pageInfor.list}" var="book"  varStatus="state">
			<tr>
			<td>${state.count+pageInfor.pageSize*(pageInfor.currentPage-1)}</td>
			<td> ${book.isbn } </td>
			<td>${book.bookName}</td>
			<td>${book.price }</td>
<%-- 			<td><a href="cart.do?isbn=${book.isbn}" class="addGoods">添加到购物车</a></td> --%>
			<td><a href="javascript:return voild(0)" class="addGoods" value="${book.isbn }">添加到购物车</a></td>
			
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<%@ include file="include/subPage.jsp" %>
				</td>
			</tr>
		</table>
	</from>
	 <div>
	  <a href="cart.jsp">查看购物车</a>
	 </div>
	<form id="form2" action="${pageInfor.url}" method="post">
	<input type="hidden" name="currentPage" id="hd_page" >
	</form>
</body>
</html>