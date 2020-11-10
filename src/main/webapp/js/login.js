document.write("<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.7.2.js'></script>");
function checkUser(){
	//获取用户的值
	var userName=document.getElementById("userName").value;
	if(userName==undefined || userName==null||userName==""){
		alert("用户名不能为空");
		return;
	}
	//获取密码
	var pwd=document.getElementById("pwdId").value;
	if(pwd==undefined || pwd==null||pwd==""){
		alert("密码不能为空");
		return;
	}
	document.forms[0].submit()//提交form表单数据
}
function checkRightUser() {
	var username=document.getElementById("username").value;
	var uid = document.getElementById("uid").value;
	var password = document.getElementById("password").value;
	var password2=document.getElementById("password2").value;
	var birth = document.getElementById("birth").value;
	var email = document.getElementById("email").value;
	var phone=document.getElementById("phone").value;

	var mobilereg = /^1[23456789]\d{9}$/;
	var emailreg = /^[a-zA-Z0-9]+@([a-zA-Z0-9]+(\.[a-zA-Z0-9]+))+$/;
	if (username==undefined||username==null||username==""){
		alert("用户名不能为空");
		return false;
	}
	if (uid==undefined||uid==null||uid==""){
		alert("身份证号不能为空");
		return false;
	}
	if (password==undefined||password==null||password==""){
		alert("密码不能为空");
		return false;
	}
	if (password2==undefined||password2==null||password2==""){
		alert("密码不能为空");
		return false;
	}
	if (password!=password2){
		alert("两次密码不一致");
		return false;
	}
	if (birth==undefined||birth==null||birth==""){
		alert("生日不能为空");
		return false;
	}
	if (!mobilereg.test(phone)){
		alert("请输入正确手机号");
		return false;
	}
	if (email==""||email==undefined||email==null){

		return true;
	}else if (!emailreg.test(email)) {
		alert("请输入正确的邮箱地址");
		return false;
	}
	return true;
}