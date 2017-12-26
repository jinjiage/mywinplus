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
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>        <link href="<%=basePath%>resources/web/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet">
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
                         if (txt >= 100) {
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
<input type="hidden" value="${ memberInfo }" id="memberIsTrue">
 <input type="hidden" id="subjectName" value="${getsubject.name }">
    <input type="hidden"  id="subjectId" value="${getsubject.id }">
    <div class="proMain">
        <div class="conTit">
            <span><a style="color:#9d8440;" href="<%=basePath%>subject">其他标的</a></span>
            <h2><em>￥</em>
            ${getsubject.name }
            </h2>
        </div>
        <table class="conTable" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="txtInfo">
                    <div class="txt1">
                        <h2>
                        ${getsubject.amount }
                        </h2>
                        <p>标的总额(元)</p>
                    </div>
                    <div class="txt2">
                        <h2>
                        
                        ${getsubject.year_rate }%</h2>
                        <p>年化收益</p>
                    </div>
                    <div class="txt1">
                        <h2>
                        ${getsubject.period }
                        </h2>
                        <p>投资期限(天)</p>
                    </div>
                </td>
                <td width="360" rowspan="2" align="center" ; valign="middle" height="320">
                    <div class="tbBox">
                        <input type="hidden" id="account" value="${memberAccount.useable_balance }">
                        <h2>
                        <c:forEach items="${list }" var="lis">
                    <c:if test="${lis[0]==getsubject.id }">${getsubject.amount-lis[1] } 
                    <input type="hidden" id="ablecase" value="${getsubject.amount-lis[1] } ">
                    </c:if>
                    </c:forEach>
                        </h2>
                        <p>可投金额(元)</p>
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
                        <span style="float: right;margin-top: -40px;position: relative; line-height: 40px; padding: 0 10px;color: #f00;" id="addMoney"></span>
                        <p class="preBox">
                            <input type="checkbox" id="registerRule" class="registerRule" checked="checked"><span
                                class="fl">同意<a href="<%=basePath%>web/syxy" target="_black">《产品协议》</a></span>
                                
                                <button id="redPacket">使用红包</button>
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
                            <p>还款方式：<font color="#666"><c:forEach items="${refundway }" var="ref">
                        <c:if test="${ref.statu==getsubject.refund_way }">${ref.name }</c:if>
                        </c:forEach></font>&nbsp;&nbsp;&nbsp;&nbsp;保障方式：<font
                                    color="#00baff"><c:forEach items="${safeguardway }" var="ref">
                        <c:if test="${ref.statu==getsubject.safeguard_way }">${ref.name }</c:if>
                        </c:forEach></font></p>
                            <p>投标进度：<span class="scroll"><em style="width:100%"></em></span><font
                                    color="#666">0天0小时0分</font></p>
                        </li>
                        <li id="pie" class="pie" data-num="0"></li>
                    </ul>
                </td>
            </tr>
        </table>
        <div class="tbConBox">
            <div class="tab">
                    <a class="select" href="#1">产品速览</a>
                    <a href="#1">项目详情</a>
                    <a href="#1">安全保障</a>
                    <a href="#1">投资列表</a>
            </div>
            <div id="conBox">
                    <div class="box" style="display:block">

                <table class="dbwtab" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">

                    <tr>
                            <td class="corf9"><span>借款用途</span></td>
                            <td>${getsubject.serial_no }</td>

                            <td class="corf9"><span>抵押物所在地</span></td>
                            <td>434343</td>
                    </tr>
                    <tr>
                            <td class="corf9"><span>房产类型</span></td>
                            <td>44343</td>

                            <td class="corf9"><span>房产面积</span></td>
                            <td>434343</td>

                    </tr>
                </table>
                <div style="border:solid 1px #e9e9e9; padding:15px; margin-top:5px;"><p>${getsubject.safetycontrol }</p></div>
                <div class="picList">
                    认证文件展示
                    <ul>
                    </ul>
                </div>
            </div>
            <div class="box" style="display:none;">
                <p>${getsubject.projectdetails }</p>
            </div>
            <div class="box" style="display:none;">
                <p>${getsubject.commentt }</p>
            </div>
              
                <div class="box">

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<div class="ajaxContainer">
	<!-- 异步内容开始 -->
		 <table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
                      <tr>
                        <th>序号</th>
                        <th>投标人</th>
                        <th>投标金额</th>
                        <th>投标时间</th>
                      </tr>
          </table>
	<!-- 异步内容结束 -->
</div>

<script type="text/javascript">
	function getJsonInfo(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer").empty();
			$(".ajaxContainer").append(data);
		});
	}
