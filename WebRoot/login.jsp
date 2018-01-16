<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/loginStyle.css" type="text/css"></link><body>
  </head>
  <body>
  
   <form class="form-horizontal" action="main.jsp" method="post">
 	<div class="login">
		 <div class="login-main">
		 		<div class="login-top">
		 			<img class="img" src="images/top.png" alt=""/>
		 			<h1>WEB考勤管理系统</h1>
		 			<input type="text" placeholder="用户名" required="">
		 			<input type="password" placeholder="密码"  required="">
		 			<div class="login-bottom">
		 			<div class="login-check">
			 			<label class="checkbox"><input type="checkbox" name="checkbox"  checked="checked" /><i> </i> 记 住 我</label>
			 		</div>
						<div class="clear"></div>
					</div>
		 			<input type="submit" value="登录" />
		 		</div>
		 	</div>
  </div>
</form>
  </body>
</html>
