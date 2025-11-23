<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="head">
			<div class="top">
				<div class="container">


					<div class="pull-right">
						<c:choose>
							<c:when test="${empty landing}">
								<div class="top-right">
									Hello, please
									<a href="jsp/book/reg.jsp?type=login">Login</a>
									<a href="jsp/book/reg.jsp?type=reg">Register</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="btn-group adminName top-right">
									<a href="javascript:void(0)">
									    ${landing.name} <span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-menu-right">
									    <li><a href="OrderServlet?action=list" >My Orders</a></li>
<%--									    <li><a href="#">My Profile</a></li>--%>
									    <li><a style="border-top:1px #ccc solid" href="UserServlet?action=off" onClick="return confirm('Are you sure you want to logout?')">Logout</a></li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="mid container">
				<div class="row">
					<a class="logo col-md-5"  title="Online Bookstore">
						<span>Campus Used Book Trading System</span>
					</a>
					<div class="search col-md-4">
						<div class="input-group">
							<form action="BookList2" method="get">
		     	 				<input style="float: left;width: 160px;" type="text" class="form-control" name="seachname" placeholder="Enter book name to search...">
		       					&nbsp;&nbsp;&nbsp;
		       					<input style="float: left;width: 55px;" class="btn btn-default" type="submit" value="Search"/>
							</form>
   						</div>
					</div>
					<div class="shopcart col-md-2 col-md-offset-1">
						<a id="cart" href="jsp/book/cart.jsp">
							<span class="badge num">
								<c:choose>
									<c:when test="${!empty shopCart}">
										${shopCart.getTotQuan()}
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</span>
							<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
							<span>Cart</span>
							<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</a>
					</div>
				</div>
				<div class="navbar">
					<ul class="nav navbar-nav">
				        <li class="active"><a href="jsp/book/index.jsp">Home <span class="sr-only">(current)</span></a></li>
						<li><a href="#">Categories</a></li>
						<li><a href="#">New Arrivals</a></li>
						<li><a href="#">Deals</a></li>
						<li><a href="#">Best Sellers</a></li>
			      	</ul>
				</div>
			</div>
		</div>
