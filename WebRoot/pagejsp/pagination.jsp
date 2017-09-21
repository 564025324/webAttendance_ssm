<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'pagination.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>

	<input type="hidden" id="currentPage" name="currentPage" />
	<div class="page">
	共<span style="color:red">${page.totalPage}</span>页，当前第<span style="color:red">${page.currentPage}</span>页    &nbsp;                                      
		        每页显示:<input name="pagesize"  type="number" oninput="OnInput(event)"
			onpropertychange="OnPropChanged(event)"
			style="width:46px;height:25px" value="${ pagesize}">条 
		<a class="btn btn-xs btn-primary" onclick="clickPage(1)">首页</a>
		<c:if test="${page.currentPage == 1}">
			<a class="btn btn-xs btn-primary" disabled="">上一页</a>
		</c:if>
		<c:if test="${page.currentPage > 1}">
			<a class="btn btn-xs btn-primary"
				onclick="clickPage(${page.currentPage - 1})">上一页</a>
		</c:if>
		<c:forEach begin="${page.start}" end="${page.end}" var="item">
			<c:if test="${page.currentPage == item}">
				<font class="badge badge-grey" disabled="" color="red"
					style="font-size:17px;">${item}</font>
			</c:if>
			<c:if test="${page.currentPage != item}">
				<a class="badge badge-info" style="font-size:17px;"
					onclick="clickPage(${item})">${item}</a>
			</c:if>
		</c:forEach>
		<c:if test="${page.currentPage == page.totalPage}">
			<a class="btn btn-xs btn-primary" disabled="">下一页</a>
		</c:if>
		<c:if test="${page.currentPage != page.totalPage}">
			<a class="btn btn-xs btn-primary"
				onclick="clickPage(${page.currentPage + 1})">下一页</a>
		</c:if>
		<a class="btn btn-xs btn-primary" onclick="clickPage(${page.totalPage})">末页</a>
		跳转到第<!-- <input id="pagenum" type="number" style="width:55px;height:25px"> -->
		 <select id="pagenum" class="span12" style="width:55px;height:25px">
			<c:forEach begin="1" end="${page.totalPage}" var="item">
				<option value="${item}">${item}</option>	
			</c:forEach>
		</select> 
		页
        <a class="btn btn-xs btn-success" onclick="gotopitchup()">GO</a>

	</div>
	<script type="text/javascript">
   function clickPage(c) {
		document.getElementById("currentPage").value=c;
		queryPage();
	}
	function select(){
	    document.getElementById("currentPage").value=1;
	 	queryPage();
	}
	function queryPage() {
			  $.ajax({
				type : 'post',
				url : '${ctx}/StaffController/queryPage.do',
				data:$('#form').serialize(),
				success : function(html) {
					$('#mainContainer').empty();
					$('#mainContainer').append(html);
				},
			    error: function(html) {
                    $('#mainContainer').empty();
					$('#mainContainer').append(html);
                  }
			});  
		}
	function gotopitchup(){
		var pagenum=document.getElementById("pagenum").value;
		document.getElementById("currentPage").value=pagenum;
		queryPage();
	}
    function OnInput (event) {
         document.getElementById("currentPage").value=1;
            queryPage();
     }
    function OnPropChanged (event) {
        if (event.propertyName.toLowerCase () == "value") {
                document.getElementById("currentPage").value=1;
                queryPage();
            }
            }
        
</script>
<style type="text/css">
.page a:HOVER {
	cursor: pointer;
}
</style>
</body>
</html>
