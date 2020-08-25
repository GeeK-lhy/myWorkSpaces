<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->	
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">	
					<div class="col-xs-12">
					
					<form action="receiveaccident/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SENTACCIDENT_ID" id="SENTACCIDENT_ID" value="${pd.SENTACCIDENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
				<input type="hidden" id="unit" value="${sessionScope.sessionUser.GRADENAME}">
				<input type="hidden" id="roleid" value="${sessionScope.sessionUser.ROLE_ID }">
				<input type="hidden" id="SENDUSER" value="${sessionScope.sessionUser.USER_ID }">
						<input type="hidden" id="unit" value="${sessionScope.sessionUser.GRADENAME}">
					<div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					 <tr><td colspan="4"><font size="3 "><b>事故基本信息:</b></font></td> </tr> 
					  <tr>
					    <td nowrap align="right" width="11%"><font size="3">事故标题:</font></td>
					    <td width="27%"><input ntype="text" name="title" id="TITLE" value="${pd.TITLE}" maxlength="255" readonly="readonly" placeholder="这里输入消息标题" title="消息标题" style="width:350px;border: none;" /></td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>
  							
  						<tr>
					    <td nowrap align="right" width="11%"><font size="3">事发时间:</font></td>
					    <td width="27%"><input class="span10 date-picker" name="time" id="TIME" value="<fmt:formatDate value="${pd.TIME}" pattern="yyyy-MM-dd hh:mm:ss" />" type="text"  readonly="readonly" style="width:350px;border:none"  /></td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>	
  						<tr style="display: none;"><td><input type="text" name="sendUser" value="${userid}"></td></tr>
					  <tr>
					  	 <td width="11%"  align="right" nowrap><font size="3">应急响应等级:</font></td>
					  <td width="27%">
							<input type="text" readonly="readonly" name="responseGrade" id="RESPONSEGRADE" value="${pd.RESPONSEGRADE}" maxlength="255" placeholder="这里输入应急响应等级" title="应急响应等级" style="width:350px;border: none;"/></td>
					    </tr>
				  	<tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">事发单位:</font> </td>
					  	  <td width="27%"><input readonly="readonly" type="text" name="source" id="SOURCE" value="${pd.SOURCE}" maxlength="255" placeholder="这里输入事发单位" title="事发单位" style="width:350px;border: none;"  /></td>

					  </tr>

					 <tr>
					 <td width="11%"  align="right" nowrap><font size="3">事故类型:</font></td>
						 <td width="27%">
						<input type="hidden" readonly="readonly" name="accidentType" id="ACCIDENTTYPE" value="${pd.ACCIDENTTYPE}"  maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;border: none;"	>
						 <c:if test="${pd.ACCIDENTTYPE == '1'}">
						<input type="text" readonly="readonly" value="火灾"  maxlength="255" style="width:350px;border: none;"	>
						</c:if>
						<c:if test="${pd.ACCIDENTTYPE == '2'}">
						<input type="text" readonly="readonly" value="爆炸"  maxlength="255" style="width:350px;border: none;"	>
						</c:if>
						<c:if test="${pd.ACCIDENTTYPE == '3'}">
						<input type="text" readonly="readonly" value="其他"  maxlength="255" style="width:350px;border: none;"	>
						</c:if>
					  	  </td>
					 </tr>
					 
					 <tr>
					 <td width="11%"  align="right" nowrap><font size="3">事故等级:</font></td>
						 	 <td width="27%">
						<input type="text" readonly="readonly"  name="grade" id="GRADE" value="${pd.GRADE}" maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;border: none;"	>

					  	  </td>
					 </tr>
					 
					  <tr>
					 <td width="11%"  align="right" nowrap><font size="3">报送时间:</font></td>
						 	 <td width="27%">
						<input type="text" readonly="readonly"  name="sendTime" id="SENDTIME" value="<fmt:formatDate value="${pd.SENDTIME}" pattern="yyyy-MM-dd hh:mm:ss" />"   style="width:350px;border: none;"	>

					  	  </td>
					 </tr>
					 
					  </table>
					  <input type="hidden" name="receiveUser" id="RECEIVEUSER" value="${pd.RECEIVRUSER }">
					   <input type="hidden" name="sendUser" id="SENDUSER" value="${pd.SENDUSER }">
