<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

	<link href="../css/css.css" rel="stylesheet" type="text/css" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
	 $(function(){
		 
		 //按时间查询：
		 $("#selectByTime").click(function(){

			 window.open("receiveMessageList.do?startTime="+$("#startTime").val()+"&endTime="+$("#endTime").val(),"_self");
			 
		 });
		 //反选
		 $("#uncheck").click(function(){
			 var checked=$("input:checked");
			 $("input:not(:checked)").prop("checked",true);
			 checked.prop("checked",false);
			 
		 
	 });
	 
	 //全选
	 $("#selectAll").click(function(){
		
		 $(":checkbox").prop("checked",true);
	 });
	 //上一页，下一页
		$(".pageAction").click(function(){
			$("#hd_page").val($(this).attr("value"));
		
			$("#form2").submit();
		});
	 
	 //删除
	 $("#btn_delete").click(function(){
			if($("input:checked").length==0){
				alert("请选择需要删除的信息");
			}else{
			
			if(confirm("确定要删除吗？"));
				$("#fom").submit();
			}
	 });
 });
</script>
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.open("gaojisousuo.htm","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}
function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

function link(){
    document.getElementById("fom").action="sendxiaoxi.htm";
   document.getElementById("fom").submit();
}

function on_load(){
	var loadingmsg=document.getElementById("loadingmsg");
	var mainpage=document.getElementById("mainpage");
	loadingmsg.style.display="";
	mainpage.style.display="none";
	
	loadingmsg.style.display="none";
	mainpage.style.display="";
}
</SCRIPT>

<body onload="on_load()">
<form name="fom" id="fom" method="post" action="deleteReceiveMessage.do">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="../images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="21"><img src="../images/ico07.gif" width="20" height="18" /></td>
			<td width="550">查看内容：按时间：
			 <!-- <input name="textfield" type="text" size="12" readonly="readonly"/><span class="newfont06">至</span> -->
			 <input name="startTime" id="startTime" type="text" size="12" value="${startTime }" /><span class="newfont06">至</span>
			 <input name="endTime" id="endTime" type="text" size="12" value="${endTime }"/>	
			 <input name="Submit" type="button" id="selectByTime" class="right-button02" value="查 询" />
			 </td>
			 <td width="132" align="left"><a href="#" onclick="sousuo()">
			   <input name="Submit" type="button" class="right-button07" value="高级搜索" /></a></td>	
		  </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="javascript:return void(0)" class="right-font08" id="selectAll">全选</a>-<a href="javascript:return void(0)" class="right-font08" id="uncheck">反选</a></span>
                 <input name="Submit3" type="button" id="btn_delete" value="删除所选信息" />
                 <input name="Submit2" type="button" class="right-button08" value="新建信息" onclick="link();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 接收信息列表 &nbsp;</td>
                  </tr>
                  <tr>
                    <td width="14%" align="center" bgcolor="#EEEEEE">选择</td>
                    <td width="19%" height="20" align="center" bgcolor="#EEEEEE">标题</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">发信人</td>
                    <td width="15%" align="center" bgcolor="#EEEEEE">收件时间</td>
                     <td width="16%" align="center" bgcolor="#EEEEEE">查看时间</td>
                    <td width="26%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <tr align="center">
  
					<c:forEach items="${pageInfo.list }" var="r">
                  <tr align="center">
                    <td bgcolor="#FFFFFF"><input type="checkbox" name="receiveId" value="${r.receiveId }"/></td>
                    <td height="20" bgcolor="#FFFFFF">${r.messageTitle }</td>
                    <td bgcolor="#FFFFFF">${r.empName }</td>
                    <td bgcolor="#FFFFFF">${r.createDate}</td>
                     <td bgcolor="#FFFFFF"><c:out value="${r.openDate}" default="未读信件"></c:out></td>
                    <td bgcolor="#FFFFFF"><a href="deleteReceiveMessage.do?receiveId=${r.receiveId }">删除</a>|<a href="receiveMessageDetails.do?receiveId=${r.receiveId }">查看</a></td>
                  </tr>
					</c:forEach>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">${pageInfo.pageCount }</span> 页 | 第 <span class="right-text09">${pageInfo.currentPage }</span> 页</td>
                <td width="49%" align="right">
                  <a href="javascript:return void(0)" class="pageAction" value="1" >[首页 | </a> 
                <c:choose>
                <c:when test="${pageInfo.currentPage>1}">
                <a href="javascript:return void(0)" class="pageAction" value="${pageInfo.currentPage-1 }">上一页 | </a>
              	</c:when>
              	 <c:when test="${pageInfo.currentPage==1}">
	 	  		 <a href="javascript:return void(0)" class="pageAction" value="1">上一页 | </a>
	 			  </c:when>
               </c:choose>
               
                 <c:choose>
	 	 		 <c:when test="${pageInfo.currentPage<pageInfo.pageCount}">
               	 <a href="javascript:return void(0)" class="pageAction" value="${pageInfo.currentPage+1 }">下一页 | </a>
              	  </c:when>
                  <c:when test="${pageInfor.currentPage==pageInfor.pageCount}">
	 			  <a href="javascript:return void(0)" class="pageAction" value="${pageInfo.pageCount }">下一页 | </a>
	 			  </c:when>
	 			  </c:choose>
	 			  
	 			  
              	  <a href="javascript:return void(0)" class="pageAction" value="${pageInfo.pageCount }">末页</a>] 转至:&nbsp;
                
                </td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input name="textfield3" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value=" " />
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<form action="receiveMessageList.do" id="form2">
 <input type="hidden" name="currentPage" id="hd_page">
  <input type="hidden" name="startTime" value="${startTime }">
   <input type="hidden" name="endTime" value="${endTime }">
</form>
<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">
	<img src="file:///F|/项目管理相关资料/项目管理系统页面/images/loadon.gif" />
</div>

</body>
</html>