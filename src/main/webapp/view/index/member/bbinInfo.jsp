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
<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon"
	rel="shortcut icon">
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/font/iconfont.css"
	rel="stylesheet">
<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>

<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">
<title>Insert title here</title>
</head>
<body>


	<div class="admin-right">
		<div class="tbConBox">
			<div class="tab">
				<a class="select" href="javascript:;">体验金记录</a>
			</div>
			<div id="conBox">
				<div class="box" style="display: block">
					<div class="remind">
						<h4>
							<strong><span style="color: #827E76">体验金余额(元)：</span><span
								style="color: #9d8440">${memberAccount.bbin_amount }</span>&nbsp;&nbsp;&nbsp;&nbsp; </strong>
						</h4>
					</div>

					<div>
						<table class="tzlist" width="100%" border="1"
							bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
							<tr>
								<td>标的名称</td>
								<td style="color: #9d8440;">${bbinPurchaseRecords[0]}</td>
								<td>状态</td>
								<td style="color: #9d8440;">${bbinPurchaseRecords[7]==0?"持有中":"已结清"}</td>
							</tr>
							<tr>
								<td>投资金额</td>
								<td style="color: #9d8440;">￥
								<f:formatNumber pattern="##,###.00" value="${bbinPurchaseRecords[1]}"></f:formatNumber>
								</td>
								<td>期限</td>
								<td style="color: #9d8440;">${bbinPurchaseRecords[2]}天</td>
							</tr>
							<tr>
								<td>收益方式</td>
								<td style="color: #9d8440;">一次性还本付息</td>
								<td>年化收益率</td>
								<td style="color: #9d8440;">${bbinPurchaseRecords[3]}%</td>
							</tr>
							<tr>
								<td>计息日</td>
								<td style="color: #9d8440;">
								<f:formatDate value="${bbinPurchaseRecords[4]}" pattern="yyyy-MM-dd"/>
								</td>
								<td>预期收益</td>
								<td style="color: #9d8440;">￥
								<f:formatNumber pattern="##.##" value="${bbinPurchaseRecords[6]}"></f:formatNumber>
								</td>
							</tr>
							<tr>
								<td>结束日</td>
								<td style="color: #9d8440;"><f:formatDate value="${bbinPurchaseRecords[5]}" pattern="yyyy-MM-dd"/></td>
								<td>已获收益</td>
								<td style="color: #9d8440;">
								<f:formatNumber pattern="##.##" value="${bbinPurchaseRecords[8]}"></f:formatNumber>
								元</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>