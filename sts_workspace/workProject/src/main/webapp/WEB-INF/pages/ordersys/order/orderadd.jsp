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
<!-- <script src="../../../js/jquery-1.4.2.min.js" type="text/javascript"></script> -->
<script src="../../../js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){

	
	var checkbox=[];
	function addAjax(){
		$(".dataTr").remove(); 
		$.post("orderadd",{"partsname":$("#selectName").val()},function(data){
			var list=data.list;
			$("#pageinfo").text("第"+data.pageNum+"页");
			$("#pageinfo1").text("共"+data.pages+"页");
			for(var i=0;i<list.length;i++){
				var m=list[i];
				var tr=$("<tr class='dataTr'>");
				var td1=$("<td align='center' style='width:7%'>");
				var td2=$("<td align='center'>");
				var td3=$("<td align='center'>");
				var td4=$("<td></td>")
				var j=0;
				for(j=0;j<checkbox.length;j++){
					if(checkbox[j]==m["PartsId"]){
						td1.append("<input type='checkbox' checked name='id' value='"+m["PartsId"]+"'>")
						break;
					}
				}
				if(j>=checkbox.length)
				td1.append("<input type='checkbox' name='id' value='"+m["PartsId"]+"'>")
				td2.text(m["PartsName"])
				td3.text(m["PartsReqCount"]);
				tr.append(td1).append(td2).append(td3);
				$("#table1").append(tr)
			}
			$(".page").each(function(){
				var value=$(this).attr("value");
				$(this).attr("value",data[value]);
			})
			$(".page").click(function(){
				
				$.post("orderadd",{"start":$(this).attr("value"),"partsname":$("#selectName").val()},function(data2){
					var l=data2.list;
					$(".dataTr").remove();
					$("#pageinfo").text("第"+data2.pageNum+"页");
					$("#pageinfo1").text("共"+data2.pages+"页");
					for(var i=0;i<l.length;i++){
						var m=l[i];
						var tr=$("<tr class='dataTr'>");
						var td1=$("<td align='center' style='width:7%'>");
						var td2=$("<td align='center'>");
						var td3=$("<td align='center'>");
						var td4=$("<td></td>")
						for(j=0;j<checkbox.length;j++){
							if(checkbox[j]==m["PartsId"]){
								td1.append("<input type='checkbox' checked name='id' value='"+m["PartsId"]+"'>")
								break;
							}
						}
						if(j>=checkbox.length)
						td1.append("<input type='checkbox' name='id' value='"+m["PartsId"]+"'>")
						td2.text(m["PartsName"])
						td3.text(m["PartsReqCount"]);
						tr.append(td1).append(td2).append(td3);
						$("#table1").append(tr)
					}
				});
				$("input:checked").each(function(i){
					checkbox.push($(this).val());
					});

			})
	     	
		});
	}
	$("#select").click(function(){
		
		$("#materdiv").fadeIn();
		
		addAjax();
		
	}) ;
	$("#btn_selectByName").click(function(){
		$("input:checked").each(function(i){
			checkbox.push($(this).val());
			});

		addAjax();
	});
	$("#close").click(function(){
		$("#materdiv").fadeOut();
	})
	$("#confirm").click(function(){	
		
	//	$("#table2").children(".dataTr").remove(); 
	//	$(".dataTr").remove();
	
		if($("input:checked").length==0){
			alert("请选择配件");
		}else{
			var check=[];
			
			$("input:checked").each(function(i){
			checkbox.push($(this).val());
			})
			 $.ajax({
			    url: "getPartsJson",
			    type: "POST",
			    traditional: true,
			    data: {
			        "id": checkbox,
			    },
			    success: function(data) {
			    	/* $("#table2 tr:gt(0)").remove(); */
			    	var t=$("#table2")
			    	var table2id=[]
			    	$(".table2id").each(function(){
			    		table2id.push($(this).val())
			    	})
			 	for(var i=0;i<data.length;i++){
			 		var flag=false;
					for(var j=0;j<table2id.length;j++){
						if(table2id[j]==data[i].PartsId)
							{flag=true;
							break;}
					}
					if(flag==false){
						var tr=$("<tr>");
						var td=$("<td  style='width:5%'>");
						var td2=$("<td>");
						var td3=$("<td>");
						var td4=$("<td>");
						var td5=$("<td>");
						td.append("<input type='text' form='firstForm' name='ods["+i+"].partsid' value='"+data[i].PartsId+"'class='table2id'>")
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
							
							var checkbox2=[];
							var len=checkbox.length;
							for(var k=0;k<len;k++)
								checkbox2.push(checkbox.pop());
							for(var k=0;k<len;k++){
								var cb=checkbox2.pop();
		
								if(cb!=$(this).parent().prev().prev().prev().prev().children().val()){
									checkbox.push(cb);
								}
							}
							$(this).parent().parent().remove();
							
						});
					}
					}
			    	$("#materdiv").fadeOut();
			    }
			});
			
		}
	});
	$("#checkAll").click(function(){
		$(":checkbox").prop("checked",true);

	})
	$("#notCheck").click(function(){
		$(":checkbox").prop("checked",false);
	})
	$("#ordercode").focusout(function(){
		var v=$("#ordercode").val()
		if(v!=""){
		$.post("checkOrderCode",{"ordercode":v},function(data){
			if(data=="0"){
				$("#span1").css("color","red");
				$("#span1").html("订单号已存在")
			}else{
				$("#span1").css("color","green");
				$("#span1").html("订单号可用")
			}
		
		});
		}
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
        <form id="firstForm" name="firstForm" action="saveOrder" method="post">
		  <table border="0" cellspacing="1" cellpadding="0" class="commonTable">
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单编码：</td>
				<td width="15%" align="left"><input type="text" id="ordercode" value="${ordercode }" name="ordercode" style="width:150px">
				<span id="span1"></span>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单保存日期：</td>
				<td width="15%" align="left"><input type="text" name="orderdate" value='<fmt:formatDate value="${orderdate }"/>' style="border: hidden;"></td>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单状态：</td>
				<td width="15%" align="left">
					<select id="orderstatus" name="orderflag" id="orderflag">
						<option value="0" selected>未提交</option>
						<option value="1">待审核</option>

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
	 
	</div>
	<form id="form1" name="form-search" action="orderadd" method="post">
	  <input type="hidden" id="hid">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
	        <tr>
	            <th align="right">配件名称：</th>
	            <th ><input id="selectName" name="selectName" type="text" class="inputTextNormal" id="textfield" /></td>
				<th width="100%" align="left" >
					<input type="button" id="btn_selectByName" value="检索">
				</th> 
			
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
	    <table width="101%" id="table1" border="0" cellpadding="0" cellspacing="1" class="commonTable">
	        <tr>
	            <td>
	           <a href="javascript:return void(0)" id="checkAll" >全选&nbsp;
	           <a href="javascript:return void(0)" id="notCheck">取消
	            	
	            </td>
	            <td align="center">配件名称</td>
	            <td align="center">配件库存</td>
	        </tr>
	        
<%-- 		    <c:forEach items="${list }" var="l" varStatus="state">
		    <tr>
            <td align="center" style="width:6%">
		       <input type="checkbox" name="id" value="${l.PartsId }">
		    </td>
            <td align="center">${l.PartsName }</td>
			<td align="center">${l.PartsReqCount }</td>
        </tr>
		</c:forEach> --%>

	  </table>
	  
	     <div id="pagelist">
    	<ul class="clearfix">
        	<li><a class="page" href="javascript:return void(0)" id="firstPage" value="firstPage">首页</a></li>
            <li ><a class="page" href="javascript:return void(0)" id="prePage"value="prePage">上页</a></li>
            <li><a class="page" href="javascript:return void(0)"id="nextPage"value="nextPage">下页</a></li>
            <li  class="current"><input id="text1" type="text" value="1" style="text-align:right" size="1"></li>
            <li><a  href="javascript:return void(0)" id="skip">跳转</a></li>
            <li><a class="page" href="javascript:return void(0)" id="lastPage"value="lastPage">尾页</a></li>
            <li class="pageinfo" id="pageinfo"></li>
            <li class="pageinfo" id="pageinfo1"></li>
        </ul>
    </div>
	  
  </form>
    <!--//commonTable-->

</div>
	



    <!--//commonTable-->
		<table id="table2" form="firstForm" width="90%" border="0" cellpadding="0" cellspacing="1" id="attachmentList" class="commonTable marginTopM">
		  <tr id="tr1">
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
