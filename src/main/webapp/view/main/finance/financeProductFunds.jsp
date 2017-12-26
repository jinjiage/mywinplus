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
<html lang="zh-cn">

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/ying/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/style/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
    <script type="text/javascript" src="<%=basePath%>resources/sys/js/jquery.js"></script>
    <title>后台首页</title>
</head>
<body>
<div class="box-right-main">
    <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>私募/股权类</h2>

    <div class="tablelist">
        <form action="<%=basePath%>financeProductFunds/list" method="post" id="form1">
        <input type="hidden" id="pageid" name="page">
            <table class="table tabletop">
                <tr>
                    <td style="width:110px;padding-left:30px">名称：</td>
                    <td style="width:180px"><input type="text" class="form-control" name="name" placeholder="名称"></td>
                    <td style="width:110px;padding-left:30px">状态：</td>
                    <td style="width:180px">
                        <select class="form-control" name="status">
                           <option value="-1">全部</option>
                        <c:forEach items="${financestaus }" var="finance">
                         <option value="${finance.statu }" ${financeProductFunds.status==finance.statu?"selected='selected'":"" } >${finance.name }</option>
                        </c:forEach>
                
                        </select>
                    </td>
                    <td style="width:110px;padding-left:30px">类别：</td>
                    <td style="width:180px">
                        <select class="form-control" name="type">
                            <option value="-1">全部</option>
                            <c:forEach items="${financetype }" var="finance">
                         <option value="${finance.statu }" ${financeProductFunds.type==finance.statu?"selected='selected'":"" } >${finance.name }</option>
                        </c:forEach>
                        </select>
                    </td>
                    <td class="pull-right">
                        <a class="btn btn-primary btn-sm" 
                           onclick="javascript:$('#form1').submit();">搜索</a>
                        <a class="btn btn-primary btn-sm" href="<%=basePath%>financeProductFunds/addFinanceProductFundsPage">新增</a>
                    </td>
                </tr>
            </table>
        </form>
        <table class="table table-bordered tablebox">
            <tr class="text-center" bgcolor="#f7f7f7">
                <td>序号</td>
                <td>ID</td>
                <td>名称</td>
                <td>类型</td>
                <td>状态</td>
                <td>年化收益</td>
                <td>返佣比例</td>
                <td>开始日期</td>
                <td>结束日期</td>
                <td>投资期限</td>
                <td>起投金额</td>
                <td>添加时间</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${finance.getContent() }" var="financep" varStatus="statu">
             <tr class="text-center">
                <td>${statu.index+1 }</td>
                <td>${financep.id }</td>
                <td>${financep.name }</td>
                <td>
                <c:forEach items="${financetype }" var="financeps">
                <c:if test="${financeps.statu==financep.type  }">
                ${financeps.name }
                </c:if>
                </c:forEach>
                </td>
                <td>
                <c:forEach items="${financestaus }" var="financeps">
                <c:if test="${financeps.statu==financep.status  }">
        	 ${financeps.name }
                </c:if>
                </c:forEach>
            </td>
                <td>${financep.year_rate }%</td>
                <td>${financep.ratio }</td>
                <td>
                <f:formatDate value="${financep.start_date }" pattern="yyyy-MM-dd"/>
                </td>
                <td>                <f:formatDate value="${financep.end_date }" pattern="yyyy-MM-dd"/>
</td>
                <td>
                <c:if test="${! empty financep.period}">
                 ${financep.period }天
                </c:if>
               
                 </td>
                <td>${financep.floor_amount }元</td>
                <td>
                <f:formatDate value="${financep.create_date}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <a class="btn btn-primary btn-sm"
                       href="<%=basePath%>financeProductFunds/financeProductSubscribe?financeProductFundsId=${financep.id}">未签署&nbsp;<strong style="color: red;">
                       
                       <c:forEach items="${counts }" var="cou">
            
                       <c:if test="${cou[0]==financep.id }">${ cou[1]}</c:if>
                        
                       </c:forEach>
               
                       <c:if test="${ counts==null }">0</c:if>
                       </strong>&nbsp;人</a>
                    <a class="btn btn-primary btn-sm"
                       href="<%=basePath%>financeProductFunds/editFinanceProductFundsPage/${financep.id}">编辑/查看</a>
                </td>
            </tr>
            </c:forEach>
           
        </table>
	
	
	<div class="llpage">
		<div class="in">
			<nav>
                <span class="count">第&nbsp;<b>${finance.getNumber()+1 }</b>&nbsp;页，&nbsp;共&nbsp;<b>${finance.getTotalPages() }</b>&nbsp;页</span>
				<ul class="pagination">
<li><a class="now" href="javascript:fun(1);" >首页</a></li>
						<li><a class="prev_page" href="javascript:fun(${finance.getNumber()+1-1>=1?finance.getNumber():finance.getNumber()+1 });">上页</a></li>

						<li><a class="next_page" rel="next" href="javascript:fun(${finance.getNumber()+1+1<finance.getTotalPages()?finance.getNumber()+1+1:finance.getTotalPages() })">下页</a></li>
						<li><a class="now" href="javascript:fun(${finance.getTotalPages() })" >尾页</a></li>
				</ul>
			</nav>
		</div>
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