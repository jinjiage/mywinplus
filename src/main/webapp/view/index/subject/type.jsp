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
<link href="<%=basePath %>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath %>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath %>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath %>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/web/layer/layer.js"></script>
<script src="<%=basePath %>resources/web/echart/dist/echarts.js"></script>
</head>
<body>
<div>
      <div class="sdShaix">
        	<ul>
            	<li class="first">标的类型：</li>
               		<li><a href="<%=basePath%>subject/-1/${empty yearRate?-1:yearRate }/${empty period?-1: period}/${empty status?-1:status}" id="11" target="iframe2">全部</a></li>
               		<li><a href="<%=basePath%>subject/0/${empty yearRate?-1:yearRate }/${empty period?-1: period}/${empty status?-1:status}" id="12" target="iframe2">固收类理财</a></li>
               		<li><a href="<%=basePath%>subject/1/${empty yearRate?-1:yearRate }/${empty period?-1: period}/${empty status?-1:status}" id="13" target="iframe2">车盈宝</a></li>
            </ul>
        	<ul>
            	<li class="first">年化收益：</li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/-1/${empty period?-1: period}/${empty status?-1:status}" id="21" target="iframe2">全部</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/6/${empty period?-1: period}/${empty status?-1:status}" id="22" target="iframe2">6.0%</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/7/${empty period?-1: period}/${empty status?-1:status}" id="23" target="iframe2">7.0%</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/2/${empty period?-1: period}/${empty status?-1:status}" id="24" target="iframe2">7.5%</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/8/${empty period?-1: period}/${empty status?-1:status}" id="25" target="iframe2">8.0%</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/9/${empty period?-1: period}/${empty status?-1:status}" id="25" target="iframe2">8.0%以上</a></li>
            </ul>
        	<ul>
            	<li class="first">项目期限：</li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/-1/${empty status?-1:status}" id="31" target="iframe2">全部</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/10/${empty status?-1:status}" id="32"target="iframe2">15天以下</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/20/${empty status?-1:status}" id="33" target="iframe2">15-30天</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/100/${empty status?-1:status}" id="34" target="iframe2">30-180天</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/200/${empty status?-1:status}" id="35" target="iframe2">180-365天</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/400/${empty status?-1:status}" id="36" target="iframe2">一年以上</a></li>
            </ul>
        	<ul>
            	<li class="first">标的状态：</li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/${empty period?-1:period }/-1" id="41" target="iframe2">全部</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/${empty period?-1:period }/0" id="42" target="iframe2">投标中</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/${empty period?-1:period }/1" id="43" target="iframe2">还款中</a></li>
               		<li><a href="<%=basePath%>subject/${empty type?-1: type}/${empty yearRate?-1:yearRate }/${empty period?-1:period }/2" id="44"target="iframe2">已完成</a></li>
            </ul>
        </div>
        </div>
</body>
</html>