<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>User Details Page</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<style type="text/css">
		body{
			margin:0;
			padding:0;
			background:#eee;
		}
		 
		.container .row{
			line-height: 30px;
			htight:30px;
		}
		
	</style>
</head>
<body>
	<h2 class="text-center">User Details</h2>
	<div class="container">
		<div class="row">
			<div class="col-md-2 text-right">User ID</div>
			<div class="col-md-10">${userInfo.userId}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Username</div>
			<div class="col-md-10">${userInfo.userName}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Password</div>
			<div class="col-md-10">${userInfo.userPassWord}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Name</div>
			<div class="col-md-10">${userInfo.name}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Gender</div>
			<div class="col-md-10">${userInfo.sex}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Age</div>
			<div class="col-md-10">￥${userInfo.age}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Phone</div>
			<div class="col-md-10">${userInfo.tell}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Address</div>
			<div class="col-md-10">${userInfo.address}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Enable Status</div>
			<div class="col-md-10">
				<c:choose>
					<c:when test="${i.enabled eq 'y'}">
						<span style="background:green;color:#fff">Enabled</span>
					</c:when>
					<c:otherwise>
						<span style="background:red;color:#fff">Disabled</span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		
	</div>
</body>
</html>