</div>

				<div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr>
					 <td colspan="3"><font size="3"><b>事发地址GPS:<input name="addressRemark" id="addressRemark" value="${pd.ADDRESSREMARK }" style="width:300px"> </b></font></td> 
					   </tr> 
						  <tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">经度：</font> </td>
					  	  <td width="27%">
					  	  <span class="input-icon"><input type="text" id="ZUOBIAO_Y" value="${pd.ZUOBIAO_Y }"  style="width:350px;" disabled="disabled">
					  	  <i class="ace-icon fa fa-fire"></i>
						</span>
						  </td>
					  	<!--   <td width="27%"><input name='address' type="text"style="width:350px; class="text" /></td> -->
					  </tr>
						<tr> 
						 <td  width="11%" nowrap align="right"> <font size="3">纬度：</font> </td>
					  	  <td width="27%">
					  	  	<span class="input-icon"><input type="text" id="ZUOBIAO_X" title=""  value="${pd.ZUOBIAO_X }" style="width:350px;" disabled="disabled">
					  	  	<i class="ace-icon fa fa-fire"></i>
							</span>
						  </td>
						</tr>
						<tr></tr>
						<tr><td colspan="4">
					
				
		
 					<font size="3">查看位置:</font>	<button type="button" class="btn btn-app btn-light btn-xs" id="btn_map" onclick="openMap();" >
								<i class="ace-icon fa fa-globe"></i>
							</button> 

						</td></tr>
						<tr>
							<td><input type="hidden" name="address" id="ADDRESS" value="${pd.ADDRESS}"></td>
						</tr>
						
					  </table>
				<input type="hidden" id="address" >
	 </div>
	 
	 				<div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3 "><b>事故具体信息:</b></font></td> </tr> 

					  <tr>
					    <td  width="11%" nowrap align="right"><font size="3">事故原因:</font></td>
					    <td colspan="3"><textarea  readonly="readonly"  cols="45" rows="3">${pd.REASON}</textarea>
					     <input type="hidden" name="reason" id="REASON"value="${pd.REASON}">
					    </td>
					    </tr>
					    
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">伤亡情况:</font></td>
					    <td colspan="3"><textarea   cols="45" rows="3">${pd.CASUALTY}</textarea>
					    <input type="hidden" name="casualty" id="CASUALTY" value="${pd.CASUALTY}">
					    </td>
					    
					    </tr>
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">经济损失:</font></td>
					    <td colspan="3"><textarea  cols="45" rows="3">${pd.ECONOMICLOSS}</textarea>
					   <input type="hidden" name="economicLoss" id="ECONOMICLOSS" value="${pd.ECONOMICLOSS}"> 
					    </td>
					    </tr> 
					  </table>

	 </div>
	 
	 
		 <div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3"><b>图片附件:</b></font></td> </tr> 
					 
				  <tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">查看:</font> </td>
					  	  <td width="27%"><input name='picAddress' id="picAddress" value="${pd.PICADDRESS }" type="text"style="width:350px;height: 60px" readonly="readonly" onclick="look()" /></td>

					  </tr>

					  </table>

			 </div>	
						
			<div id="receive_div" style="width: 250px;height: 150px;background-color: white;display:none;position:absolute ;top:455px ;left:90px;padding: 10px">
  			</div>
					<div style="position: absolute;left: 500px;top:760px" >

						<c:if test="${userRoleId !='4' }">
						<a class="btn btn-mini btn-primary" style="width: 100px;height: 30px" onclick="handIn();">同意</a>
						</c:if>
						<a href="javascript:return void(0)"  style="width: 100px;height: 30px" onclick="sendFhsms('${pd.USERNAME}')" id="suggest" class="btn btn-mini btn-primary">返回意见</a>
						<a class="btn btn-mini btn-danger" style="width: 100px;height: 30px" onclick="top.Dialog.close();">取消</a>
						</div>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		function look(){
			var array=new Array();
			var str=$("#picAddress").val();
			array=str.split(",");
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="图片";
			 diag.URL ='<%=basePath%>receiveaccident/picture.do?path='+str;
			 diag.Width = 850;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
	
				 diag.close();
			 	
			 };
			  diag.show();  
		}
		
		function openMap(){
			 top.jzts();
			 var zbx=$("#ZUOBIAO_X").val();
			 var zby=$("#ZUOBIAO_Y").val();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="地图";
			 diag.URL ='<%=basePath%>receiveaccident/mapXY.do?zbx='+zbx+'&zby='+zby;
			 diag.Width = 650;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件

				 diag.close();
			 };
			  diag.show();  
		}
		
		
		//发站内信
		function sendFhsms(username){
			
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="站内信";
			 diag.URL = '<%=basePath%>fhsms/goAdd.do?username='+username;
			 diag.Width = 660;
			 diag.Height = 444;
			 diag.CancelEvent = function(){ //关闭事件
				 top.jzts();
				 setTimeout("self.location=self.location",100);
				diag.close();
				var id=$("#SENTACCIDENT_ID").val();
				var roleId=$("#roleid").val()
			$.post("receiveaccident/updateStatusSecond.do",{"sendAccidentId":id,"roleId":roleId},function(){	
				}); 
			 }
			 diag.show();
			
		}
		
		function handIn(){
			var id=$("#SENTACCIDENT_ID").val();
			var roleId=$("#roleid").val()
			$.post("receiveaccident/updateStatus.do",{"sendAccidentId":id,"roleId":roleId},function(){
				
			});
			if($("#roleid").val()=="6"){
			$.ajax({
				 url: "accidenthandle/save.do",
				 type: "POST",
				 data: {
				    "title": $("#TITLE").val(),
				    "time":$("#TIME").val(),
				    "source":$("#SOURCE").val(),
				    "accidentType":$("#ACCIDENTTYPE").val(),
				    "grade":$("#GRADE").val(),
				    "address":$("#ADDRESS").val(),
				    "responseGrade":$("#RESPONSEGRADE").val(),
				    "sendTime":$("#SENDTIME").val(),
				    "casualty":$("#CASUALTY").val(),
				    "economicLoss":$("#ECONOMICLOSS").val(),
				    "reason":$("#REASON").val(),
				    "picAddress":$("#picAddress").val(),
				    "units":$("#unit").val(),
				    "addressRemark":$("#addressRemark").val()
 					
				 },
				 success: function(data){
					 alert("处理成功");
						
					 top.Dialog.close();
				 }
			});

			}else{
				 alert("处理成功");
				 top.Dialog.close();
			}
		}
		
		$(function() {
			
			 $.getJSON("accidenthandle/getLeader.do",{"unit":$("#unit").val(),"roleid":$("#roleid").val()},function(data){
					var t=$("<table width='100%'>");
					$("#receive_div").append(t);	
					var tr=null;
					$.each(data,function(i,d){
						if(i%2==0){
							tr=$("<tr>");
							t.append(tr);
						}
						var td=$("<td>");
						var ckc=$("<input type='checkbox'  id='RECEIVEUSER' name='receiveid' style='height:14px;width:14px;margin-right: 10px'>").val(d["USER_ID"]);
						td.append(ckc);
			 			ckc.click(function(){
							var names=[];
							$("input:checked").each(function(){
								names.push($(this).next().html());
							});
							$("#receivename").val(names.join());
						}); 
						td.append($("<span style='font-size: large'>").html(d["NAME"]));
						tr.append(td);
					});
					var tr2=$("<tr>");
					t.append(tr2);
					var td=$("<td colspan='3' align='right'>");
					
					var button=$("<input type='button' value='确定'>");
					td.append(button);
					tr2.append(td);
					button.click(function(){
						$("#receive_div").fadeOut();
					});

				}); 
			 	$("#receivename").click(function(){
					
					$("#receive_div").fadeIn();
				});
			

		});
		</script>
</body>
</html>