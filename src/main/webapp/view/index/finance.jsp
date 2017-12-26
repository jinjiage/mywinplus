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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath%>resources/web/font/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/web/layer/layer.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>
</head>
<title>Insert title here</title>


</head>
<body>
	<div class="ajaxContainer">
		<c:forEach items="${financeProductFundsList }" var="finance">

			<ul class="tbList">
				<li class="first"><span class="ico jp"></span>
					<h2>
						<b>${finance.name }</b>
					</h2> <i></i></li>
				<c:if test="${!empty finance.period }">
					<li class="second" style="width: 630px;">
						<div class="txt1">
							<h2>${finance.year_rate }%</h2>
							<p>年化收益</p>
						</div>

						<div class="txt2">
							<h2>${finance.period }</h2>
							<p>期限(天)</p>
						</div>
						<div class="txt2">
							<h2>${finance.floor_amount }</h2>
							<p>起购金额(元)</p>
						</div>
					</li>
				</c:if>
				<c:if test="${empty finance.period}">
					<li class="second">
						<div class="txt1" style="width: 115px; margin-left: 40px;">
							<h2>${finance.year_rate }%</h2>
							<p>年化收益</p>
						</div>
						<div class="txt2" style="width: 120px; margin-left: 40px;">
							<h2>${finance.floor_amount }</h2>
							<p>起购金额(元)</p>
						</div>
					</li>
					<li class="six three" style="width: 290px;">
						<p>
							已购人数：${finance.buyer_count }人 <br> 管理人：${finance.buyer_count }<br>
							投资方向：${finance.buyer_count }
						</p>
					</li>
				</c:if>



				<li class="five"><a class="abtn"
					href="<%=basePath%>finance/financeView/30">购买</a></li>
			</ul>


		</c:forEach>

		<!-- 异步内容结束 -->


		<div class="llpage">
			<div class="in">

				<a class="prev_page">上页</a> <a class="now">1</a> <a
					class="next_page" rel="next">下页</a>
			</div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
	</div>
</body>
</html>