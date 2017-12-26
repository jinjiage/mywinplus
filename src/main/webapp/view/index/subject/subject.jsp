<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=basePath %>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath %>resources/web/font/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath %>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath %>resources/web/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath %>resources/web/layer/layer.js"></script>
<script src="<%=basePath %>resources/web/echart/dist/echarts.js"></script>
</head>
<body>
<div>
<div><iframe name="iframe1"  src="<%=basePath %>view/index/subject/type.jsp"scrolling="no" width="100%" onload="this.height=iframe1.document.body.scrollHeight" frameborder="0"  style="border: 0px;" ></iframe></div>
</div>
<div>
<form action="<%=basePath%>subject/${type }/${yearRate }/${period }/${status}" method="get" id="form1">
        <input type="hidden" id="pageid" name="page">
        </form>
	<div class="ajaxContainer">
		<c:forEach items="${subjects.getContent() }" var="sub">
			<ul class="tbList">
				<li class="first"><span class="ico zq"></span>
					<h2>
						<em>投</em>${sub.name}</h2> <i></i></li>
						<c:forEach items="${list }" var="lis">
						<c:if test="${lis[0]==sub.id }">
						<c:if test="${empty sub.amount }">
								<li class="second">

					<div class="txt1">
						<h2>

							<f:formatNumber pattern="0.0" value="${sub.year_rate-1}"></f:formatNumber>


							<span style="font-size: 18px;">+1.0%</span>
						</h2>
						<p>年化收益</p>
					</div>

					<div class="txt2">
						<h2>￥${sub.floor_amount }</h2>
						<p>起购金额(元)</p>
					</div>

					<div class="txt2">
						<h2>${sub.period }天</h2>
						<p>投资期限</p>
					</div>
				</li>
				<li class="three"><a href="#1">企业担保</a><span>中国人保财险承保</span>
					<p>
						计息日期：当天投资，立即计息<br>已购人数：
						
							${lis[2]+sub.bought }
					

						人
					</p></li>
						<li class="four"></li>
						</c:if>
						<c:if test="${!empty sub.amount }">
						<li class="second">					
							<div class="txt1">
								<h2>${ sub.amount}</h2>
								<p>标的总额(万)</p>
							</div>
							
							<div class="txt2">
								<h2>
								<f:formatNumber pattern="0.0" value="${sub.year_rate-1}"></f:formatNumber>
								<span style="font-size:18px;">+1.0%</span></h2>
								<p>年化收益</p>
							</div>
							<div class="txt2">
								<h2>${sub.period }天</h2>
								<p>投资期限</p>
							</div>
						</li>
						<li class="three">
								<a href="#1">企业担保</a><span>中国人保财险承保</span>
								<p>计息日期：募集满后第二天<br>已购人数：
									${lis[2]+sub.bought}人</p>
						</li>
						<li class="four">
								<div data-num="0" class="yuan" ></div>
						</li>
							</c:if>
						</c:if>
						</c:forEach>
					<li class="five"><a class="abtn"
					href="<%=basePath %>subject/subjectContent/${sub.id }"target="indexframe">购买</a></li>
			</ul>
		</c:forEach>

		<div class="llpage">
			<div class="in"><a
									href="javascript:getJsonInfo(${subjects.getNumber()+1 })">首页</a>
								<a class="prev_page" href="javascript:getJsonInfo(${subjects.getNumber()+1-1>=1?subjects.getNumber():subjects.getNumber()+1 })">上页</a> 
								<a
									href="javascript:getJsonInfo(${subjects.getNumber()+1+1<subjects.getTotalPages()?subjects.getNumber()+1+1:subjects.getTotalPages() })"
									class="next_page" rel="next">下页</a>
								<a
									href="javascript:getJsonInfo(${subjects.getTotalPages()})">尾页</a>	
							</div>
		</div>
		<div style="width: 100%;height: 30px;"></div>
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