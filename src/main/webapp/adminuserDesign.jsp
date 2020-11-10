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
            function addData(users) {

                for (var i = 0; i < users.length; i++) {
                    $("#userTable").append("<tr class='data'>\n" +
                        "<td>" + users[i].userId + "</td>" +
                        "<td>" + users[i].username + "</td>" +
                        "<td>" + users[i].password + "</td>" +
                        "<td>" + users[i].sex + "</td>" +
                        "<td>" + users[i].phone + "</td>" +
                        "<td>" + users[i].uid + "</td>" +
                        "<td>" + users[i].email + "</td>" +
                        "<td>" + users[i].birth + "</td>" +
                        "<td><input userId = '" + users[i].userId + "' class='updateBtn' type='button' value='更新'/>" +
                        "<input userId = '" + users[i].userId + "' class='deleteBtn' type='button' value='删除'/></td>" +
                        "</tr>");
                }
            }

            //绑定更新按钮
            function updateBtn() {
                $(".updateBtn").click(function () {
                    var userId = $(this).attr("userId");
                    $.ajax({
                        type: "POST",
                        url: "queryUserById",
                        data: {"userId": userId},
                        success: function (data) {
                            var jsonObj = data;
                            if (jsonObj.code == "200") {
                                window.location.href = "adminuserupdate.jsp";
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
                    var userId = $(this).attr("userId");

                    $.ajax({
                        type: "POST",
                        url: "deleteUserById",
                        data: {"userId": userId},
                        beforeSend: function () {
                            var del = confirm("确认是否删除");
                            return del;
                        },
                        success: function (data) {
                            var jsonObj = data;
                            alert(jsonObj.msg)
                            window.location.href = "adminuserDesign.jsp";
                        }
                    })
                });
            }

            queryUserLimit(1, 10);

            function queryUserLimit(nowPageNo, nowPageSize) {
                $.ajax({
                    type: "POST",
                    url: "queryAllUser",
                    data: {"pageNo": nowPageNo, "pageSize": nowPageSize},
                    success: function (data) {
                        var jsonObj = data;
                        if (jsonObj.code == "200") {
                            $("#pageNo").attr("value", nowPageNo);
                            $(".data").remove();
                            var users = jsonObj.data;
                            addData(users);
                            updateBtn();
                            deleteBtn();

                        } else {
                            $(".data").remove();
                            $("#userTable").append("<tr><td colspan='9'>" + jsonObj.msg + "</td></tr>")
                        }
                        var users = jsonObj.data;
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
                <form action="queryUserById" method="post">
                    <table class="search-tab">
                        <tr>


                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" type="text">
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
                        <a href="adminuserinsert.jsp"><i class="icon-font"></i>新增用户</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>更新排序</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%" id="userTable">
                        <tr>
                            <th>id</th>
                            <th>用户姓名</th>
                            <th>密码</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>身份证</th>
                            <th>邮箱</th>
                            <th>生日</th>
                            <th colspan="2">操作</th>
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