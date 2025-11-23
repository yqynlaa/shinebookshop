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
	<title>Book Category Management Interface</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script> 
	<style type="text/css">
		body{
			margin:0;
			padding:0;
			background:#eee;
		}
		.content{
			padding:20px 40px 0 40px;
		} 
		.page-div{
			display: inline-block;
			width:110px;
		}
		.homePage,.prePage,.page-go,.nextPage,.lastPage{
			border-radius:15px;
			color:#337ab7;
		}
		.pager{
			padding:0 20px;
		}
		#page-input{
			display:inline-block;
			width:60px;
			border-radius: 10px;
		}
		.bookImg{
			width:50px;
		}
		.funbtn{
			margin:10px 0;
		}
		.funbtn a{
			margin-right:10px;
		}
		/* .table #desc{
			display:inline-block;
			width:300px;
			word-break:keep-all;
    		white-space:nowrap;
    		overflow:hidden;
    		text-overflow:ellipsis;
		} */
	</style>

</head>
<body>
	<c:if test="${!empty catalogMessage}">
		<h3 class="text-center">${catalogMessage}</h3>
	</c:if>
	<h2 class="text-center">Book Category Information Management</h2>
	<div class="container content">
		<div class="funbtn">
			<a id="batDel" class="btn btn-danger" href="javascript:void(0)">Batch Delete</a>
			<a class="btn btn-info" href="jsp/admin/bookManage/catalogAdd.jsp" >Add Category</a>
		</div>
		<table class="table table-striped table-hover">
			<tr class="success">
				<th>
					<input type="checkbox" id="batDelChoice">
					<label for="batDelChoice"> Select All/Reverse</label>
				</th>
				<th>Category ID</th>
				<th>Category Name</th>
				<th>Action</th>
			</tr>
			<c:choose>
				<c:when test="${!empty catalogList}">
					<c:forEach items="${catalogList}" var="i" varStatus="n">
						<tr>
							<td class="noClick"><input type="checkbox" name="choice" value="${i.catalogId}">
							<td>${i.catalogId}</td>
							<td>${i.catalogName}</td>
							<td class="noClick">
								<a class="btn btn-danger btn-sm" href="jsp/admin/CatalogServlet?action=del&id=${i.catalogId}" onclick="javascript:return confirm('Are you sure you want to delete?');">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8"><h4 class="text-center">No more book information available</h4></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>

	<ul class="pager">
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
		window.location="${bsePath}jsp/admin/CatalogServlet?action=list&page=1";
	})
	$(".prePage").click(function(){
		window.location="${basePath}jsp/admin/CatalogServlet?action=list&page=${pageBean.prePage}";
	})
	$(".nextPage").click(function(){
		
		window.location="${basePath}jsp/admin/CatalogServlet?action=list&page=${pageBean.nextPage}";
	})
	$(".lastPage").click(function(){

		window.location="${basePath}jsp/admin/CatalogServlet?action=list&page=${pageBean.pageCount}";
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
			window.location="${basePath}jsp/admin/CatalogServlet?action=list&page="+page;
		}
	})

	//Batch select
	$("#batDelChoice").change(function(){
		if(!$("input[name='choice']").prop("checked")){
			$(this).prop("checked",true);
			$("input[name='choice']").prop("checked",true);
			
		}else{
			$(this).removeProp("checked");
			$("input[name='choice']").removeProp("checked");
		}	
	})


	//Batch delete
	$("#batDel").click(function(){
		var choices=$("input:checked[name='choice']");
		var ids="";
		for(i=0;i<choices.length;i++){
			if(i!=choices.length-1){
				ids+=choices.eq(i).val()+",";
			}else{
				ids+=choices.eq(i).val();
			}
		}
		if(ids==""){
			alert("Please select items to delete!");
			return;

		}
		if(confirm("Are you sure you want to delete "+choices.length+" users?")){

			window.location = "${basePath}jsp/admin/CatalogServlet?action=batDel&ids="+ids;

		}
	})
	
	
</script>
</body>
</html>