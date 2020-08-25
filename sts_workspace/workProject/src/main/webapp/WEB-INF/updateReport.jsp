<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
			<a href="/workProject/">退出</a>
		</div>
		<form action="update">

		<div>
		<table align="center" border=1 width="90%">
			<tr>
			<td colspan="3" align="right"> <a href="javascript:history.back(-1)">返回上一页</a></td>
			</tr>
			<tr>
			<td>周报序号：</td>
			<td><input type="text" name="report_id" value="${report_id}" readonly="true"></td>
			</tr>
			
			<tr>
			<td>标题</td>
			<td><input type="text" name="title" width="200px" value="${report.title }">  </td>
			</tr>
			<tr>
			<td>计划起始时间</td>
			<td><input type="text" name="plan_btime" width="200px" value="${report.plan_btime}">  </td>
			
			</tr>
			<tr>
			<td>计划结束时间</td>
				<td><input type="text" name="plan_etime" width="200px"value="${report.plan_etime}">  </td>
			
			</tr>
			<tr>
			<td>实际开始时间</td>
				<td><input type="text" name="actual_btime" width="200px">  </td>
			<td><fmt:formatDate value="${report.actual_btime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
			<td>实际结束时间</td>
				<td><input type="text" name="actual_etime" width="200px"value="${report.actual_etime}">  </td>

			</tr>
			<tr>
			<td>报送时间</td>
			<td><input type="text" name="report_time" width="200px" value="${report.report_time}">  </td>
		
			</tr>
			<tr>
			<td>工作描述</td>
			 <td colspan="3"><textarea id="work_content" name="work_content" cols="45" rows="3">${report.work_content }</textarea></td>
			
			</tr>
			
			<tr>
			<td>备注</td>
			 <td colspan="3"><textarea id="remark" name="remark" cols="45" rows="3" >${report.remark }</textarea></td>
			</tr>
			
			<tr>
			<td>负责人</td>
			<td><input type="text" id="manager" name="manager" width="200px" value="${manager}"></td>
			</tr>
			<tr>
			<td>工号</td>
		<td><input type="text" id="manager_id" name="manager_id" width="200px" value="${manager_id}"></td>
			</tr>
		
			<tr>
				<td align="center" colspan="2"><input type="submit" value="更新"></i></td>
			</tr>
		
		</table>
		</div>
	</form>
</body>
</html>