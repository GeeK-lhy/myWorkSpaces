<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>物资采购与产品整合管理系统</title>
<link href="../../../css/main.css" rel="stylesheet" type="text/css" media="all" />
<script src="../../../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#skip").click(function(){
			window.open("list?start="+$("#text1").val()+"&name="+$("#name").val()+"&ordercode="+$("#ordercode").val()+"&orderdate="+$("#orderdate").val(),"_self")
			
		});
		$("#btn_select").click(function(){
			$("#form1").submit();
		});
		
 		$(".btnIconDel").each(function(){
			$(this).click(function(){
				var code=$(this).parent().prev().prev().prev().text()
				
				$.get("deleteOrder",{"ordercode":code},function(data){
					alert(data);
					$("#form1").submit();	
				}); 

			});

		});
 		$(".btnIconEdit").each(function(){
 			$(this).click(function(){
 				var code=$(this).parent().prev().prev().prev().text();
 				var date=$(this).parent().prev().prev().text();
 				var flag=$(this).parent().prev().children().text();
				 window.open("toOrderEdit?ordercode="+code+"&orderdate="+date+"&orderflag="+flag,"_self");
 			});
 		});

	});

</script>

</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form1" name="form-search" action="list" method="post">
        <tr>
            <th align="right">订单编码：</th>
            <td><input name="ordercode" type="text" class="inputTextNormal" id="ordercode" value="${ordercode}"/></td>
            <th align="right">订单保存时间：</th>
            <td><input name="orderdate" type="text" class="inputTextNormal" id="orderdate" value="${orderdate}"/></td>
            <td align="right">订单状态：</td>
            <td><input name="name" type="text" class="inputTextNormal" id="name" value="${name }"/></td>
            <th align="right">
				<input type="button" id="btn_select" class="btnShort" value="检索" />
			</th>
        </tr>
       	</form>
    </table>


    <!--//commonTableSearch-->
    
	<input type="button" class="btnNormal" value="创建订单" onclick="location.href='add'"/>	

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
            	<a href="order-view.html" class="btnIconView" title="查看详情"></a>
            	<a href="orderedit.html" class="btnIconEdit" title="更新"></a>
                <a href="#" class="btnIconDel" title="删除"></a>
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
  	          	<a href="order-view.html" class="btnIconView" title="查看详情"></a>
             <c:if test="${l.name eq '未提交'}">
            	<a href="javascript:return void(0)" class="btnIconEdit" title="更新"></a>
                <a href="javascript:return void(0)" class="btnIconDel" title="删除"></a>
              </c:if>
            </td>
        </tr>
        </c:forEach>

   	
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="list?start=${pageInfo.firstPage }&ordercode=${ordercode}&name=${name}&orderdate=${orderdate}">首页</a></li>
            <li ><a href="list?start=${pageInfo.prePage }&ordercode=${ordercode}&name=${name}&orderdate=${orderdate}">上页</a></li>
            <li><a href="list?start=${pageInfo.nextPage }&ordercode=${ordercode}&name=${name}&orderdate=${orderdate}">下页</a></li>
            <li class="current"><input id="text1" type="text" value="1" style="text-align:right" size="1"></li>
            <li><a href="javascript:return void(0)" id="skip">跳转</a></li>
            <li><a href="list?start=${pageInfo.lastPage}&ordercode=${ordercode}&name=${name}&orderdate=${orderdate}">尾页</a></li>
            <li class="pageinfo">第${pageInfo.pageNum }页</li>
            <li class="pageinfo">共${pageInfo.pages }页</li>
        </ul>
    </div>
</div>


<!--//content pages wrap-->
</body>
</html>