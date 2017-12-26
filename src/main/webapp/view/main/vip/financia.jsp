<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>理财师管理
		</h2>

		<div class="tablelist">
			<form action="<%=basePath%>sysmember/financia" method="post"
				id="form1" name="empfrm">
				<input type="hidden" name="page" id="page">
				<table class="table tabletop">
					<tr>
						<%--    ${financialPlanner.member.mobile_Phone} --%>
						<td style="width: 110px; padding-left: 30px">手机号：</td>
						<td style="width: 180px"><input type="text"
							name="Phone" class="form-control" placeholder="手机号"
							value=""></td>
						<td style="width: 110px; padding-left: 30px">真实姓名：</td>
						<td style="width: 180px"><input type="text"
							class="form-control" name="name" placeholder="用户名" value=""></td>
						<td style="width: 110px; padding-left: 30px">状态：</td>
						<td style="width: 180px"><select name="status"
							class="form-control" style="width: 130px; height: 32px">
								<option value=" ">全部</option>
								<option value="0">待审核</option>

								<option value="1"
									${financialPlanner.status==1?"selected='selected'":"" }>认证成功</option>

								<option value="2">认证失败</option>
						</select></td>
						<td style="width: 110px; padding-left: 30px">注册时间：</td>
						<td style="width: 180px"><input type="text" name="createDate"
							class="form-control time" placeholder="注册时间" readonly="readonly"
							value=""></td>
						<td class="pull-right" style="padding-right: 30px">
							<button type="submit" class="btn btn-primary btn-sm">查询</button>
						</td>
						<td><button type="button" class="btn btn-primary btn-sm"
								onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
					</tr>
				</table>
			</form>
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>手机号</td>
					<td>真实姓名</td>
					<td>机构名称</td>
					<td>我的名片</td>
					<td>邮寄地址</td>
					<td>状态</td>
					<td>注册时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${pageemp.getContent()}" var="financialPlanner"
					varStatus="qq">
					<tr style="background: white;">
						<td>${qq.index}</td>
						<td>${financialPlanner.member.mobile_Phone}</td>
						<td>${financialPlanner.name}</td>
						<td>${financialPlanner.orgname}</td>
						<td>${financialPlanner.mycard}</td>
						<td>${financialPlanner.address}</td>
						<td>${financialPlanner.status==1?"认证成功":"审核"}</td>
						<td>${financialPlanner.create_date}</td>
						<c:if test="${financialPlanner.status==1}">
							<td>已认证</td>
						</c:if>
						<c:if test="${financialPlanner.status!=1}">
							<td><a href="javascript:fun(1,${financialPlanner.id})">更新订单</a>
							</td>
						</c:if>
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

			<!-- 内容结束 -->

		</div>
		<!-- 容器结束 -->

		<script type="text/javascript">
		function pagerequest(page){
			document.getElementById("page").value=page;
			document.empfrm.submit();
		}
	</script>

		<form action="<%=basePath %>/sysmember/fin" name="form">
			<input type="hidden" name="id" id="ids"> <input type="hidden"
				name="status" id="sexs">
		</form>
		<script type="text/javascript">
	function fun(amount,id){
		document.getElementById("ids").value=id;
		document.getElementById("sexs").value=amount;
		document.form.submit();
	}
	
	
	
	
</script>



		<!-- <div class="llpage">
		<div class="in">
			<nav>
				<span class="count">第&nbsp;<b>1</b>&nbsp;页，&nbsp;共&nbsp;<b>1</b>&nbsp;页</span>
				<ul class="pagination">

						<li><a class="prev_page">上页</a></li>


							<li><a class="now" >1</a></li>


						<li><a class="next_page" rel="next">下页</a></li>
				</ul>
			</nav>
		</div>
	</div>

         </div> -->

		<!-- 内容结束 -->
		<script type="text/javascript">
	$(function(){
		$("#status").val("");
	});

		$('.time').datetimepicker({
			format : 'yyyy-mm-dd',
			language: 'zh-CN',
			minView: 2,
		    todayBtn: 1
		}).on('changeDate', function(ev) {
			$('.time').datetimepicker('hide');
		});
		
		</script>
	</div>
	<!-- 容器结束 -->
</body>
</html>