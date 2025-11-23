$(function(){
	var form=$("#myForm").Validform({
		tiptype:2,//validform初始化
	});
	form.addRule([
		{
			ele:"#passWord",
			datatype:"s4-8",
			nullmsg:"Please enter password",
			errormsg:"Password is 4-8 characters, please re-enter!"
		},
		{
			ele:"#c_passWord",
			datatype:"*",
			recheck:"passWord",
			mullmsg:"Please enter confirm password!",
			errormsg:"Passwords do not match, please re-enter!"
		},
		{
			ele:"#name",
			datatype:"s2-8",
			mullmsg:"Please enter name!",
			errormsg:"Name is 2-8 characters, please re-enter!"
		}
	]);
	
});

			