</script>        </div>
    </div>
    </div>
    </div>
  
</body>
<script src='<%=basePath%>resources/dist/js/jquery.min.js'></script>
<script src='<%=basePath%>resources/js/jquery.form.js'></script>
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
    var addMoney = $("#addMoney");

    var exists = $("#memberIsTrue").val();
    var authBankCard=false;
    		authBankCard=true;
        //使用红包
        $("#redPacket").click(function () {
            if (redPacket.hasClass("active")) {//选中
                redPacket.removeClass("active");
                addMoney.html("");
            } else {//未选中
                redPacket.addClass("active");
                addMoney.html("+"+0);
            }
        });


        $(".submit").click(function () {
            if (exists == '') {
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
            var money = $("#ablecase").val();
            if (value == null || value == '') {
                $("#checkmoney").html("金额不能为空");
                $(".li4").show(100);
                return false;
            }
            value = parseInt(value);
            money = parseInt(value);
            if (value <100) {
                $("#checkmoney").html("起投金额在100以上");
                $(".li4").show(100);
                return false;
            }
            if (value >money) {
                $("#checkmoney").html("投资金额大于可投金额");
                $(".li4").show(100);
                return false;
            }
            var bonusFee = 0;
            var bbinStatus = 0;
            var acountval = $("#account").val();
            if (acountval != -1) {
                if ((acountval - value) < 0) {
                    $("#checkmoney").html("账号余额不足，请充值");
                    return false;
                }
            }
            if (redPacket.hasClass("active")) {//选中红包
                bonusFee =0;
            }
            $.ajax({
                type: "POST", // 用POST方式传输
                dataType: "json", // 数据格式:JSON
                async: true,
                url: '<%=basePath%>subjectPur/order', // 目标地址
                data: {
                	 subjectId:$('#subjectId').val(),
                     subjectName:$('#subjectName').val(),
                     totalFee: value
                },
                success: function (msg) {
                    if (msg.code == 0) {
                        window.location.href = "<%=basePath%>subjectPur/orderView?tradeNo=" + msg.msg;
                    } else {
                        $("#checkmoney").html(msg.msg);
                        $(".li4").show(100);
                    }
                }
            });

        });



});




require.config({
    paths: {
        echarts: '<%=basePath%>resources/web/echart/dist/'
    }
});
require(
        [
            'echarts',
            'echarts/chart/pie'
        ],
        function (ec) {
            var labelTop = {
                normal: {
                    color: '#ff503f',
                    label: {
                        show: false,
                        position: 'center',
                        formatter: '{b}',
                        textStyle: {
                            baseline: 'bottom'
                        }
                    },
                    labelLine: {
                        show: false
                    }
                }
            };
            var labelFromatter = {
                normal: {
                    label: {
                        formatter: function (params) {
                            return 100 - params.value + '%'
                        },
                        textStyle: {
                            color: '#666',
                            baseline: 'middle'
                        }
                    }
                },
            };
            var labelBottom = {
                normal: {
                    color: '#f8f8f8',
                    label: {
                        show: true,
                        position: 'center'
                    },
                    labelLine: {
                        show: false
                    }
                }
            };
            var radius = [40, 48];
            var myChart1 = ec.init(document.getElementById('pie'));
            var num = document.getElementById('pie').getAttribute('data-num');
            myChart1.setOption({
                series: [
                    {
                        type: 'pie',
                        center: ['50%', '50%'],
                        radius: radius,
                        x: '0%', // for funnel
                        itemStyle: labelFromatter,
                        data: [
                            {name: 'other', value: 100 - num, itemStyle: labelBottom},
                            {name: '占比', value: num, itemStyle: labelTop}
                        ]
                    },
                ]
            });
        }
);
</script>
</html>