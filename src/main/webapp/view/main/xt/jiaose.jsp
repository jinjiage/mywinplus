<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<title>后台首页</title>
</head>
<body>

	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>角色管理
		</h2>

		<div class="tablelist">
			<table class="table tabletop">
				<tr>
					<td class="pull-right" style="padding-right: 30px"><button
							type="button" class="btn btn-primary btn-sm add">新增</button></td>
				</tr>
			</table>
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>角色名</td>
					<td>角色描述</td>
					<td>创建时间</td>
					<td>菜单配置</td>
				</tr>

	<c:forEach items="${pageemp.getContent()}" var="users" varStatus="qq">
					<tr class="text-center">
						<td>${qq.index}</td>
						<td>${users.cname}</td>
						<td>${users.remark}</td>
						<td>${users.create_date}</td>
						<td><a href="<%=basePath%>sys/permisssion?roleId=2" value="2"
					class="btn btn-primary btn-sm">菜单配置</a></td>
					</tr>
				</c:forEach>
			</table>


<form action="<%=basePath %>/sys/rolelist" name="form">
<input type="hidden" name="page" id="page">
		
		</form>
		<script type="text/javascript">
		function pagerequest(page){
			document.getElementById("page").value=page;
			document.empfrm.submit();
		}
	</script>
			<div class="llpage">
				<div class="in">
					<nav>
					<span class="count">第&nbsp;<b>${pageemp.getNumber()+1}</b>&nbsp;页，&nbsp;共&nbsp;<b>${pageemp.getTotalPages()}</b>&nbsp;页</span>
				<ul class="pagination">
				   <li><a href="javascript:pagerequest(${pageemp.getNumber()>=1?pageemp.getNumber():pageemp.getNumber()+1});" class="prev_page">上页</a></li>
                   <c:forEach  begin="1" var="v" end="${pageemp.getTotalPages()}">
				   <li><a href="javascript:pagerequest(${v})" class="now">${v}</a></li>
                   </c:forEach>
				<li><a href="javascript:pagerequest(${pageemp.getNumber()+1+1<pageemp.getTotalPages()?pageemp.getNumber()+1+1:pageemp.getTotalPages() });" class="next_page" rel="next">下页</a></li>
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
    $(function () {
        $(".add").click(function () {
        	window.location.href="<%=basePath%>sys/addRolePage";
        });
        
        $(".delRole").click(function () {
        	var roleid = $(this).attr("roleid");
        		$.post(
        			"<%=basePath%>sys/delRole/"+roleid,
        			function(result) {
        				alert(result.msg);
	           			if(result.code==0){
	           				location.reload();;
	           			};
            }, 'json');
        });
    });
</script>
</html>