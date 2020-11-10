<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> 中国南方航空股份有限公司 - 南航明珠俱乐部</title>
    <script src="${pageContext.request.contextPath}/js/login.js">
    </script>
</head>

<body>

<div id="top">
    <h1 align="center"><tt><strong><span class="blueText">加入明珠俱乐部</span></strong></tt></h1></div>
<h2 align="center">南航会员</h2>
<hr/>
<div align="center">
    <h4 align="center">温馨提示:</h4>
    <div align="left" style="width:700px; height:200px;"/>
    <p style="color:#666">1、如使用外国人永久居留身份证/港澳台居民居住证件，请选择“其他”证件进行入会。
    <p style="color:#666">2、填写姓、名需与所持证件顺序保持一致，否则将影响乘机和积分入账。
    <p style="color:#666">3、如用身份证注册，请登录增加护照以免国际航班里程累积失败</p>
</div>
</div>

<hr/>
<form name="user" action="registUser" method="post" onsubmit="return checkRightUser()">
    <div align="left"><h3 align="center">个人信息:</h3>
        <table align="center">
            <tr>
                <td>姓名</td>
                <td>
                    <input type="text" name="username" id="username"/>
                </td>
            </tr>
            <tr>
                <td>身份证号</td>
                <td>
                    <input type="text" name="uid" id="uid"/>
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input type="password" name="password" id="password"/>
                </td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td>
                    <input type="password" name="password2" id="password2"/>
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="sex" value="男" checked="checked"/>男
                    <input type="radio" name="sex" value="女"/>女
                </td>
            </tr>
            <tr>
                <td>生日</td>
                <td>
                    <input type="date" name="birth" id="birth"/>
                </td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td>
                    <input type="text" name="email" id="email"/>
                </td>
            </tr>
            <tr>
                <td>电话号码</td>
                <td>
                    <input type="tel" name="phone" id="phone"/>
                </td>
            </tr><span style="color: red">${msg}</span>
        </table>
    </div>
    <td>

        <br/>
        <br/>
        <div align="center"><input type="submit" name="woyaoruhui" value="我要入会"
                                   style="width:250px;height:40px;background:#39F;font-size:20px"/></div>

    </td>
    </tr>

    </table>
    </div>
</form>

</body>
</html>
