<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div>
<meta charset="UTF-8">
    <div class="security">
        <div class="item">
            <img src="<%=basePath%>resources/web/images/indexSecurity1.png">
            <div class="detail">
                资金银行监管
                <div class="desc">
                    平台资金由第三方银行监管
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=basePath%>resources/web/images/indexSecurity2.png">
            <div class="detail">
                交易证监会监管
                <div class="desc">
                    投资交易由证监会监管
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=basePath%>resources/web/images/indexSecurity3.png">
            <div class="detail">
                风控盈+监管
                <div class="desc">
                    盈+全自动风控系统为您保驾护航
                </div>
            </div>
        </div>
    </div>
	<div class="foot">
		<div class="container">
            <div class="row">
                <div class="hzhb_box">
                    <div class="title" style=" padding-left:10px; font-weight:normal; font-size:20px; color:#ccc;">
                        主要合作机构
                    </div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.picc.com/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/1_on.png'" onmouseout="this.src = '<%=basePath%>resources/web/images/hzhb/1.jpg'" src="<%=basePath%>resources/web/images/hzhb/1.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.fuioupay.com/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/2_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/2.jpg'" src="<%=basePath%>resources/web/images/hzhb/2.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.nanhua.net/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/3_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/3.jpg'" src="<%=basePath%>resources/web/images/hzhb/3.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.zttrust.com.cn/stations/526623d20a/index.php/5268e6b50a"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/4_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/4.jpg'" src="<%=basePath%>resources/web/images/hzhb/4.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://sc.hkex.com.hk/TuniS/www.hkex.com.hk/eng/index.htm/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/5_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/5.jpg'" src="<%=basePath%>resources/web/images/hzhb/5.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.cmegroup.com/cn-s/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/6_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/6.jpg'" src="<%=basePath%>resources/web/images/hzhb/6.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.sgx.com/wps/portal/sgxweb_ch/home/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOKNHB1NPAycDSz9wwzMDTxD_Z2Cg8PCDANdjYEKIoEKDHAARwNC-sP1o8BK8JhQkBthkO6oqAgAzDYPQQ!!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/7_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/7.jpg'" src="<%=basePath%>resources/web/images/hzhb/7.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.neeq.com.cn/index/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/8_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/8.jpg'" src="<%=basePath%>resources/web/images/hzhb/8.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.cmbchina.com/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/9_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/9.jpg'" src="<%=basePath%>resources/web/images/hzhb/9.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.bankcomm.com/BankCommSite/default.shtml"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/10_on.png'" onmouseout="this.src = '<%=basePath%>resources/web/images/hzhb/10.jpg'" src="<%=basePath%>resources/web/images/hzhb/10.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.ccb.com/cn/home/index.html"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/11_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/11.jpg'" src="<%=basePath%>resources/web/images/hzhb/11.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.icbc.com.cn/icbc/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/12_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/12.jpg'" src="<%=basePath%>resources/web/images/hzhb/12.jpg" /></a></div>
                </div>

                <div class="ft_item ft_item_sns">
                    <div class="ft_item_tit">关注我们</div>
                    <ul style=" margin-bottom:0px;" class="ft_sns_list clearfix">
                        <li>
                            <div class="wx_tips j_tips">
                                <div class="tips_hd">
                                    <em class="ico_sns ico_weixin"></em>
                                    <span class="txt">微信公众号</span>
                                </div>
                                <div class="tips_bd">
                                    <em class="arrow"></em>
                                    <img src="<%=basePath%>resources/web/images/yj.jpg" alt="微信公共平台">
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="" target="_blank" rel="nofollow">
                                <em class="ico_sns ico_sinawb"></em>
                                <span class="txt">新浪微博</span>
                            </a>
                        </li>
                        <li>
                            <a href="" target="_blank" rel="nofollow">
                                <em class="ico_sns ico_txwb"></em>
                                <span class="txt">腾讯微博</span>
                            </a>
                        </li>
                    </ul>

                    <div class="contactUs">
                       <div class="title" style=" padding-left:10px; font-weight:normal; font-size:20px; color:#ccc;">
                          联系我们
                        </div>
                        <div class="contactInfo" style="padding-left:30px;">
                            <a style="display:inline-block; height:50px; width:50px; text-align:center; " target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=508886246&amp;site=qq&amp;menu=yes"><img src="<%=basePath%>resources/web/images/qqIcon.png" onmouseover="$(this).css('height', '52px');" onmouseout="    $(this).css('height', '48px');" /></a>
                            <span class="kefu">在线客服</span><span class="time">08:30 - 21:00</span>
                        </div>
                    </div>

                </div>

			</div>
		</div>
	</div>
	<div class="foot3">
		<div class="container">
			<div class="row">
				Copyright © 2010 - 2015 www.ying158.com All Rights Reserverd 杭州吉威投资管理有限公司 版权所有<br>
				浙ICP备14030807号-3 杭州市江干区钱江新城迪凯银座19F 4000-999-158
			</div>
		</div>
	</div>
</div>
</body>
</html>