$(function(){
	var form=$("#bookAddForm").Validform({
		tiptype:2,//validform初始化
	});
	
	form.addRule([
		{
			ele:"#bookName",
		    datatype:"*2-20",
		    ajaxurl:"jsp/admin/BookManageServlet?action=find",
		    nullmsg:"Please enter book name!",
		    errormsg:"Book name must be at least 2 characters, maximum 20 characters!"
		},
		{
			ele:"#catalog",
			datatype:"*",
			nullmsg:"Please select book category!",
			errormsg:"Please select book category!"
		},
		{
			ele:"#price",
			datatype:"/^[0-9]{1,}([.][0-9]{1,2})?$/",
			mullmsg:"Price cannot be empty!",
			errormsg:"Price must be a number"
		},
		{
			ele:"#author",
		    datatype:"*2-30",
		    nullmsg:"Please enter author name!",
		    errormsg:"Author name must be at least 2 characters, maximum 30 characters!"
		},
		{
			ele:"#press",
		    datatype:"*2-30",
		    nullmsg:"Please enter press!",
		    errormsg:"Press name must be at least 2 characters, maximum 30 characters!"
		},
		{
			ele:"#bookImg",
		    datatype:"*",
		    nullmsg:"Please upload book image!",
		    errormsg:"Please upload book image!"
		}
	
	]);
	
});



////ajax实时判断用户存在否
//var oldErr;
//var xmlHttp;
//var flag=true;//标记
//function ck_username(){
//		xmlHttp=getXmlHttp();
//		
//		//用户名验证4-8位大小写字母和数字
//		
//		if($("#userName").val()==null){
//			return;
//		}
//
//		var url="UserServlet?action=find&userName="+$("#userName").val();
//		xmlHttp.open("GET",url,true);
//		xmlHttp.onreadystatechange=function(){
//			if(xmlHttp.readyState==4 && xmlHttp.status==200){
//				var json=JSON.parse(xmlHttp.responseText);
//				var info=json['info'];
//				if(info==0){
//					oldErr=$(".ckerr").eq(0).html("*用户名已存在！请重新输入！").css("color","red");
//					flag=true;
//				}else{
//					if(oldErr!=null){
//						oldErr.html("√ 正确").css("color","green");
//						flag=false;
//					}
//				}
//			}
//		}
//		xmlHttp.send(null);
//	}
//	
//
//
//function getXmlHttp(){
//	var xHttp;
//	if(window.XMLHttpRequest){
//		xHttp=new XMLHttpRequest();
//	}
//	if(window.ActiveXObject){
//		xHttp=new ActiveXObject("Microsoft.XMLHttp");
//	}
//	return xHttp;
//}
//
//
		