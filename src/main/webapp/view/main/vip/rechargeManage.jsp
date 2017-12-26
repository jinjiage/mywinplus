<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta name="keywords"
	content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">

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

<link rel="stylesheet"
	href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
<script type="text/javascript"
	src="<%=basePath%>resources/date/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js"></script>

<title>后台首页</title>
</head>
<body>

	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>充值管理
		</h2>

		<div class="tablelist">
			<form action="<%=basePath%>sysmember/rechargeManage" method="post"
				id="form1" name="empfrm">
				<input type="hidden" name="page" id="page"> <input
					type="hidden" name="id" id="ids"> <input type="hidden"
					name="status" id="sexs">
				<table class="table tabletop">
					<tr>
						<td style="width: 110px; padding-left: 30px">订单编号：</td>
						<td style="width: 180px"><input type="text"
							class="form-control" name="serialNumber" placeholder="订单编号"
							value=""></td>
						<td style="width: 110px; padding-left: 30px">手机号：</td>
						<td style="width: 180px"><input type="text"
							class="form-control" name="mobilePhone" placeholder="手机号"
							value=""></td>
						<td style="width: 90px">订单状态：</td>
						<td style="width: 140px"><select name="status"
							class="form-control" style="width: 135px; height: 32px"
							id="status">
								<option value=-1>全部</option>
								<option value=0>充值失败</option>
								<option value=1>充值成功</option>
						</select></td>
						<td style="width: 110px; padding-left: 30px">富友订单：</td>
						<td style="width: 180px"><input type="text"
							class="form-control" name="payChannelOrderNo" placeholder="富友订单"
							value=""></td>
						<td style="width: 110px; padding-left: 30px">订单时间：</td>
						<td style="width: 180px"><input type="text"
							class="form-control time" name="createDate" placeholder="订单时间"
							readonly="readonly" value=""></td>
						<td class="pull-right" style="padding-right: 30px">
							<button type="submit" class="btn btn-primary btn-sm">查询</button>
						</td>
						<td>
							<button type="button" class="btn btn-primary btn-sm"
								onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">
								重置</button>
						</td>
					</tr>
				</table>
			</form>



			<table class="table table-bordered tablebox">

				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>订单编号</td>
					<td>手机号</td>
					<td>订单金额</td>
					<td>订单状态</td>
					<td>充值渠道</td>
					<td>富友手机充值订单</td>
					<td>订单时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${pageemp.getContent()}" var="sub" varStatus="qq">
					<tr class="text-center">

						<td>${qq.index}</td>
						<td>${sub.serial_number}</td>
						<td>
						${sub.member.mobile_Phone}</td>
						<td>${sub.amount}</td>
						<td>${sub.status==1?"充值成功":"充值失败"}</td>
						<td>${sub.pay_channel_name}</td>
						<td>${sub.pay_channel_order_no}</td>
						<td>${sub.create_date}</td>
						<td><a
							href="javascript:fun(${sub.status==1?'0':'1'},${sub.id})">更新订单</a>
						</td>
					</tr>
				</c:forEach>
			</table>

			<table style="background: blue; width: 600px">
				<tr style="background: white;">
					<td align="center">
						当前第${pageemp.getNumber()+1}页/共${pageemp.getTotalPages()}页 &nbsp;
						&nbsp; &nbsp; &nbsp; <a href="javascript:pagerequest(1);">首页</a>&nbsp;
						&nbsp; &nbsp; &nbsp; <a
						href="javascript:pagerequest(${pageemp.getNumber()>1?pageemp.getNumber():1});">上一页</a>&nbsp;
						&nbsp; &nbsp; &nbsp; <a
						href="javascript:pagerequest(${pageemp.getNumber()<pageemp.getTotalPages()?pageemp.getNumber()+1+1:pageemp.getTotalPages()});">下一页</a>&nbsp;
						&nbsp; &nbsp; &nbsp; <a
						href="javascript:pagerequest(${pageemp.getTotalPages()});">尾页</a>
					</td>
				</tr>
			</table>

       <script type="text/javascript">
		function fun(amount,id){
		 		document.getElementById("ids").value=id;
				document.getElementById("sexs").value=amount;
			     document.empfrm.submit();
		}
	</script>
			<script type="text/javascript">
		function pagerequest(page){
			document.getElementById("page").value=page;
			document.empfrm.submit();
		}
	</script>




			<%-- 		alert(11122);
		
		var rid=id;
		
		alert(rid);
		     $.ajax({
			 type : "POST", // 用POST方式传输
			 url:'<%=basePath%>sysmember/recharge',
			 data:{
				  "id":rid,
			 },
	})  
		 
	} --%>

			<div class="llpage">
				<div class="in">
					<nav>
						<span class="count">第&nbsp;<b>1</b>&nbsp;页，&nbsp;共&nbsp;<b>11</b>&nbsp;页
						</span>
						<ul class="pagination">

							<li><a class="prev_page">上页</a></li>


							<li><a class="now">1</a></li>
							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=2&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate=">2</a></li>
							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=3&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate=">3</a></li>
							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=4&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate=">4</a></li>
							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=5&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate=">5</a></li>

							<li><span class="gap">…</span></li>
							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=10&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate=">10</a></li>
							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=11&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate=">11</a></li>

							<li><a
								href="<%=basePath%>sysmember/rechargeManage?page=2&serialNumber=&mobilePhone=&status=&payChannelOrderNo=&createDate="
								class="next_page" rel="next">下页</a></li>
						</ul>
					</nav>
				</div>
			</div>

		</div>

		<!-- 内容结束 -->

	</div>
	<!-- 容器结束 -->

	<script type="text/javascript">
	
	

    
	
/* 	 $.ajax({
		 type : "POST", // 用POST方式传输
		 url:base+'/manage/login',
		 data:{
			 "userName":en_phone,
			 "password":en_pwd,
			 "mobilePhone":mobilePhone.val(),
			 "code":code.val()
		 },
		
		 success:function(data){
			 if(data.iscode == 0){
				 window.location.href=b+"/view/main/main.jsp";
			 }else{
				 $(".error").html(data.msg).show();
			 }
	 */
	
	
	
    $(function () {
        $("#status").val("");
    });
    $('.time').datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        autoclose: false
    }).on('changeDate', function (ev) {
        $('.time').datetimepicker('hide');
    });

</script>
</body>
</html>