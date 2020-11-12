<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/cityselector.css">
    <title></title>
    <style>
        *{
            margin: 0;
            padding: 0
        }
        .div{
            width: 100%;
            height:500px;
            background-repeat: no-repeat;
            background-image: url("images/1.jpg");
            animation:frams 7s infinite;
        }
        img{vertical-align: bottom}
        @keyframes frams {
            0%{
                background-image: url("images/1.jpg");background-size: 100% 100%;background-repeat: no-repeat
            }
            25%{
                background-image: url("images/2.jpg");background-size: 100% 100%;background-repeat: no-repeat
            }
            50%{
                background-image: url("images/3.jpg");background-size: 100% 100%;background-repeat: no-repeat
            }
            75%{
                background-image: url("images/4.jpg");background-size: 100% 100%;background-repeat: no-repeat
            }
            100%{
                background-image: url("images/1.jpg");background-size: 100% 100%;background-repeat: no-repeat
            }
        }
    </style>
</head>

<body>
<div id="header">
    <a href="index.jsp"><img alt="brand" src="images/sky.png"></a>
</div>

<div id="menubar" style=" height: 70px;">



    <div class="dropdown">
        <a href="index.jsp"><button class="dropbt">首页</button></a>
    </div>
    <div class="dropdown">
        <button class="dropbt">预定管理 </button>
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

<div class="div"></div>

<div class="div2">
    <div id=tabbar>
        <input id="tab1" type="button" onclick="click1()" value="机票预定">
        <input id="tab2" type="button" onclick="click2()" value="航班动态">
    </div>
    <div id=tabcontent>
        <div id="tab1_content">
            <div id="tabbar1">
                <input type="button" value="单程">
            </div>
            <form action="queryFlightInformation" method="get">
                <table id="tab_content1" class="tab_content">
                    <tr><td>出发城市</td><td>到达城市</td><td>出发时间</td></tr>
                    <tr>
                        <td><input id="form1_citySelect1" type="text" name="origin" required></td>
                        <td><input id="form1_citySelect2" type="text" name="destination" required></td>
                        <td><input id="form1_calendar" type="date" name="originTime" required></td>
                    </tr>
                </table>
                <input id="ordeTicket" type="submit" value="查询机票">
            </form>
        </div>

        <div id="tab2_content">

            <div id="tabbar2">
                <input id="tab2_1" type="button" onclick="click3()" value="按航班路线">
                <input id="tab2_2" type="button" onclick="click4()" value="按航班号">
            </div>

            <div id="tab2_content_1">
                <form action="queryFlightInformation" name="flight">
                    <table id="tab_content2" class="tab_content">
                        <tr><td>出发城市</td><td>到达城市</td><td>出发时间</td></tr>
                        <tr>
                            <td><input id="form2_citySelect1" type="text" name="origin" required></td>
                            <td><input id="form2_citySelect2" type="text" name="destination" required></td>
                            <td><input id="form2_calendar" type="date" name="originTime" required></td>
                        </tr>
                    </table>
                    <input class="queryFlight" type="submit" value="查询航班">
                </form>
            </div>

            <div id="tab2_content_2">
                <form action="flightList.jsp">
                    <table id="tab_content3" class="tab_content">
                        <tr><td>航班号</td><td>出发时间</td></tr>
                        <tr>
                            <td><input id="flight" type="text" name="flightID" required placeholder="例如：MF3780"></td>
                            <td><input id="form3_calendar" type="text" name="exFlightDate" required></td>
                        </tr>
                    </table>
                    <input class="queryFlight" type="submit"  value="查询航班">
                </form>
            </div>
        </div>
    </div>
</div>



</body>

<script type="text/javascript" src="js/cityselect.js"></script>
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
    function click1(){
        document.getElementById("tab1").style.backgroundColor="#008acd";
        document.getElementById("tab2").style.backgroundColor="white";
        document.getElementById("tab1_content").style.display="block";
        document.getElementById("tab2_content").style.display="none"
    }
    function click2(){
        document.getElementById("tab2").style.backgroundColor="#008acd";
        document.getElementById("tab1").style.backgroundColor="white";
        document.getElementById("tab2_content").style.display="block";
        document.getElementById("tab1_content").style.display="none"
    }
    var test=new Vcity.CitySelector({input:'form1_citySelect1'});
    var test=new Vcity.CitySelector({input:'form1_citySelect2'});

    var test=new Vcity.CitySelector({input:'form2_citySelect1'});
    var test=new Vcity.CitySelector({input:'form2_citySelect2'});

    function click3(){
        document.getElementById("tab2_content_1").style.display="block";
        document.getElementById("tab2_content_2").style.display="none"
    }
    function click4(){
        document.getElementById("tab2_content_2").style.display="block";
        document.getElementById("tab2_content_1").style.display="none"
    }
</script>
<script src="laydate/laydate.js">
</script>
<script type="text/javascript">
    lay('#version').html('-v'+ laydate.v);
    //执行一个laydate实例
    laydate.render({
        elem: '#form1_calendar', //指定元素
        min:0,
    });
    laydate.render({
        elem: '#form2_calendar', //指定元素
        min:-1,
        max:7
    });
    laydate.render({
        elem: '#form3_calendar', //指定元素
        min:-1,
        max:7
    });
</script>
</html>
