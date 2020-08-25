<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
/* 		 setInterval(function(){
             location.reload();
         },500); */
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
		$("#btn_select").click(function(){
			var str=$("#text1").val();
			window.open("select.do?selectName="+str,"_self");

		});
		$("#btn_to").click(function(){
			var i=$("#text2").val();
			if(i>=1)
			window.open("skip.do?skipPage="+i,"_self");
			else{
				window.open("skip.do?skipPage=1","_self");	
			}
		});
	});
	</script>
</head>
<body>
	<div style="float: right">
	<a href="logout.do">注销</a>
	</div>
	当前在线人数：${count }<br/>
	当前登录人数：${fn:length(loginMap)}<br/>
	<p>登陆成功</p>
	<p>您好，${user.realName}</p>
	<p>登陆次数为：${user.loginCount+1}</p>
	<c:choose >
	<c:when test="${empty user.lastDate}">
	<p>上次登录时间为：这是第一次登录</p>
	</c:when>
	<c:otherwise>
		<p>上次登录时间为：${user.lastDate}</p>
	</c:otherwise>
	</c:choose>
	<br/>
	 图书查询   : <input  type="text" name="selectName" id="text1" width="50px">
	 	<input type="button" id="btn_select" value="查询"><br/><br/>
	<form id="form1" action="delete.do" method="post">
	 <table border=1 width="60%" align="center">
	 <tr>
	 <td>序号</td>
	 <td>书号</td>
	 <td>书名</td>
	 <td>价格</td>
	 <td>操作</td>
	 </tr>
	 <c:forEach items="${books}" var="book" varStatus="state"  >
	 <tr class="trs">
	 <td>${state.index+1+4*(page-1)}</td>
	 <td>${book.isbn}</td>
	 <td>${book.bookName}</td>
	 <td>${book.price}</td>
	 <td><a href="edit.do?isbn=${book.isbn}">编辑  |</a><a value="${book.isbn}" class="btn_delete"  href="javascript:return void(0)">删除  </a>
	 <input type="checkbox" value="${book.isbn}" name="isbn">
	 </td>

	 </tr>
	 </c:forEach>
	 </table>
	<div style="position: absolute;left: 280px;">
		<a href="first.do" id="first" value="${page}">首页        | </a>
		<a href="prior.do" id="prior"value="${page}">上一页     |  </a>

		 <input type="text" id="text2" style="width:25px;font-size:17px" value="${page}"> 

		  <c:choose>
		  <c:when test="${size%4==0}">
		  <fmt:formatNumber type="number" value="${size/4}" maxFractionDigits="0" pattern="#"/> 
		 </c:when>
			<c:otherwise>
		  <fmt:formatNumber type="number" value="${(size-size%4)/4+1}" maxFractionDigits="0" pattern="#"/> 
			</c:otherwise>
		 </c:choose>
		 
	  <input type="button" id="btn_to" value="跳转">
	
		<a href="next.do" id="next" value="${page}">下一页         | </a>
		<a href="last.do" id="last"value="${page}">尾页   </a>
		<br/>
			<br/>
	 <input type="button" value="添加图书" id="btn_add"/>
	  <input type="button" value="批量删除" id="btn_delete"/>
	  
	</div>
	</form>
</body>
</html>