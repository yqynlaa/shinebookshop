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
	<title>User Edit</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="bs/validform/style.css">
	<script type="text/javascript" src="bs/validform/Validform_v5.3.2_min.js"></script> 
	<script type="text/javascript" src="js/admin/userManage/userEdit.js"></script>
</head>
<body>
	<c:if test="${!empty userMessage}">
		<h3 class="text-center">${userMessage}</h3>
	</c:if>
	<div class="container">
		<h2 class="text-center">User Edit</h2>
		<form id="myForm" action="jsp/admin/UserManageServlet?action=update" method="post" class="form-horizontal">
			<input type="hidden" name="userId" value="${userInfo.userId}">
			<div class="form-group">
				<label for="userName" class="col-md-2 col-md-offset-2 control-label">Username:</label>
				<div class="col-md-4">
					<p class="form-control-static">${userInfo.userName}</p>
				</div>
				
			</div>
			<div class="form-group">
				<label for="passWord" class="col-md-2 col-md-offset-2 control-label">Password:</label>
				<div class="col-md-4">
					<input type="password" name="passWord" id="passWord" class="form-control" value="${userInfo.userPassWord }">
				</div>
				<div class="col-md-4">
					<span class="Validform_checktip"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="c_passWord" class="col-md-2 col-md-offset-2 control-label">Confirm Password:</label>
				<div class="col-md-4">
					<input type="password" name="c_passWord" id="c_passWord" class="form-control" value="${userInfo.userPassWord }">
				</div>
				<div class="col-md-4">
					<span class="Validform_checktip"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-md-2 col-md-offset-2 control-label">Name:</label>
				<div class="col-md-4">
					<input type="text" id="name" name="name" class="form-control" value="${userInfo.name }">
				</div>
				<div class="col-md-4">
					<span class="Validform_checktip"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 col-md-offset-2 control-label">Gender:</label>
				<div class="col-md-4 ">
					<c:choose>
						<c:when test="${userInfo.sex eq '男'}">
							<label class="radio-inline">
								<input type="radio" name="sex" id="sex" checked="checked" class="pr1" value="男">Male
							</label>
							<label class="radio-inline">
								<input type="radio" name="sex"  class="pr1"  value="女">Female
							</label>
						</c:when>
						<c:otherwise>
							<label class="radio-inline">
								<input type="radio" name="sex" id="sex" class="pr1" value="男">Male
							</label>
							<label class="radio-inline">
								<input type="radio" name="sex" checked="checked"  class="pr1"  value="女">Female
							</label>
						</c:otherwise>
					</c:choose>
					
				</div>
				
			</div>
			<div class="form-group">
				<label for="age" class="col-md-2 col-md-offset-2 control-label">Age:</label>
				<div class="col-md-4">
					<input type="text" id="age" name="age" class="form-control" value="${userInfo.age }">
				</div>
				<div class="col-md-4">
					<span class="Validform_checktip"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="tell" class="col-md-2 col-md-offset-2 control-label">Phone:</label>
				<div class="col-md-4">
					<input type="text" id="tell" name="tell" class="form-control" value="${userInfo.tell }">
				</div>
				<div class="col-md-4">
					<span class="Validform_checktip"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="address" class="col-md-2 col-md-offset-2 control-label">Address:</label>
				<div class="col-md-4">
					<input type="text" id="address" name="address" class="form-control" value="${userInfo.address }">
				</div>
				<div class="col-md-4">
					<span class="Validform_checktip"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="enabled" class="col-md-2 col-md-offset-2 control-label">Enable Status</label>
				<div class="col-md-4">
					<select class="form-control" name="enabled" id="enabled">
						<c:choose>
							<c:when test="${userInfo.enabled eq 'y'}">
								<option value="y" selected="selected">Enabled</option>
								<option value="n">Disabled</option>
							</c:when>
							<c:otherwise>
								<option value="y">Enabled</option>
								<option value="n" selected="selected">Disabled</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2  control-label col-md-offset-2">
					<input class="btn btn-success btn-block" type="submit" value="Update">
				</label>
				<label class="col-md-2 control-label">
					<input class="btn btn-warning btn-block" type="reset" value="Reset">
				</label>
			</div>
		</form>
	</div>
</body>
</html>