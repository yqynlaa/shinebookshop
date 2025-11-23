<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert Title Here</title>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" href="css/admin/left.css">
</head>
<body>
	<div class="left">
		<ul>
			<li class="list">
				<h3>User Management</h3>
				<ul>
					<li><a href="jsp/admin/AdminManageServlet?action=list" target="rFrame">Admin Management</a></li>
					<li><a href="jsp/admin/UserManageServlet?action=list" target="rFrame">User Management</a></li>
				</ul>
			</li>
			<li class="list">
				<h3>Book Management</h3>
				<ul>
					<li><a href="jsp/admin/BookManageServlet?action=list" target="rFrame">Book List</a></li>
					<li><a href="jsp/admin/CatalogServlet?action=list" target="rFrame">Category Management</a></li>
				</ul>
			</li>

			<li class="list">
				<h3>Order Management</h3>
				<ul>
					<li><a href="jsp/admin/OrderManageServlet?action=list" target="rFrame">Order List</a></li>
					<li><a href="jsp/admin/OrderManageServlet?action=processing" target="rFrame">Order Processing</a></li>
				</ul>
			</li>

		</ul>
	</div>
	<script type="text/javascript">
	/* Menu toggle expand */
		$(".list h3").next().slideUp(300);
		$(".list h3").click(function(){
			$(".list h3").css("color","#fff");
			$(".list h3").next().slideUp(300);  
			if($(this).next().css("display")=="none"){
				$(this).css("color","#52de92");
				$(this).next().slideDown(300);
			}else{
				$(this).next().slideUp(300);
			}
		})
		
		$(".list ul a").click(function(){
			$(".list ul a").css("color","#000");
			$(this).css("color","#52de92");
		})
	</script>
</body>
</html>