<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script>
	$(function(){
		$("tr").hover(function(){
			$(this).css("background-color","yellow");
		},function(){
			$(this).css("background-color","white");
		});
	});
</script>
</head>
<body>
	  <%List<String> list=(List)request.getAttribute("names");%>
	
	<table width="70%" border=1>
	<%for(String s:list){ %> 
	 
	 <tr> <td>
	 <%=s %>
	 </td></tr>
	<%} %>
	</table>
<%-- 	${names}
	${book.isbn}
	${book.bookName}
	${book.price}
	 --%>
	 <c:out value="${book.isbn}" default="没有编号"></c:out><br/>
	   ${book.isbn}
		${book.bookName}<br/>
		${book.price}<br/>
		
		<c:choose>
		<c:when test="${book.price>40}">买不起</c:when>
		<c:when test="${book.price==40}">我要购买</c:when>
		<c:otherwise>太便宜</c:otherwise>
		</c:choose>
	<%-- <%pageContext.include("b.jsp");%> --%>
</body>
</html>