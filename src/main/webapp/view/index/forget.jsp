<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/winplus/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="/winplus/resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/winplus/resources/web/css/common.css" rel="stylesheet">
<link href="/winplus/resources/web/css/jw.css" rel="stylesheet">

<script src="/winplus/resources/web/js/jquery.js"></script>
<script type="text/javascript" src="/winplus/resources/web/layer/layer.js"></script>
<script src="/winplus/resources/web/echart/dist/echarts.js"></script>
</head>
<body>
 <div class="proMain">
    	<div class="container">
            <div class="row register">
                <div class="title">
                    <div class="left">
                        <hr>
                    </div>
                    <div class="mid">
                        重设密码
                    </div>
                    <div class="right">
                        <hr>
                    </div>
                </div>
                <div class="item">
                    <div class="rLabel">
                        手机号
                    </div>
                    <div class="rInput">
                        <input placeholder="请输入手机号" id="phone" name="phone" class="form-control textInput phone" type="text"><span class="errorInfo">手机号码不能为空</span>
                    </div>
                </div>
                <div class="item">
                    <div class="rLabel">
                        验证码
                    </div>
                    <div class="rInput">
                        <input placeholder="请输入验证码" id=vCode name="code" class="form-control textInput code" type="text"><button class="btn vCodeBtn" onclick="sendMessage(60)" id="btnSendCode">获取验证码</button><span class="errorInfo"></span>
                    </div>
                </div>
                 <div class="item">
                    <div class="rLabel">
           输入新密码     
                    </div>
                    <div class="rInput">
                        <input placeholder=" 输入新密码" id="password" name="password" class="form-control textInput password" type="password"><span class="errorInfo">手机号码不能为空</span>
                    </div>
                </div>
                 <div class="item">
                    <div class="rLabel">
                        确认新密码
                    </div>
                    <div class="rInput">
                        <input placeholder="确认新密码" id="password2" name="password2" class="form-control textInput password2" type="password"><span class="errorInfo">手机号码不能为空</span>
                    </div>
                </div>
                <div class="item">
                    <div class="rLabel">
                        &nbsp;
                    </div>
                    <div class="rInput">
                        <button class="btn registBtn submit" id="checkCode">重设密码</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
var code,base,phone,password,password2,css;
$(function() {
	css = {
			"-moz-box-shadow" : "0px 0px 10px #9e020c",
			"-webkit-box-shadow" : "0px 0px 10px #9e020c",
			"box-shadow" : "0px 0px 10px #9e020c"
		};
	
	forget = function(b) {
		base = b;
		phone=$(".phone");
		code = $(".code");
		password=$(".password");
		password2=$(".password2");
		
		
		
		phone.keyup(function() {
			if ((/^1[3-9][0-9]\d{8}$/.test(phone.val()))) {
				$.ajax({
					type : "POST", // 用POST方式传输
					dataType : "json", // 数据格式:JSON
					async : true,
					url : base + '/web/valiatorPhone', // 目标地址
					data : {
						phone : phone.val(),
						type:2
					},
					success : function(msg) {
						if (msg.code == 0) {
							phone.focus().css(css);
							phone.next(".errorInfo").html(msg.msg).show();
							return;
						} else {
							phone.removeAttr("style");
							phone.next(".errorInfo").html(msg.msg).show();
							return;
						}
					}
				});
			}
		});
		
		code.keyup(function() {
			if ((/^.{4}$/.test(code.val()))) {
				code.removeAttr("style");
				code.next(".errorInfo").html("").hide();
				return;
			}
		});
		
		password.keyup(function() {
			if ((/^[a-zA-Z]\w{5,17}$/.test(password.val()))) {
				password.removeAttr("style");
				password.next(".errorInfo").html("").hide();
				return;
			}
		});
		password2.keyup(function() {
			if ((password2.val()==password.val())) {
				password2.removeAttr("style");
				password2.next(".errorInfo").html("").hide();
				return;
			}
		});
		
		//忘记密码
		$(".submit").click(function() {
			phone.next(".errorInfo").html("").hide();
			if (!(/^1[3-9][0-9]\d{8}$/.test(phone.val()))) {
				phone.focus().css(css);
				phone.next(".errorInfo").html("手机号码格式不正确").show();
				return;
			}
			if (!(/^.{4}$/.test(code.val()))) {
				code.focus().css(css);
				code.next(".errorInfo").html("验证码格式不正确").show();
				return;
			}
			if (!(/^[a-zA-Z]\w{5,17}$/.test(password.val()))) {
				password.focus().css(css);
				password.next(".errorInfo").html("密码为6位以上的英文加数字").show();
				return;
			}
			if (password.val()!=password2.val()) {
				password2.focus().css(css);
				password2.next(".errorInfo").html("两次密码不一致").show();
				return;
			}
			
			$.ajax({
				type : "POST", // 用POST方式传输
				dataType : "json", // 数据格式:JSON
				async : true,
				url : base + '/web/forget', // 目标地址
				data : {
					mobilePhone : phone.val(),
					password:password.val(),
					code : code.val()
				},
				success : function(msg) {
					if (msg.code == 0) {
						alert("您的密码已经重新设置！");
						window.location.href=base+"/web/login";
					} else {
						phone.next(".errorInfo").html(msg.msg).show();
					}
				}
			});
			
		});
	};
});



// 发送验证码		
var InterValObj; //timer变量，控制时间
var curCount;//当前剩余秒数
function sendMessage(count) {
		if (!(/^1[3-9][0-9]\d{8}$/.test(phone.val()))) {
			phone.focus().css(css);
			phone.next(".errorInfo").html("手机号码格式不正确").show();
		return;
		}
		curCount = count;
		$("#btnSendCode").attr("disabled", "true");
		$("#btnSendCode").addClass("grey")
		$("#btnSendCode").html(""+ curCount + "秒");
		InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		$.ajax({
			type : "POST", // 用POST方式传输
			dataType : "json", // 数据格式:JSON
			async : true,
			url : base + '/web/sendTestValSms', // 目标地址
			data : {
				phone : phone.val(),
				type:3
			},
			success : function(msg) {
				if (msg.code == 0) {
					phone.next(".errorInfo").html(msg.msg).show();
				} else {
					phone.next(".errorInfo").html(msg.msg).show();
				}
			}
		});
}
//timer处理函数
function SetRemainTime() {
	if (curCount == 0) {                
		window.clearInterval(InterValObj);//停止计时器
		$("#btnSendCode").removeAttr("disabled");//启用按钮
		$("#btnSendCode").removeClass("grey")
		$("#btnSendCode").html("重新发送");
	}
	else {
		curCount--;
		$("#btnSendCode").html(""+ curCount + "秒");
	}
}

</script>
</html>