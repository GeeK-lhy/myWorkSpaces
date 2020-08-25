<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		$.getJSON("partsrepCode",{"type":"io"},function(data){

			for(var i=0;i<data.length;i++){
			$("#select1").append($("<option>").html(data[i].name).val(data[i].code));
			}
		});
		$.getJSON("partsrepParts",{},function(data){
		
			for(var i=0;i<data.length;i++){
				$("#select3").append($("<option>").html(data[i].partsname).val(data[i].partsid));
				}
		});
		$("#select1").change(function(){
		
			$("#select2").empty();
			$.getJSON("partsrepCode",{"type":$("#select1").val()},function(data){
				for(var i=0;i<data.length;i++){
				$("#select2").append($("<option>").html(data[i].name).val(data[i].code));
				}
				})
		});
		$("#save").click(function(){
			$("#coursesCreat").submit()
		});

	});
</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; 配件出入库</h2>
  </div>
        <form id="coursesCreat" name="coursesCreat" action="savePartsRepBill" method="post">
		  <table border="0" cellspacing="1" cellpadding="0" height="70" class="commonTable">
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>类型：</td>
				<td width="15%" align="left">
					<select style="width:150px;" id="select1" name="billflag">
						<option value="">请选择</option>
<!-- 						<option>出</option>
						<option>入</option> -->
					</select>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>出/入库类型：</td>
				<td width="15%" align="left">
					<select style="width:150px;" id="select2" name="billtype">
						<option value="">请选择</option>
					</select>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>出/入库日期：</td>
				<td width="15%" align="left"><input type="text" readonly="readonly" style="border: hidden;" name="billtime" value="<fmt:formatDate value="${time}" pattern="yyyy-MM-dd hh:mm:ss"/>"></td>
				<td width="10%" align="right" class="title"><span class="required">*</span>操作员：</td>
				<td width="15%" align="left">&nbsp;${empName }<input type="hidden" name="billuser" value=${user.userid }></td>
			  </tr>
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>配件：</td>
				<td width="15%" align="left">
					<select style="width:150px;" id="select3" name="partsid">
						<option value="">请选择</option>
					</select>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>出/入库数量：</td>
				<td width="15%" align="left">
					<input type="text" style="width:150px;height:20px" name="billcount">
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>说明：</td>
				<td width="15%" align="left" colspan="3"><input type="text" style="width:470px;height:20px"></td>
			  </tr>
		 </table>
		</form>
	 </div>
    <!--//commonTable-->
    <div id="formPageButton">
    	<ul>
			<li><a href="javascript:return void(0)" id="save" title="保存" class="btnShort">保存</a></li>
        	<li><a href="javascript:window.history.go(-1)" title="返回" class="btnShort">返回</a></li>
        </ul>

    </div>
            <br/>
        <br/>
        <p><font style="color: green; font-size: large;">${result }</font> </p>
    <!--//commonToolBar-->
</div>
<!--//content pages wrap-->
</body>
</html>
