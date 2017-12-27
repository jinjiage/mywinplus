<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/web/layer/layer.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>    <link href="<%=basePath%>resources/web/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet">
    <script src="<%=basePath%>resources/web/fancybox/jquery.fancybox-1.3.4.js"></script>
     <script>
        $(function () {
            $(".picList a").fancybox({
                'transitionIn': 'none',
                'transitionOut': 'none',
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
            $("#mytext").keyup(function () {
                var txt = parseInt($(this).val());
                if (txt >= 10) {
                    $("#count").show(100);
                    var lx = $("#num").attr("data-num");
                    var lr = txt * lx;
                    $("#num").text(lr.toFixed(2));
                } else {
                    $("#count").hide(100);
                }
            })
            $("#mytext").focus(function () {
                $("#count").hide(100);
            })
        })


    </script>
</head>
<body>
<input type="hidden" value="${memberInfo }" id="memberIsTrue">
<input type="hidden" value="${memberAccount.bbin_amount }" id="bbin_amount">
<input type="hidden" value="${memberAccount.bonus_amount }" id="bonus_amount">
<div class="proMain">
    <div class="conTit">
    <input type="hidden" id="subjectName" value="${getsubject.name }">
    <input type="hidden"  id="subjectId" value="${getsubject.id }">
        <span><a style="color:#9d8440;" href="<%=basePath%>subject">其他标的</a></span>
        <h2><em>￥</em>${getsubject.name }</h2>
    </div>
    <table class="conTable" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td class="txtInfo">
                <div class="txt1">
                    <h2>
                    <c:forEach items="${list }" var="lis">
                    <c:if test="${lis[0]==getsubject.id }">${lis[2]+getsubject.bought }</c:if>
                    </c:forEach>
                    </h2>
                    <p>已购人数(人)</p>
                </div>
                <div class="txt2">
                    <h2>${getsubject.year_rate }%</h2>
                    <p>年化收益</p>
                </div>
                <div class="txt1">
                    <h2>${getsubject.period }</h2>
                    <p>投资期限(天)</p>
                </div>
            </td>
            <td width="360" rowspan="2" align="center" ; valign="middle" height="320">
                <div class="tbBox">
                    <input type="hidden" id="account" value="${memberAccount.useable_balance }">
                    <h2>
                    <c:forEach items="${list }" var="lis">
                    <c:if test="${lis[0]==getsubject.id }"> ${lis[1] }</c:if>
                    </c:forEach>
                    </h2>
                    <p>已投金额(元)</p>
                    <div class="li4" style=""><span id="checkmoney" style="color: red;"></span></div>
                    <div class="tit">
                    <c:if test="${empty memberInfo }">
                    	<span class="fr">
                    	<a style="color:#2695d5" class="unlogin" href="<%=basePath%>web/login" target="_top">登录</a>后可见          
						</span>
						</c:if>
						 <c:if test="${!empty memberInfo }">
                    	<span class="fr">
                    	<font color="red"><f:formatNumber pattern="00.0" value="${memberAccount.useable_balance }"></f:formatNumber></font>
                        元&nbsp;&nbsp;<a href="<%=basePath%>account/deposit">充值&nbsp;&nbsp;&nbsp;</a>
						</span>
						 </c:if>
                        <h2>账户余额</h2>
                        <div id="count">预期所得收益<i
                                data-num="0.000959"
                                id="num">
                                <c:forEach items="${list }" var="lis">
                                <c:if test="${lis[0]==getsubject.id }">${lis[1] }</c:if>
                                </c:forEach>
                                </i>元
                        </div>
                    </div>
                    <input id="mytext" class="txt" name="totalFee" type="text"
                           placeholder="起投金额100元以上">
                        <span style="float: right;margin-top: -40px;position: relative; line-height: 40px; padding: 0 10px;color: #f00;"
                              id="addMoney"></span>
                    <p class="preBox">
                        <input type="checkbox" id="registerRule" class="registerRule" checked="checked"><span
                            class="fl">同意<a href="<%=basePath%>web/syxy" target="_black">《产品协议》</a></span>
                            <c:if test="${!empty memberInfo }">
                              <button id="redPacket">使用红包</button>
                            <button id="bbinAll">体验金全投</button>
                             </c:if>
                    </p>
                    <c:if test="${getsubject.status==1 }">
                         <button class="submit">确认抢购</button>
                         </c:if>
                         <c:if test="${getsubject.status!=1 }">
                                <button disabled style="background-color:#c3c3c3; ">已售罄</button>
                    </c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <ul class="conInfoList">
                    <li class="info">
                        <p>计息日期：<font color="#00baff">
                        ${nowdate }
                        </font></p>
                        <p>还款方式：<font color="#00baff"><a>
                        <c:forEach items="${refundway }" var="ref">
                        <c:if test="${ref.statu==getsubject.refund_way }">${ref.name }</c:if>
                        </c:forEach>
                        </a></font></p>
                        <p>资金到账日：<font color="#00baff">${enddate }至${enddate2 }
                       </font>
                        </p>
                    </li>
                    <li class="info">
                        <p>保障方式：<font color="#00baff"><c:forEach items="${safeguardway }" var="ref">
                        <c:if test="${ref.statu==getsubject.safeguard_way }">${ref.name }</c:if>
                        </c:forEach></font></p>
                        <p>资金安全：<font color="#00baff">中国人保财险承保</font></p>
                        <p></p>
                    </li>
                </ul>
            </td>
        </tr>
    </table>
     <div class="tbConBox">
        <div class="tab">
            <a class="select" href="#1">产品速览</a>
            <a href="#1">项目详情</a>
            <a href="#1">安全保障</a>
        </div>
        <div id="conBox">
            <div class="box" style="display:block">
                <table class="dbwtab" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="corf9"><span>债权编号</span></td>
                    <td>45454</td>

                    <td class="corf9"><span>企业认证</span></td>
                    <td>545241</td>
                    </tr>
                    <tr>
                    <td class="corf9"><span>债权人</span></td>
                    <td>454545</td>

                    <td class="corf9"><span>保障平台</span></td>
                    <td>45545</td>

                </tr>
                </table>
                <div style="border:solid 1px #e9e9e9; padding:15px; margin-top:5px;"><p>${getsubject.commentt }</p></div>
            </div>

            <div class="box" style="display:none;">
            <p>${getsubject.projectdetails }</p>
            </div>
            <div class="box" style="display:none;">
            <p>${getsubject.safetycontrol }</p>
            </div>
            <div style="width: 100%;height: 100px"></div>
        </div>
    </div>
    <div class="picList">
        认证文件展示
        <ul>
            <li><a href="<%=basePath%>upload/514/1449624836387.jpg"><img
                    src="<%=basePath%>upload/514/1449624836387.jpg"/></a></li>
            <li><a href="<%=basePath%>upload/514/1449624836600.jpg"><img
                    src="<%=basePath%>upload/514/1449624836600.jpg"/></a></li>
            <li><a href="<%=basePath%>upload/514/1449624836815.jpg"><img
                    src="<%=basePath%>upload/514/1449624836815.jpg"/></a></li>
        </ul>
        <!-- <div style="clear:both;"></div> -->
    </div>

</div>

<div class="productDetailCnt"><div class="pDetailList"><div class="listItem row_1"><div class="media"><span class="fl"><em class="detailIcon">&nbsp;</em></span><div class="media-body"><h3>安不安全</h3><p>本产品是中建投信托产品，上市公司宋都股份为该项目项下宋都集团的债务清偿提供连带责任保证责任，宋都股份为A股上市公司，浙江本地较大房地产企业，综合实力较强；</p><p>标的项目为杭州市区内刚需楼盘，销售情况较好；还款来源充足。</p><p>抵押物位于杭州桐庐大奇山郡未售现房，品质较高，抵押率不超过50%，抵押资产真实可靠。</p></div></div></div><div class="listItem row_2"><div class="media"><span class="fr"><em class="detailIcon">&nbsp;</em></span><div class="media-body"><h3>钱去哪了</h3><p>本产品由债权出让人购得中建投信托-安泉19号集合资金信托计划，用于宋都集团下属子公司香悦郡置业负责开发的杭州宋都香悦郡项目的开发建设。</p></div></div></div><div class="listItem row_3"><div class="media"><span class="fl"><em class="detailIcon">&nbsp;</em></span><div class="media-body"><h3>购买准备</h3><p>1. 首次购买需开通理财账户，理财账户可直接进行充值。<img src="<%=basePath%>upload/ueditor-img/20151106/201511061446791791861070838.jpg" title="201511061446791791861070838.jpg" alt="1245.jpg"/></p><p>2. 了解申购所用银行卡支持情况，大额支付需要网银，支持银行数量和支付限额高；快捷支付方便迅速，但支持银行数量有限。</p><p>3. &nbsp;产品限量抢购，提前充值可以大大提升抢购成功率。</p></div></div></div><div class="listItem row_4"><div class="media"><span class="fr"><em class="detailIcon">&nbsp;</em></span><div class="media-body"><h3>怎样赎回</h3><p>产品到期后本金和收益将自动回款至您的理财账户，产品到期前暂不支持提前赎回。</p></div></div></div><div class="tipRow f12 g9">由于理财资金管理运用过程中，可能会面临多种风险因素，在您选择购买本理财产品前，请充分认识风险，谨慎投资</div></div></div></div>
            </div>

            <div class="box" style="display:none;">
            <p style="text-align:center"><strong><span style="font-size:21px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;">项目亮点</span></strong></p><p class="MsoListParagraph" style="margin-left:48px"><strong>1、<span style="font:9px &#39;Times New Roman&#39;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong><strong>宋都股份为A股上市公司，浙江本地较大房地产企业，综合实力较强；</strong></p><p class="MsoListParagraph" style="margin-left:48px;text-indent:0">截 至2014年末，宋都股份总资产136.85亿元，总负债98.01亿元，资产负债率71.62%。宋都股份2014年全年主营业务收入约23.23亿 元，净利润为0.55亿元，主要来源于房地产销售收入，销售净利率2.35%。2015年3月末，宋都股份主营业务收入约7.37亿元，净利润0.61亿 元。根据预测，其未售存货按照目前的售价估算未来的可售金额可达到140亿元左右，结合其未来工程款投入压力较小的因素，宋都股份整体未来2年内的现金流 对本信托计划有较好的保证能力。</p><p class="MsoListParagraph" style="margin-left:48px"><strong>2、<span style="font:9px &#39;Times New Roman&#39;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong><strong>标的项目为杭州市区内刚需楼盘，销售情况较好:</strong></p><p class="MsoListParagraph" style="margin-left:48px;text-indent:0">目前项目工程进度至地上主体工程二分之一左右程度，截至2015年5月末，已推盘去化率（按套数）大约52%。由于属于纯刚需楼盘，项目目前销售情况良好，信托计划第一还款来源较为充足。</p><p class="MsoListParagraph" style="margin-left:48px"><strong>3、<span style="font:9px &#39;Times New Roman&#39;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong><strong>抵押物位于杭州桐庐大奇山郡未售现房，品质较高，抵押率不超过50%：</strong></p><p class="MsoListParagraph" style="margin-left:48px;text-indent:0">大奇山郡置业拥有的位于杭州桐庐的大奇山郡项目已竣工未销售的现房资产或其他受托人认可的资产，抵押率不超过50%。</p><p style="text-align:center"><strong><span style="font-size:21px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;">增信措施</span></strong></p><p><strong>连带责任保证担保</strong></p><p>上市公司宋都股份为本项目项下宋都集团的债务清偿提供连带责任保证责任。</p><p><strong>抵押担保</strong></p><p>大奇山郡置业以其持有的位于杭州桐庐的大奇山郡项目存量房产提供抵押担保或其他受托人认可的资产提供担保，抵押率不超过50%。</p><p><strong>资金归集</strong></p><p class="MsoListParagraph" style="margin-left:24px">1、 销售资金归集</p><p class="MsoListParagraph" style="margin-left:24px;text-indent:0">当 目标项目可售货值&lt;全部信托贷款本金余额*1.5时，如宋都集团未提前一次性偿还全部信托贷款本金及利息，则自目标项目可售货值〈全部信托贷款本金 余额*1.5之日起，目标项目销售回款（销售回款以所有按揭银行发放的按揭贷款流水金额以及宋都集团书面提供的首付款金额统计为准，下同）每满5000万 元时，宋都集团应向归集账户归集资金人民币3500万元。</p><p class="MsoListParagraph" style="margin-left:24px">2、 到期前归集</p><p class="MsoListParagraph" style="margin-left:24px;text-indent:0">各期贷款到期日前20日，归集该期贷款本金余额的5%；各期贷款到期日前10日，归集至该期贷款本金余额的20%；各期贷款到期日，归集至该期贷款本金余额的100%。</p><p><strong>资金监管</strong></p><p>受托人委托商业银行作为本信托计划监管银行，对信托资金使用进行专项监管。</p><p><br/></p>
            </div>
            <div class="box" style="display:none;">
            <div class="box" style="display: block;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		<ul class="projectLists list-paddingleft-2"><li><h3><strong><span style="font-size: 18px;">资金保障</span></strong></h3><p>										1.交易过程中盈+平台不触碰资金，资金在银行的监管下在银行账户间流动。</p><p>										2.交易资金由招商银行全面监管。</p><p>										3.资金流向清晰，资金安全有保障。</p></li><li><h3><strong><span style="font-size: 18px;">本息保障</span></strong></h3><p>1.资金最终投向中建投信托产品，基础资产风险几乎为零，安全有保障。</p><p>										2.杭州吉威投资承担对该笔债权的回购义务，到期无条件偿付投资人本息。</p><p>										3.盈+平台对资金真实投向中建投信托产品的过程提供保障。如果因资金没有流向中建投信托产品而发生损失，盈+平台100%全额赔付本息。</p></li><li><h3><strong><span style="font-size: 18px;">盈+平台风控综述</span></strong></h3><p>盈+平台通过与知名企业合作，利用互联网金融的高周转和灵活性，择时提供既能给盈主（平台客户）带来不错的收益，又能满足低资金成本需求的理财产品。</p></li></ul>&nbsp; &nbsp; &nbsp; &nbsp;	</div><p><br/></p>
            </div>
        </div>
    </div>
    <div class="picList">
        认证文件展示
        <ul>
        </ul>
        <!-- <div style="clear:both;"></div> -->
    </div>
<div style="width: 100%;height: 1000px;"></div>
</div>

</body>
<script type="text/javascript">

    $(function () {
            $(".tbConBox .tab a").click(function () {
                if (!$(this).hasClass("select")) {
                    var num = $(this).index();
                    $(this).addClass("select").siblings().removeClass("select");
                    $("#conBox .box").eq(num).show().siblings().hide();
                }
            });

            $(":input[name=totalFee]").focus(function () {
                $(".li4").hide();
            });

            var redPacket = $("#redPacket");
            var bbinAll = $("#bbinAll");
            var addMoney = $("#addMoney");
            var mytext = $("#mytext");
            var exists = $("#memberIsTrue").val();
            var authBankCard=false;
            		authBankCard=true;
                 //使用红包
                 var  bonus_amount=$("#bonus_amount").val();
                 var  bbin_amount=$("#bbin_amount").val();
                 
                 $("#redPacket").click(function () {
                     if (redPacket.hasClass("active")) {//选中
                         redPacket.removeClass("active");
                         addMoney.html("");
                         bbinAll.removeAttr("disabled");
                     } else {//未选中
                         redPacket.addClass("active");
                         addMoney.html("+" +bonus_amount);
                         bbinAll.attr("disabled", "disabled");
                     }
                 });
                 //使用体验金
                 $("#bbinAll").click(function () {
                     if (bbinAll.hasClass("active")) {//选中
                         bbinAll.removeClass("active");
                         mytext.val("");
                         mytext.removeAttr("readonly");
                         redPacket.removeAttr("disabled");
                     } else {//未选中
                         bbinAll.addClass("active");
                         mytext.val(bbin_amount);
                         mytext.attr("readonly", "readonly");
                         redPacket.attr("disabled", "disabled");
                     }
                 });
        $(".tbConBox .tab a").click(function () {
            if (!$(this).hasClass("select")) {
                var num = $(this).index();
                $(this).addClass("select").siblings().removeClass("select");
                $("#conBox .box").eq(num).show().siblings().hide();
            }
        });

        $(":input[name=totalFee]").focus(function () {
            $(".li4").hide();
        });

        $(".submit").click(function () { 	
            if (exists=='') {
                $("#checkmoney").html("请先登陆!");
                $(".li4").show(100);
                return false;
            }
            if(authBankCard==false){
            	$("#checkmoney").html("请先绑定银行卡，<a href='<%=basePath%>account/security/memberBankcardView'>绑卡</a>");
                $(".li4").show(100);
            	return false;
            }
            var value = $(":input[name=totalFee]").val();
            if (value == null || value == '') {
                $("#checkmoney").html("金额不能为空");
                $(".li4").show(100);
                return false;
            }
            value = parseInt(value);
            if (value
                    <100) {
                $("#checkmoney").html("起投金额在100以上");
                $(".li4").show(100);
                return false;
            }
                var bonusFee = 0;
                var bbinStatus = 0;
                if (!(bbinAll.hasClass("active"))) {//未选中体验金
                    var acountval = $("#account").val();
                    if (acountval != -1) {
                        if ((acountval - value) < 0) {
                            $("#checkmoney").html("账号余额不足，请充值");
                            $(".li4").show(100);
                            return false;
                        }
                    }
                    if (redPacket.hasClass("active")) {//选中红包
                        bonusFee =$("#bonus_amount").val();
                    }
                } else {
                    bbinStatus = 1;
                }

            $.ajax({
                type: "POST", // 用POST方式传输
               // 数据格式:JSON
                url: '<%=basePath%>subjectPur/order', // 目标地址
                data: {
                    subjectId:$('#subjectId').val(),
                    subjectName:$('#subjectName').val(),
                    totalFee: value,
                    bonusFee: bonusFee,
                    bbinStatus: bbinStatus
                },
                success: function (msg) {
                    if (msg.code == 0) {
                    	window.location.href = "<%=basePath%>subjectPur/orderView?tradeNo="+msg.msg+"&bbinStatus=" + msg.bbinStatus;
                    } else {
                        $("#checkmoney").html(msg.msg);
                        $(".li4").show(100);
                    }
                }
            });

        });



    });

</script>
</html>