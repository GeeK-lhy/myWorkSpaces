<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		var billflag='${partsRepBill.billflag}'
		var billtype='${partsRepBill.billtype}'
		$.getJSON("getJson",{"type":"io"},function(data){

			for(var i=0;i<data.length;i++){
				if(data[i].code==billflag)
				$("#select1").append($("<option selected>").html(data[i].name).val(data[i].code));
				else
				$("#select1").append($("<option>").html(data[i].name).val(data[i].code));	
		  }
			$("#select1").change();
		});
		
		$("#select1").change(function(){
			
			$("#select2").empty();
			$("#select2").append($("<option>").html("不限").val(""))
			$.getJSON("getJson",{"type":$("#select1").val()},function(data){
				for(var i=0;i<data.length;i++){
				if(data[i].code==billtype)
				$("#select2").append($("<option selected>").html(data[i].name).val(data[i].code));
				else
				$("#select2").append($("<option>").html(data[i].name).val(data[i].code));
				}
				})
		});
		
		$("#skip").click(function(){
			
			window.open("partsrepbilllist?start="+$("#skipText").val()+"&partsname="+$("#partsname").val()+"&billflag="+$("#select1").val()+"&billtype="+$("#select2").val()+"&billtime="+$("#time").val(),"_self")
		})

		$("#btn_select").click(function(){
			window.open("partsrepbilllist?partsname="+$("#partsname").val()+"&billflag="+$("#select1").val()+"&billtype="+$("#select2").val()+"&billtime="+$("#time").val(),"_self");
		})
	})

</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 配件库存流水账查询</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="" method="post">
        <tr>
            <th align="right">配件名称：</th>
            <td><input name="partsname" type="text" class="inputTextNormal" id="partsname"  value="${partsname }"/></td>
            <th align="right">出/入库：</th>
            <td>
            	<select style="width:150px;" name="name1" id="select1">
						<option value="">请选择</option>
				</select>
			</td>
            <th align="right">出入库类型：</th>
            <td>
            	<select style="width:150px;" name="name2" id="select2">
						<option value="">请选择</option>
				</select>
            </td>
            <th align="right">出入库日期：</th>
            <td>
            	<input name="time" type="text" class="inputTextNormal" id="time" value="${partsRepBill.billtime}" pattern="yyyy-MM-dd hh:mm:ss"/>
            </td>
            <th align="right">
				<input type="button" id="btn_select" class="btnShort" value="检索" />
			</th>
        </tr>
       	</form>
    </table>
	<br>

    <!--//commonTableSearch-->

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>出/入库</th>
            <th>出入库类别</th>
            <th>配件名称</th>
            <th>数量</th>
            <th>时间</th>
            <th>操作人</th>
        </tr>
<!--         <tr>
            <td align="center">1</td>
            <td align="center">出库</td>
            <td align="center">订单出库</td>
			<td align="center">滤清器</td>
			<td align="center">30</td>
			<td align="center">2017-10-20</td>
			<td align="center">张飞</td>
        </tr> -->
      <c:forEach items="${pageInfo.list }" var="l" varStatus="state">
              <tr>
            <td align="center">${(pageInfo.pageNum-1)*pageInfo.pageSize+state.count }</td>
            <td align="center">${l.name1 }</td>
            <td align="center">${l.name2 }</td>
			<td align="center">${l.PartsName }</td>
			<td align="center">${l.billcount }</td>
			<td align="center"><fmt:formatDate value="${l.billtime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			<td align="center">${empName}</td>
        </tr>
      </c:forEach>
        
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="partsrepbilllist?start=${pageInfo.firstPage }&partsname=${partsname}&billflag=${partsRepBill.billflag}&billtype=${partsRepBill.billtype}&billtime=${partsRepBill.billtime}">首页</a></li>
            <li ><a href="partsrepbilllist?start=${pageInfo.prePage }&partsname=${partsname}&billflag=${partsRepBill.billflag}&billtype=${partsRepBill.billtype}&billtime=${partsRepBill.billtime}">上页</a></li>
            <li><a href="partsrepbilllist?start=${pageInfo.nextPage }&partsname=${partsname}&billflag=${partsRepBill.billflag}&billtype=${partsRepBill.billtype}&billtime=${partsRepBill.billtime}">下页</a></li>
            <li class="current"><input type="text" id="skipText" value="1" style="text-align:right" size="1"></li>
            <li><a href="javascript:return void(0)" id="skip" >跳转</a></li>
            <li><a href="partsrepbilllist?start=${pageInfo.lastPage }&partsname=${partsname}&billflag=${partsRepBill.billflag}&billtype=${partsRepBill.billtype}&billtime=${partsRepBill.billtime}">尾页</a></li>
            <li class="pageinfo">第${pageInfo.pageNum }页</li>
            <li class="pageinfo">共${pageInfo.pages }页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>