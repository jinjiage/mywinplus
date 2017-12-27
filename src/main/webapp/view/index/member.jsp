<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.demo.model.Member" %>
	<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html><head>
    
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
	<title>投资记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>
  <script type="text/javascript">
	 $(function(){
		 <%
		 Member  member = (Member)request.getSession().getAttribute("memberInfo");
			if(member==null||member.equals("")){
				response.sendRedirect(basePath+"web/login");
			} %> 
		 
	 })
	 $(document).ajaxError(function(e,obj,settings,exception){  
        if (obj.status == 500) {  
            window.location = '/';  
        }  
  
    });
	</script>
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>


<table height="160" class="peopleInfo" width="970" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left" valign="middle" class="info">
            <a href="<%=basePath%>account/security">
                <div class="img"><img src="<%=basePath%>resources/web/images/userPic.jpg"></div>
                <h2>${memberInfo.name }，<span>您好!</span></h2>
            </a>
            <div class="safe">账户安全&nbsp;&nbsp;<span class="scroll"><em style="width:100%"></em></span></div>
            <ul class="listIco iconfont">
                <li class="active"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></li>
                <li class="active"><a href="#1">&#xe61d;</a><em>&#xe61b;</em></li>
                <!-- <li class=""><a href="#1">&#xe61f;</a><em>&#xe61b;</em></li> -->
                <li class="active"><a href="#1">&#xe61a;</a><em>&#xe61b;</em></li>                                
                <li class="active"><a href="#1">&#xe61e;</a><em>&#xe61b;</em></li>
            </ul>
        </td>
        <td align="right">
            <a href="<%=basePath%>web/logout" class="loginOut"><span class="iconfont">&#xe618;</span>安全退出</a>
        </td>
    </tr>
</table>
<div class="countBox">
    <ul>
        <li><h2>
        <f:formatNumber pattern="00.00" value="${ memberAccount.useable_balance}"></f:formatNumber>
        </h2><p>账户可用余额(元)<a href="javascript:;" class="iconfont">&#xe619;<span>账户可用余额</span><i></i></a></p></li>
        <li><h2>
        <f:formatNumber pattern="00.00" value="${ memberAccount.useable_balance+memberAccount.total_profit+memberAccount.invest_amount}"></f:formatNumber>
       </h2><p>账户总资产(元)<a href="javascript:;" class="iconfont">&#xe619;<span>可用余额+投资金额+累计收益</span><i></i></a></p></li>
        <li><h2 style="color:#9d8440">
        <f:formatNumber pattern="00.00" value="${memberAccount.invest_amount }"></f:formatNumber>
       </h2><p>投资金额(元)<a href="javascript:;" class="iconfont">&#xe619;<span>投资中资金</span><i></i></a></p></li>
        <li><h2 style="color:#9d8440">
         <f:formatNumber pattern="00.00" value=" ${memberAccount.total_profit }"></f:formatNumber>
       </h2><p>累计收益(元)<a href="javascript:;" class="iconfont">&#xe619;<span>累计收益</span><i></i></a></p></li>
        <li><h2 style="color:#9d8440">
        <f:formatNumber pattern="00.00" value="${memberAccount.imuseale_balance }"></f:formatNumber>
        </h2><p>冻结金额(元)<a href="javascript:;" class="iconfont">&#xe619;<span>提现冻结金额</span><i></i></a></p></li>
    </ul>
    <a href="<%=basePath%>account/deposit" class="cz" target="iFrame3">充值</a>
    <a href="<%=basePath%>account/withdraw" class="tk" target="iFrame3">提款</a>
</div>   
 <div class="proMain clearfix">
<div class="adminLeft">
    <h2>我的投资</h2>
    <ul>
        <li><a id="member_center_menu_invests" href="<%=basePath%>account/touZiList" target="iFrame3"><em class="iconfont red">&#xe602;</em>投资记录</a></li>
        <li><a id="member_center_menu_profit_record" href="<%=basePath%>account/trades/profit/records" target="iFrame3"><em class="iconfont red">&#xe616;</em>收益记录</a></li>
        <li><a id="member_center_menu_deposit_record" href="<%=basePath%>account/deposit/records" target="iFrame3"><em class="iconfont red">&#xe616;</em>充值记录</a></li>
        <li><a id="member_center_menu_withdraw_record" href="<%=basePath%>account/withdraw/records" target="iFrame3"><em class="iconfont red">&#xe616;</em>提款记录</a></li>
        <li><a id="member_center_menu_bbinInfo_record" href="<%=basePath%>account/bbinInfo/records" target="iFrame3"><em class="iconfont red">&#xe616;</em>体验金记录</a></li>
    </ul>
    <h2>我的账户</h2>
    <ul>
        <li><a id="member_center_menu_deposit" href="<%=basePath%>account/deposit" target="iFrame3"><em class="iconfont">&#xe614;</em>账户充值</a></li>
        <li><a id="member_center_menu_security" href="<%=basePath%>account/security" target="iFrame3"><em class="iconfont">&#xe612;</em>安全信息</a></li>
        <li><a id="member_center_menu_withdraw" href="<%=basePath%>account/withdraw" target="iFrame3"><em class="iconfont">&#xe612;</em>我要提款</a></li>
        <li><a id="member_center_menu_financial" href="<%=basePath%>account/financial" target="iFrame3"><em class="iconfont">&#xe612;</em>我是理财师</a></li>
    </ul>
</div>
<script>
  var menu_item="";
 $("#"+menu_item).addClass("select");
</script>

        <div class="admin-right">
        <iframe id="iFrame3" name="iFrame3" width="750"
								onload="this.height=iFrame3.document.body.scrollHeight"
								frameborder="0" src="<%=basePath%>account/touZiList" scrolling="no"></iframe>
							</div>
							</div>
        	
    <jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>