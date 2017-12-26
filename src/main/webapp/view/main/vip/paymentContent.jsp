<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>    
<!DOCTYPE html>
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
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>付息计划</h2>

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
                          <td>投资金额</td>
                          <td>还款利息+本金=本息</td>
                          <td>投资时间</td>
                          <td>还款时间</td>
                          <td>还款状态</td>
                          <td>操作</td>
                          </tr>
                          
                    <tr class="text-center">
                        <td>1</td>
                        <td>201603090218541823</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td>￥4,248.00元</td>
                        <td><span style="color: red;">4.89</span>+
                        	<span style="color: red;">4248</span>=
                        	<span style="color: blue;">￥4,252.89</span>元
                        </td>
                        <td>2016-03-09 14:18</td>
                        <td>
                        		2016-03-15 14:18
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>2</td>
                        <td>201603090218437651</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td>￥200.00元</td>
                        <td><span style="color: red;">0.23</span>+
                        	<span style="color: red;">200</span>=
                        	<span style="color: blue;">￥200.23</span>元
                        </td>
                        <td>2016-03-09 14:18</td>
                        <td>
                        		2016-03-15 14:18
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>3</td>
                        <td>201603091243597289</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td>￥120.00元</td>
                        <td><span style="color: red;">0.14</span>+
                        	<span style="color: red;">120</span>=
                        	<span style="color: blue;">￥120.14</span>元
                        </td>
                        <td>2016-03-09 12:43</td>
                        <td>
                        		2016-03-15 12:43
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>4</td>
                        <td>201603091228485630</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td>￥105.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">105</span>=
                        	<span style="color: blue;">￥105.12</span>元
                        </td>
                        <td>2016-03-09 12:28</td>
                        <td>
                        		2016-03-15 12:28
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>5</td>
                        <td>201603091221221701</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 12:21</td>
                        <td>
                        		2016-03-15 12:21
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>6</td>
                        <td>201603091219321237</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 12:19</td>
                        <td>
                        		2016-03-15 12:19
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>7</td>
                        <td>201603091219028124</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 12:19</td>
                        <td>
                        		2016-03-15 12:19
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>8</td>
                        <td>201603091139541422</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 11:39</td>
                        <td>
                        		2016-03-15 11:39
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>9</td>
                        <td>201603091139144699</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td>￥110.00元</td>
                        <td><span style="color: red;">0.13</span>+
                        	<span style="color: red;">110</span>=
                        	<span style="color: blue;">￥110.13</span>元
                        </td>
                        <td>2016-03-09 11:39</td>
                        <td>
                        		2016-03-15 11:39
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>10</td>
                        <td>201603091138424562</td>
                        <td>18767119349</td>
                        <td>陈建操</td>
                        <td>330182199109184315</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 11:38</td>
                        <td>
                        		2016-03-15 11:38
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>11</td>
                        <td>201603091131272228</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 11:31</td>
                        <td>
                        		2016-03-15 11:31
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>12</td>
                        <td>201603090954085625</td>
                        <td>18758030932</td>
                        <td>尚镜</td>
                        <td>420621199501053332</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-03-09 09:54</td>
                        <td>
                        		2016-03-15 09:54
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>13</td>
                        <td>201603011114568106</td>
                        <td>18758030932</td>
                        <td>尚镜</td>
                        <td>420621199501053332</td>
                        <td>￥450.00元</td>
                        <td><span style="color: red;">0.52</span>+
                        	<span style="color: red;">450</span>=
                        	<span style="color: blue;">￥450.52</span>元
                        </td>
                        <td>2016-03-01 11:14</td>
                        <td>
                        		2016-03-07 11:14
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>14</td>
                        <td>201601220347238786</td>
                        <td>18120581170</td>
                        <td>杨思晗</td>
                        <td>421083199503162417</td>
                        <td>￥1,233.00元</td>
                        <td><span style="color: red;">1.42</span>+
                        	<span style="color: red;">1233</span>=
                        	<span style="color: blue;">￥1,234.42</span>元
                        </td>
                        <td>2016-01-22 15:47</td>
                        <td>
                        		2016-01-28 15:47
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>15</td>
                        <td>201601151011138629</td>
                        <td>18758030932</td>
                        <td>尚镜</td>
                        <td>420621199501053332</td>
                        <td>￥100.00元</td>
                        <td><span style="color: red;">0.12</span>+
                        	<span style="color: red;">100</span>=
                        	<span style="color: blue;">￥100.12</span>元
                        </td>
                        <td>2016-01-15 10:11</td>
                        <td>
                        		2016-01-21 10:11
                        </td>
                        <td>
                        	<span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        	<a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
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