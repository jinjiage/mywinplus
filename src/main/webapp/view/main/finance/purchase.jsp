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
<link rel="stylesheet" href="<%=basePath%>resources/sys/ying/iconfont.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/bootstrap.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
        <script type="text/javascript" src="<%=basePath%>resources/sys/js/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="box-right-main">

        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>投资记录</h2>
	<form action="<%=basePath%>subject/sys/subjectPurchase" method="get" id="form1">
	<input type="hidden" value="${subjectId}" name="subjectId">
		<input type="hidden" id="pageid" name="page">
		</form>
        <div class="tablelist">
            <table class="table table-bordered tablebox">
                <tr class="text-center" bgcolor="#f7f7f7">
                    <td>序号</td>
                    <td>流水号</td>
                    <td>会员姓名</td>
                    <td>购买金额</td>
                    <td>结算利息</td>
                    <td>是否还款</td>
                    <td>购买时间</td>
                </tr>
                    
                    <c:forEach items="${subjects.getContent()}" var="subject">
                    <tr class="text-center">
                    <td>${subject.id }</td>
                        <td>${subject.serial_number }</td>
                        <td>
                        <c:forEach items="${memberlist }" var="member">
                        <c:if test="${member.id==subject.member_id }">
                        ${member.name }
                        </c:if>
                        </c:forEach>
                        ${subject.member_id }</td>
                        <td>￥
                        <f:formatNumber pattern="00.00" value="${subject.amount}"></f:formatNumber>
                        元</td>
                        <td>￥
                        <f:formatNumber pattern="0.00" value="${subject.interest}"></f:formatNumber>
                        元</td>
                        <td>${subject.ispayment==0?"未还款":""}
                        ${subject.ispayment==1?"已还款":""}
                        </td>
                        <td>${subject.create_date}</td>
                    </tr>
                    
                    </c:forEach>
                        
                    
            </table>
        </div>
	
	
	<div class="llpage">
		<div class="in">
			<nav>
				<span class="count">第&nbsp;<b>${subjects.getNumber()+1 }</b>&nbsp;页，&nbsp;共&nbsp;<b>${subjects.getTotalPages() }</b>&nbsp;页</span>
			<ul class="pagination">
<li><a class="now" href="javascript:fun(1);" >首页</a></li>
						<li><a class="prev_page" href="javascript:fun(${subjects.getNumber()+1-1>=1?subjects.getNumber():subjects.getNumber()+1 });">上页</a></li>

						<li><a class="next_page" rel="next" href="javascript:fun(${subjects.getNumber()+1+1<subjects.getTotalPages()?subjects.getNumber()+1+1:subjects.getTotalPages() });">下页</a></li>
						<li><a class="now" href="javascript:fun(${subjects.getTotalPages() });" >尾页</a></li>
				</ul>
			</nav>
		</div>
	</div>
        <!-- 内容结束 -->
    </div>
    <!-- 容器结束 -->
    <script type="text/javascript">
    function fun(id){
	$("#pageid").val(id);
	$(form1).submit();
}
    </script>
    </body>
</html>