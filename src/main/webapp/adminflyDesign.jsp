<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            //渲染数据
            function addData(flights) {

                for (var i = 0; i < flights.length; i++) {
                    $("#flightTable").append("<tr class='data'>\n" +
                        "<td>" + flights[i].flightId + "</td>" +
                        "<td>" + flights[i].origin + "</td>" +
                        "<td>" + flights[i].destination + "</td>" +
                        "<td>" + flights[i].originTime + "</td>" +
                        "<td>" + flights[i].destinationTime + "</td>" +
                        "<td>" + flights[i].price + "</td>" +
                        "<td>" + flights[i].airId + "</td>" +
                        "<td><input flightId = '" + flights[i].flightId + "' class='updateBtn' type='button' value='更新'/>" +
                        "<input flightId = '" + flights[i].flightId + "' class='deleteBtn' type='button' value='删除'/></td>" +
                        "</tr>");
                }
            }

            //绑定更新按钮
            function updateBtn() {
                $(".updateBtn").click(function () {
                    var flightId = $(this).attr("flightId");
                    $.ajax({
                        type: "POST",
                        url: "queryFlightById",
                        data: {"flightId": flightId},
                        success: function (data) {
                            var jsonObj = data;
                            if (jsonObj.code == "200") {
                                window.location.href = "adminflightupdate.jsp";
                            } else {
                                alert(jsonObj.msg);
                            }
                            // alert(data)
                        }
                    })
                });
            }

            function deleteBtn() {
                $(".deleteBtn").click(function () {
                    var flightId = $(this).attr("flightId");

                    $.ajax({
                        type: "POST",
                        url: "deleteFlightById",
                        data: {"flightId": flightId},
                        beforeSend: function () {
                            var del = confirm("确认是否删除");
                            return del;
                        },
                        success: function (data) {
                            var jsonObj = data;
                            alert(jsonObj.msg)
                            window.location.href = "adminflyDesign.jsp";
                        }
                    })
                });
            }

            queryUserLimit(1, 10);

            function queryUserLimit(nowPageNo, nowPageSize) {
                $.ajax({
                    type: "POST",
                    url: "queryAllFlight",
                    data: {"pageNo": nowPageNo, "pageSize": nowPageSize},
                    success: function (data) {
                        var jsonObj = data;
                        if (jsonObj.code == "200") {
                            $("#pageNo").attr("value", nowPageNo);
                            $(".data").remove();
                            var flights = jsonObj.data;
                            addData(flights);
                            updateBtn();
                            deleteBtn();

                        } else {
                            $(".data").remove();
                            $("#userTable").append("<tr><td colspan='9'>" + jsonObj.msg + "</td></tr>")
                        }
                        var flight = jsonObj.data;
                    }
                });
            }

            $("#prePage").click(function () {
                var pageNoStr = $("#pageNo").val();
                var pageNo = parseInt(pageNoStr);

                var pageSizeStr = $("#pageSize").val();
                var pageSize = parseInt(pageSizeStr)
                queryUserLimit(pageNo - 1, pageSize)


            });
            $("#nextPage").click(function () {
                var pageNoStr = $("#pageNo").val();
                var pageNo = parseInt(pageNoStr);

                var pageSizeStr = $("#pageSize").val();
                var pageSize = parseInt(pageSizeStr)

                queryUserLimit(pageNo + 1, pageSize)
            });

        })
    </script>
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
                <li><a href="#">${sessionScope.adminName}</a></li>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="indexadmin.jsp">首页</a><span class="crumb-step">&gt;</span><span
                    class="crumb-name">用户管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>


                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text">
                            </td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="adminflyInsert.jsp"><i class="icon-font"></i>新增航班</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>更新排序</a>
                    </div>
                </div>
                <div class="result-content">
                    <table id="flightTable" class="result-tab" width="100%">
                        <tr>
                            <th>航班id</th>
                            <th>出发地</th>
                            <th>目的地</th>
                            <th>出发时间</th>
                            <th>到达时间</th>
                            <th>价格</th>
                            <th>航班号</th>
                            <th>操作</th>
                        </tr>

                    </table>
                    <div class="result-content">

                        <div class="list-page">
                            <table class="result-tab" width="100%">
                                <tr>
                                    <th colspan="10">
                                        <input id="prePage" type="button" value="上一页"/>
                                        <span>
                                      页码:
                                     <input id="pageNo" type="text" name="pageNo">
                                </span>
                                        <span>
                                      页面大小:
                                      <input id="pageSize" type="text" name="pageSize">
                                </span>
                                        <input id="nextPage" type="button" value="下一页">
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>