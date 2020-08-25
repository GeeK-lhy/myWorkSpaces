<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	遍历数组<br/>
<%-- 	<c:forEach items="${array}" var="name">
	<input type="checkbox" value="${name}"/>${name}
	</c:forEach>
			 --%>
	<select name="name" style="width:200px">
	<c:forEach items="${array}" var="name">
		<option value="${name}"> ${name}</option>
		
	</c:forEach>
	
	</select>
	<br/>
	遍历List<br/>
	<c:forEach items="${stringList}" var="name">
			${name}	<br/>
	</c:forEach>
	
	遍历set<br/>
	<table width="70%" border=1>
	<tr>
	<td>序号</td>
	<td>书号</td>
	<td>书名</td>
	<td>价格</td>
	<td>操作</td>
	</tr>
	<c:forEach items="${set}" var="book" varStatus="status">
	 <tr>
	  <td>${status.index}</td>
	 <td>${book.isbn}</td>
	 <td>${book.bookName}</td>
	 <td>${book.price}</td>
	 <td>操作</td>
	 </tr>
	</c:forEach>
	</table>
	<br/>
	<table width="70%" border=1>
	<tr>
	<td>序号</td>
	<td>书号</td>
	<td>书名</td>
	<td>价格</td>
	<td>操作</td>
	</tr>
	<c:forEach items="${map}" var="m" varStatus="status">
	 <tr>
	  <td>${status.index}</td>
	 <td>${m.value.isbn}</td>
	 <td>${m.value.bookName}</td>
	 <td>${m.value.price}</td>
	 <td>操作</td>
	 </tr>
	</c:forEach>
	</table>
	<br/>
<%-- 	<table width="70%" border=1>
	<tr>
	<td>序号</td>
	<td>书号</td>
	<td>书名</td>
	<td>价格</td>
	<td>操作</td>
	</tr>
	<c:forEach items="${set}" var="book" begin="2" end="4" varStatus="status">
	 <tr>
	  <td>${status.count}</td>
	 <td>${book.isbn}</td>
	 <td>${book.bookName}</td>
	 <td>${book.price}</td>
	 <td>操作</td>
	 </tr>
	</c:forEach>
	</table> --%>
	<fmt:formatDate value="${date}" type="both"/><br/>
		${fn:length(set)}
		${fn:contains(book.bookName,"j")}
</body>
</html>