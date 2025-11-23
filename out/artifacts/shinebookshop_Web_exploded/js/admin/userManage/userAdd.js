//Registration form validation
$(function(){
	var form=$("#myForm").Validform({
		tiptype:2,//validform initialization
	});

	form.addRule([
		{
			ele:"#userName",
		    datatype:"*2-15",
		    ajaxurl:"jsp/admin/UserManageServlet?action=find",
		    nullmsg:"*Please enter username!",
		    errormsg:"*Username is 2-15 characters, please re-enter!"
		},
		{
			ele:"#passWord",
			datatype:"*4-8",
			nullmsg:"*Please enter password!",
			errormsg:"*Password is 4-8 characters, please re-enter"
		},
		{
			ele:"#c_passWord",
			datatype:"*",
			recheck:"passWord",
			mullmsg:"*Please enter confirm password!",
			errormsg:"*Passwords do not match, please re-enter!"
		},
		{
			ele:"#name",
		    datatype:"*2-15",
		    nullmsg:"Please enter name!",
		    errormsg:"Name is 2-15 characters, please re-enter!"
		},
		{
			ele:"#sex",
		    datatype:"*",
		    nullmsg:"Please select gender!",
		    errormsg:"Please select gender!"
		},
		{
			ele:"#age",
		    datatype:"n1-2",
		    nullmsg:"Please enter age",
		    errormsg:"Age is 1-2 digits, please re-enter!"
		},
		{
			ele:"#tell",
		    datatype:"/^13[0-9]{9}$|17[0-9]{9}$|14[0-9]{9}&|15[0-9]{9}$|18[0-9]{9}$/",
		    nullmsg:"Please enter phone number",
		    errormsg:"Phone number is incorrect, please re-enter!"
		},
		{
			ele:"#address",
		    datatype:"*1-100",
		    nullmsg:"Please enter address!",
		    errormsg:"Address is too long (100)!"
		}

	]);
	
});