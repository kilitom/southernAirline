<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="utf-8">
<title>找回密码</title>
<script type="text/javascript" src=""></script>
<style type="text/css">
	@import url(css/news.css);
	*{
      margin: 0;
      padding: 0;
      list-style: none;
     }
     body{
      font-family: sans-serif,Verdana, Helvetica, Arial;
     }
         #main{
          padding-left:0;
         }
        .kv-item{
     padding-left: 100px;
     padding-bottom: 20px;
       }
        .kv-label{
     display: inline;
     height: 28px;
     line-height: 28px;
     margin-left: -100px;
     float: left;
     text-align: left;
     width: 100px;
       }
       .text-align{
     border:1px solid #474E63;
     color: #0A1844;
     height: 26px;
     line-height:26px;
     padding:0 2px;
     width: 177px; 
     text-align: left;
        }
        #submit{
     margin-left: 80px;
     border:1px solid #474E63;
			background:#E61156;
     height: 26px;
     font-weight: bold;
		color: #FFFFFF;
			width: 150px;
       }
       #reset{
     border:1px solid #474E63;
     height: 26px;
     font-weight: bold;
       }
	h1{
		 
		width: 920px;
		background:#008acb;
		color: #FFFFFF;
	}
	.div{
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
 .wrap{
        width: 260px;
        height: 100%;
    }

    .nav{
        width:250px;
        margin: 10px 5px 0;
    }
	.div2{
            position:absolute;
            left: 730px;
            top: 315px;
            display:none;
            width: 925px;
            height: 468px;
			
			color:#000;
            text-align: center;
            box-shadow: 1px 1px 2px #ccc;
			

        }
			.div3{
            position:absolute;
            left: 730px;
            top: 315px;
            display:none;
            width: 925px;
            height: 468px;
			
			color:#000;
            text-align: center;
            box-shadow: 1px 1px 2px #ccc;
			

        }
		
    .list{
        margin-bottom: 5px;
    }
    .list h2{
        position: relative;
        padding: 15px 0;
        background-color: #3889d4;
        text-align: center;
        font-size: 16px;
        color: #fff;
        transition: .5s;
    }
    .list h2.on{
        background-color: #393c4a;
    }
    .list i{
        position: absolute;
        right: 10px;
        top: 16px;
        border: 8px solid transparent;
        border-left-color: #393c4a;/*triangle*/
        transform:rotate(0deg);
        transform-origin: 1px 8px;
        transition: .5s;
    }
    .list i.on{
        transform:rotate(90deg);
    }
    .hide{
        overflow: hidden;
        height: 0;
        transition: .5s;
    }
    .hide h5{
        padding: 10px 0;
        background-color: #fff;
        text-align: center;
        color: #000;
        border-bottom:#42495d;
    }
	.yh{
	background-color:#0CF;
}
form#payment {
 
    background: #FFF;
 
    -webkit-border-radius: 5px;
 
    border-radius: 5px;
 
    padding: 20px;
 
    width: 1024px;
 
    margin:auto;
 
}
 
form#payment fieldset {
 
    border: none;
 
    margin-bottom: 10px;
 
}
 
form#payment fieldset:last-of-type { margin-bottom: 0; }
 
form#payment legend {
 
    color: #000;
 
    font-size: 16px;
 
    font-weight: bold;
 
    padding-bottom: 10px;
 
    text-shadow: 0 1px 1px #c0d576;
 
}
 
form#payment > fieldset > legend:before {
 
   
 
    counter-increment: fieldsets;
 
}
 
form#payment fieldset fieldset legend {
 
    color: #AFECFE;
 
    font-size: 13px;
 
    font-weight: normal;
 
    padding-bottom: 0;
 
}
 
form#payment ol li {
 
    background: #b9cf6a;
 
    background: rgba(255, 255, 255, .3);
 
    border-color: #e3ebc3;
 
    border-color: rgba(255, 255, 255, .6);
 
    border-style: solid;
 
    border-width: 2px;
 
    -webkit-border-radius: 5px;
 
    line-height: 30px;
 
    list-style: none;
 
    padding: 5px 10px;
 
    margin-bottom: 2px;
 
}
 
form#payment ol ol li {
 
    background: none;
 
    border: none;
 
    float: left;
 
}
 
form#payment label {
 
    float: left;
 
    font-size: 13px;
 
    width: 110px;
 
}
 
form#payment fieldset fieldset label {
 
    background: none no-repeat left 50%;
 
    line-height: 20px;
 
    padding: 0 0 0 30px;
 
    width: auto;
 
}
 
form#payment fieldset fieldset label:hover { cursor: pointer; }
 
form#payment input:not([type=radio]), form#payment textarea {
 
    background: #ffffff;
 
    border: #FC3 solid 1px;
 
    -webkit-border-radius: 3px;
 
    font: italic 13px Georgia, "Times New Roman", Times, serif;
 
    outline: none;
 
    padding: 5px;
 
    width: 200px;
 
}
 
form#payment input:not([type=submit]):focus, form#payment textarea:focus {
 
    background: #eaeaea;
 
    border: #F00 solid 1px;
 
}
 
form#payment input[type=radio] {
 
    float: left;
 
    margin-right: 5px;
 
}



	
 </style>
	
  <script src="https://code.jquery.com/jquery-1.8.2.min.js" integrity="sha256-9VTS8JJyxvcUR+v+RTLTsd0ZWbzmafmlzMmeZO9RFyk=" crossorigin="anonymous"></script>

</head>


<body>
<div id="header">
	<a href="index.jsp"><img alt="brand" src="images/sky.png"></a>
</div>

<div id="menubar">



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
		<span><button class="logindropbt">登录</button></span>
		<span><button class="logindropbt">注册</button></span>
	</div>
<hr>

</div>
<p>&nbsp;</p>
        <p>&nbsp;</p>
        
<div class="div">
    
   <div class="my-csair">取回密码</div>

   <form id="payment" style="background-color:
   #0CF" method="post" action="queryUserByUsernameUidPhone">
 
    <fieldset>
 
        <legend>用户信息</legend>
 
        <ol>
 
            <li>
 
                <label >姓名：</label>
 
                <input id="name" name="name" type="text" placeholder="请输入用户名" required autofocus>
 
            </li>
 
            <li>
 
                <label >身份证号：</label>
 
                <input id="uid" name="uid" type="text" placeholder="请输入身份证号" required>
 
            </li>
 
            <li>
 
                <label >联系电话：</label>
 
                <input id="phone" name="phone" type="tel" placeholder="请输入电话"  required>
 
            </li>
            
 
        </ol>
 
    </fieldset>
        
 <button><input type="submit" name="提交" ></button>

</form>
   

  
   
   </div>
   
</body>
</html>
