<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="js/md5.min.js"></script>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
 <script>
 $(function(){
		$(".givePower").each(function(){
 	 $(this).click(function(){
		$.post("addPower",{"account_name":$(this).attr("value")},function(data){
			alert(data)
			window.location.href="touserLimit";
			
		})
 	 })
	 }); 
 	$(".deletePower").each(function(){
 	 $(this).click(function(){
 		$.post("deletePower", {"account_name":$(this).attr("value")},function(data){
 			alert(data)
 			window.location.href="touserLimit";
 			
 		})
 	 })
 	})
})
 

	

</script>
</head>
<body>
		<div>
			<a href="/workProject/">退出</a>
		</div>
		<form>

		<div>
		<table align="center" border=1 width="90%">
			<tr>
			<td colspan="10" align="right"> <a href="javascript:history.back(-1)">返回上一页</a></td>
			</tr>
			<tr>
			<td>序号</td>
			<td>工号</td>
			<td>姓名</td>
			<td>用户名</td>
			<td>权限</td>
			<td>角色</td>
			<td>联系方式</td>
			<td>地址</td>
			<td>操作</td>
			</tr>
			<c:forEach items="${userList}" var="user"  varStatus="state">
			<tr>
			<td>${state.count}</td>
			<td>${user.job_number} </td>
			<td>${user.user_name}</td>
			<td>${user.account_name }</td> 
			<td>
		<c:choose>
			<c:when test="${user.jurisdiction == 0}">
				无权限
			</c:when>
		
			<c:otherwise>
				已授权
			</c:otherwise>
		
		</c:choose>
		</td>
		<td>
		
	
			<c:choose>
			<c:when test="${user.role==0}">
			普通用户
			</c:when>
		
			<c:otherwise>
			管理员
			</c:otherwise>
		
			</c:choose>
			</td>

			<td>${user.contact }</td> 

			<td>${user.address}</td>
			<td>
			<c:if test="${user.jurisdiction == 0}">
			<a href="javascript:return voild(0)" class="givePower" value="${user.account_name}">授权</a> 
			</c:if>
			<c:if test="${user.jurisdiction ==1 and user.role==0}">
			<a href="javascript:return voild(0)" class="deletePower" value="${user.account_name}">撤销</a> 
			</c:if>
			</td>
			
			</tr>
			</c:forEach>

		</table>
		</div>
	</form>

</body>
</html>