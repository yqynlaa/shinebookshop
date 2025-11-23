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
	<title>Book Details Page</title>
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
	<h2 class="text-center">Book Details</h2>
	<div class="container">
		<div class="row">
			<div class="col-md-2 text-right">Book ID</div>
			<div class="col-md-10">${bookInfo.bookId}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Book Name</div>
			<div class="col-md-10">${bookInfo.bookName}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Book Category</div>
			<div class="col-md-10">${bookInfo.catalog.catalogName}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Book Author</div>
			<div class="col-md-10">${bookInfo.author}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Press</div>
			<div class="col-md-10">${bookInfo.press}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Book Price</div>
			<div class="col-md-10">￥${bookInfo.price}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Listing Date</div>
			<div class="col-md-10">${bookInfo.addTime}</div>
		</div>

		<div class="row">
			<div class="col-md-2 text-right">Book Description</div>
			<div class="col-md-10">${bookInfo.description}</div>
		</div>
		<div>
			<img class="col-md-6 col-md-offset-2" alt="" src="${bookInfo.upLoadImg.imgSrc}">
		</div>
		
	</div>
</body>
</html>