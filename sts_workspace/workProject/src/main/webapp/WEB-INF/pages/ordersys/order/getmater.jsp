<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$("#confirm").click(function(){
		$("#form2").submit();

	//	window.close();

	})
})
</script>


</head>
<script type="text/javascript">



function checkAll(){
	var form = document.forms[1];
	var checkObj = form.ids;
	var ids = form.id;
	for(var i=0;i<ids.length;i++){
		ids[i].checked = checkObj.checked;
	}
}


</script>
<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理&nbsp;&gt;&gt;&nbsp;配件选择列表</h2>
	</div>
	<form id="form1" name="form-search" action="orderadd" method="post">
	  <input type="hidden" id="hid">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
	        <tr>
	            <th align="right">配件名称：</th>
	            <td ><input name="partsname" type="text" class="inputTextNormal" id="textfield" /></td>
				<td width="150" align="" >
					<button>检索</button>
				</td>
				<td></td>
	        </tr>
    	</table>
    </form>
    <!--//commonTableSearch-->
    <div class="btnBar">
    	<ul class="clearfix">
        	<li><a href="javascript:return void(0)" id="confirm" title="确定" class="btnLong">确定</a></li>
        	<li><a href="javascript:window.history.go(-1)" title="关闭" class="btnLong">关闭</a></li>
        </ul>
    </div>
    <form action="orderadd" name="form2" id="form2" method="post">
	    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
	        <tr>
	            <th>
	            	<input type="checkbox" name="ids" onclick="checkAll();">
	            </th>
	            <th>配件名称</th>
	            <th>配件库存</th>
	        </tr>

<!-- 		        <tr>
		            <td align="center" style="width:5%">
		            	<input type="checkbox" checked disabled="disabled" name="id" value="1,滤清器,50">
		            </td>
		            <td align="center">滤清器</td>
		            <td align="center">50</td>
		        </tr> -->
		    <c:forEach items="${list }" var="l" varStatus="state">
		    <tr>
            <td align="center" style="width:5%">
		       <input type="checkbox" name="id" value="${l.PartsId }">
		    </td>
            <td align="center">${l.PartsName }</td>
			<td align="center">${l.PartsReqCount }</td>
        </tr>
		</c:forEach>

	  </table>
  </form>
    <!--//commonTable-->

</div>
<!--//content pages wrap-->
</body>
</html>
