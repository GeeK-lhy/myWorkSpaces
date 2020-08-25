<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>物资采购与产品整合管理系统</title>
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#skip").click(function(){
			window.open("partsreplist?start="+$("#text1").val()+"&partsid="+$("#idText").val()+"&partsname="+$("#nameText").val(),"_self");
		});
		$("#btn_select").click(function(){
			window.open("partsreplist?partsid="+$("#idText").val()+"&partsname="+$("#nameText").val(),"_self");
		})

	});
</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 配件管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="" method="post">
        <tr>
            <th align="right">配件编码：</th>
            <td><input name="textfield2" type="text" id="idText" class="inputTextNormal" value="${partsid }" /></td>
             <th align="right">配件名称：</th>
            <td><input name="textfield2" type="text" id="nameText" class="inputTextNormal" value="${partsname }"/></td>
            <th align="right">
				<input type="button" id="btn_select" class="btnShort" value="检索" />
			</th>
        </tr>
       	</form>
    </table>


    <!--//commonTableSearch-->
    
	<input type="button" class="btnNormal" value="配件出入库" onclick="location.href='partsrep'"/>	

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>配件编码</th>
            <th>配件名称</th>
            <th>库存数量</th>
        </tr>
<!--         <tr>
            <td align="center">1</td>
            <td align="center">100</td>
            <td align="center">滤清器</td>
			<td align="center">30</td>
        </tr> -->
		<c:forEach items="${pageInfo.list }" var="l" varStatus="state">
		    <tr>
            <td align="center">${(pageInfo.pageNum-1)*pageInfo.pageSize+state.count }</td>
            <td align="center">${l.PartsId }</td>
            <td align="center">${l.PartsName }</td>
			<td align="center">${l.PartsReqCount }</td>
        </tr>
		</c:forEach>
        
        
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="partsreplist?start=${pageInfo.firstPage }&partsname=${partsname}">首页</a></li>
            <li ><a href="partsreplist?start=${pageInfo.prePage }&partsname=${partsname}">上页</a></li>
            <li><a href="partsreplist?start=${pageInfo.nextPage }&partsname=${partsname}">下页</a></li>
            <li class="current"><input type="text" id="text1" value="1" style="text-align:right" size="1" "></li>
            <li><a href="javascript:return void(0)" id="skip"style="text-align:right size="1">跳转</a></li>
            <li><a href="partsreplist?start=${pageInfo.lastPage }&partsname=${partsname}">尾页</a></li>
            <li class="pageinfo">第${pageInfo.pageNum }页</li>
            <li class="pageinfo">共${pageInfo.pages }页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>