<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>邀请奖励
		</h2>

		<div class="tablelist">
			<form action="<%=basePath%>sysmember/inviteRewards" method="post" id="form1" name="empfrm">
		 <input type="hidden" name="page" id="page">
				<table class="table tabletop">
					<tr>
						<td style="width: 90px; padding-left: 20px">姓名：</td>
						<td style="width: 140px"><input type="text"
							class="form-control" name="memberName" placeholder="姓名" value=""></td>
						<td style="width: 100px; padding-left: 20px">手机号：</td>
						<td><input type="text" name="mobilePhone"
							class="form-control" placeholder="手机号" value=""></td>
						<td style="width: 90px; padding-left: 20px">邀请码：</td>
						<td style="width: 140px"><input type="text"
							class="form-control" name="invitationcode" placeholder="邀请码"
							value=""></td>
						<td style="width: 100px; padding-left: 20px">被邀请码：</td>
						<td><input type="text" name="invitedcode"
							class="form-control" placeholder="被邀请码" value=""></td>
						<td style="width: 140px; padding-left: 20px">是否已注册奖励：</td>
						<td><select name="status" class="form-control"
							style="width: 100px; height: 32px" id="status">
								<option value="">全部</option>
								<option value="0">否</option>
								<option value="1">是</option>
						</select></td>
						<td style="width: 140px; padding-left: 20px">是否已投资奖励：</td>
						<td><select name="delFlag" class="form-control"
							style="width: 100px; height: 32px" id="delFlag">
								<option value="">全部</option>
								<option value="0">否</option>
								<option value="1">是</option>
						</select></td>
						<td class="pull-right" style="padding-right: 20px">
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
					<td>姓名</td>
					<td>邀请码</td>
					<td>被邀请码</td>
					<td>投资金额</td>
					<td>是否已注册奖励</td>
					<td>是否已投资奖励</td>
					<td>注册时间</td>
					<td>操作</td>
				</tr>

				<c:forEach items="${sub}" var="sub" varStatus="qq">
					<tr class="text-center">
						<td>${qq.index}</td>
						<td>${sub[1]}</td>
						<td>${sub[2]}</td>
						<td>${sub[3]}</td>
						<td>${sub[4]}</td>
						<td>${sub[5]}</td>
						<td>${sub[6]}</td>
						<td>${sub[7]}</td>
						<td>${sub[8]}</td>
					<!-- 	"是";"否" -->
						<td><span style="color: blue;">注册已奖励 |</span> <span
							style="color: blue;">投资金额未达到 |</span> <a
							class="btn btn-primary btn-sm"
							href="<%=basePath%>sysmember/inviteRewardsRecord/${sub[0]}">奖励记录</a>
						</td>
					</tr>
				</c:forEach>
			</table>

      <table style="background: blue;width: 600px">
			<tr style="background: white;">
				<td align="center">
					当前第${pageemp.getNumber()+1}页/共${pageemp.getTotalPages()}页  &nbsp; &nbsp; &nbsp; &nbsp;
					<a href="javascript:pagerequest(1);">首页</a>&nbsp; &nbsp; &nbsp; &nbsp;
					<a href="javascript:pagerequest(${pageemp.getNumber()>1?pageemp.getNumber():1});">上一页</a>&nbsp; &nbsp; &nbsp; &nbsp;
					<a href="javascript:pagerequest(${pageemp.getNumber()<pageemp.getTotalPages()?pageemp.getNumber()+1+1:pageemp.getTotalPages()});">下一页</a>&nbsp; &nbsp; &nbsp; &nbsp;
					<a href="javascript:pagerequest(${pageemp.getTotalPages()});">尾页</a>
				</td>	
			</tr>	
		</table>	
	<script type="text/javascript">
	function pagerequest(page){
	document.getElementById("page").value=page;
	document.empfrm.submit();
		}
	</script>	
			<div class="llpage">
				<div class="in">
					<nav> <span class="count">第&nbsp;<b>1</b>&nbsp;页，&nbsp;共&nbsp;<b>1</b>&nbsp;页
					</span>
					<ul class="pagination">

						<li><a class="prev_page">上页</a></li>


						<li><a class="now">1</a></li>


						<li><a class="next_page" rel="next">下页</a></li>
					</ul>
					</nav>
				</div>
			</div>

		</div>

		<!-- 内容结束 -->

	</div>
	<!-- 容器结束 -->
</body>

<script type="text/javascript">
$(function(){
	$("#status").val("");
	$("#delFlag").val("");
	
});

	 function award(tid,type){
		if(confirm('你确定要奖励吗？')){
			$.ajax({
                type: "POST", // 用POST方式传输
                dataType: "json", // 数据格式:JSON
                url: '<%=basePath%>sysmember/awards', // 目标地址
                data: {
                    id: tid,
                    type:type
                },
                success: function (msg) {
                	 if (msg.code == 0) {
                         window.location.href = "<%=basePath%>sysmember/inviteRewards";
                     } else {
                        alert(msg.msg);
                     }
                }
            });
		}
	} 
</script>
</html>