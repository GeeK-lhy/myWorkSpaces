<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn_delete").click(function(){
			if($("input:checked").size()>0){
				if(confirm("确定要删除吗？")){
					$("#form2").submit();
				}
			}else{
				alert("请选择要删除到学生");
			}
		});		
		$("#sel_class").load("classInfor.do",{classId:${classId}});
	});
</script> 
</head>
<body>
	<form action="studentList.do" method="post"> 
		姓名:<input type="text" name="studentName" width="20px" value="${studentName }">&nbsp;
		学历:<select name="degree" style="width: 100px">
				<option value="">不限</option>
				<option value="bachelor">本科</option>
				<option value="master">硕士</option>
				<option value="doctor">博士</option>
			</select>&nbsp;	
		城市:<input type="text" name="city" width="20px" value="${city }">&nbsp;	
		班级:<select id="sel_class" name="classId"  style="width: 100px"></select>
		<input type="submit" value="查询">
	</form><br/>
	<input type="button" value="批量删除" id="btn_delete">
	
	<form  id="form2" action="delete.do" method="post">
	<table border="1" width="90%">
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>学历</td>
			<td>班级名称</td>
			<td>城市</td>
			<td>工资</td>
			<td>出生日期</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list}" var="s" varStatus="state"> 
			<tr>
				<td>${state.count }</td>
				<td>${s.studentName }</td>
				<td>${s.degree}</td>
				<td>${s.tclass.className }</td>
				<td>${s.city }</td>
				<td>${s.salary}</td>
				<td>${s.birth }</td>
				<td><input type="checkbox" name="studentId" value="${s.studentId}"></td>
			</tr>		
		</c:forEach>		
	</table>
	</form>
</body>
</html>