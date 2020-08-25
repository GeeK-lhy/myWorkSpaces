<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物资采购与产品整合管理系统</title>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=7" /> -->
<!-- <title>物资采购与产品整合管理系统</title> -->
<link href="../../../css/main.css" rel="stylesheet" type="text/css" media="all" />
<script src="../../../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("#select").click(function(){
		$("#materdiv").fadeIn();
		
	})
	$("#close").click(function(){
		$("#materdiv").fadeOut();
	})
	$("#confirm").click(function(){	
		if($("input:checked").length==0){
			alert("请选择配件");
		}else{
			var check=[];
			
			$("input:checked").each(function(i){
			check[i]=$(this).val();
			})
			 $.ajax({
			    url: "getPartsJson",
			    type: "POST",
			    traditional: true,
			    data: {
			        "id": check,
			    },
			    success: function(data) {
			    	var t=$("#table2")
					
			 	for(var i=0;i<data.length;i++){
	
						var tr=$("<tr>");
						var td=$("<td  style='width:5%'>");
						var td2=$("<td>");
						var td3=$("<td>");
						var td4=$("<td>");
						var td5=$("<td>");
						td.append("<input type='text' form='firstForm' name='ods["+i+"].partsid' value='"+data[i].PartsId+"'>")
						td2.append($("<span>").html(data[i].PartsName))
						td3.append($("<span>").html(data[i].PartsReqCount))
						td4.append($("<input type='text' form='firstForm' name='orderpartscount'><span style='color:red'></span>"))
						var btn=$("<input type='button' class='btn_delete'>").attr("value","删除")
						td5.append(btn)				
						tr.append(td)
						tr.append(td2)
						tr.append(td3)
						tr.append(td4)
						tr.append(td5);
						t.append(tr);
						btn.click(function(){
							
							tr.remove();
						});
					}
			    	$("#materdiv").fadeOut();
			    }
			});
			
		}
	});
	$("#checkAll").click(function(){
		$(":checkbox").attr("checked",true);

	})
	$("#notCheck").click(function(){
		$(":checkbox").attr("checked",false);
	})
	$("#ordercode").focusout(function(){
		var v=$("#ordercode").val()
		$.post("checkOrderCode",{"ordercode":v},function(data){
			if(data=="0"){
				$("#span1").css("color","red");
				$("#span1").html("订单号已存在")
			}else{
				$("#span1").css("color","green");
				$("#span1").html("订单号可用")
			}
		});
		
	});
 	$("#btn_save").click(function(){
 	 	  //alert("123")
 	 	  var flag;
 	 	 var i=0;
 		  $("input[name='orderpartscount']").each(function(){
 			  flag=false;
 				var n1=$(this).val();
 				var n2=$(this).parent().prev().children().html()
 				if(n1==""){
 					$(this).next().html("请输入数量");

 				}
 				else if(n1!=null && n1!="" && parseInt(n1)>parseInt(n2)){
 					$(this).next().html("库存不足");
 	          }else if(n1!=null && n1!="" && parseInt(n1)<=parseInt(n2)){
 	       
 	        	$(this).attr("name","ods["+i+"].orderpartscount")
 	        	i++;
 	        	flag=true;
 	          }
 	        
 	      });
 	      if(flag==true)
 	    	 $("#firstForm").submit();
 			
 		
 	});
 	$("#btn_submit").click(function(){
 		$("#orderstatus").val(1)
	 	  var flag;
	 	 	 var i=0;
	 		  $("input[name='orderpartscount']").each(function(){
	 			  flag=false;
	 				var n1=$(this).val();
	 				var n2=$(this).parent().prev().children().html()
	 				if(n1==""){
	 					$(this).next().html("请输入数量");

	 				}
	 				else if(n1!=null && n1!="" && parseInt(n1)>parseInt(n2)){
	 					$(this).next().html("库存不足");
	 	          }else if(n1!=null && n1!="" && parseInt(n1)<=parseInt(n2)){
	 	       
	 	        	$(this).attr("name","ods["+i+"].orderpartscount")
	 	        	i++;
	 	        	flag=true;
	 	          }
	 	        
	 	      });
	 	      if(flag==true)
	 	    	 $("#firstForm").submit();
 	});
	
});
	
