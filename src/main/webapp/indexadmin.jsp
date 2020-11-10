<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="indexadmin.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="indexadmin.jsp">首页</a></li>
                <li><a href="index.jsp" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>${sessionScope.adminName}</li>
                <li><a href="removeAdmin">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="adminuserDesign.jsp"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="adminflyDesign.jsp"><i class="icon-font">&#xe005;</i>航班管理</a></li>
                        <li><a href="adminorderDesign.jsp"><i class="icon-font">&#xe006;</i>订单管理</a></li>

                    </ul>
                </li>

            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i></div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="adminuserinsert.jsp"><i class="icon-font">&#xe001;</i>新增用户</a>
                    <a href="adminflyInsert.jsp"><i class="icon-font">&#xe005;</i>新增航班</a>
                    <a href="adminorderInser.jsp"><i class="icon-font">&#xe005;</i>新增订单</a>
                </div>
            </div>
        </div>
       
        <div class="result-wrap">
       >
            <div class="result-content">
                <ul class="sys-info-list">
 
                </ul>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>