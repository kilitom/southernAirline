<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>机票订单</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            list-style: none;
            text-decoration: none;
            box-sizing: border-box
        }


        .cx {
            color: #FFF;
        }

        table {
            border-collapse: collapse;
        }

        th, td {
            width: 100px;
            height: 40px;
            font-size: 18px;
            font-align: center;
            text-align: center;
        }

        .sc {
            color: #FFF;
        }

        .gx {
            color: #FFF;;
        }
    </style>
<%--xin新添用户订单删除--%>
    <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        function sc() {
            $(".sc").click(function () {
                var orderId = $(this).attr("orderId");
                $.ajax({
                    type: "POST",
                    url: "deleteOrderById",
                    data: {"orderId": orderId},
                    beforeSend: function () {
                        var del = confirm("确认是否删除");
                        return del;
                    },
                    success: function (data) {
                        var jsonObj = data;
                        alert(jsonObj.msg)
                        window.location.href = "queryOrderByUserId?userId=${sessionScope.user.userId}";
                    }
                })
            });
        }

        queryUserLimit(1, 10);

        function queryUserLimit(nowPageNo, nowPageSize) {
            $.ajax({
                type: "POST",
                url: "queryAllOrder",
                data: {"pageNo": nowPageNo, "pageSize": nowPageSize},
                success: function (data) {
                    var jsonObj = data;
                    if (jsonObj.code == "200") {
                        $("#pageNo").attr("value", nowPageNo);
                        $(".data").remove();
                      /*  var flightId = jsonObj.data;*/
                       /* addData(flightId);*/
                        /*updateBtn();*/
                        sc();

                    } else {
                        $(".data").remove();
                        $("#userTable").append("<tr><td colspan='9'>" + jsonObj.msg + "</td></tr>")
                    }
                    var users = jsonObj.data;
                }
            });
        }



        // //11.11下午实验用户从中心去支付
        // function gx() {
        //     /*var jsonObj = data;*/
        //     var amount=price;
        //     var product = airId;
        //     var body = "lmc";
        //  /*   alert(jsonObj.msg);*/
        //     window.location.href = "http://localhost:8080/southernAirline/pay/aliPay/"+orderId+"/"+amount+"/"+product+"/"+body;
        // }



    </script>

</head>

<body>
<div style="background-color:#06C" class="text" align="left" height="50px">
    <font size="5" style="color:#FFF">所有机票订单</font>
</div>
<%--<div class="list" style="height:50px;">--%>
<%--    <ul>--%>
<%--        <span>电话号码</span>--%>
<%--        <input type="text">--%>
<%--        <span>订单编号</span>--%>
<%--        <input type="text">--%>
<%--        <span>身份证号</span>--%>
<%--        <input type="text">--%>
<%--        <span>乘机人</span>--%>
<%--        <input type="text">--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<div style="height:60px">--%>
<%--    <form>--%>
<%--        <input type="button" name="chaxun" value="查询" class="cx"--%>
<%--               style="width:200px;height:40px;font-size:20px; background-color:#06C"/>--%>
<%--    </form>--%>
<%--</div>--%>
<div style="height:100px">
    <table border="1" cellpadding="0" align="center">
        <tr>
            <th>订单号</th>
            <th>用户号</th>
            <th>乘客姓名</th>
            <th>航班号</th>
            <th>出发时间</th>
            <th>到达时间</th>
            <th>价格</th>
            <th>支付状态</th>
            <th>支付</th>
            <th>取消</th>
        </tr>
        <c:forEach items="${orders}" var="order">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.userId}</td>
            <td>${order.username}</td>
            <td>${order.airId}</td>
            <td>${order.originTime}</td>
            <td>${order.destinationTime}</td>
            <td>${order.price}</td>
            <td>${order.state}</td>
            <td>
                <button name="reset" value="支付" class="gx" style="background-color:#06C;width: 44px;height: 29px;">支付</button>
            </td>
            <td>
                <button name="delate" value="取消" orderId="${order.orderId}" class="sc" style="background-color:#06C;width: 44px;height: 29px;">取消</button>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
