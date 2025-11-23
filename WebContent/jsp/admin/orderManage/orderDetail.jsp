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
	<title>Order Details Page</title>
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
	<h2 class="text-center">Order Details</h2>
	<div class="container">
		<div class="row">
			<div class="col-md-2 text-right">Order Number</div>
			<div class="col-md-10">${order.orderNum}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Customer ID</div>
			<div class="col-md-10">${order.userId}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Customer Name</div>
			<div class="col-md-10">${order.user.name}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Shipping Address</div>
			<div class="col-md-10">${order.user.address}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Contact</div>
			<div class="col-md-10">${order.user.tell}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">Order Status</div>
			<div class="col-md-10">
				<c:if test="${order.orderStatus eq 1 }"><span style="background:red;color:#fff;">Submitted</span></c:if>
				<c:if test="${order.orderStatus eq 2 }"><span style="background:green;color:#fff;">Shipped</span></c:if>
				<c:if test="${order.orderStatus eq 3 }"><span >Completed</span></c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-left">Order Product Information</div>
			<div class="col-md-12">
				<table class="table table-bordered">
					<tr class="info">
						<th class="col-md-6">&nbsp;</th>
						<th class="col-md-2">Unit Price</th>
						<th class="col-md-2">Quantity</th>
						<th class="col-md-2">Amount</th>
					</tr>
					<c:forEach items="${order.oItem}" var="i" varStatus="vs">
						<tr class="pro-list">
							<td><img width="50px" class="img-responsive col-md-2"
								src="${i.book.upLoadImg.imgSrc }" alt="" />
								<div class="col-md-8">
									<p>${i.book.bookName}</p>
									<p>${i.book.author}</p>
									<p>${i.book.press}</p>
								</div>
							</td>
							<td>￥<i>${i.book.price}</i></td>
							<td>${i.quantity}</td>
							<c:choose>
								<c:when test="${vs.first}">
									<td style="border:0;border-left:1px solid #ddd;">￥${order.money }</td>
								</c:when>
								<c:otherwise>
									<td style="border:0;border-left:1px solid #ddd;">&nbsp;</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			
			</div>
		</div>
		
		
		
	</div>
</body>
</html>