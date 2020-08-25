<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="js/md5.min.js"></script>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script>
$(function(){
	 $("#reportSubmit").click(function(){
		 $.ajax({
				url: "submitReport",
			    type: "POST",
			    data:{
			    	title:$("#title").val(),
			    	plan_btime: $("#plan_btime").val(),
			    	plan_etime:$("#plan_etime").val(),
			    	actual_btime:$("#actual_btime").val(),
			    	actual_etime:$("#actual_etime").val(),
			    	work_content:$("#work_content").val(),
			    	remark:$("#remark").val(),
			    	manager:$("#manager").val(),
			    	manager_id:$("#manager_id").val()
			    },
			    success:function(data){
				alert(data)
				
			    }

			});
	 });
})


	

</script>
</head>
<body>
			<div>
			<a href="/workProject/">退出</a>
		</div>
	<div style="background-color:whitesmoke;height: 850px">
		<div style="background-color: white;width: 1350px;height: 550px;border: double 5px seagreen;float: left;margin:50px 50px">		
			<div style="margin:150px 50px">
			<form  id="form1" action="submitReport">
	<table align="center">
		<tr>
			<td colspan="3" align="right"><a href="toIndex"> 返回</a></td>
		</tr>
			 <tr>
			 <td ><font color="black">标题:</font></td>
			 <td ><input type="text" name="title" id="title" width="200px"></td>
			 </tr>		
			<tr>
				<td><font color="black">计划开始时间:</font></td>
				<td>
					<input type="text" name="plan_btime" id ="plan_btime" width="200pxs">
				</td>
				
			</tr>
			<tr>
				<td><font color="black">计划结束时间:</font>:</td>
				<td>
					<input type="text" name="plan_etime" id="plan_etime" width="200pxs">
				</td>
				
			</tr>
			
			<tr>
				<td><font color="black">实际开始时间:</font>:</td>
				<td>
					<input type="text" name="actual_btime" id="actual_btime" width="200pxs">
				</td>
				
			</tr>
			
			<tr>
				<td><font color="black">实际结束时间:</font>:</td>
				<td>
					<input type="text" name="actual_etime" id="actual_etime" width="200pxs">
				</td>
				
			</tr>
			
			<tr>	
			  <td ><font color="black">工作描述:</font>:</td>
			 <td colspan="3"><textarea id="work_content" name="work_content" cols="45" rows="3"></textarea></td>
			 </tr>
			 <tr>
				 <td ><font color="black">备注:</font></td>
				 <td colspan="3"><textarea id="remark" name="remark" cols="45" rows="3"></textarea></td>
	       
	   		</tr>
	   		<tr>
				<td><font color="black">负责人：</font></td>
				<td><input type="text" id="manager" name="manager" width="200px" value="${manager}"></td>
					
	   		</tr>
	       	<tr>
				<td><font color="black">工号：</font>:</td>
				<td><input type="text" id="manager_id" name="manager_id" width="200px" value="${manager_id}"></td>
					
	   		</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" id="reportSubmit"  value="上报" width="200px"></td>
			</tr>
			</table>
		</form>
		</div>
	</div>
</div> 
</body>
</html>