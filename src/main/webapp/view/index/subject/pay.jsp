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
<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
</head>
<body>
<input type="hidden" id="subjectId" value="${subjectId }">
<div class="sdbanner probanner"></div>
    <div class="proMain">
    	<div class="orderBox">
        	<div class="title"><h2><span class="iconfont">&#xe606;</span>订单详情</h2></div>
            <div class="order">
            	<img src="<%=basePath%>resources/web/images/orderPic.jpg">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  
                   <tr>
                    <td width="54%"  align="right"><span>产品名称：&nbsp;</span></td>
                    <td>${subjectName }</td>
                  </tr>
                  <tr>
                    <td align="right"><span>投资金额：&nbsp;</span></td>
                    <td><b>	${totalFee }</b>元</td>
                  </tr>
                
                  <tr>
                    <td align="right"><span>年化收益率：&nbsp;</span></td>
                    <td><b>${yearRate }</b>%</td>
                  </tr>
                  <tr>
                    <td align="right"><span>借款周期：&nbsp;</span></td>
                    <td><b>${period }</b>天 </td>
                  </tr>
                </table>
            </div>
            <table class="orderInfo" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><p>订单编号：<b>${tradeNo }</b></p><p>订单时间：
                <f:formatDate value="${date }" pattern="yyyy年MM月dd日  HH时mm分ss秒"/>
                </p></td>
                <td align="right">
                	<div class="money">
                    	<b>￥
                    	<f:formatNumber pattern="0.0" value="${totalFee }"></f:formatNumber>
                    	</b>
                        <span>应付总金额(元)</span>
                    </div>
                    </td>
                  <td width="150px">
					<form action="<%=basePath%>subjectPur/orderEnsure/${tradeNo }" method="post" class="hiddenForm">
                        <input type="hidden" name="bbinStatus" value="0">
                		<button class="tybutton">立即付款</button>
					</form>
                </td>
              </tr>
            </table>
        </div>
    </div>
</body>
<script src='<%=basePath%>resources/dist/js/jquery.min.js'></script>
<script src='<%=basePath%>resources/js/jquery.form.js'></script>
<script type="text/javascript">
    $(function () {
    	var subject_id = $("#subjectId").val();
        $(".hiddenForm").ajaxForm(function (url) {
            if(url.code==0){
               alert(url.msg);
               location="<%=basePath%>subject/subjectContent/"+subject_id+"?showTab=list"
            }else{
            	alert(url.msg);	
            }
        });
    });
</script>
</html>