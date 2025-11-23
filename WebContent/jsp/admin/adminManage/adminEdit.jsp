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
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="bs/validform/style.css">
	<script type="text/javascript" src="bs/validform/Validform_v5.3.2_min.js"></script> 
	<script type="text/javascript" src="js/admin/adminManage/adminEdit.js"></script>
</head>
<body>
	<c:if test="${!empty adminMessage}">
		<h3 class="text-center">${adminMessage}</h3>
	</c:if>
	<div class="container">
		<h2 class="text-center">Admin Edit</h2>
		<form action="jsp/admin/AdminManageServlet?action=update" method="post" class="form-horizontal" onsubmit="javascript:return checkAdd();">
				<input type="hidden" name="id" value="${adminInfo.id}">
				<div class="form-group">
					<label for="userName" class="col-sm-2 col-sm-offset-2 control-label">Username:</label>
					<div class="col-sm-4">
						<span>${adminInfo.userName}</span>
					</div>
				</div>
				<div class="form-group">
					<label for="passWord" class="col-sm-2 col-sm-offset-2 control-label">Password:</label>
					<div class="col-sm-4">
						<input type="password" name="passWord" id="passWord" class="form-control" value="${adminInfo.passWord}">
					</div>
					<div class="col-sm-4">
						<span class="Validform_checktip">Password is 4-8 characters</span>
					</div>
				</div>
				<div class="form-group">
					<label for="passWord_ck" class="col-sm-2 col-sm-offset-2 control-label">Confirm Password:</label>
					<div class="col-sm-4">
						<input type="password" name="passWord_ck" id="passWord_ck" class="form-control" value="${adminInfo.passWord}">
					</div>
					<div class="col-sm-4">
						<span class="Validform_checktip"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 col-sm-offset-2 control-label">Name:</label>
					<div class="col-sm-4">
						<input type="text" id="name" name="name" class="form-control" value="${adminInfo.name}">
					</div>
					<div class="col-sm-4">
						<span class="Validform_checktip">Name is 2-8 characters</span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-sm-offset-2 control-label">
						<input class="btn btn-success btn-block" type="submit" value="Update">
					</label>
					<label class="col-sm-2 control-label">
						<input class="btn btn-warning btn-block" type="reset" value="Reset">
					</label>
				</div>
		</form>
	</div>
</body>
</html>