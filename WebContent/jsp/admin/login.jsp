<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Bookstore Admin Login</title>
<link rel="stylesheet" type="text/css" href="css/login/login.css" />
<script type="text/javascript">
	function checkForm(){
		var userName=document.getElementById("userName");
		var passWord=document.getElementById("passWord");
		if(userName.value.length<=0){
			alert("Please enter username!");
			userName.focus();
			return false;
		}
		if(passWord.value.length<=0){
			alert("Please enter password!");
			passWord.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<c:if test="${!empty infoList}">
	<c:forEach items="${infoList}" var="i">
		<script type="text/javascript">
			alert("${i}")
		</script>
	</c:forEach>
</c:if>


	<h1 id="title">
		Bookstore Management System&nbsp;<sup style="color: red;font-size:14px;"><%=application.getInitParameter("ver")%></sup>
	</h1>
	<div id="login">
		<form action="jsp/admin/LoginServlet" method="post"
			onsubmit="javascript:return checkForm()">
			<p>
				<input type="text" name="userName" id="userName" placeholder="Username">
			</p>
			<p>
				<input type="password" name="passWord" id="passWord"
					placeholder="Password">
			</p>
			<p>
				<input type="submit" id="submit" value="Login">
			</p>
		</form>
	</div>
</body>
</html>
