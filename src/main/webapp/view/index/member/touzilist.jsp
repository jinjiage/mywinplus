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
<form action="<%=basePath%>account/deposit/records" method="get" id="form1">
        <input type="hidden" id="pageid" name="page">
        <input type="hidden" id="pageid2" name="page1">
        </form>
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">投资记录</a>
                </div>
          <div id="conBox">
		<div class="box" style="display: block">     
	<div class="ajaxContainer">
		<!-- 异步内容开始 -->
		<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9"
			cellspacing="0" cellpadding="0">
			<tr>
				<th>订单编号</th>
				<th>标的名称</th>
				<th>金额</th>
				<th>预期收益</th>
				<th>状态</th>
				<th>购买时间</th>
			</tr>
			<c:forEach items="${ subjectPurchaseRecords.getContent() }" var="subject" varStatus="sta">
			<tr>
				<td>${subject.serial_number }</td>
				<td><font color="#a58b48">
				<c:forEach items="${subjects }" var="su">
				<c:if test="${su.id==subject.subject_id }">${su.name }</c:if>
				</c:forEach>
				</font></td>
				<td><font color="#ff503f">￥
				<f:formatNumber pattern="0.00" value="${subject.amount }"></f:formatNumber>
				</font></td>
				<td>￥
				<f:formatNumber pattern="0.00" value="${subject.interest+0.01 }"></f:formatNumber>
</td>
				<td>
				${subject.ispayment==1?"已还款":"未还款" }
				</td>
				<td>${subject.create_date}</td>
			</tr>
			
			</c:forEach>
		</table>
		<div class="listCount">
			总计<font color="#ff503f">${subjectPurchaseRecords.getTotalElements()}</font>笔
		</div>


		<div class="llpage">
			<div class="in"><a
									href="javascript:getJsonInfo(${subjectPurchaseRecords.getNumber()+1 })">首页</a>
								<a class="prev_page" href="javascript:getJsonInfo(${subjectPurchaseRecords.getNumber()+1-1>=1?subjectPurchaseRecords.getNumber():subjectPurchaseRecords.getNumber()+1 })">上页</a> 
								<a
									href="javascript:getJsonInfo(${subjectPurchaseRecords.getNumber()+1+1<subjectPurchaseRecords.getTotalPages()?subjectPurchaseRecords.getNumber()+1+1:subjectPurchaseRecords.getTotalPages() })"
									class="next_page" rel="next">下页</a>
								<a
									href="javascript:getJsonInfo(${subjectPurchaseRecords.getTotalPages()})">尾页</a>	
							</div>
		</div>
	</div>
	
	</div></div>
	</div>
	<div class="tbConBox">
	<div class="tab">
		<a class="select" href="javascript:;">预约记录</a>
	</div>
	<div id="conBox">
		<div class="box" style="display: block">
			<div class="ajaxContainer2">
				<!-- 异步内容开始 -->
				<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9"
					cellspacing="0" cellpadding="0">
					<tr>
						<th>标的名称</th>
						<th>金额</th>
						<th>预期收益</th>
						<th>状态</th>
						<th>预约时间</th>
						<th>下载</th>
					</tr>
					<c:forEach items="${financeProductSubscribes.getContent() }" var="finance">
					
					<tr>
						<td><font color="#a58b48">
						<c:forEach items="${financeProductFunds }" var="fff">
						<c:if test="${fff.id==finance.product_id }">${fff.name}</c:if>
						</c:forEach>
</font></td>
						<td><font color="#ff503f">￥
						<f:formatNumber pattern="00.00" value="${finance.amount }"></f:formatNumber>
						</font></td>
						<td>￥
						<f:formatNumber pattern="00.00" value="${finance.amount+finance.interest }"></f:formatNumber></td>
						<td>
						已签署
						</td>
						<td>2016-03-07</td>
						<td><a
							href="<%=basePath%>${finance.commentt}"
							target="_black">查看下载</a></td>
					</tr>
					</c:forEach>
					</table>
				<div class="listCount">
					总计<font color="#ff503f">${financeProductSubscribes.getTotalElements()}</font>笔
				</div>


				<div class="llpage">
					<div class="in"><a
									href="javascript:getInfo(${financeProductSubscribes.getNumber()+1 })">首页</a>
								<a class="prev_page" href="javascript:getInfo(${financeProductSubscribes.getNumber()+1-1>=1?financeProductSubscribes.getNumber():financeProductSubscribes.getNumber()+1 })">上页</a> 
								<a
									href="javascript:getInfo(${financeProductSubscribes.getNumber()+1+1<financeProductSubscribes.getTotalPages()?financeProductSubscribes.getNumber()+1+1:financeProductSubscribes.getTotalPages() })"
									class="next_page" rel="next">下页</a>
								<a
									href="javascript:getInfo(${financeProductSubscribes.getTotalPages()})">尾页</a>	
							</div>
				</div>
			</div>
			<script type="text/javascript">
						function getJsonInfo(id) {
							$("#pageid").val(id);
							$(form1).submit();
						}
						function getInfo(id) {
							$("#pageid2").val(id);
							$(form1).submit();
						}
					</script>
		</div>
	</div>
	</div>
</body>
</html>