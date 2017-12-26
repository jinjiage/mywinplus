<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>    
<html lang="zh-cn">
<head>

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/ying/iconfont.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/bootstrap.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
        <script type="text/javascript" src="<%=basePath%>resources/sys/js/jquery.js"></script>
  <title>后台首页</title>
</head>
<body>

                     <div class="box-right-main">
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>体验金付息计划</h2>

                      <div class="tablelist">
                        <table class="table tabletop">
                        <tr>
                        <td style="padding-left:30px">标的名称：有缘固收类1 
                        				&nbsp; &nbsp; &nbsp; &nbsp;  标的期限：6天
                        				&nbsp; &nbsp; &nbsp; &nbsp;  年化收益率：7%</td>
                        </tr>     
                        </table>
                        <table class="table table-bordered tablebox">
                         
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>流水号</td>
                          <td>投资人手机号</td>
                          <td>投资人姓名</td>
                          <td>投资人身份证</td>
                          <td>投资体验金</td>
                          <td>还款利息</td>
                          <td>还款时间</td>
                          <td>还款状态</td>
                          <td>操作</td>
                          </tr>
                          
                    <tr class="text-center">
                        <td>1</td>
                        <td>201603080314148072</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td><span style="color: blue;">￥8,888.00</span>元</td>
                        <td><span style="color: red;">￥10.23</span>元 </td>
                        <td>2016-03-14</td>
                        <td>
                        	<span style="color: red;">待还款</span>
                        </td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbin?id=16" class="btn btn-primary btn-sm">立即还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>2</td>
                        <td>201603080311315951</td>
                        <td>13074607845</td>
                        <td>张丽珍</td>
                        <td>330126197110034322</td>
                        <td><span style="color: blue;">￥8,888.00</span>元</td>
                        <td><span style="color: red;">￥10.23</span>元 </td>
                        <td>2016-03-14</td>
                        <td>
                        	<span style="color: red;">待还款</span>
                        </td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbin?id=15" class="btn btn-primary btn-sm">立即还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>3</td>
                        <td>201603040345074309</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td><span style="color: blue;">￥8,888.00</span>元</td>
                        <td><span style="color: red;">￥10.23</span>元 </td>
                        <td>2016-03-10</td>
                        <td>
                        	<span style="color: red;">待还款</span>
                        </td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbin?id=14" class="btn btn-primary btn-sm">立即还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>4</td>
                        <td>201601220621005110</td>
                        <td>18758030932</td>
                        <td>尚镜</td>
                        <td>420621199501053332</td>
                        <td><span style="color: blue;">￥8,888.00</span>元</td>
                        <td><span style="color: red;">￥10.23</span>元 </td>
                        <td>2016-01-28</td>
                        <td>
                        	<span style="color: red;">待还款</span>
                        </td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbin?id=13" class="btn btn-primary btn-sm">立即还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>5</td>
                        <td>201601220555153152</td>
                        <td>15558101208</td>
                        <td>柴高</td>
                        <td>412822198811093770</td>
                        <td><span style="color: blue;">￥8,888.00</span>元</td>
                        <td><span style="color: red;">￥10.23</span>元 </td>
                        <td>2016-01-28</td>
                        <td>
                        	<span style="color: red;">待还款</span>
                        </td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbin?id=12" class="btn btn-primary btn-sm">立即还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>6</td>
                        <td>201601220533418626</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td><span style="color: blue;">￥8,888.00</span>元</td>
                        <td><span style="color: red;">￥10.23</span>元 </td>
                        <td>2016-01-28</td>
                        <td>
                        	<span style="color: red;">待还款</span>
                        </td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbin?id=11" class="btn btn-primary btn-sm">立即还款</a>
                        </td>
                    </tr>
            </table>
	
	
	<div class="llpage">
		<div class="in">
			<nav>
				<span class="count">第&nbsp;<b>1</b>&nbsp;页，&nbsp;共&nbsp;<b>1</b>&nbsp;页</span>
				<ul class="pagination">

						<li><a class="prev_page">上页</a></li>


							<li><a class="now" >1</a></li>


						<li><a class="next_page" rel="next">下页</a></li>
				</ul>
			</nav>
		</div>
	</div>
         </div>

         <!-- 内容结束 -->

  </div>
<!-- 容器结束 -->
</body>
</html>