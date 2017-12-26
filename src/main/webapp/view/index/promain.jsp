<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=basePath %>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath %>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath %>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath %>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/web/layer/layer.js"></script>
<script src="<%=basePath %>resources/web/echart/dist/echarts.js"></script>
</head>
<body>
<div class="sdbanner probanner"></div>
<div class="proMain">
    	<div class="hwpzNav">
    		<ul>
    			<li class="first"><a class="active" href="<%=basePath %>subject" target="abc" >固收类理财</a></li>
    			<li class="second"><a href="<%=basePath %>finance" target="abc">私募基金</a></li>
    			<li class="three"><a href="<%=basePath %>oversea" target="abc">海外配置</a></li>
    			<li class="four"><a href="<%=basePath %>finance" target="abc">股权基金</a></li>
    		</ul>
    	</div>
    	<iframe name="abc" src="<%=basePath %>/view/index/subjectgu.jsp" scrolling="no" width="100%" onload="this.height=abc.document.body.scrollHeight" frameborder="0"  style="border: 0px;"></iframe>
    	
    	
    	</div>
</body>
</html>