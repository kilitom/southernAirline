<%@ taglib prefix="font-size" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>预定信息</title>
    <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <style type="text/css">
        @import "css/other.css";
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

        #addPassengers {
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

            width: 800px;
            background: #008acb;
            color: #FFFFFF;
        }

        .div {
            margin: auto;
            padding-left: 135px;
        }

    </style>
    <script type="text/javascript">

        //判断前三个表单元素（用户名、密码、确认密码是否为空）
        function check(Form) {
            var check = true;
            var flag = 0;
            for (i = 0; i < 3; i++) {
                if (Form.elements[i].value == "") {
                    alert(Form.elements[i].title + "不能为空！");
                    Form.elements[i].focus();
                    check = false;
                    return false;
                }
                //判断两次输入的密码是否相同
                if (i == 2)
                    if (Form.pwd.value != Form.repwd.value) {
                        alert("两次输入密码不同，请重新输入！");
                        Form.repwd.value = "";
                        Form.pwd.value = "";
                        //Form.pwd.focus();
                        i = i - 2;
                        continue;
                    }
            }
            return check;
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
    <script type="text/javascript" src="js/jquery-1.7.2.js">


        function generateOrder() {
            var username = arrUsername.join("/")
            var uid = arrUid.join("/")
            let userId =${sessionScope.user.userId};
            let airId =${sessionScope.flight.airId};
            let originTime =${sessionScope.flight.originTime};
            let destinationTime =${sessionScope.flight.destinationTime};
            let price =${sessionScope.flight.price};
            let state = "未支付";
            $.ajax({
                type: "POST",
                url: "insertOrder",
                traditional: true,
                data: {
                    "username": username,
                    "uid": uid,
                    "userId": userId,
                    "airId": airId,
                    "originTime": originTime,
                    "destinationTime": destinationTime,
                    "price": price,
                    "state": state
                },
                success: function (data) {
                    var jsonObj = data;
                    alert(jsonObj.msg);
                    window.location.href = ""
                }
            });

        }


    </script>
    <script type="text/javascript">        /* 增加tr行 */
    var num = 1;        //全局变量 默认为一组控件
    function add() {                    /* 增加人员行 */
        num++;
        var str = String.fromCharCode(64 + num);
        var $tr = $("<tr class=\"addPerson\"><td><span class=\"span_none\"> " + str + ": &nbsp;&nbsp; </span><input type=\"text\" maxlength=\"10\"/></td><td><input type=\"text\" maxlength=\"18\"/></td><td><a href=\"#\" class=\"del\">删除</a></td></tr>");
        var $parent;
        if (num == 1) {
            $parent = $("table tr.addPersonTh");   //num默认为1 如果当前没元素就在标题后添加
        } else if (num >= 4) {
            alert("最多输入三个乘客");
            num--;
            stop();
        } else {
            $parent = $("table tr:.addPerson:eq(" + (num - 2) + ")");   //num默认为1 进入add事件首先将num+1，所以此处要获取在哪里添加元素需-2
        }
        $parent.after($tr);
        init();
    }

    var arrUsername = [];
    var arrUid = [];

    function query() {          /* 获取人员行 */

        var m = -1;
        for (var i = 0; i < num; i++) {
            for (var j = 0; j < 2; j++) {
                var l = 0;
                var k = 1;
                m++;
                arrUsername[i] = $("table tr:.addPerson:eq(" + i + ") td:eq(" + l + ") :text").val();
                arrUid[i] = $("table tr:.addPerson:eq(" + i + ") td:eq(" + k + ") :text").val();
                // alert("第" + (i + 1) + "行第" + (j + 1) + "的值是：" + $("table tr:.addPerson:eq(" + i + ") td:eq(" + j + ") :text").val());
            }
        }
        // console.log(arrUsername);
        // console.log(arrUid);
    }

    function init() {           /* 删除人员行 */
        $("table tr td a.del").unbind("click").click(function () {
            $(this).parent().parent().remove();
            for (var i = 0; i < num - 1; i++) {
                var str = String.fromCharCode(65 + i) + ":";
                $("table tr:.addPerson:eq(" + i + ") span").html(str);
            }
            num--;
        });
    }
    </script>
    <!--JS代码结束-->
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
        <c:if test="${empty sessionScope.user.username}">
            <span><button class="logindropbt" onclick="loginBtn()">登录</button></span>
            <span><button class="logindropbt" onclick="registerBtn()">注册</button></span>
        </c:if>
    </div>
    <hr>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="wrap">
    <div class="cont">
        <ul class="nav">
            <li>航班信息</li>
            <li>出发地</li>
            <li>到达地</li>
            <li>起飞时间</li>
            <li>到达时间</li>
            <li>价格</li>
        </ul>
        <div class="flight">
            <ul>
                <li>${sessionScope.flight.airId}</li>
                <li>${sessionScope.flight.origin}</li>
                <li>${sessionScope.flight.destination}</li>
                <li>${sessionScope.flight.originTime}</li>
                <li>${sessionScope.flight.destinationTime}</li>
                <li>${sessionScope.flight.price}</li>
            </ul>
        </div>
    </div>
</div>
<div class="div">
    <div id="main" align="left">
        <form name="order" id="form_edu" onSubmit="generateOrder()">
            <div class="div">
                <h1 align="left" style="font-size: 26px">乘机人信息 </h1>
                　　
                <table id="tabConten" cellpadding="10" cellspacing="0">
                    <tr>
                        <td style=" border-left-width:0px;" colspan="5">
                            <input type="button" value="添加人员" style="margin-right:0px;" onclick="add()"
                                   class="btn btn-info"/>
                            <input id="btn_save" type="submit" value="提交" class="btn btn-success" onclick="query()"/>
                        </td>
                    </tr>
                    <tr class="addPersonTh">
                        <td class="tdFontW tdCos_01"><span style="color: #F00" class="tdAlignL">*</span>&nbsp;姓名</td>
                        <td class="tdFontW tdCos_04"><span style="color: #F00" class="tdAlignL">*</span>&nbsp;证件号码</td>
                        <td class="tdFontW tdCos_05">操作</td>
                    </tr>
                    <tr class="addPerson">
                        <td>
                            <span class="span_none">A: &nbsp;&nbsp; </span>
                            <input type="text" maxlength="10"/>
                        </td>
                        <td><input type="text" maxlength="18"/></td>
                        <td><a href="#" class="del">删除</a></td>
                    </tr>
                </table>
            </div>
        </form>
        <div>
            <br/>
        </div>
    </div>
    <div class="footer" align="left">
        Copyright(C)1997-2020 中国南方航空股份有限公司 版权所有 粤ICP备05053330号
    </div>
</div>
</body>
</html>
