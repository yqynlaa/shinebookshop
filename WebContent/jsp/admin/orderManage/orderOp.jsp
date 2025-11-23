<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<base href="${basePath}">
	<meta charset="UTF-8">
	<title>Order List</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script> 
	<link rel="stylesheet" href="css/admin/adminManage/userList.css">
	<style type="text/css">
		
	</style>
</head>
<body>
	<c:if test="${!empty orderMessage}">
		<h3 class="text-center">${orderMessage}</h3>
	</c:if>
	<h2 class="text-center">Pending Orders List</h2>
	<div class="funbtn" style="padding-left: 300px"> 
			<div class="search col-md-4"> 
						<div class="input-group">
							<form action="jsp/admin/OrderManageServlet" method="get">
								<input type="hidden" value="seach1" name="action">
		     	 				<input style="float: left;width: 160px;" type="text" class="form-control" name="ordername" placeholder="Enter order number to search...">
		       					&nbsp;&nbsp;&nbsp;
		       					<input style="float: left;width: 55px;" class="btn btn-default" type="submit" value="Search"/>
							</form>
   						</div>
			</div>
		</div>
	<div class="container content">
		<table class="table table-striped table-hover">
			<tr class="success">
				<th>Order ID</th>
				<th>Order Number</th>
				<th>User ID</th>
				<th>Order Date</th>
				<th>Amount</th>
				<th>Order Status</th>
				<th>Action</th>
			</tr>
			<c:choose>
				<c:when  test="${!empty orderList}">
					<c:forEach items="${orderList}" var="i">
						<tr>
							
							<td>${i.orderId}</td>
							<td>${i.orderNum}</td>
							<td>${i.userId}</td>
							<td>${i.orderDate}</td>
							<td>${i.money}</td>
							<td>
								<c:if test="${i.orderStatus eq 1 }"><span style="background:red;color:#fff;">Submitted</span></c:if>
								<c:if test="${i.orderStatus eq 2 }"><span style="background:green;color:#fff;">Shipped</span></c:if>
								<c:if test="${i.orderStatus eq 3 }"><span >Completed</span></c:if>
							</td>
							<td>
								<a class="btn btn-default btn-sm" href="jsp/admin/OrderManageServlet?action=detail&id=${i.orderId}">Details</a>
								<a class="btn btn-info btn-sm" href="jsp/admin/OrderManageServlet?action=ship&id=${i.orderId}" onclick="return confirm('Confirm shipment?')">Ship</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7"><h4 class="text-center">No more order information</h4></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	
	<ul class="pager">
		<li><button class="homePage btn btn-default btn-sm">First</button></li>
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
<script type="text/javascript">
	
	//按钮禁用限制
	if("${pageBean.curPage}"==1){
		$(".homePage").attr("disabled","disabled");
		$(".prePage").attr("disabled","disabled");
	}
	if("${pageBean.curPage}"=="${pageBean.pageCount}"){
		$(".page-go").attr("disabled","disabled");
		$(".nextPage").attr("disabled","disabled");
		$(".lastPage").attr("disabled","disabled");
	}
	//按钮事件
	$(".homePage").click(function(){
		window.location="${basePath}jsp/admin/OrderManageServlet?action=processing&page=1";
	})
	$(".prePage").click(function(){
		window.location="${basePath}jsp/admin/OrderManageServlet?action=processing&page=${pageBean.prePage}";
	})
	$(".nextPage").click(function(){
		window.location="${basePath}jsp/admin/OrderManageServlet?action=processing&page=${pageBean.nextPage}";
	})
	$(".lastPage").click(function(){
		window.location="${basePath}jsp/admin/OrderManageServlet?action=processing&page=${pageBean.pageCount}";
	})
	//控制页面跳转范围
	$(".page-go").click(function(){
		var page=$("#page-input").val();
		var pageCount=${pageBean.pageCount};
		if(isNaN(page)||page.length<=0){
			$("#page-input").focus();
			alert("Please enter numeric page number");
			return;
		}
		if(page > pageCount || page < 1 ){
			alert("Page number out of range!");
			$("#page-input").focus(); 
		}else{
			window.location="${basePath}jsp/admin/OrderManageServlet?action=processing&page="+page;
		}
	})
	
	
	
	
	
	
	
	
	
	
</script>
</body>
</html>