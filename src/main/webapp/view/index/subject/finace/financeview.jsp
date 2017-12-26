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
<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon"
	rel="shortcut icon">
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/web/layer/layer.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>    <script type="text/javascript" src="<%=basePath%>resources/web/location/area.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/web/location/location.js"></script>
    <script type="text/javascript">
	$(document).ready(function() {
		showLocation();
	});
	</script>
</head>
<body>
<div class="proMain">
    <div class="conTit">
        <span><a style="color:#9d8440;" href="<%=basePath%>finance">其他标的</a></span>
        <h2><em>￥</em>${product.name }</h2>
    </div>
    <table class="conTable" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td class="txtInfo">
                <div class="txt2">
                    <h2>${product.year_rate }%</h2>
                    <p>预期收益</p>
                </div>
                <div class="txt1">
                    <h2>${product.floor_amount }</h2>
                    <p>起投金额(元)</p>
                </div>

            </td>
            <td width="360" rowspan="2" align="center" ; valign="middle" height="320">
                <div class="tbBox">
                    <div class="li4" style=""><span id="checkmoney" style="color: red;"></span></div>
                
                    <p><input class="txt" name="name" type="text" value="" placeholder="请输入姓名"></p>
                    <p><input class="txt" name="phone" type="text" value="" placeholder="请输入电话号码"></p>
                    <p class="pSelect">
                    	<span class="select1 fl">
                           <select id="loc_province"></select>
                        </span>
                        <span class="select2 fr">
                            <select id="loc_city"></select>
                        </span>
                        <input type="hidden" name="location_id" id="location_id"/>
                    </p>
                    <c:if test="${product.status==1}">
                    <button class="submit">投资预约</button>
                    </c:if>
                    <c:if test="${product.status!=1}">
                    <button disabled="disabled" style="background-color: #848080;">已售罄</button>
                    </c:if>
                    <div class="phone"><span>4000-999-158</span>7X24小时咨询电话</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <ul class="conInfoList">
                    <li class="info" style="height:auto">
                        <p>已购人数：<font color="#00baff">${product.buyer_count }人</font></p>
                        <p>管&nbsp;理&nbsp;&nbsp;人：<font color="#00baff">${product.product_manager_name }</font></p>
                        <p>投资方向：<font color="#00baff">${product.invest_points } </font></p>
                    </li>
                </ul>
            </td>
        </tr>
    </table>
    <div class="tbConBox">
        <div class="tab">
            <a class="select" href="#1">关于基金</a>
            <a href="#1">产品要素</a>
        </div>
        <div id="conBox">
            <div class="box" style="display:block">
            <p>21312</p>
            </div>
            <div class="box">
            <p>43534</p>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?06cf97732baac1a65bed8ae95f2384aa";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script></body>
<script type="text/javascript">
	$(function(){

		$(".tbConBox .tab a").click(function(){
			if(!$(this).hasClass("select")){
				var num=$(this).index();
				$(this).addClass("select").siblings().removeClass("select");
				$("#conBox .box").eq(num).show().siblings().hide();
			}
		});
		
		$(":input").focus(function () {
            $(".li4").hide();
        });
		
		
            $(".submit").click(function(){
            	 
	   			 var loc_province = $("#loc_province").find("option:selected").text();
	   		     var loc_city = $("#loc_city").find("option:selected").text();
	   		     var cardaddress=loc_province+"-"+loc_city;
	   		     if($("input[name='name']").val()==''){
	   		    	 $("#checkmoney").html("请输入姓名");
	   		    	 $(".li4").show(100);
	   		    	 return false;
	   		     }
	   		     if($("input[name='phone']").val()==''){
	   		    	 $("#checkmoney").html("请输入电话");
	   		    	 $(".li4").show(100);
	   		    	 return false;
	   		     }
	   		     if(!(/^1[34578]\d{9}$/.test($("input[name='phone']").val()))){
	   		    	$("#checkmoney").html("请输入正确电话号码");
	  		    	 $(".li4").show(100);
	  		    	 return false;
	   		     }
	   		     if(loc_province=="省份"){
	   		        $("#checkmoney").html("请选择省份");
	   		     	$(".li4").show(100);
	   		        return false;
	   		     }
	   		     if(loc_city=="地级市"){
	   		    	$("#checkmoney").html("请选择地级市");
	   		    	$(".li4").show(100);
	   		        return false;
	   		     }
	   		     $("#location_id").val(cardaddress);
		   		  $.ajax({
		                type: "POST", // 用POST方式传输
		                dataType: "json", // 数据格式:JSON
		                async: true,
		                url: '<%=basePath%>finance/addfinance', // 目标地址
		                data: {
		                	productId: 33,
		                	name: $("input[name='name']").val(),
		                	phone:$("input[name='phone']").val(),
		                	location_id:cardaddress
		                },
		                success: function (msg) {
		                    if (msg.code == 0) {
                                layer.open({
                                    type: 1,
                                    title: ['', 'background:#fff'],
                                    skin: '',
                                    area: ['406px', '466px'],
                                    content: '<div class="dialogs">' +
                                    '<img src="<%=basePath%>resources/web/images/dialog_ico.png"/><h1>预约申请成功</h1>'+
                                    '<a type="button" href="<%=basePath%>h5/v1/financeContract/33" target="_black">合同建档成功，等待签署</a><div class="hrs"><font>银行账户</font></div><p>招商银行杭州湖墅支行</p>'+
                                    '<p>5719 0815 9410 801</p><p style="margin-top:20px">户名：杭州吉威投资管理有限公司</p></div>'
                                });
		                    } else {
		                    	$("#checkmoney").html(msg.msg);
		                    	$(".li4").show(100);
		    	   		        return false;
		                    }
		                }
		            });
	   		});
		
	});
		
        
</script>
</html>