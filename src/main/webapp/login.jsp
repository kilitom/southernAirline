<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style>
        .pop{
            position: absolute;
            top: 143px;
            left: 230px;
        }
        .login{
            position: relative;
        }
    </style>
    <meta charset="UTF-8">
    <!-- 引入外部css文件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <title>登录页面</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" >
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
    </script>
</head>

<body>
<!-- 头部div logo 登录注册，-->
<div class="top">
    <!-- 设置一个中间容器：一般是宽度1200，1000 -->
    <div class="container">
        <div class="topLeft">
            <img src="${pageContext.request.contextPath}/images/sky.png">
        </div>
        <div class="topRight">
            <span><a href="registerUser.jsp">立即注册</a></span>|<span><a href="#">需要帮助</a></span>
        </div>
    </div>
</div>
<!-- 清除浮动样式 -->
<div class="clean"></div>

<!-- 中间体:主题内容 -->
<div class="middle">
    <!-- 设置一个中间容器：一般是宽度1200，1000 -->
    <div class="container">
        <div class="login" >
            <div class="loginContent">
                <h3>登录</h3>
                <form action="loginUser" method="post">
                    <div class="it">
                        <!-- 小图标-->
                        <i></i><!-- 设计规范，icon缩写，默认值0，0-->
                        <!-- 文本框-->
                        <input type="text" placeholder="用户名或邮箱" class="inputTxt" id="userName" name="username">
                    </div>
                    <div class="it">
                        <!-- 小图标-->
                        <i  class="pwd"></i>
                        <!-- 文本框-->
                        <input type="password" placeholder="请输入密码" class="inputTxt" id="pwdId" name="password">
                    </div>
                    <div class="it">
                        <i></i>
                        <input type="text" placeholder="请输入验证码" class="inputTxt" id="vcode" style="width: 150px" name="vcode">
                        <img src="checkCode" alt="" width="100" height="38"onclick="this.src=this.src+'?'" class="pop">
                    </div>
                    <span style="color: red">${msg}</span>
                    <div class="mt20">
                        <input type="checkbox" class="topLeft"><span class="topLeft">记住密码</span>
                        <a href="password.jsp" class="topRight">找回密码或者账户</a>
                    </div>
                    <div class="clean"></div>
                    <!-- 登录按钮-->
                    <div class="mt20">
                        <input type="button" value="登录" class="btn" onClick="checkUser()">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 底部信息 ：版权号，协议，公司联系方式-->
<div class="footer">
    <!-- 设置一个中间容器：一般是宽度1200，1000 -->
    <div class="container2">
        <div class="footfont" >关于南航 | 投资者关系 | 预订须知 | 常见问题 | 联系我们 | “十分”关爱基金会</div>
        <hr size="1" color="gray">
        <div class="footfont"><span>Copyright&copy; 2012-2020 Tencent All Rights Reserves</span></div>
    </div>
</div>
</div>
</body>
</html>
