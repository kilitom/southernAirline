<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <title></title>
    <style type="text/css">
        /* 清除默认样式 同时给所有元素设置样式 */
        * {
            margin: 0;
            padding: 0;
            font-family: "Open Sans Light";
            letter-spacing: .07em; /* 字母间隔大小 */
        }
        /* 因为下面想设置body、wrap区域的宽高为整个窗口高度 所以得先设置html也得这样设置
             这里得注意 body 和 html 的区别
             1.如果body及其子元素想设置高度为窗口高度 那么得设置h向下面这样设置html

             2.在body里面设置background-color时，发现整个窗口都会变了颜色 这容易产生错觉： body == 窗口
        */
        html {
            height: 100%;
        }
        body {
            height: 100%;
        }
        /* 继承窗口高度 设置一个渐变色向右渐变  渐变色推荐网站：https://www.sj520.cn/tools/jianbian/  应该有你喜欢的吧 */
        .wrap {
            height: 100%;
            background-image: linear-gradient(to right, #30cfd0, #330867);
        }
        /* 这个是登录区域 */
        .login-wrap {
            width: 200px;
            height: 400px;
            background-color: rgba(170, 170, 255, 0.3);
            /* 居中开始 */
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* 居中结束 */
            border-radius: 10px;
            padding: 0 50px; /* 左右留出空余 */
        }
        /* 给最上面的Login这个标题设置样式 */
        .login-title {
            font-size: 25px;
            text-align: center;
            line-height: 100px;
            color: #fff;
            font-weight: bold;
        }
        /* 输入设置样式 */
        .login-form .login-input{
            display: block; /* input 标签是行内元素 */
            width: 100%;
            border: 0;
            border-bottom: 1px solid #ccc;
            padding: 10px 0 10px 10px;
            margin-bottom: 20px;
            outline: none; /* 输入框边框去掉 */
            background-color: transparent; /* 透明色 */
        }
        .login-form .login-input::placeholder {
            text-transform: uppercase; /* 设置placeholder内容的大小写 */
            color: #bdbdbd;
        }
        /* 给登录提交按钮设置样式 */
        .login-form .login-submit {
            width: 100%;
            line-height: 30px;
            border: 0;
            border-radius: 3px;
            margin-top: 20px;
            background-image: linear-gradient(to right, #5ee7df, #b490ca);
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            color: #aa00ff;
            font-weight: bold;
        }
        /* tip 区域样式 */
        .tip {
            margin-top: 15px;
        }
        .tip a {
            padding-left: 110px;
            text-decoration: none;
            color: #7d3ebc;
        }
    </style>
</head>
<body>

<div class="wrap">
    <h1 align="center" style="color:#FFF; font-size:36px">中国南方航空后台登录系统</h1>
    <div class="login-wrap">
        <div class="login-title">
            登录
        </div>
        <div class="login-form">
            <form action="loginAdmin" method="post">
            <input type="text" name="name" placeholder="username" class="login-input">
            <input type="password" name="password" placeholder="password" class="login-input">
            <input type="submit" name="login" value="登录" class="login-submit"/>
            </form>
        </div>
    </div>
</div>
</html>
