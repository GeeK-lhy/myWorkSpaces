<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	   <input type="button" value="按钮">
		<%pageContext.setAttribute("page_info","page中的数据",pageContext.PAGE_SCOPE);
			pageContext.setAttribute("request_info","request中的数据",pageContext.REQUEST_SCOPE);
			pageContext.setAttribute("session_info","session的数据",pageContext.SESSION_SCOPE);
			request.setAttribute("request","request的数据2");
			application.setAttribute("application_info","application全局的数据");
			
		%>
		<br/>
		page:<%=pageContext.getAttribute("page_info",pageContext.PAGE_SCOPE) %><br/>
		request:<%=request.getAttribute("request_info") %><br/>
		session:<%=session.getAttribute("session_info") %><br/>
		全局:<%=application.getAttribute("application_info") %>
		<%-- <%pageContext.forward("b.jsp");%> --%>
		<%response.sendRedirect("b.jsp"); %>
</body>
</html>