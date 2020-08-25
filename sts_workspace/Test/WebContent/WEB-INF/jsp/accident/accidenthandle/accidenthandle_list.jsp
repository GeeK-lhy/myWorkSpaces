<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>

<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link href="static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> 
<!-- <link rel="stylesheet" type="text/css" href="static/datetimepicker-master/build/jquery.datetimepicker.min.css" /> -->
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin" style="background-color:silver; ">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container"  style="background-color:whitesmoke; ">
		<!-- /section:basics/sidebar -->
		<div class="main-content" style="background-color:whitesmoke; height: 850px">
			<div class="main-content-inner" style="background-color:whitesmoke; height: 850px">
				<div class="page-content" style="background-color:whitesmoke;height: 850px ">
					<div class="row">
						<div class="col-xs-12" style="background-color:whitesmoke;height: 850px;" >
							<br>

 <form action="accidenthandle/sendMessage.do" method="post"  name="form" id="form1" >

<input type="hidden" id="unit" value="${sessionScope.sessionUser.GRADENAME}">
<input type="hidden" id="roleid" value="${sessionScope.sessionUser.ROLE_ID }">

			<div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					 <tr><td colspan="4"><font size="3 "><b>事故基本信息:</b></font></td> </tr> 
					  <tr>
					    <td nowrap align="right" width="11%"><font size="3">事故标题:</font></td>
					    <td width="27%"><input name='title' type="text" class="text" style="width:350px" /></td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>
  							
  						<tr>
					    <td nowrap align="right" width="11%"><font size="3">事发时间:</font></td>
					    <!-- <td width="27%"><input type="text" class="span10 date-picker" name="time"  data-date-format="yyyy-mm-dd" placeholder="事发时间" title="事发时间" style="width:350px"  /></td> -->
				        <td width="27%"><input type="text" id="datetimepicker" name="time"  style="width:350px"  /></td>	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>	
  						<tr style="display: none;"><td><input type="text" name="sendUser" value="${userid}"></td></tr>
					  <tr>
					    <td width="11%"  align="right" nowrap><font size="3">上报领导:</font></td>
					    <td colspan="3"><input id="receivename" name='receivename' type="text" class="text" style="width:350px;" size="20" /><span id="span1" style="color:red"></span>
					     <select name="responseGrade">
							<option selected="selected" value="0"><font size="3">==应急响应级别==</font></option>
							<option value="1">低级</option>
							<option value="2">中级</option>
							<option value="3">高级</option>
						</select></td>
					    </tr>
				  	<tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">事发单位:</font> </td>
					  	  <td width="27%"><input name='source' type="text"style="width:350px; class="text"  /></td>

					  </tr>

					 <tr>
					 <td width="11%"  align="right" nowrap></td>
					 	 <td >
					  	  <select name="accidentType">					
					  	 	<option selected="selected" value="0"><font size="3">==事故类型==</font></option>
					  	 	<option  value="1"><font size="3">火灾</font></option>
					  	 	<option  value="2"><font size="3">爆炸</font></option>
					  	 	<option value="3"><font size="3">其他</font></option>
					  	  </select>&nbsp;&nbsp;&nbsp;
					  	  <select name="grade">					
					  	 	<option selected="selected" value="0"><font size="3">==事故等级==</font></option>
					  	 	<option value="1"><font size="3">==1==</font></option>
					  	 	<option  value="2"><font size="3">==2==</font></option>
					  	 	<option  value="3"><font size="3">==3==</font></option>
					  	  </select>
					  	  </td>

					 </tr>
					 
					  </table>
