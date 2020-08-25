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
<link href="static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> 
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
					<input type="hidden" id="unit" value="${sessionScope.sessionUser.GRADENAME}">
<input type="hidden" id="roleid" value="${sessionScope.sessionUser.ROLE_ID }">
<input type="hidden" id="username" value="${pd.USERNAME}">
					<form action="sentaccident/sendMessage.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SENTACCIDENT_ID" id="SENTACCIDENT_ID" value="${pd.SENTACCIDENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
							<div style="background-color: white;width: 570px;height: 380px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					 <tr><td colspan="4"><font size="3 "><b>事故基本信息:</b></font></td> </tr> 
					  <tr>
					    <td nowrap align="right" width="11%"><font size="3">事故标题:</font></td>
					    <td width="27%"><input type="text" name="title" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入消息标题" title="消息标题" style="width:350px;" /></td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>
  							
  						<tr>
					    <td nowrap align="right" width="11%"><font size="3">事发时间:</font></td>
					    <td width="27%"><input  name="time" id="datetimepicker" value="<fmt:formatDate value="${pd.TIME}" pattern="yyyy-MM-dd hh:mm:ss" />" type="text"  style="width:350px;"  /></td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>	
					    
					     <tr>
					    <td width="11%"  align="right" nowrap><font size="3">上报领导:</font></td>
					    <td colspan="3"><input id="receivename" value="${pd.name}" name='receivename' type="text" class="text" style="width:350px;" size="20" /><span id="span1" style="color:red"></span>
					    </tr>
					    
					    
  						<tr style="display: none;"><td><input type="text" name="sendUser" value="${userid}"></td></tr>
					  <tr>
					  	 <td width="11%"  align="right" nowrap><font size="3">应急响应等级:</font></td>
					  <td width="27%">
							<input type="text"  name="responseGrade" id="RESPONSEGRADE" value="${pd.RESPONSEGRADE}" maxlength="255" placeholder="这里输入应急响应等级" title="应急响应等级" style="width:350px;"/></td>
					    </tr>
				  	<tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">事发单位:</font> </td>
					  	  <td width="27%"><input  type="text" name="source" id="SOURCE" value="${pd.SOURCE}" maxlength="255" placeholder="这里输入事发单位" title="事发单位" style="width:350px;"  /></td>

					  </tr>

					 <tr>
					 <td width="11%"  align="right" nowrap><font size="3">事故类型:</font></td>
						 <td width="27%">
						 <input type="hidden"  name="accidentType" id="ACCIDENTTYPE" value="${pd.ACCIDENTTYPE}"  maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;"	>
						
						 <c:if test="${pd.ACCIDENTTYPE == '0'}">
						<input type="text"   maxlength="255" style="width:350px;"	>
						</c:if>
						 <c:if test="${pd.ACCIDENTTYPE == '1'}">
						<input type="text"  value="火灾"  maxlength="255" style="width:350px;"	>
						</c:if>
						<c:if test="${pd.ACCIDENTTYPE == '2'}">
						<input type="text" value="爆炸"  maxlength="255" style="width:350px;"	>
						</c:if>
						<c:if test="${pd.ACCIDENTTYPE == '3'}">
						<input type="text"  value="其他"  maxlength="255" style="width:350px;"	>
						</c:if>
					  	  </td>
					 </tr>
					 
					 <tr>
					 <td width="11%"  align="right" nowrap><font size="3">事故等级:</font></td>
						 	 <td width="27%">
						<input type="text"   name="grade" id="GRADE" value="${pd.GRADE}" maxlength="255" placeholder="这里输入事故类型" title="事故类型" style="width:350px;"	>

					  	  </td>
					 </tr>
					 
					  <tr>
					 <td width="11%"  align="right" nowrap><font size="3">报送时间:</font></td>
						 	 <td width="27%">
						<input type="text"   name="sendTime" id="SENDTIME" value="<fmt:formatDate value="${pd.SENDTIME}" pattern="yyyy-MM-dd hh:mm:ss" />"   style="width:350px;"	>

					  	  </td>
					 </tr>
					 
					  </table>
					  <input type="hidden" name="receiveUser" class="receiveUser" id="RECEIVEUSER" value="${pd.RECEIVEUSER }">
					   <input type="hidden" name="sendUser" id="SENDUSER" value="${pd.SENDUSER }">
