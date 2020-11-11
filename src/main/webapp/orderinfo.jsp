<%@ taglib prefix="font-size" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>预定信息</title>
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
        #addPassengers{
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
            padding-left: 300px;
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
            parent.location.href="${pageContext.request.contextPath}/remove"

        }
        function addck(){
            parent.location.href= "${pageContext.request.contextPath}/alipay.trade.page.pay.jsp";
        }


        //新增乘客
        var collegediv =1;
        var collegename=1;
        //生成大学教育div
        function addck(strid){
            var o=document.getElementById(strid);
            var div=document.createElement("div");
            div.id = "chengke"+ collegediv;
            var deletediv=document.createElement("div");
            //拿到删除按钮的id并加1
            var deletename=o.childNodes.item(4).id+1;
            <!--div.innerHTML=o.innerHTML.replace(/\{0\}/ig,a);-->
            //将现有的divhtml赋值给新创建的div
            div.innerHTML=o.innerHTML;
            document.getElementById("parentpoint").appendChild(div);
            //给新的div的删除按钮赋值（动态加1）
            div.childNodes.item(4).id=deletename;
            collegediv++;
            collegename++;
        }
        //动态删除大学教育经历div
        function deleteck(obj)
        {
            <!--var strid=obj.name;-->
            //获取本删除按钮的id值，并创建对象
            var strid=obj.id;
            var o=document.getElementById(strid);
            var z=o.parentElement;
            <!--var o=document.getElementsByTagName(strid)[4].parentElement;-->
            //找到这个删除按钮对应的父div的值
            <!--var stridone=document.getElementsByName(strid)[0].parentNode.id;-->
            var stridone=z.id;
            //判断本id对应的值并删除
            var my = document.getElementById(stridone);
            if (my != null){
                my.parentNode.removeChild(my);}
            <!--window.location.reload(); -->
        }

    </script>
    <!--JS代码结束-->
</head>


<body>
<div id="header">
    <a href="index.jsp"><img alt="brand" src="images/sky.png"></a>
</div>

<div id="menubar" STYLE=" height: 90px;">


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
        <button class="dropbt" style=" width: 120px;">明珠俱乐部</button>
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
<div class="wrap">
    <div class="cont">
        <ul class="nav">
            <li>航班信息</li>
            <li>出发地</li>
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
                    <li><button type="submit" value="预定" onclick="reserve()">预定</button></li>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
<div class="div" style="padding-left: 200px;
    width: 1220px;
    height: 340px;">
    <h1 align="left" style="font-size: 26px">乘机人信息 </h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div id="main" align="left" >
        <form  name="personalForm" method="post" action="RegisterController" onSubmit="return check(this)">
            <div class="kv-item">
               <span class="kv-label">
             <label class="tsl" for="name">旅客姓名：</label>
              </span>
                <input type="text" name="name" class="text-align" id="name" placeholder="*必填项" autofocus size="25"
                       title="用户名">
            </div>
            <div class="kv-item">
                <span class="kv-label">
                 <label class="tsl">旅客性别：</label>
                </span>
                <input type="text" name="sex">
            </div>
            <div class="kv-item">
                <span class="kv-label">
                 <label class="tsl" for="news">证件信息：</label>
                </span>
                <th>
                    <select font-size:font-size:30px>
                        <option value="大陆身份证">大陆身份证</option>
                        <option value="港澳台身份证">港澳台身份证</option>
                    </select>
                </th>
                <input type="password" name="news" class="text-align" id="news" placeholder="*必填项" size="25"title="证件信息">
                <div class="kv-item" style=" padding-top: 30px">
                    <input type="submit" name="submit" id="addPassengers" style="border-radius: 9px"  onclick="addck()" value="添加乘客">
                    <input type="submit" name="submit" id="submit" style="border-radius: 9px" value="提交">
                </div>
            </div>

        </form>
    </div>



    <div>
        <input type="checkbox">阅读并接受<a href="chaolianjie.html">《旅客告知书》</a>
        <a href="chaolianjie.html">《旅客购票须知》</a>
        <a href="chaolianjie.html">《客票行李规定》</a>
        <a href="chaolianjie.html">《国内运输总条件》</a>
    </div>
</div>
</body>
</html>