</div>

				<div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr>
					 <td colspan="3"><font size="3"><b>事发地址GPS:</b></font></td>
					<!--  <td></td>  -->
					   </tr> 
						  <tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">经度：</font> </td>
					  	  <td width="27%">
					  	  <span class="input-icon"><input type="text" id="ZUOBIAO_Y" title=""  style="width:350px;" disabled="disabled">
					  	  <i class="ace-icon fa fa-fire"></i>
						</span>
						  </td>
					  	<!--   <td width="27%"><input name='address' type="text"style="width:350px; class="text" /></td> -->
					  </tr>
						<tr> 
						 <td  width="11%" nowrap align="right"> <font size="3">纬度：</font> </td>
					  	  <td width="27%">
					  	  	<span class="input-icon"><input type="text" id="ZUOBIAO_X" title=""  style="width:350px;" disabled="disabled">
					  	  	<i class="ace-icon fa fa-fire"></i>
							</span>
						  </td>
						</tr>
						<tr></tr>
						<tr><td colspan="4">
					
				
		
 						<button type="button" class="btn btn-app btn-light btn-xs" id="btn_map" onclick="openMap();" >
								<i class="ace-icon fa fa-globe"></i>
							</button> 

						</td></tr>
						
						<tr>
						<td  width="11%" nowrap align="right"> <font size="3">备注：</font> </td>
					  	  <td width="27%">
					  	  <input type="text" name="addressRemark" id="addressRemark"style="width:350px;" >
					  	  </td>
						</tr>
						
					  </table>
				<input type="hidden" name="address" id="address" >
	 </div>
	 
	 				<div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3 "><b>事故具体信息:</b></font></td> </tr> 

					  <tr>
					    <td  width="11%" nowrap align="right"><font size="3">事故原因:</font></td>
					    <td colspan="3"><textarea name="reason" cols="45" rows="3"></textarea></td>
					    </tr>
					    
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">伤亡情况:</font></td>
					    <td colspan="3"><textarea name="casualty" cols="45" rows="3"></textarea></td>
					    </tr>
					     <tr>
					    <td  width="11%" nowrap align="right"><font size="3">经济损失:</font></td>
					    <td colspan="3"><textarea name="economicLoss" cols="45" rows="3"></textarea></td>
					    </tr> 
					  </table>

	 </div>
	 
	 
		 <div style="background-color: white;width: 520px;height: 350px;border: double 5px seagreen;float: left;margin:10px 50px">		
				
					  <table align="center" border="0" cellpadding="2" cellspacing="1" style="width:80%;border-collapse: separate; border-spacing: 10px">
					   <tr><td colspan="4"><font size="3"><b>图片附件:</b></font></td> </tr> 
					 
				  <tr>
					  	  <td  width="11%" nowrap align="right"> <font size="3">上传:</font> </td>
					  	  <td width="27%"><input name='picAddress' id="picAddress" type="text"style="width:350px;" onclick="add()" /></td>

					  </tr>

					  </table>

			 </div>
	 
	
			<div style="position: absolute;left: 530px;top:780px" >
			<input type="button" id="submit1" value="上报" style="width: 200px" class="button" />　
		<!-- 	<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/> -->
			</div>
   
     <div id="receive_div" style="width: 300px;height: 250px;border:double ;background-color: white;display:none;position:absolute;top:190px;left:173px;padding: 10px">
  	</div>
	 <input type="hidden" id="CONTENT2" value="您的验证码是：12358。请不要把验证码泄露给其他人。">
		<input type="hidden" name="isAll" id="isAll" value="no"/>
		<input type="hidden" name="TYPE" id="TYPE" value="2"/>
	<input type="hidden"  id="receiveUserName">
	<input type="hidden"  id="receiveUserPhone" >
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
		<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>

	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 发送短信 -->
	<script type="text/javascript" src="static/js/myjs/sms.js"></script>
 <!-- <script src="jquery"></script> 
