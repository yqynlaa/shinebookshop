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
	<title>Shopping Cart</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script> 
	<link rel="stylesheet" href="css/book/head_footer.css" >
	<link rel="stylesheet" href="css/book/booklist.css" />
	<script type="text/javascript" src="js/book/getCatalog.js"></script> 
	<script type="text/javascript" src="js/book/landing.js"></script>
	<script type="text/javascript" src="js/book/addcart.js"></script>
</head>
<body>

	<div class="container-fullid">
		<%@include file="header.jsp" %>
		
		<div class="wrapper">
			<!-- main start -->
			<div class="main container">
				<div class="row">
					<div class="col-md-2 main-left">
						<h3>Book Categories</h3>
						<ul id="catalog-list">
							<li><a href="BookList">All Books</a></li>

						</ul>
					</div>
					<div class="col-md-10 main-right">
						<div class="pro col-md-12">
							<h3>Book List——${title}</h3>
							<div class="pro-list">
								<ul class="row"> 
									<c:choose>
										<c:when test="${!empty bookList}">
											<c:forEach items="${bookList}" var="i">
												<li class="col-md-3">
													<div class="list">
														<a href="bookdetail?bookId=${i.bookId}">
															<img class="img-responsive" src="${i.upLoadImg.imgSrc}" />
														</a>
														<div class="proinfo">
															<h2>
																<a class="text-center" href="bookdetail?bookId=${i.bookId}">${i.bookName}</a>
															</h2>
															<p>
																<i>${i.price}</i>
																<a class="btn btn-danger btn-xs" onclick="addToCart(${i.bookId})" href="javascript:void(0)" data-toggle="modal" data-target=".bs-example-modal-sm">Add</a>
															</p>
														</div>
													</div>
												</li>
												
											</c:forEach>
										</c:when>
										<c:otherwise>
											<p style="text-align:center;font-size:20px;height:200px;">No books available</p>
										</c:otherwise>
									</c:choose>
								</ul>
								<!-- 分页栏 -->
								<ul class="pager row">
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
						</div>
					</div>
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
		window.location="${bsePath}BookList?action=list&page=1";
	})
	$(".prePage").click(function(){
		window.location="${basePath}BookList?action=list&page=${pageBean.prePage}";
	})
	$(".nextPage").click(function(){

		window.location="${basePath}BookList?action=list&page=${pageBean.nextPage}";
	})
	$(".lastPage").click(function(){
		window.location="${basePath}BookList?action=list&page=${pageBean.pageCount}";
	})
	//控制页面跳转范围
	$(".page-go").click(function(){
		var page=$("#page-input").val();
		var pageCount=${pageBean.pageCount};
		if(isNaN(page)||page.length<=0){
			$("#page-input").focus();
			alert("Please enter a page number");
			return;
		}
		if(page > pageCount || page < 1 ){
			alert("Page number out of range!");
			$("#page-input").focus();
		}else{
			window.location="${basePath}BookList?action=list&page="+page;
		}
	})
	
		
		
</script>
</body>
</html>