<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
/* 		 setInterval(function(){
             location.reload();
         },500); */
         	//添加图书
		$("#btn_add").click(function(){
			window.open("addBook.jsp","_self");
		});
         //鼠标悬停
		$(".trs").hover(function(){
			$(this).css("background-color","#edefec");
		},function(){
			$(this).css("background-color","white");
		});
		//删除
		$(".btn_delete").click(function(){
			var value=$(this).attr("value");
			if(confirm("您确定要删除吗")){
				window.open("delete.do?isbn="+value,"_self");
			}
		});
		
		//删除
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
		//模糊查询
		$("#btn_select").click(function(){
			var str=$("#text1").val();
			window.open("select.do?selectName="+str,"_self");

		});
		//跳转
		$("#btn_skip").click(function(){
			var i=$("#skiptext").val();
			if(i>=1&&i<=$("#skipLastPage").val()){
			window.open("skip.do?currentPage="+i,"_self");
			}else if(i<1){
				window.open("skip.do?currentPage=1","_self");
			}else {
				window.open("skip.do?currentPage="+$("#skipLastPage").val(),"_self");
			}
		});
	});
	</script>
</head>
<body>

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
	</c:choose>&nbsp;&nbsp;&nbsp;
	<br/>
	 图书查询   : <input  type="text" name="selectName" id="text1" width="50px">
	 	<input type="button" id="btn_select" value="查询"><br/><br/>
	<form id="form1" action="delete.do" method="post">
	 <table border=1 width="80%" align="center">
	 <tr>
	 <td>序号</td>
	 <td>书号</td>
	 <td>书名</td>
	 <td>价格</td>
	 <td>操作</td>
	 </tr>
	 <c:forEach items="${pageInfor.list}" var="book" varStatus="state"  >
	 <tr class="trs">
	 <td>${state.count+pageInfor.pageSize*(pageInfor.currentPage-1)}</td>
	 <td>${book.isbn}</td>
	 <td>${book.bookName}</td>
	 <td>${book.price}</td>
	 <td><a href="edit.do?isbn=${book.isbn}">编辑  |</a><a value="${book.isbn}" class="btn_delete"  href="javascript:return void(0)">删除  </a>
	 <input type="checkbox" value="${book.isbn}" name="isbn">
	 </td>

	 </tr>
	 </c:forEach>
	 <tr>
	 	<td colspan="5">
	 	 <div>
	 	  总记录数：${pageInfor.recordCount }&nbsp;
	 	  该页记录数：${fn:length(pageInfor.list)}&nbsp;
	 	  当前页数：${pageInfor.currentPage}&nbsp;
	 	  总页数：${pageInfor.pageCount}&nbsp;

	 	  <a  class="urlaction"href="javascript:return void(0)" value="1">首页</a>&nbsp;
	 	  <c:choose>
	 	  <c:when test="${pageInfor.currentPage>1}">
	 	  <a  class="urlaction1"href="javascript:return void(0)" value="${pageInfor.currentPage-1 }">上一页</a>&nbsp;
	 	  </c:when>
	 	   <c:when test="${pageInfor.currentPage==1}">
	 	  <a  class="urlaction1"href="javascript:return void(0)" value="${pageInfor.currentPage }">上一页</a>&nbsp;
	 	  </c:when>
	 	  </c:choose>
	 	  
	 	  <c:choose>
	 	  <c:when test="${pageInfor.currentPage<pageInfor.pageCount}">
	 	  <a  class="urlaction1"href="javascript:return void(0)" value="${pageInfor.currentPage+1}">下一页</a>&nbsp;
	 	  </c:when>
	 	   <c:when test="${pageInfor.currentPage==pageInfor.pageCount}">
	 	  <a  class="urlaction1"href="javascript:return void(0)" value="${pageInfor.pageCount}">下一页</a>&nbsp;
	 	  </c:when>
	 	  </c:choose>
  		
	 	  <a class="urlaction" href="javascript:return void(0)" value="${pageInfor.pageCount}">尾页</a>&nbsp;
	 	 
	 	  <input type="text" id="skiptext" style="width: 30px"value="${pageInfor.currentPage}">
	 	  <input type="hidden" id="skipLastPage" value="${pageInfor.pageCount}">
	 	  <input type="button" id="btn_skip" value="跳转">
	 	 </div>
	 	</td>
	 </tr>
	 </table>

	<div style="position:absolute;left: 280px">
	 	<input type="button" value="添加图书" id="btn_add"/>
	  <input type="button" value="批量删除" id="btn_delete"/>
	</div>
	
	</form>
	<form id="form2" action="${pageInfor.url}" method="post">
	<input type="hidden" name="currentPage" id="hd_currentPage">
	</form>
	
	<script>
	$(function(){
		$(".urlaction").click(function(){
			$("#hd_currentPage").val($(this).attr("value"));
			$("#form2").submit();
		});
	$(".urlaction1").click(function(){
		$("#hd_currentPage").val($(this).attr("value"));
		$("#form2").submit();
	});
	});
	</script>
	
</body>
</html>