<script src="static/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script> -->
<script type="text/javascript" src="static/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="static/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
				top.jzts();
				$("#Form").submit();
			} 
		
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
					 if(path =="")
					$("#picAddress").val($(this).val())
					else{
						$("#picAddress").val(path+","+$(this).val())
					}
				 } 
			})

				div.remove()
				diag.close();
			 };
			 diag.show();
		}
		
		
		function openMap(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="地图";
			 diag.URL ='<%=basePath%>accidenthandle/mapXY.do';
			 diag.Width = 650;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 var address1=diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_X').value;;
				 var address2=diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_Y').value;
				 document.getElementById("ZUOBIAO_X").value = diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_X').value;
				 document.getElementById("ZUOBIAO_Y").value = diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_Y').value;
				$("#address").val(address1+","+address2)
				 diag.close();
			 };
			  diag.show();  
		}
	
			
		$(function() {


				$("#submit1").click(function(){
					if($("#receivename").val()==""){
						$("#span1").html("请选择报送人员")
					}else if($("#datetimepicker").val()==""){
						alert("请输入时间")
					}
					else{
						
						$("#address").val($("#ZUOBIAO_Y").val()+","+$("#ZUOBIAO_X").val())

						var USERNAME=$("input:checked").attr("uname")
						$.ajax({
						type: "POST",
						url:'<%=basePath%>fhsms/save.do?tm='+new Date().getTime(),
    					data: {USERNAME:USERNAME,CONTENT:"收到事故上报，请查看处理"},
						dataType:'json',
						cache: false,
						success: function(data){
						 }
					});
						var PHONE = $("#receiveUserPhone").val();
						var CONTENT = $("#CONTENT2").val();
					 	var isAll = $("#isAll").val(); 
						if($("#receiveUserPhone").val().search(",")!=-1){
							isAll="yes";
						}else{
							isAll="no";
						}
						var TYPE  = $("#TYPE").val();
						var fmsg = "${pd.msg}";
						
						$.ajax({
							type: "POST",
							url: '<%=basePath%>/head/sendSms.do?tm='+new Date().getTime(),
							data: {PHONE:PHONE,CONTENT:CONTENT,isAll:isAll,TYPE:TYPE,fmsg:fmsg},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								 $.each(data.list, function(i, list){
									 if(list.msg == 'ok'){
										 var count = list.count;
										 var ecount = list.ecount;
										 $("#msg").tips({
											side:3,
								            msg:'成功发出'+count+'条,失败'+ecount+'条',
								            bg:'#68B500',
								            time:4
									      });
									 }else{
										 $("#msg").tips({
												side:3,
									            msg:'短信发送失败,请联系管理员检查短信配置是否正确!',
									            bg:'#FF0000',
									            time:6
										 });
										
									 }
									 setTimeout("close()",6000);
									 timer(5);
								 }); 
							}
						});
			
					$("#form1").submit()
						alert("报送成功");
					}
					
				})
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
						var ckc=$("<input type='checkbox' name='receiveUser' style='height:15px;width:15px;margin-right: 10px'>").val(d["USER_ID"]);
					ckc.attr("uname",d["USERNAME"])
						ckc.attr("uphone",d["PHONE"])
						td.append(ckc);
			 			ckc.click(function(){
							var names=[];
							var phone=[];
							$("input:checked").each(function(){
								names.push($(this).next().html());
								phone.push($(this).attr("uphone"));
							});
							$("#receivename").val(names.join());
							$("#receiveUserPhone").val(phone.join());
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
					
					$("#receive_div").fadeIn();
				}); 
		
			 	$("#datetimepicker").datetimepicker({
			        format: 'yyyy-mm-dd hh:ii:ss',
			        autoclose: true,
			        language: 'zh-CN',
			        minuteStep: 1
			 		
			 	});
			 	 $('#datetimepicker').val(new Date().format('yyyy-MM-dd HH:mm:ss'));
				//日期框

/* 				$('.date-picker').datepicker({
					 format: 'yyyy-mm-dd hh:ii:ss',
				autoclose: true,
				todayHighlight: true
				
			});   */
		});
		
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>accidenthandle/excel.do';
		}
	</script>


</body>
</html>