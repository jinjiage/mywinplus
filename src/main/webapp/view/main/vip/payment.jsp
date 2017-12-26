<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
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
        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>付息计划</h2>

        <div class="tablelist">
        <form action="<%=basePath%>sysmember/payment" method="post" id="form1" name="fmm">
        	<input type="hidden" name="page" id="pageid">
            <table class="table tabletop">
                <tr>
                    <td style="width:110px;padding-left:30px">名称:</td>
                    <td style="width:180px"><input type="text" class="form-control" name="name" placeholder="名称" value=""></td>
                    <td style="width:80px">状态：</td>
                    <td style="width:180px"><select name="status" class="form-control" style="width:130px;height:32px" id="status">
                   		<option value="QUAN_BU">全部</option>
                        <option value="NOT_PUBLISHED">未发布</option>
                        <option value="RAISING">募集中</option>
                        <option value="REFUNDING">回款中</option>
                        <option value="OVER">还款完成</option>
                    </select></td>
                    <td style="width:80px">类型：</td>
                    <td style="width:180px"><select name="type" class="form-control" style="width:130px;height:32px" id="type">
                    	<option value="QUAN_BU">全部</option>
                        <option value="GU_SHOU">固收类</option>
                        <option value="P2P_CHE">P2P车贷</option>
                        <option value="P2P_FANG">P2P房贷</option>
                    </select></td>
                     <td class="pull-right" style="padding-right:30px">
                         <button type="submit" class="btn btn-primary btn-sm">查询</button></td>
                    <td><button type="button" class="btn btn-primary btn-sm" onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
                  </tr>  
            </table>
           </form>
            <table class="table table-bordered tablebox">
                <tr class="text-center" bgcolor="#f7f7f7">
                    <td>序号</td>
                    <td>合同编号</td>
                    <td>标的类别</td>
                    <td>标的名称</td>
                    <td>标的总金额</td>
                    <td>已投金额</td>
                    <td>已投人数</td>
                    <td>标的期限</td>
                    <td>年化收益</td>
                    <td>标的状态</td>
                    <td>可体验金购买</td>
                    <td>操作</td>
                </tr>
                 <c:forEach items="${sublist}" var="sublist" varStatus="qq">
                    <tr class="text-center">
                        <td>${qq.index+1}</td>
                        <td>${sublist[1]}</td>
                        <td>${sublist[4]}</td>
                        <td>${sublist[3]}</td>
                        <td></td>
                        <td>${sublist[6]}</td>
                        <td>221人</td>
                        <td>${sublist[17]}</td>
                        <td>7%</td>
                        <td>募集中</td>
                        <td>是</td>
                        <td>
                        	<a href="<%=basePath%>sysmember/paymentBbinContent/${sublist[0]}" class="btn btn-primary btn-sm">体验金付息</a>
                        	<a href="<%=basePath%>sysmember/paymentContent/${sublist[0]}" class="btn btn-primary btn-sm">付息列表</a>	
                        </td>
                    </tr>
                    </c:forEach>
            </table>
            
  			<td>
				共${pages}页/第${page}页 <a href="javascript:fun(1)">首页</a> <a
					href="javascript:fun(${page>1?page-1:page})">上一页</a> <a
					href="javascript:fun(${page<pages?page+1:pages})">下一页</a> <a
					href="javascript:fun(${pages})">尾页</a>	
				</td>
			
		
		<script type="text/javascript">
		
		
		function fun(page) {
			$("#pageid").val(page);
			document.fmm.submit();
		}
	  
		
		</script>
		
	<div class="llpage">
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
        </div>
        <!-- 内容结束 -->
    </div>
    <!-- 容器结束 -->
    <script type="text/javascript">
    $(function(){
		$("#status").val("");
		$("#type").val("");
	});
    </script>
    </body>
</html>