</div>

				<div style="background-color: white;width: 570px;height: 380px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr>
					 <td colspan="3"><font size="3"><b>事发地址GPS: <input name="addressRemark" id="addressRemark" value="${pd.ADDRESSREMARK }"style="width:300px"></b></font></td> 
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
	 
	 				<div style="background-color: white;width: 570px;height: 380px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3 "><b>事故具体信息:</b></font></td> </tr> 
		
					  <tr>
					    <td  width="11%" nowrap align="right"><font size="3">事故原因:</font></td>
					    <td colspan="3"><textarea id="REASON"  cols="45" rows="3">${pd.REASON}</textarea>
					     <input type="hidden" name="reason" value="${pd.REASON}">
					    </td>
					    </tr>
					    
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">伤亡情况:</font></td>
					    <td colspan="3"><textarea id="CASUALTY"  cols="45" rows="3">${pd.CASUALTY}</textarea>
					    <input type="hidden" name="casualty"  value="${pd.CASUALTY}">
					    </td>
					    
					    </tr>
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">经济损失:</font></td>
					    <td colspan="3"><textarea  id="ECONOMICLOSS" cols="45" rows="3">${pd.ECONOMICLOSS}</textarea>
					   <input type="hidden" name="economicLoss"  value="${pd.ECONOMICLOSS}"> 
					    </td>
					    </tr> 
					  </table>

	 </div>
	 
	 
		 <div style="background-color: white;width: 570px;height: 380px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3"><b>图片附件:</b></font></td> </tr> 
					 
					  <tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">查看:</font> </td>
					  	  <td width="27%"><input name='picAddress' id="picAddress" value="${pd.PICADDRESS }" type="text"style="width:350px;height: 60px" onclick="look()" /></td>

					  </tr>
					  
					  <tr>
					   <td  width="11%" nowrap align="right"> <font size="3"></font> </td>
					 	<td width="27%"> 
					 			<a class="btn btn-mini btn-primary" style="width: 100px;height: 30px" onclick="add();">上传</a>
						</td>
					  </tr>
	
					  </table>
					<div id="picList" style="width: 510px;height: 260px;border: double; display: none;"></div>
			 </div>
			 		<div style="position: absolute;left: 585px;top:820px" >
					<a class="btn btn-mini btn-primary" style="width: 100px;height: 30px" onclick="handIn();">上报</a>
					<a class="btn btn-mini btn-danger" style="width: 100px;height: 30px" onclick="top.Dialog.close();">取消</a>
						</div>

						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					<input type="hidden" value="${pd.USERNAME}" id="receiveName">
					 <div id="receive_div" style="width: 300px;height: 250px;border:double ;background-color: white;display:none;position:absolute;top:186px;left:212px;padding: 10px">
  					</div>
					
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
	<script type="text/javascript" src="static/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="static/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
		var flag=0;
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>pictures/goAdd.do';
			 diag.Width = 800;
			 diag.Height = 490;
			 diag.CancelEvent = function(){ //关闭事件
				  var div=$(diag.innerFrame.contentWindow.document.getElementById('pathDiv'))
					 var path=$("#picAddress").val()
					 var p=$(diag.innerFrame.contentWindow.document.getElementsByName('path'));
					 p.each(function(){
					path=$("#picAddress").val()
					if($(this).val()!=null && $(this).val()!=""){
					 if(path!="")
					$("#picAddress").val(path+","+$(this).val())
					else{
						$("#picAddress").val($(this).val())
					}
				 } 
			})

				div.remove()
				diag.close();
			 };
			 diag.show();
		}
		
		
		
		function look(){
			var array=new Array();
			var str=$("#picAddress").val();
			array=str.split(",");
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="图片";
			 diag.URL ='<%=basePath%>sentaccident/picture.do?path='+str;
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
			 diag.URL ='<%=basePath%>sentaccident/mapXY.do?zbx='+zbx+'&zby='+zby;
			 diag.Width = 650;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件

				 diag.close();
			 };
			  diag.show();  
		}
		
		function handIn(){
			var name=[];
			name=$("input:checked")
			
			if(name.length>1){
				alert("只能选择一个领导")
			}else{
				
			var receiveUser;
			
			if(flag==0){
				 receiveUser=$("#RECEIVEUSER").val();
			}else{
				receiveUser=$("input:checked").val()
			}
			$("#zhongxin").hide(); 
			$("#zhongxin2").show(); 
	
			$.ajax({
				 url: "sentaccident/edit.do",
				 type: "POST",
				 data: {
					"sendaccident_id":$("#SENTACCIDENT_ID").val(),
				    "title": $("#TITLE").val(),
				    "time":$("#datetimepicker").val(),
				    "source":$("#SOURCE").val(),
				    "accidentType":$("#ACCIDENTTYPE").val(),
				    "grade":$("#GRADE").val(),
				    "address":$("#ADDRESS").val(),
				    "responseGrade":$("#RESPONSEGRADE").val(),
				    "sendTime":$("#SENDTIME").val(),
				    "casualty":$("#CASUALTY").val(),
				    "economicLoss":$("#ECONOMICLOSS").val(),
				    "reason":$("#REASON").val(),
				    "sendUser":$("#SENDUSER").val(),
				    "receiveUser":receiveUser,
 					"picAddress":$("#picAddress").val(),
 					"addressRemark":$("#addressRemark").val()
				 },
				 success: function(data){
					 var USERNAME;
					 if($(":checked").length==0){
						 USERNAME=$("#username").val()
					 }else
					 USERNAME=$(":checked").attr("uname")
				
						$.ajax({
						type: "POST",
						url:'<%=basePath%>fhsms/save.do?tm='+new Date().getTime(),
    					data: {USERNAME:USERNAME,CONTENT:"收到事故上报，请查看处理"},
						dataType:'json',
						cache: false,
						success: function(data){
						 }
					});
					 alert("报送成功")
						 $("#zhongxin2").hide();
					 top.Dialog.close();
				 }
			});

			}
		};
		

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
						var ckc=$("<input type='checkbox'  name='receiveUser' style='height:15px;width:15px;margin-right: 10px'>").val(d["USER_ID"]);
					ckc.attr("uname",d["USERNAME"])
						td.append(ckc);
			 			ckc.click(function(){
							var names=[];
							$("input:checked").each(function(){
								names.push($(this).next().html());
							});
							$("#receivename").val(names.join());
						}); 
						td.append($("<span style='font-size: x-large'>").html(d["NAME"]));
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
			 		flag=1;
					
					$("#receive_div").fadeIn();
				}); 
			
			
		 	$("#datetimepicker").datetimepicker({
		        format: 'yyyy-mm-dd hh:ii:ss',
		        autoclose: true,
		        language: 'zh-CN',
		        minuteStep: 1
		 		
		 	});
		 	 $('#datetimepicker').val(new Date().format('yyyy-MM-dd HH:mm:ss'));
		});
		</script>
</body>
</html>