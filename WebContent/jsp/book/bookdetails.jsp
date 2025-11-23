<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${basePath}">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Online Bookstore</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/book/landing.js"></script>
	<link href="css/book/head_footer.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/book/addcart.js"></script>
	<style type="text/css">
		.wrapper .pro_info{
			border-bottom: 1px #ccc solid;
			line-height: 34px;
			margin-top:20px;
		}
		.wrapper .pro_info tr td:first-child{
			font-weight: bold;

		}
		.wrapper .pro_info i{
			color:red;
			font-size:22px;
		}
		.wrapper .buy_pro{
			margin-top:20px;

		}
		.wrapper .pro_desc{
			margin:10px;
		}

		.wrapper .pro_desc h3{
			border-bottom: 1px #ccc solid;
			padding:10px;
		}
		.wrapper .pro_desc div{
			text-indent: 2em;
			line-height: 2em;
		}

	</style>
</head>
<body>

	<div class="container-fullid">
		<%@include file="header.jsp" %>
		<div class="wrapper">
			<!-- main start -->
			<div class="main container">
				<div class="sub-nav">
					<ol class="breadcrumb">
  						<li><a href="jsp/book/index.jsp">Home</a></li>
						<li><a href="#">${bookInfo.catalog.catalogName}</a></li>
						<li class="active">${bookInfo.bookName}</li>
					</ol>
				</div>
				<div class="row">
					<div class="col-md-5">
						<img class="img-responsive" src="${bookInfo.upLoadImg.imgSrc}" />
					</div>
					<div class="col-md-7">
						<table class="pro_info">
								<tr>
									<td colspan="2"><h2>${bookInfo.bookName}</h2></td>
								</tr>
								<tr>
									<td>Price:</td>
									<td><i>￥${bookInfo.price}</i></td>
								</tr>
								<tr>
									<td>Book ID:</td>
									<td>${bookInfo.bookId}</td>
								</tr>
								<tr>
									<td>Category:</td>
									<td>${bookInfo.catalog.catalogName}</td>
								</tr>
								<tr>
									<td>Author:</td>
									<td>${bookInfo.author}</td>
								</tr>
								<tr>
									<td>Publisher:</td>
									<td>${bookInfo.press}</td>
								</tr>
								<tr>
									<td>Date Added:</td>
									<td>${bookInfo.addTime}</td>
								</tr>
								<tr>
									<td>Service:</td>
									<td>Shipped by bookstore with after-sales service. Expected delivery within 3 days. We will do our best to serve you, thank you!</td>
								</tr>
							</table>
						<p class="buy_pro">
								<a class="btn btn-info" href="#">Buy Now</a>
								<button type="button" class="btn btn-danger" onclick="addToCart(${bookInfo.bookId})" data-toggle="modal" data-target=".bs-example-modal-sm">Add to Cart</button>
						</p>
						<p>Warm reminder: 7-day return policy supported</p>
					</div>

				</div>
				<div class="row pro_desc">
					<h3>Book Description</h3>
					<div>${bookInfo.description}</div>
				</div>

			</div>


		</div>

		<%@include file="footer.jsp" %>
	</div>
<!--弹窗盒子start -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-sm">
    	<div class="modal-content">
    		<div class="modal-body" style="color:green;font-size:24px;">
			  <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbspItem added to cart successfully!
			</div>

      		<div class="modal-footer">
      			<a href="javascript:void(0)" type="button" class="btn btn-default" data-dismiss="modal">Continue Shopping</a>
		        <a href="jsp/book/cart.jsp" type="button" class="btn btn-success">Go to Checkout</a>
		    </div>
    	</div>
  	</div>
</div>
<!--弹窗盒子end -->
</body>
</html>
