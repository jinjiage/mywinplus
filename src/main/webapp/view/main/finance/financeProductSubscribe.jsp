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
<html lang="zh-cn">

<meta name="keywords"
	content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/ying/iconfont.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/style/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
<script type="text/javascript"
	src="<%=basePath%>resources/sys/js/jquery.js"></script>
<title>后台首页</title>
</head>
<body>
	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>预约记录
		</h2>
		<form
			action="<%=basePath%>financeProductFunds/financeProductSubscribe"
			method="post" id="form1">
			<input type="hidden" value="${financeProductFundsId }"
				name="financeProductFundsId"> <input type="hidden"
				id="pageid" name="page">
		</form>
		<div class="tablelist">
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>姓名</td>
					<td>联系电话</td>
					<td>地址</td>
					<td>状态</td>
					<td>签署拍照图</td>
					<td>查看文档</td>
					<td>预约时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${financeProductFundsPage.getContent()}"
					var="finance" varStatus="st">
					<tr class="text-center">
						<td>${st.index+1 }</td>
						<td>${finance.name }</td>
						<td>${finance.phone }</td>
						<td>${finance.addr }</td>
						<td>
								<c:forEach items="${financesubscribestatus }" var="stat">
								<c:if test="${stat.statu==finance.status }" >
								<span style="color:${stat.statu==1?"green":"red"} ;">
								${stat.name }</span></c:if>
								</c:forEach> </td>
						<td><a
							href="<%=basePath%>upload/app/signedPhotos/20160309/20160309111905945559.png"
							target="_black">查看</a></td>
						<td>
						<c:if test="${finance.status==1}">
						 <a href="<%=basePath%>upload/subject/file/20160307/20160307170911553839(Yes).pdf" target="_black">私募合同</a>
                                |
                               <a href="<%=basePath%>" target="_black">风险揭示书</a>
                               </c:if>
                               <c:if test="${finance.status!=1}"> ——</c:if>
						</td>
						<td>${finance.create_date }</td>
						<td>
						<c:choose>
						<c:when test="${finance.status==0}">
						<a class="btn btn-primary btn-sm"
                               href="javascript:" disabled="disabled">签署拍照</a>
						</c:when>
						<c:when test="${finance.status==1}">
						<a class="btn btn-primary btn-sm"
                               href="javascript:" disabled="disabled">已签署</a>
						</c:when>
						<c:when test="${finance.status==2}">
						 <a class="btn btn-primary btn-sm"
                               href="<%=basePath%>financeProductFunds/addContractView/${finance.id}">签署</a>
                            <a class="btn btn-primary btn-sm"
                               href="<%=basePath%>financeProductFunds/signedError/${finance.id}" onclick="return confirm('你确定要签署失败?')">签署失败</a>
						</c:when>
						<c:when test="${finance.status==3}">
						 <a class="btn btn-primary btn-sm"
                               href="javascript:" disabled="disabled">签署失败</a>
						</c:when>
						</c:choose>
						
							
							</td>
					</tr>
				</c:forEach>


			</table>
		</div>


		<div class="llpage">
			<div class="in">
				<nav> <span class="count">第&nbsp;<b>${financeProductFundsPage.getNumber()+1 }</b>&nbsp;页，&nbsp;共&nbsp;<b>${financeProductFundsPage.getTotalPages() }</b>&nbsp;页
				</span>
				<ul class="pagination">
					<li><a class="now" href="javascript:fun(1);">首页</a></li>
					<li><a class="prev_page"
						href="javascript:fun(${financeProductFundsPage.getNumber()+1-1>=1?financeProductFundsPage.getNumber():financeProductFundsPage.getNumber()+1 });">上页</a></li>

					<li><a class="next_page" rel="next"
						href="javascript:fun(${financeProductFundsPage.getNumber()+1+1<financeProductFundsPage.getTotalPages()?financeProductFundsPage.getNumber()+1+1:financeProductFundsPage.getTotalPages() })">下页</a></li>
					<li><a class="now"
						href="javascript:fun(${financeProductFundsPage.getTotalPages() })">尾页</a></li>
				</ul>
				</nav>
			</div>
		</div>
		<!-- 内容结束 -->
	</div>
	<!-- 容器结束 -->
	<script type="text/javascript">
function fun(id){
	$("#pageid").val(id);
	$(form1).submit();
}
</script>
</body>
</html>