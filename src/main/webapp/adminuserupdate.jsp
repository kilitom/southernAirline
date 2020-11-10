<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript">
        function toValue() {
            var username=document.getElementById("username").value;
            var uid = document.getElementById("uid").value;
            var password = document.getElementById("password").value;
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
    </script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="indexadmin.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="indexadmin.jsp">首页</a></li>
                <li><a href="#" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">退出</a></li>
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
                    <a href="indexadmin.jsp"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="adminuserDesign.jsp"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="adminflightDesign.jsp"><i class="icon-font">&#xe005;</i>航班管理</a></li>
                        <li><a href="adminorderDesign.jsp"><i class="icon-font">&#xe006;</i>订单管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="indexadmin.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="adminuserDesign.jsp">用户管理</a><span class="crumb-step">&gt;</span><span>修改用户</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form name="user" action="modifyUser"  method="post"  onsubmit="return toValue()">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th width="120"><i class="require-red"></i>用户ID：</th>
                                <td>
                                    <input name="userId" id="userId" class="common-text required" readonly="readonly" size="50" value="${sessionScope.user.userId}" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th width="120"><i class="require-red"></i>用户姓名：</th>
                                <td><input name="username" id="username" class="common-text" size="50"  type="text" value="${sessionScope.user.username}/${sessionScope.user.birth}"></td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>用户密码：</th>
                                <td>
                                    <input name="password" id="password" class="common-text required"  size="50" value="${sessionScope.user.password}" type="password">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>用户性别：</th>
                                <td>
                                    <input name="sex" id="sex" class="common-text required" size="50" value="${sessionScope.user.sex}" type="text">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>电话：</th>
                                <td>
                                    <input name="phone" id="phone" class="common-text required" size="50" value="${sessionScope.user.phone}" type="tel">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>身份证号：</th>
                                <td>
                                    <input name="uid" id="uid" class="common-text required" size="50" value="${sessionScope.user.uid}" type="text">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>邮箱：</th>
                                <td>
                                    <input name="email" id="email" class="common-text required" size="50" value="${sessionScope.user.email}" type="email">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>生日：</th>
                                <td>
                                    <input name="birth" id="birth" class="common-text required" size="50" value="${sessionScope.user.birth}" type="date">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>