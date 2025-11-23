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
<title>Shopping Cart</title>
<link rel="stylesheet" href="bs/css/bootstrap.css">
<script type="text/javascript" src="bs/js/jquery.min.js"></script>
<script type="text/javascript" src="bs/js/bootstrap.js"></script>
<script type="text/javascript" src="js/book/landing.js"></script>
<link href="css/book/head_footer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/book/addcart.js"></script>
<link rel="stylesheet" type="text/css" href="bs/validform/style.css">
<script type="text/javascript" src="bs/validform/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="js/book/user_reg_login.js"></script>
<style type="text/css">
.wrapper {
	minheight: 400px;
}

.wrapper .main {
	padding: 20px 50px;
}

.wrapper .main .content .spinner a {
	display: inline-block;
}

.wrapper .main .content .spinner input {
	display: inline-block;
	width: 30px;
	height: 22px;
	border-radius: 3px;
}
</style>

</head>
<body>
	<c:if test="${!empty suberr}">
		<script type="text/javascript">
			alert("${suberr}")
		</script>
	</c:if>
	<div class="container-fullid">
		<%@include file="header.jsp" %>
		<div class="wrapper">
			<!-- main start -->
			<div class="main container">
				<h3>
					<span>My Shopping Cart</span>
				</h3>
				<div class="content table-responsive">
					<table class="table">
						
						<c:choose>
							<c:when test="${!empty shopCart}">
								<tr class="info row">
									<th class="col-md-6">Product</th>
									<th class="col-md-2">Price</th>
									<th class="col-md-1">Quantity</th>
									<th class="col-md-2">Subtotal</th>
									<th class="col-md-1">Action</th>
								</tr>
								<c:forEach items="${shopCart.map}" var="i">
									<tr class="row" id="pro-tr-${i.key}">
										<td><img class="img-responsive col-md-4"
											src="${i.value.book.upLoadImg.imgSrc }" alt="" />
											<div class="col-md-8">
												<a href="bookdetail?bookId=${i.key}">${i.value.book.bookName}</a>
												<p>${i.value.book.author}</p>
												<p>${i.value.book.press}</p>
											</div>
										</td>
										<td >￥<i>${i.value.book.price}</i></td>
										<td>
											<div class="spinner">
												<span onclick="addval(this,${i.key})"
													class="btn btn-xs btn-default"> <b>-</b>
												</span> 
												<input type="text" value="${i.value.quantity}" onchange="changeinput(this,${i.key})" >
												<span onclick="cutval(this,${i.key})"
													class="btn btn-xs btn-default"> <b>+</b>
												</span>
											</div>
										</td>
										<td class="price" style="color:red;font-size:20px;">￥<i>${i.value.subtotal}</i></td>
										<td><a  class="btn btn-danger btn-sm" href="CartServlet?action=delItem&id=${i.key}" onClick="return confirm('Are you sure you want to delete this item?')">Delete</a></td>
									</tr>
								</c:forEach>
								<tr class="row">
									<td colspan="2"><a href="CartServlet?action=delAll" class="btn btn-danger">Clear Cart</a></td>
									<td class="pull-right" style="font-size: 24px;">Total:</td>
									<td id="totPrice"><b style="color:red;font-size: 24px;">
										￥
										<i>
										<c:choose>
											<c:when test="${!empty shopCart}">
												${shopCart.totPrice}
											</c:when>
											<c:otherwise>
												0.00
											</c:otherwise>
										</c:choose>
										
										</i></b></td>
									<td><a id="tosettle" class="btn btn-success" href="javascript:void(0)">Checkout</a></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6"
										style="height: 200px; line-height: 100px; font-size: 24px;">
										Your cart is empty, <a style="font-size: 24px; color: red"
										href="BookList">Go Shopping >></a>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</table>

				</div>
			</div>
		</div>

		<%@include file="footer.jsp" %>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Login</h4>
				</div>
				<div class="modal-body">
					<!-- Login form body -->
					<p class="info" style="text-align: center;color:red"></p>
	        		<div id="tab_login" class="tab-pane fade in active">
						<form id="loginForm" name="loginForm"  method="post" class="form-horizontal" >
							<div class="form-group">
								<label for="l_userName" class="col-md-4 control-label">Username:</label>
								<div class="col-md-6">
									<input name="userName" id="l_userName" type="text" class="form-control" >
									<span class="Validform_checktip">&nbsp</span>
								</div>

							</div>
							<div class="form-group">
								<label for="l_passWord" class="col-md-4  control-label">Password:</label>
								<div class="col-md-6">
									<input type="password" name="passWord" id="l_passWord" class="form-control">
									<span class="Validform_checktip">&nbsp</span>
								</div>

							</div>

							<div class="form-group">
								<label for="ck_code" class="col-md-4  control-label">Verification Code:</label>
								<div class="col-md-3" >
									<input class="form-control" type="text" name="code" id="ck_code" >
									<span class="Validform_checktip">&nbsp</span>
								</div>

								<div class="col-md-4" style="padding:0;">
									<img class="col-md-8" id="imgCode" src="CodeServlet?action=code" alt="" style="padding:0;width:100px;height:38px;" />
									<span onclick="reCode()" class="col-md-4 glyphicon glyphicon-refresh " aria-hidden="true" style="padding:0 0 0 5px;font-size: 24px;"></span>
								</div>

							</div>
							<div class="form-group">
								<label class="col-md-2 control-label col-md-offset-4">
									<button class="btn btn-success btn-block" type="submit" >Login</button>
								</label>
								<label class="col-md-2 control-label">
									<button class="btn btn-warning btn-block" type="reset">Reset</button>
								</label>

							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//Login validation


		var form=$("#loginForm").Validform({
			tiptype:3
		});

		form.addRule([
			{
				ele:"#l_userName",
			    datatype:"*",
			    nullmsg:"*Please enter username!",
			    errormsg:"*Username is incorrect, please re-enter!"
			},
			{
				ele:"#l_passWord",
				datatype:"*",
				nullmsg:"*Please enter password!",
				errormsg:"*Password is incorrect, please re-enter"
			},
			{
				ele:"#ck_code",
				datatype:"*",
				ajaxurl:"CodeServlet?action=ckCode",
				nullmsg:"*Please enter verification code!",
				errormsg:"*Verification code is incorrect"
			}

		]);
		

	//Increase/decrease button handling
	  function addval(obj,id) {  
		  var input=$(obj).parent().find("input");
		  if(input.val()>1){
			  input.val(parseInt(input.val()) - 1); 
			  changeQ(obj,id,input.val());
			}
		 }
	  function cutval(obj,id){
		  var input=$(obj).parent().find("input");
		  if(input.val()<999){
			  input.val(parseInt(input.val()) + 1); 
			  changeQ(obj,id,input.val());
			}
	 	}
	  //Input box handling
		function changeinput(obj,id){
			var val=$(obj).val();
			var rge=/^[0-9]*[1-9][0-9]*/;
			if(!rge.test(val)){
				$(obj).val(1);
				changeinput(obj,id);
				alert("Product quantity must be an integer, please re-enter!");
				return;
			}else{
				changeQ(obj,id,val);
			}

		}
		function ckinput(val){
			
		}
		//ajax submit handling
		function changeQ(obj,id,val){
			$.ajax({
				url:"CartServlet?action=changeIn",
				dataType:"json",
				async:true,
				data:{"bookId":id,"quantity":val},
				type:"POST",
				success:function(data){
					$(obj).parent().parent().parent().find(".price i").html(data.subtotal);
					$(obj).parent().find("input").val(data.quantity);
					$("#totPrice i").html(data.totPrice);
					$("#cart .num").html(data.totQuan);
					
				}
					
			})
		}
		//Checkout handling
		$("#tosettle").click(function(){
			$.get("UserServlet?action=landstatus",function(data){
				if(data.status=="y"){
					window.location.href="${basePath}jsp/book/conorder.jsp";
				}else{
					$("#myModal").modal("show");
				}
			},"json")
			
			return;
		})
		//Login handling
		$("#loginForm").submit(function(){
			$.post("UserServlet?action=ajlogin", $('#loginForm').serialize(),function(data){
				if("y"==data.status){
					window.location.href="${basePath}jsp/book/conorder.jsp";
					
				}else{
					
					$("#myModal .info").html(data.info);
				}
			},"json")
			return false;
		})
		


		//Verification code
	function reCode(){
		$("#imgCode").prop("src","CodeServlet?action=code&"+new Date().getTime());
	}
</script>
</body>
</html>