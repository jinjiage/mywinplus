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
                    <a class="select" href="javascript:;">银行卡管理</a>
                </div>
                <div id="conBox">
                    <div class="box"  style="display:block">
                        <div class="myBankCards clearfix">
                                <div class="card" id="bankcard_93">
                                    <div class="banklogo"><img src="/winplus/resources/web/images/banks/ZSYH.jpg"></div>
                                    <div class="cardno"><strong>6214835712790243</strong></div>
                                    <div class="cardno"><strong>浙江-杭州-西湖区-高新支行</strong></div>

                                </div>
                                <div style="clear: both;">
                                    <strong>
					                                    您可以通过盈+理财APP申请更换安全银行卡，盈+理财会为您进行信息核对，换卡申请通过后，原银行卡自动失效，您可以绑定一张新的银行卡。<br>
					                                    换卡需要您提供如下资料：<br> </strong>
                                    1）手持身份证照片：手持身份证正面与本人头部合影，同时需确保本人头部与身份证无遮挡；<br>
                                    2）原卡注销证明：需前往对应银行开具盖有银行公章的旧银行卡注销或挂失证明。<br><br>
									发送至邮箱 vip@hzgeway.com 或 vip@ying158.com <br>
									联系400-999-158电话<br>
                                   
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade errorInfo infoModal" id="withdrawErrorModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
                <div class="modal-header">
                    <span>通知</span>
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                </div>
                <div class="modal-body">
                    <div id="withdrawError"></div>
                    <button class="btn btn-success confirmBtn" data-dismiss="modal">确认</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>