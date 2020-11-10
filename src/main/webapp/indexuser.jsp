<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>我的南航</title>
    <script type="text/javascript" src="../user/Index.js"></script>
    <style type="text/css">
        @import url(css/news.css);

        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        body {
            font-family: sans-serif, Verdana, Helvetica, Arial;
        }

        #main {
            padding-left: 0;
        }

        .kv-item {
            padding-left: 100px;
            padding-bottom: 20px;
        }

        .kv-label {
            display: inline;
            height: 28px;
            line-height: 28px;
            margin-left: -100px;
            float: left;
            text-align: left;
            width: 100px;
        }

        .text-align {
            border: 1px solid #474E63;
            color: #0A1844;
            height: 26px;
            line-height: 26px;
            padding: 0 2px;
            width: 177px;
            text-align: left;
        }

        #submit {
            margin-left: 80px;
            border: 1px solid #474E63;
            background: #E61156;
            height: 26px;
            font-weight: bold;
            color: #FFFFFF;
            width: 150px;
        }

        #reset {
            border: 1px solid #474E63;
            height: 26px;
            font-weight: bold;
        }

        h1 {

            width: 920px;
            background: #008acb;
            color: #FFFFFF;
        }

        .div {
            margin: auto;
            padding-left: 200px;
        }

        .my-csair {
            background: #0093d0;
            color: #FFF;
            font-size: 22px;
            padding-left: 30px;
            height: 45px;
            line-height: 45px;
            margin-bottom: 15px;
            text-align: left;
        }

        .wrap {
            width: 260px;
            height: 100%;

        }

        .nav {
            width: 250px;
            margin: 10px 5px 0;
        }

        .div2 {
            position: absolute;
            left: 730px;
            top: 315px;
            display: none;
            width: 925px;
            height: 468px;

            color: #000;
            text-align: center;
            box-shadow: 1px 1px 2px #ccc;


        }

        .div3 {
            position: absolute;
            left: 730px;
            top: 315px;
            display: none;
            width: 925px;
            height: 468px;

            color: #000;
            text-align: center;
            box-shadow: 1px 1px 2px #ccc;


        }

        .list {
            margin-bottom: 5px;
        }

        .list h2 {
            position: relative;
            padding: 15px 0;
            background-color: #3889d4;
            text-align: center;
            font-size: 16px;
            color: #fff;
            transition: .5s;
        }

        .list h2.on {
            background-color: #393c4a;
        }

        .list i {
            position: absolute;
            right: 10px;
            top: 16px;
            border: 8px solid transparent;
            border-left-color: #393c4a; /*triangle*/
            transform: rotate(0deg);
            transform-origin: 1px 8px;
            transition: .5s;
        }

        .list i.on {
            transform: rotate(90deg);
        }

        .hide {
            overflow: hidden;
            height: 0;
            transition: .5s;
        }

        .hide h5 {
            padding: 10px 0;
            background-color: #fff;
            text-align: center;
            color: #000;
            border-bottom: #42495d;
        }


    </style>

    <script src="https://code.jquery.com/jquery-1.8.2.min.js"
            integrity="sha256-9VTS8JJyxvcUR+v+RTLTsd0ZWbzmafmlzMmeZO9RFyk=" crossorigin="anonymous"></script>

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
            <a href="rules.jsp">购票服务</a>
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
        <c:if test="${empty sessionScope.user}">
            <span><button class="logindropbt" onclick="loginBtn()">登录</button></span>
            <span><button class="logindropbt" onclick="registerBtn()">注册</button></span>
        </c:if>
    </div>
    <hr>

</div>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div class="div">

    <div class="my-csair">我的南航</div>


    <div class="wrap">


        <div class="nav">
            <ul>


                <li class="list">

                    <h2><i></i>订单管理</h2>
                    <div class="hide">

                        <h5><a href="queryOrderByUserId?userId=${sessionScope.user.userId}" target="menuFrame" >机票管理</a></h5>
                        <h5>申诉单</h5>
                        <h5>酒店订单</h5>
                        <h5>租车订单</h5>
                        <h5>租车订单</h5>
                        <h5>签证管理</h5>


                    </div>


                    <h1></h1>

                </li>
                <li class="list">
                    <h2><i></i>南航账户</h2>
                    <div class="hide">
                        <h5>优惠卷</h5>
                        <h5>免票卷</h5>
                        <h5>充值卡</h5>

                    </div>

                </li>

                <li>

                </li>


                <li class="list">
                    <h2><i></i>里程管理</h2>
                    <div class="hide">
                        <h5>汇总查询</h5>
                        <h5>详细记录查询</h5>
                        <h5>里程兑换</h5>
                        <h5>南航商城</h5>

                    </div>
                </li>
                <li class="list">
                    <h2><i></i>会员服务</h2>
                    <div class="hide">
                        <h5>我的会员卡</h5>
                        <h5>服务记录</h5>
                        <h5>服务定制</h5>
                        <h5>促销注册</h5>

                    </div>
                </li>
                <li class="list">
                    <h2><i></i>个人中心</h2>
                    <div class="hide">
                        <h5><a href="changeUser.jsp" target="menuFrame">基本信息</a></h5>
                    </div>


            </ul>
        </div>

    </div>
    <div class="div2" style="background: rgb(255, 255, 255); display: block;">


        <!--  <div id="page_content">-->
        <iframe id="menuFrame" name="menuFrame" style="overflow:visible;" scrolling="yes" frameborder="no" width="100%"
                height="100%; float:left" ;left: 730px;
                top: 315px;>
        </iframe>

    </div>


</div>
<script>
    (function () {
        var oList = document.querySelectorAll('.list h2'),
            oHide = document.querySelectorAll('.hide'),
            oIcon = document.querySelectorAll('.list i'),
            lastIndex = 0;
        for (var i = 0; i < oList.length; i++) {
            oList[i].index = i;//自定义属性
            oList[i].isClick = false;
            oList[i].initHeight = oHide[i].clientHeight;
            oHide[i].style.height = '0';
            oList[i].onclick = function () {
                if (this.isClick) {
                    oHide[this.index].style.height = '0';
                    oIcon[this.index].className = '';
                    oList[this.index].className = '';
                    oList[this.index].isClick = false;
                } else {
                    oHide[lastIndex].style.height = '0';
                    oIcon[lastIndex].className = '';
                    oList[lastIndex].className = '';
                    oHide[this.index].style.height = '220px';
                    oIcon[this.index].className = 'on';
                    oList[this.index].className = 'on';
                    oList[lastIndex].isClick = false;
                    oList[this.index].isClick = true;
                    lastIndex = this.index;
                }
            }
        }
    })();
</script>
<script>
    //鼠标移入区域时
    $('.left-nav .right ul li').mouseenter(function () {
        $(this).css({'background': '#eee'});
        $(this).find('div').css({'background': '#fff'}).show();//显示div
        $('.div2').not($(this).find('div')).hide();
        $('.left-nav .right ul li').not($(this)).css({'background': '#fff'});
    });
    //鼠标移除区域时
    $('.left-nav .right ul li').mouseleave(function () {
        $(this).find('div').hide();//隐藏div
        $(this).css({'background': '#fff'})
    });
</script>
<script type="text/javascript">
    function loginBtn() {
        parent.location.href = "${pageContext.request.contextPath}/login.jsp";

    }
    function registerBtn() {
        parent.location.href = "${pageContext.request.contextPath}/registerUser.jsp";
    }
    function cancellationBtn() {
        parent.location.href="${pageContext.request.contextPath}/remove"

    }
</script>

</body>
</html>
