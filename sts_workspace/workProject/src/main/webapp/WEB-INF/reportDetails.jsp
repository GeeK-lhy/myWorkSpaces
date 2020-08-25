<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>




<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>周报详情</title>
 <script type="text/javascript" src="js/md5.min.js"></script>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
var idTmr;
function getExplorer() {
  var explorer = window.navigator.userAgent ;
  //ie
  if (explorer.indexOf("MSIE") >= 0) {
    return 'ie';
  }
  //firefox
  else if (explorer.indexOf("Firefox") >= 0) {
    return 'Firefox';
  }
  //Chrome
  else if(explorer.indexOf("Chrome") >= 0){
    return 'Chrome';
  }
  //Opera
  else if(explorer.indexOf("Opera") >= 0){
    return 'Opera';
  }
  //Safari
  else if(explorer.indexOf("Safari") >= 0){
    return 'Safari';
  }
}
function method5(tableid) {
  if(getExplorer()=='ie')
  {
    var curTbl = document.getElementById(tableid);
    var oXL = new ActiveXObject("Excel.Application");
    var oWB = oXL.Workbooks.Add();
    var xlsheet = oWB.Worksheets(1);
    var sel = document.body.createTextRange();
    sel.moveToElementText(curTbl);
    sel.select();
    sel.execCommand("Copy");
    xlsheet.Paste();
    oXL.Visible = true;
    try {
      var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
    } catch (e) {
      print("Nested catch caught " + e);
    } finally {
      oWB.SaveAs(fname);
      oWB.Close(savechanges = false);
      oXL.Quit();
      oXL = null;
      idTmr = window.setInterval("Cleanup();", 1);
    }
  }
  else
  {
    tableToExcel(tableid)
  }
}
function Cleanup() {
  window.clearInterval(idTmr);
  CollectGarbage();
}
var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,',
      template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
      base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
      format = function(s, c) {
        return s.replace(/{(\w+)}/g,
            function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>
</head>
<body>
		<div>
			<a href="/workProject/">退出</a>
		</div>
	<form>
	<table>
	<tr>
	<td ><button type="button" onclick="method5('tableExcel')">导出Excel</button></td>
	<td colspan="3" align="right"><a href="javascript:history.back(-1)">返回上一页</a></td>
	</tr>
	</table>


		<div id="myDiv">
		<table align="center" border=1 width="90%" id="tableExcel">
		
			
		
			<tr>
			<td>标题</td>
			<td> ${report.title} </td>
			</tr>
			<tr>
			<td>计划起始时间</td>
			<td><fmt:formatDate value="${report.plan_btime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
			<td>计划结束时间</td>
			<td><fmt:formatDate value="${report.plan_etime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
			<td>实际开始时间</td>
			<td><fmt:formatDate value="${report.actual_btime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
			<td>实际结束时间</td>
			<td><fmt:formatDate value="${report.actual_etime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
			<td>报送时间</td>
			<td><fmt:formatDate value="${report.report_time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
			<td>工作描述</td>
			<td>${report.work_content}</td>
			</tr>
			
			<tr>
			<td>备注</td>
			<td>${report.remark}</td>
			</tr>
			
			<tr>
			<td>负责人</td>
			<td>${report.manager}</td>
			</tr>
			<tr>
			<td>工号</td>
			<td>${report.manager_id}</td>
			</tr>
	
		
		</table>
		</div>
		<c:if test="${flags != '0'}">
		<div align="center">
		<a href="toUpdate?report_id=${report.report_id}">更新</a>
		</div>
		</c:if>

	</form>
</body>
</html>