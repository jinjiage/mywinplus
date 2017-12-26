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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
</head>
<body>
	<form action="<%=basePath%>account/trades/profit/records" method="get" id="form1">
        <input type="hidden" id="pageid" name="page">
        </form>
	<div class="admin-right">
		<div class="tbConBox">
			<div class="tab">
				<a class="select" href="javascript:;">收益记录</a>
			</div>
			<div id="conBox">
				<div class="box" style="display: block">
					<div class="ajaxContainer">
						<table class="tzlist" width="100%" border="1"
							bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
							<tr>
								<th width="20%">时间</th>
								<th width="30%">订单号</th>
								<th width="20%">金额</th>
								<th width="20%">备注</th>
							</tr>
							<c:forEach items="${memberProfitRecord.getContent() }" var="member">
							<tr>
								<td><f:formatDate pattern="yyyy-MM-dd" value="${member.create_date }"/></td>
								<td>${member.serial_number }</td>
								<td><font color="#ff503f">￥
								<f:formatNumber pattern="0.000" value="${member.amount }"></f:formatNumber>
								</font></td>
								<td>${member.commentt }</td>
							</tr>
							
							</c:forEach>
							
							
						</table>


						<div class="llpage">
							<div class="in"><a
									href="javascript:getJsonInfo(${memberProfitRecord.getNumber()+1 })">首页</a>
								<a class="prev_page" href="javascript:getJsonInfo(${memberProfitRecord.getNumber()+1-1>=1?memberProfitRecord.getNumber():memberProfitRecord.getNumber()+1 })">上页</a> 
								<a
									href="javascript:getJsonInfo(${memberProfitRecord.getNumber()+1+1<memberProfitRecord.getTotalPages()?memberProfitRecord.getNumber()+1+1:memberProfitRecord.getTotalPages() })"
									class="next_page" rel="next">下页</a>
								<a
									href="javascript:getJsonInfo(${memberProfitRecord.getTotalPages()})">尾页</a>	
							</div>
						</div>
					</div>
					<script type="text/javascript">
						function getJsonInfo(id) {
							$("#pageid").val(id);
							$(form1).submit();
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
