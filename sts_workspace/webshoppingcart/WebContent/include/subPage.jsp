<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			 	  总记录数：${pageInfor.recordCount }&nbsp;
	 			  该页记录数：${fn:length(pageInfor.list)}&nbsp;
	 	 		 当前页数：${pageInfor.currentPage}&nbsp;
	 	 		 总页数：${pageInfor.pageCount}&nbsp;
	 	 		 <a class="pageAction" href="javascript:return void(0)" value="1">首页</a>&nbsp;
	 	 		 <c:if test="${pageInfor.currentPage>1 }">
	 	 		  <a class="pageAction" href="javascript:return void(0)" value="${pageInfor.currentPage-1 }">上一页</a>&nbsp;
	 	 		 </c:if>
	 	 		 <c:if test="${pageInfor.currentPage<pageInfor.pageCount}">
	 	 		 <a class="pageAction" href="javascript:return void(0)" value="${pageInfor.currentPage+1 }">下一页</a>
	 	 		 </c:if>
	 	 		 <a  class="pageAction" href="javascript:return void(0)"value="${pageInfor.pageCount }">尾页</a>&nbsp;