<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
	<title>产品中心- 盈+</title>
	
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath %>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath %>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath %>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath %>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/web/layer/layer.js"></script>
<script src="<%=basePath %>resources/web/echart/dist/echarts.js"></script></head>

<body>

    


	<jsp:include page="top.jsp"></jsp:include>

    
 <div>
<iframe name="indexframe" frameborder="0" scrolling="no" style="border: 0px;" onload="this.height=indexframe.document.body.scrollHeight" width="100%"
 src="<%=basePath %>/view/index/promain.jsp">

</iframe>

<script type="text/javascript">
	function getJsonInfo(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer").empty();
			$(".ajaxContainer").append(data);
		});
	}
		require.config({
            paths: {
                echarts: '<%=basePath %>resources/web/echart/dist/'
            }
        });
		require(
			[
				'echarts',
				'echarts/chart/pie'
			],
			function (ec) {
				var labelTop = {
						normal : {
							color:'#ff503f',
							label : {
								show : false,
								position : 'center',
								formatter : '{b}',
								textStyle: {
									baseline : 'bottom'
								}
							},
							labelLine : {
								show : false
							}
						}
					};
				var labelFromatter = {
					normal : {
						label : {
							formatter : function (params){
								return 100 - params.value + '%'
							},
							textStyle: {
								color:'#666',
								baseline : 'middle'
							}
						}
					},
				};
				var labelBottom = {
					normal : {
						color: '#f8f8f8',
						label : {
							show : true,
							position : 'center'
						},
						labelLine : {
							show : false
						}
					}
				};
				var radius = [30,35];
				var myChart1 =document.getElementsByClassName('yuan');
				for(i=0;i<myChart1.length;i++){
					var num = myChart1[i].getAttribute('data-num');
					ec.init(myChart1[i]).setOption({
						series : [
							{
								type : 'pie',
								center : ['50%', '50%'],
								radius : radius,
								x: '0%', // for funnel
								itemStyle : labelFromatter,
								data : [
									{name:'other', value:100-num, itemStyle : labelBottom},
									{name:'占比', value:num,itemStyle : labelTop}
								]
							},
						]
					});
				}
			}
		);
    </script>    </div>
   

   <jsp:include page="bottom.jsp"></jsp:include>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?06cf97732baac1a65bed8ae95f2384aa";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script><script type="text/javascript">
$(function(){
	$('#11').addClass("select");
	$('#21').addClass("select");
	$('#31').addClass("select");
	$('#41').addClass("select");
});
</script>
</body>
</html>