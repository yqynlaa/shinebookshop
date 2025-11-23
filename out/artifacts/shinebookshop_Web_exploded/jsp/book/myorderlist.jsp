<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${basePath}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order Submission Success</title>
<link rel="stylesheet" href="bs/css/bootstrap.css">
<script type="text/javascript" src="bs/js/jquery.min.js"></script>
<script type="text/javascript" src="bs/js/bootstrap.js"></script>		
<script type="text/javascript" src="js/book/landing.js"></script>
<link href="css/book/head_footer.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.wrapper{
		min-height:500px;
	}
	/* Pagination style */
	.wrapper .pager{
		border-top:1px #eee solid;
		padding-top:15px; 
	}
	.wrapper .pager .page-div{
		display: inline-block;
		width:110px;
	}
	.wrapper .homePage,.wrapper .prePage,.wrapper .page-go,.wrapper .nextPage,.lastPage{
		border-radius:15px;
		color:#52de92;
	}
	
	
	.wrapper #page-input{
		display:inline-block;
		width:60px;
		border-radius: 10px;
	}
	.wrapper .bookImg{
		width:50px;
	}
	.wrapper .funbtn{
		margin:10px 0;
	}
	.wrapper .funbtn a{
		margin-right:10px;
	}
	

</style>	

</head>
<body>
	<div class="container-fullid">
		<%@include file="header.jsp" %>
		<div class="wrapper">
			<div class="main container">
				<h2>All Orders</h2>
				<table class="table table-bordered">
					<thead>
						<tr class="info">
							<th>Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Product Action</th>
							<th>Amount Paid</th>
							<th>Transaction Status</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${!empty orderList }">
							<c:forEach items="${orderList}" var="order" varStatus="varstatus">
								<c:if test="${!varstatus.first}"><tbody><tr><td colspan="6">&nbsp;</td></tr></tbody> </c:if>
								<tbody style="margin-top: 10px;">
									<tr class="active">
										<td>Order Date: ${order.orderDate}</td>
										<td colspan="5">Order No.: ${order.orderNum }</td>
									</tr>
									<c:forEach items="${order.oItem}" var="oit" varStatus="vs">
										<tr>
											<td>
												<img class="img-responsive col-md-2" src="${oit.book.upLoadImg.imgSrc}" alt="" />
												<span class="col-md-10">${oit.book.bookName}</span>
											</td>
											<td>￥${oit.book.price}</td>
											<td>${oit.quantity}</td>
											<td><a href="javascript:void(0)">Request After-sales</a></td> 
											<c:choose>
												<c:when test="${vs.first}">
													<td style="border:0;border-left:1px solid #ddd;">￥${order.money }</td>
													<td style="border:0;border-left:1px solid #ddd;">
														<c:if test="${order.orderStatus eq 1}"><p>Order Submitted</p><p>(Waiting for shipment)</p></c:if>
														<c:if test="${order.orderStatus eq 2}">
															<p>Shipped</p>
															<a href="OrderServlet?action=ship&id=${order.orderId}" class="btn btn-sm btn-success" onclick="confirm('Confirm receipt?')">Confirm Receipt</a>
														</c:if>
														<c:if test="${order.orderStatus eq 3}">Order Completed</c:if>
													</td>
												</c:when>
												<c:otherwise>
													<td style="border:0;border-left:1px solid #ddd;">&nbsp</td>
													<td style="border:0;border-left:1px solid #ddd;">&nbsp</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
								
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tbody>
								<tr><td colspan="6"><h2 class="text-center">No orders yet!</h2></td></tr>
							</tbody>
						</c:otherwise>
					</c:choose>
				</table>
				<!-- Pagination buttons -->
				<ul class="pager row">
					<li><button class="homePage btn btn-default btn-sm">Home</button></li>
					<li><button class="prePage btn btn-sm btn-default">Previous</button></li>
					<li>Total ${pageBean.pageCount} pages | Current page ${pageBean.curPage}</li>
					<li>
						Jump to
						<div class="input-group form-group page-div">
							<input id="page-input" class="form-control input-sm" type="text" name="page"/>
							<span>
								<button  class="page-go btn btn-sm btn-default">GO</button>
							</span>
						</div>
					</li>
					<li><button class="nextPage btn btn-sm btn-default">Next</button></li>
					<li><button class="lastPage btn btn-sm btn-default">Last</button></li>
				</ul>
				
			</div>
		</div>

		<%@include file="footer.jsp" %>
	</div>


<script type="text/javascript">
	//Button disable restrictions
	if("${pageBean.curPage}"==1){
		$(".homePage").attr("disabled","disabled");
		$(".prePage").attr("disabled","disabled");
	}
	if("${pageBean.curPage}"=="${pageBean.pageCount}"){
		$(".page-go").attr("disabled","disabled");
		$(".nextPage").attr("disabled","disabled");
		$(".lastPage").attr("disabled","disabled");
	}
	//Button events
	$(".homePage").click(function(){
		window.location="${bsePath}OrderServlet?action=list&page=1";
	})
	$(".prePage").click(function(){
		window.location="${basePath}OrderServlet?action=list&page=${pageBean.prePage}";
	})
	$(".nextPage").click(function(){
		
		window.location="${basePath}OrderServlet?action=list&page=${pageBean.nextPage}";
	})
	$(".lastPage").click(function(){
		window.location="${basePath}OrderServlet?action=list&page=${pageBean.pageCount}";
	})
	//Control page jump range
	$(".page-go").click(function(){
		var page=$("#page-input").val();
		var pageCount=${pageBean.pageCount};
		if(isNaN(page)||page.length<=0){
			$("#page-input").focus();
			alert("Please enter a numeric page number");
			return;
		}
		if(page > pageCount || page < 1 ){
			alert("Page number is out of range!");
			$("#page-input").focus(); 
		}else{
			window.location="${basePath}OrderServlet?action=list&page="+page;
		}
	}) 
	
		
		
</script>
</body>
</html>