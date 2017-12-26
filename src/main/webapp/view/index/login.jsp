<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
	<title>登录 - 盈+</title>
    <style type="text/css">
       .error{
           color: #d43f3a;
        }
    </style>
	
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/web/layer/layer.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script></head>
<script type="text/javascript">
var base, phone, password, css;


$(function () {
    css = {
        "-moz-box-shadow": "0px 0px 10px #9e020c",
        "-webkit-box-shadow": "0px 0px 10px #9e020c",
        "box-shadow": "0px 0px 10px #9e020c"
    };

    login = function (b) {
        base = b;
        phone = $(".phone");
        password = $(".password");

        phone.keyup(function () {
            if ((/^1[3-9][0-9]\d{8}$/.test(phone.val()))) {
                phone.removeAttr("style");
                $(".error").html("").hide();
                return;
            }
        });

        password.keyup(function () {
            if ((/^[a-zA-Z]\w{5,17}$/.test(password.val()))) {
                password.removeAttr("style");
                $(".error").html("").hide();
                return;
            }
        });


        //登录
        $(".submit").click(function () {
            $(".error").html("").hide();
            if (!(/^1[3-9][0-9]\d{8}$/.test(phone.val()))) {
                phone.focus().css(css);
                $(".error").html("手机号码格式不正确").show();
                return;
            }

            if (!(/^[a-zA-Z]\w{5,17}$/.test(password.val()))) {
                password.focus().css(css);
                $(".error").html("密码格式不正确").show();
                return;
            }

            $.ajax({
                type: "POST", // 用POST方式传输
                dataType: "json", // 数据格式:JSON
                async: true,
                url: base + '/web/login', // 目标地址
                data: {
                    mobile_Phone: phone.val(),
                    password: password.val()
                },
                success: function (msg) {
                    if (msg.code == 0) {
                        window.location.href = base + "/view/index/member.jsp";
                    } else {
                        $(".error").html(msg.msg).show();
                    }
                }
            });

        });

        $(document).keyup(function (event) {
            if (event.keyCode == 13) {
                $(".submit").trigger("click");
            }
        });
    };
});


</script>
<body>
	<div>
	<jsp:include page="top.jsp"></jsp:include>
	</div>

<script type="text/javascript">
    $(function(){
        function showIn(url){
            var info="<div class='mydig'><div class='bg'></div><div class='imgbox'><a href="+url+"></a></div></div>";
            $('body').append(info);
        }

    });

</script>    <div class="proMain">
    	<div class="container">
            <div class="row login">
                <div class="loginPic">
                    <img src="<%=basePath%>resources/web/images/loginImg.png" />
                </div>
                <div class="loginBlock">
                    <img class="cornerImg" src="<%=basePath%>resources/web/images/loginCorner.png" />
                    <div class="item item1">
                        <div class="lLabel">
                            手机号 
                        </div>
                        <div class="lInput">
                            <img src="<%=basePath%>resources/web/images/userIcon.png" /><input type="text" placeholder="手机号" id="phone" name="phone" class="form-control phone" /><span class="errorInfo">用户名不能为空</span>
                        </div>
                    </div>
                    <div class="item">
                        <div class="lLabel">
                            登录密码
                        </div>
                        <div class="lInput">
                            <img src="<%=basePath%>resources/web/images/passwordIcon.png" /><input type="password" placeholder="密码" id="password" name="password" class="form-control password" /><span class="errorInfo"></span>
                        </div>
                    </div>
                    <div class="rest">
                        <p class="error"></p>
                        <span id="loginError"></span><a class="forgetLink" href="<%=basePath%>web/forget">忘记密码？</a>
                    </div>
                    <div class="rest">
                        <button class="btn loginBtn submit">立即登录</button>
                    </div>
                    <div class="rest">
                        <span class="registUrl">没有账号？<a href="<%=basePath%>web/regis">免费注册</a></span>
                    </div>
        
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">
$(function(){
	var b = "/mywinplus";
	login(b);
});
</script>
   
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>