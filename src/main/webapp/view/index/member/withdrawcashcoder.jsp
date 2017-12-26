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
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/font/iconfont.css"
	rel="stylesheet">
<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script src="<%=basePath%>resources/web/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/web/location/area.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/web/location/location.js"></script>

</head>
<body>
<form action="<%=basePath%>account/withdraw/reco" method="get" id="form1">
		<input type="hidden" id="pageid" name="page"> 
	</form>
	<div class="ajaxContainer">
						<table class="tzlist" width="100%" border="1"
							bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
							<tr>
								<th width="20%">时间</th>
								<th width="30%">订单号</th>
								<th width="20%">金额</th>
								<th width="10%">状态</th>
							</tr>
							<c:forEach items="${records.getContent() }" var="reco">
								<tr>
									<td><f:formatDate pattern="yyyy-MM-dd"
											value="${reco.create_date }" /></td>
									<td>${reco.serial_number }</td>
									<td><font color="#ff503f">￥ <f:formatNumber
												pattern="0.00" value="${reco.amount }"></f:formatNumber>
									</font></td>
									<td><c:forEach items="${withdrawstatus }" var="sta">
											<c:if test="${sta.statu==reco.status }">${sta.name }</c:if>
										</c:forEach></td>
								</tr>

							</c:forEach>

						</table>


						<div class="llpage">
							<div class="in">
								<a class="now"
									href="javascript:getJsonInfo(${records.getNumber()+1 })">首页</a>
								<a class="prev_page"
									href="javascript:getJsonInfo(${records.getNumber()+1-1>=1?records.getNumber():records.getNumber()+1 })">上页</a>

								<a
									href="javascript:getJsonInfo(${records.getNumber()+1+1<records.getTotalPages()?records.getNumber()+1+1:records.getTotalPages() })"
									class="next_page" rel="next">下页</a> <a class="now"
									href="javascript:getJsonInfo(${records.getTotalPages()})">尾页</a>
							</div>
						</div>


					</div>
					<script type="text/javascript">
					function getJsonInfo(id) {
						$("#pageid").val(id);
						$(form1).submit();
					}
					
				</script>
</body>
</html>