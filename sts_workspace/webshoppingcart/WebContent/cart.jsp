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

</script>
</head>
<body>
	<from>
		<c:choose>
		<c:when test="${cart.variety>0 }">
		<table align="center" border=1 width="80%">
		<tr>
		<td>商品种类：</td>
		<td colspan="5" align="center">${cart.variety}</td>
		</tr>
			<tr>
			<td>序号</td>
			<td>书号</td>
			<td>书名</td>
			<td>价格</td>
			<td>数量</td>
			<td>操作</td>
			</tr>
		
			<c:forEach items="${cart.map}" var="m"  varStatus="state">
			<tr>
				<td>${state.count}</td>
				<td>${m.value.book.isbn}</td>
				<td>${m.value.book.bookName}</td>
				<td>${m.value.book.price}</td>
				<td class="num">${m.value.num}</td>
		<td><a href="addNum.do?isbn=${m.value.book.isbn}">增加</a>&nbsp;<a href="reduce.do?isbn=${m.value.book.isbn}">减少</a></a>&nbsp;<a href="delete.do?isbn=${m.value.book.isbn}">删除</a></td> 
		
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="6" align="right">总价格：${cart.totalPrice}</td>
			<!-- <td colspan="6" align="right"><input type="button" value="结算" id=btn_pay></td> -->
			</tr>
			</table>
			</c:when>
			<c:otherwise><div  align="center">购物车是空的，快添加物品把</div></c:otherwise>
			</c:choose>
			</from>
			<div >
			<a href="bookList.do">返回商品列表</a>
			</div>
</body>
</html>