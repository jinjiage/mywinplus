<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=basePath %>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath %>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath %>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath %>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/web/layer/layer.js"></script>
<script src="<%=basePath %>resources/web/echart/dist/echarts.js"></script></head>

<title>Insert title here</title>
</head>
<body>
<form action="<%=basePath%>oversea" method="get" id="form1">
        <input type="hidden" id="pageid" name="page">
        </form>
<ul class="safeList">

<div class="ajaxContainer">
	<!-- 异步内容开始 -->
	<c:forEach items="${overseaConfigAPIs.getContent() }" var="oversea">
	<li>
				<a href="<%=basePath %>oversea/overseaView/${oversea.id }">
				<span style="width: 40px;height: 40px;" class="iconfont"><img src="<%=basePath %>upload/news/img/20160115/20160115175237364779.png" width="40" height="40"/></span>

				<h2>${oversea.title }<p>${oversea.child_title }</p></h2>
				<h3>${oversea.description }<p><i style="color: #aaa; font-style: normal;">用户群体：</i>${oversea.user_type}</p></h3>
			</a>
		</li>
	</c:forEach>
		
	
	<div class="llpage">
		<div class="in"><a
									href="javascript:getJsonInfo(${overseaConfigAPIs.getNumber()+1 })">首页</a>
								<a class="prev_page" href="javascript:getJsonInfo(${overseaConfigAPIs.getNumber()+1-1>=1?overseaConfigAPIs.getNumber():overseaConfigAPIs.getNumber()+1 })">上页</a> 
								<a
									href="javascript:getJsonInfo(${overseaConfigAPIs.getNumber()+1+1<overseaConfigAPIs.getTotalPages()?overseaConfigAPIs.getNumber()+1+1:overseaConfigAPIs.getTotalPages() })"
									class="next_page" rel="next">下页</a>
								<a
									href="javascript:getJsonInfo(${overseaConfigAPIs.getTotalPages()})">尾页</a>	
							</div>
	</div>
	<div style="width: 100%;height: 20px;"></div>
</div>
</ul>
</body>
<script type="text/javascript">
						function getJsonInfo(id) {
							$("#pageid").val(id);
							$(form1).submit();
						}
					</script>
</html>