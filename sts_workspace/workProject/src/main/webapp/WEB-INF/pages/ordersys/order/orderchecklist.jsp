<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>物资采购与产品整合管理系统</title>
<link href="../../../css/main.css" rel="stylesheet" type="text/css" media="all" />
<!--  <script src="../../../js/jquery-1.11.1.js" type="text/javascript"></script> -->
<script src="../../../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#btn_select").click(function(){
			$("#form1").submit();
			
		})
		$(".page").click(function(){
			var n=$(this).attr("value");
			$("#pageNum").val(n)
			$("#form2").submit();
		});
		$("#pageSkip").click(function(){
			$("#pageNum").val($("#skipText").val());
			$("#form2").submit();
		});
		$(".pass").click(function(){
			var flag=$(this).attr("value");
			var code=$(this).parent().prev().prev().prev().text();
			var date=$(this).parent().prev().prev().text();
			var orderdate=$("#orderdate").val();
			var ordercode=$("#ordercode").val();
			var orderflag=$("#orderstatus").val();
			var page=$("#currentPage").val();
			window.open("passOrder?passStatus="+flag+"&date="+date+"&ordercode="+ordercode+"&orderdate="+orderdate+"&orderflag="+orderflag+"&pageNum="+page+"&code="+code,"_self")

		});
		
	})	
</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form1" name="form-search" action="orderchecklist" method="post">
        <tr>
            <th align="right">订单编码：</th>
            <td><input name="ordercode" type="text" class="inputTextNormal" id="ordercode"  value="${ordercode}"/></td>
            <th align="right">订单保存时间：</th>
            <td><input name="orderdate" type="text" class="inputTextNormal" id="orderdate"  value="${orderdate}" /></td>
            <td align="right">订单状态：</td>
            <td>
            		<select id="orderstatus" name="orderflag">
					<c:choose>
						<c:when test="${condition.orderflag eq '1' }">
            			<option value="" >请选择</option>
						<option value="1"selected>待审核</option>
						<option value="2">审核通过</option>
						<option value="3">审核不通过</option>
						</c:when>
						<c:when test="${condition.orderflag eq '2' }">
            			<option value="" >请选择</option>
						<option value="1">待审核</option>
						<option value="2"selected>审核通过</option>
						<option value="3">审核不通过</option>
						</c:when>
						<c:when test="${condition.orderflag eq '3' }">
            			<option value="" >请选择</option>
						<option value="1">待审核</option>
						<option value="2">审核通过</option>
						<option value="3" selected>审核不通过</option>
						</c:when>
						<c:otherwise>
						<option value="" selected>请选择</option>
						<option value="1">待审核</option>
						<option value="2">审核通过</option>
						<option value="3">审核不通过</option>
						</c:otherwise>
					</c:choose>
				</select></td>

            <th align="right">
				<input type="button" id="btn_select" class="btnShort" value="检索" />
			</th>
        </tr>
        <tr>

          </tr>
       	</form>
    </table>


 
	<br>

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>订单编码</th>
            <th>订单保存时间</th>
            <th>订单状态</th>
            <th class="editColDefault">操作</th>
        </tr>
<!--         <tr>
            <td align="center">1</td>
            <td align="center">DD2011103001</td>
            <td align="center">2011-10-30</td>
			<td align="center"><font color="RED">已通过</font></td>
            <td align="center">
            	
            </td>
        </tr> -->
		
		<c:forEach items="${pageInfo.list }" var="l" varStatus="state">
			 <tr>
            <td align="center">${(pageInfo.pageNum-1)*pageInfo.pageSize+state.count}</td>
            <td align="center">${l.orderCode}</td>
            <td align="center">${l.orderDate }</td>
			<c:choose>
            	<c:when test="${l.name=='已通过' }">
            	<td align="center"><font color="RED">${l.name }</font></td>
            	</c:when>
            	<c:when test="${l.name=='待审核' }">
            	<td align="center"><font color="blue">${l.name }</font></td>
            	</c:when>
            	<c:otherwise>
            	<td align="center"><font >${l.name }</font></td>
            	</c:otherwise>
            </c:choose>
          
            <td align="center">
            	  <c:if test="${l.name=='待审核' }">
            	<a href="javascript:return void(0)" class="pass" value="true" ><font color="BLUE">通过</font></a>
            	<a href="javascript:return void(0)" class="pass" value="false" ><font color="BLUE">不通过</font></a>
            	  </c:if>
            </td>
        </tr>
		</c:forEach>
		
<!-- 		
        <tr>
            <td align="center">3</td>
            <td align="center">DD2011103003</td>
            <td align="center">2011-10-30</td>
			<td align="center"><font color="BLUE">待审核</font></td>
            <td align="center">
            	<a href="#" ><font color="BLUE">通过</font></a>
            	<a href="#" ><font color="BLUE">不通过</font></a>
            </td>
        </tr>

 -->



 
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="javascript:return void(0)" class="page" value="${pageInfo.firstPage }">首页</a></li>
            <li ><a href="javascript:return void(0)" class="page"  value="${pageInfo.prePage }">上页</a></li>
            <li><a href="javascript:return void(0)" class="page"  value="${pageInfo.nextPage }">下页</a></li>
            <li class="current"><input type="text" class="page" id="skipText"  value="1" style="text-align:right" size="1"></li>
            <li><a href="javascript:return void(0)" id="pageSkip">跳转</a></li>
            <li><a href="javascript:return void(0)" class="page"  value="${pageInfo.lastPage}">尾页</a></li>
            <li class="pageinfo">第${pageInfo.pageNum }页</li>
            <li class="pageinfo">共${pageInfo.pages }页</li>
        </ul>
    </div>
</div>

<form action="orderchecklist" id="form2">
	<input type="hidden" name="pageNum" id="pageNum" value="1">
	<c:forEach items="${condition }" var="c" >
	<input type="hidden" name="${c.key}" value="${c.value }">
	</c:forEach>
</form>

<input type="hidden" id="currentPage" value="${pageInfo.pageNum }">


<!--//content pages wrap-->
</body>
</html>
