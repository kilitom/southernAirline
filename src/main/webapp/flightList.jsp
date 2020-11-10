<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>航班查询</title>
    <link rel="stylesheet" href="css/other.css">
    <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        function reserve(){
            parent.location.href= "${pageContext.request.contextPath}/orderinfo.jsp";
        }

        function loginBtn() {
            parent.location.href = "${pageContext.request.contextPath}/login.jsp";

        }

        function registerBtn() {
            parent.location.href = "${pageContext.request.contextPath}/registerUser.jsp";
        }

        function cancellationBtn() {
            parent.location.href = "${pageContext.request.contextPath}/remove"

        }
    </script>

</head>

<body>
<div id="header">
    <a href="index.jsp"><img alt="brand" src="images/sky.png"></a>
</div>

<div id="menubar">
    <div class="dropdown">
        <a href="index.jsp">
            <button class="dropbt">首页</button>
        </a>
    </div>
    <div class="dropdown">
        <button class="dropbt">预定管理</button>
        <div class="content">
            <a href="https://b2c.csair.com/B2C40/newTrips/static/main/page/search/index.html">机票预定</a>
            <a href="https://www.csair.com/cn/bookings/value_add_service/hotel/">旅游预定</a>
            <a href="https://b2c.csair.com/B2C40/modules/bookingGroup/manage/ticket_booking.html?lang=cn">团队商旅</a>
            <a href="https://b2c.csair.com/B2C40/modules/bookingnew/mileage/search.html">机票兑换</a>
            <a href="https://www.csair.com/cn/bookings/enterprise/corporate_travel/index.shtml">企业商旅</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbt">南航会员</button>
        <div class="content">
            <a href="#">我的账户</a>
            <a href="#">我的订单</a>
            <a href="#">积分累计</a>
            <a href="#">积分兑换</a>
            <a href="#">会员权益</a>
            <a href="#">优惠专区</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbt">出行帮助</button>
        <div class="content">
            <a href="../dwlogin/rules.jsp">购票服务</a>
            <a href="https://www.csair.com/cn/tourguide/booking/orders/order/lvkexuzhi/guonei/index.shtml">预订须知</a>
            <a href="#">出行准备</a>
            <a href="#">地面服务</a>
            <a href="#">客舱服务</a>
            <a href="#">运输规定</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbt">优惠信息</button>
        <div class="content">
            <a href="https://www.csair.com/cn/favourable/discount_tickets_domestic/">优惠机票</a>
            <a href="https://www.csair.com/cn/favourable/mileage_promotion/">机票促销</a>
            <a href="https://www.csair.com/cn/favourable/joint_promotion/">精彩活动</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbt">NDC合作</button>
        <div class="content">
            <a href="#">NDC简介</a>
            <a href="#">api接口</a>
            <a href="#">申请合作</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbt">明珠俱乐部</button>
        <div class="content">
            <a href="#">账户管理</a>
            <a href="#">里程兑换</a>
            <a href="#">里程累计</a>
        </div>
    </div>

    <div class="rightlogin">
        <c:if test="${not empty sessionScope.user}">
            <span><a href="indexuser.jsp">${sessionScope.user.username}</a></span>
            <span><button class="logindropbt" onclick="cancellationBtn()">注销</button></span>
        </c:if>
        <c:if test="${empty sessionScope.user.username}">
            <span><button class="logindropbt" onclick="loginBtn()">登录</button></span>
            <span><button class="logindropbt" onclick="registerBtn()">注册</button></span>
        </c:if>
    </div>
    <hr>

</div>

<div class="wrap">
    <header>
        <form action="queryFlightInformation" method="get">


            <span>
                <li>
                    <span>出发城市:</span><input name="origin" type="text" style="width:100px; height:20px;">
                    <span>到达城市:</span><input name="destination" type="text" style="width:100px; height:20px;">
                    <span>出发日期:</span><input name="originTime" type="date" style="width:100px; height:20px;">
                    <input type="submit" value="立即查询">
                </li>
            </span>
        </form>
    </header>
    <div class="cont">
        <ul class="nav">
            <li>航班信息</li>
            <li>起飞地</li>
            <li>到达地</li>
            <li>起飞时间</li>
            <li>到达时间</li>
            <li>价格</li>
            <li>预定</li>
        </ul>
        <c:forEach items="${flights}" var="flight">
            <div class="flight">
                <ul>
                    <li>${flight.airId}</li>
                    <li>${flight.origin}</li>
                    <li>${flight.destination}</li>
                    <li>${flight.originTime}</li>
                    <li>${flight.destinationTime}</li>
                    <li>${flight.price}</li>
                    <li>
                        <button type="submit" value="预定" onclick="reserve()">预定</button>
                    </li>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
</body>

</html>