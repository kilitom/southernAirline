<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="indexAdmin.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="indexAdmin.jsp">首页</a></li>
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
                    <a href="indexAdmin.jsp"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="userDesign.jsp"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="flightDesign.jsp"><i class="icon-font">&#xe005;</i>航班管理</a></li>
                        <li><a href="orderDesign.jsp"><i class="icon-font">&#xe006;</i>订单管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="flightDesign.jsp">航班管理</a><span class="crumb-step">&gt;</span><span>新增航班</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="updateFlight" method="post" name="flight">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th width="120"><i class="require-red"></i>航班id：</th>
                                <td>
                                    <input class="common-text required" readonly id="flightId" name="flightId" size="50" value="${sessionScope.flight.flightId}" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th width="120"><i class="require-red"></i>出发地：</th>
                                <td><input class="common-text" id="origin" name="origin" size="50" value="${sessionScope.flight.origin}" type="text"></td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>目的地：</th>
                                <td>
                                    <input class="common-text required" id="destination" name="destination" size="50" value="${sessionScope.flight.destination}" type="text">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>出发时间：</th>
                                <td>
                                    <input class="common-text required" id="originTime" name="originTime" size="50" value="${sessionScope.flight.originTime}" type="text">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>到达时间：</th>
                                <td>
                                    <input class="common-text required" id="destinationTime" name="destinationTime" size="50" value="${sessionScope.flight.destinationTime}" type="text">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>价格：</th>
                                <td>
                                    <input class="common-text required" id="price" name="price" size="50" value="${sessionScope.flight.price}" type="text">
                                </td>
                            </tr>
                             <tr>
                                <th width="120"><i class="require-red"></i>航班号：</th>
                                <td>
                                    <input class="common-text required" id="airId" name="airId" size="50" value="${sessionScope.flight.airId}" type="text">
                                </td>
                            </tr>

                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
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