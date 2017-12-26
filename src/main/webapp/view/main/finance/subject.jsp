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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/ying/iconfont.css">
<link rel="stylesheet" href="<%=basePath%>resources/sys/ying/font2.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/style/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
<script src="<%=basePath%>resources/sys/js/jquery.js"></script>
</head>
<body>
	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>固收类/P2P
		</h2>

		<div class="tablelist">
			<form action="<%=basePath%>subject/sys/gushouList" method="post"
				id="form1">
				<input type="hidden" id="pageid" name="page">
				<table class="table tabletop">
					<tr>
						<td style="width: 110px; padding-left: 30px">名称：</td>
						<td style="width: 180px"><input type="text"
							class="form-control" name="name" placeholder="名称"
							value="${subject.name }"></td>
						<td style="width: 80px">状态：</td>
						<td style="width: 180px"><select name="status" id="status"
							class="form-control" style="width: 130px; height: 32px">
								<option value="-1">全部</option>
								<c:forEach items="${subjectstatu }" var="statu">
									<option value="${statu.statu }"
										${subject.status==statu.statu?"selected='selected'":"" }>${statu.name }</option>
								</c:forEach>
						</select></td>
						<td style="width: 80px">类型：</td>
						<td style="width: 180px"><select name="type" id="type"
							class="form-control" style="width: 130px; height: 32px">
								<option value="-1">全部</option>
								<c:forEach items="${subjecttype }" var="statu">
									<option value="${statu.statu }"
										${subject.type==statu.statu?"selected='selected'":"" }>${statu.name }</option>
								</c:forEach>

						</select></td>
						<td class="pull-right">
							<button type="submit" class="btn btn-primary btn-sm">查询</button>
						</td>
						<td><button type="button" class="btn btn-primary btn-sm"
								onclick="javascript:resert()">重置</button></td>
						<td class="pull-right"><a class="btn btn-primary btn-sm"
							href="<%=basePath%>subject/sys/addView">新增</a></td>
					</tr>
				</table>
			</form>
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>ID</td>
					<td>合同编号</td>
					<td>类型</td>
					<td>名称</td>
					<td>标的总金额</td>
					<td>已投总金额</td>
					<td>投资期限</td>
					<td>起投金额</td>
					<td>年化收益</td>
					<td>状态</td>
					<td>可使用体验金</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>

				<c:forEach items="${pageInfo }" var="object" varStatus="index">
					<tr class="text-center">
						<td>${index.index+1 }</td>
						<td>${object[0] }</td>
						<td>${object[1] }</td>
						<td><c:choose>
								<c:when test="${object[2]==0 }">固收类</c:when>
								<c:when test="${object[2]==1 }">P2P车贷</c:when>
								<c:when test="${object[2]==2 }">P2P房贷</c:when>
							</c:choose></td>
						<td>${object[3] }</td>
						<td><c:if test="${object[4]!=null }">￥
						<f:formatNumber pattern=",000.00" value="${object[4] }"></f:formatNumber>
							</c:if></td>
						<td><c:if test="${object[5]!=null }">￥
						<f:formatNumber pattern=",000.00" value="${object[5] }"></f:formatNumber>
							</c:if></td>
						<td>${object[6] }天</td>
						<td>${object[7] }元</td>
						<td>${object[8] }%</td>
						<td><c:choose>
								<c:when test="${object[9]==0 }">未发布</c:when>
								<c:when test="${object[9]==1 }">募集中</c:when>
								<c:when test="${object[9]==2 }">回款中</c:when>
								<c:when test="${object[9]==3 }">还款完成</c:when>
							</c:choose></td>
						<td>${object[10]==1?"是":"否" }</td>
						<td><f:formatDate pattern="yyyy-MM-dd" value="${object[11] }" />
						</td>
						<td><a class="btn btn-primary btn-sm"
							href="<%=basePath%>subject/sys/editView/${object[0] }">编辑/查看</a>
							<a class="btn btn-primary btn-sm"
							href="<%=basePath%>subject/sys/subjectPurchase?subjcetId=${object[0] }">查看投资</a></td>
					</tr>

				</c:forEach>


			</table>
		</div>


		<div class="llpage">
			<div class="in">
				<nav> <span class="count">第&nbsp;<b>${page }</b>&nbsp;页，&nbsp;共&nbsp;<b>${pages }</b>&nbsp;页
				</span>
				<ul class="pagination">
					<li><a class="now" href="javascript:fun(1)">首页</a></li>
					<li><a class="prev_page"
						href="javascript:fun(${page>1?page-1:page })">上页</a></li>
					<li><a class="next_page" rel="next"
						href="javascript:fun(${page<pages?page+1:pages })">下页</a></li>
					<li><a class="now" href="javascript:fun(${pages })">尾页</a></li>
				</ul>
				</nav>
			</div>
		</div>
		<!-- 内容结束 -->
	</div>
	<script type="text/javascript">
		function fun(id) {
			$("#pageid").val(id);
			$(form1).submit();
		}
		function resert() {
			$("#type").val(-1);
			$("#status").val(-1);
		}
	</script>
</body>
</html>