</script>

</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; 订单信息修改</h2>
  </div>
        <form id="firstForm" name="firstForm" action="editOrder" method="post">
		  <%--  <input type="hidden" name="preOrderCode" value="${preOrderCode }"> --%>
		  <table border="0" cellspacing="1" cellpadding="0" class="commonTable">
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单编码：</td>
				<td width="15%" align="left"><input type="text" id="ordercode" value="${preOrderCode }" name="ordercode" style="width:150px">
				<span id="span1"></span>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单保存日期：</td>
				<td width="15%" align="left"><input type="text" name="orderdate" value="${orderdate }"  style="border: hidden;"></td>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单状态：</td>
				<td width="15%" align="left">
					<select id="orderstatus" name="orderflag" id="orderflag">
					<c:if test="${orderflag eq '未提交' }">
						<option value="0" selected>未提交</option>
						<option value="1">待审核</option>
					 </c:if>
					<c:if test="${orderflag eq '待审核' }">
						<option value="0" >未提交</option>
						<option value="1" selected>待审核</option>
					 </c:if>
					 
					</select>
				</td>
			  </tr>

		 </table>
	    <div align="left" style="margin-top:15px;margin-bottom:5px">
	    	<a href="javascript:return void(0)" id="select" title="选择原料" class="btnShort">选择配件</a>
	    </div>
<!--  -->	    


<div id="materdiv" style="display: none;">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理&nbsp;&gt;&gt;&nbsp;配件选择列表</h2>
	</div>
	<form id="form1" name="form-search" action="orderadd" method="post">
	  <input type="hidden" id="hid">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
	        <tr>
<!-- 	            <th align="right">配件名称：</th>
	            <th ><input name="partsname" type="text" class="inputTextNormal" id="textfield" /></td>
				<th width="100%" align="left" >
					<input type="button" id="btn_selectByName" value="检索">
				</th> -->	
			
	        </tr>
    	</table>
    </form>
    <!--//commonTableSearch-->
    <div class="btnBar">
    	<ul class="clearfix">
        	<li><a href="javascript:return void(0)" id="confirm" title="确定" class="btnLong">确定</a></li>
        	<li><a href="javascript:return void(0)" id="close"title="关闭" class="btnLong">关闭</a></li>
        </ul>
    </div>
    <form action="orderadd" name="form2" id="form2" method="post">
	    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
	        <tr>
	            <td>
	           <a href="javascript:return void(0)" id="checkAll" >全选&nbsp;
	           <a href="javascript:return void(0)" id="notCheck">取消
	            	
	            </td>
	            <td>配件名称</td>
	            <td>配件库存</td>
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
            <td align="center" style="width:6%">
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




    <!--//commonTable-->
		<table id="table2" form="firstForm" width="90%" border="0" cellpadding="0" cellspacing="1" id="attachmentList" class="commonTable marginTopM">
		  <tr>
		  	  <td>配件号</td>
	          <td>配件名称</td>
	          <td>库存数量</td>
	          <td>进货数量</td>
	          <td class="editColXS">操作</td>
	      </tr>
		</table> 
</form>

	 </div>
    <!--//commonTable-->

    
    <div id="formPageButton">
    	<ul>
			<li><a href="javascript:return void(0)" id="btn_save" title="保存" class="btnShort">保存</a></li>
			<li><a href="javascript:return void(0)"id="btn_submit" title="提交" class="btnShort">提交</a></li>
        	<li><a href="javascript:window.history.go(-1)" title="返回" class="btnShort">返回</a></li>
        </ul>
    </div>
    <!--//commonToolBar-->
</div>
<!--//content pages wrap-->
</body>
</html>
