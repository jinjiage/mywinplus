<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
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
        <script type="text/javascript" src="<%=basePath%>resources/sys/js/bootstrap.js"></script>
        
        <link rel="stylesheet" href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
        <script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js"></script>
        <title>后台首页</title>
    </head>
<body>

                     <div class="box-right-main">
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>提现管理</h2>

                      <div class="tablelist">
                      	<form action="<%=basePath%>sysmember/withdrawManage" method="post" id="form1" name="empfrm">
                      	 <input type="hidden" name="page" id="page">
                        <table class="table tabletop">
                        <tr>
                        <td style="width:110px;padding-left:30px">姓名：</td>
                        <td style="width:180px"><input type="text" name="memberName" class="form-control" placeholder="姓名" value=""></td>
                        <td style="width:110px;padding-left:30px">手机号：</td>
                        <td style="width:180px"><input type="text"  name="mobilePhone" class="form-control" placeholder="手机号" value=""></td>
                        <td style="width:130px;padding-left:30px">绑卡卡号：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="bankCard" placeholder="绑卡卡号" value=""></td>
                         <td style="width:80px">状态：</td>
	                    <td style="width:180px"><select name="status" class="form-control" style="width:130px;height:32px" id="status">
	                   		<option value="">全部</option>
	                        <option value="1">待审核</option>
	                        <option value="2">已付款</option>
	                        <option value="3">打款中</option>
	                        <option value="4">打款失败</option>
	                       	<option value="4">已解冻</option>
	                    </select></td>
                         <td style="width:110px;padding-left:30px">提现时间：</td>
                        <td style="width:180px"><input type="text"  name="createDate" class="form-control time" placeholder="提现时间" readonly="readonly" value=""></td>
                         <td class="pull-right" style="padding-right:30px">
                         <button type="submit" class="btn btn-primary btn-sm">查询</button></td>
	                    <td><button type="button" class="btn btn-primary btn-sm" onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
	                 	 </tr>    
                        </table>
                        </form>
                        <table class="table table-bordered tablebox">
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>手机号</td>
                          <td>姓名</td>
                          <td>身份证</td>
                          <td>提现金额</td>
                          <td>提现银行</td>
                          <td>提现卡号</td>
                          <td>提现开户行地址</td>
                          <td>提现状态</td>
                          <td>提现时间</td>
                          <td>账号详细</td>
                          <td>操作</td>
                          </tr>
                           <c:forEach items="${pageemp.getContent()}" var="member" varStatus="qq">
                          <tr class="text-center">
                            <td>${qq.index}</td>
						   <td>${member.member.mobile_Phone}</td>
						   <td>${member.member.member_name}</td>
						  <td>${member.member.identity}</td>
						   <td>${member.amount}</td>
						   <td>${member.bank_name}</td>
						    <td>${member.bank_card}</td>
						     <td>${member.cardaddress}</td> 
						     <c:if test="${member.status==0}">
						       <td>待审核</td>
						     </c:if>
						      <c:if test="${member.status==1}">
						     <td>已打款</td>
						     </c:if>
						       <c:if test="${member.status==2}">
						     <td>打款中</td>
						     </c:if>
						       <c:if test="${member.status==3}">
						     <td>打款失败</td>
						     </c:if>
						     <td>${member.create_date}</td>
                          	  <td><a class="btn btn-primary btn-sm" href="<%=basePath%>sysmember/memberInof/${member.member.id}">账号详细</a></td>
                          	 <td>
                             <a class="btn btn-primary btn-sm" data-toggle="modal" onclick="audit('201601050319343295')">审核</a>
						    <a class="btn btn-primary btn-sm" href="<%=basePath%>sysmember/withdrawPayment?serialNumber=201601050319343295&channelName=BEIFU" onclick="return confirm('你确定要审核通过吗')">贝付打款</a>
							<a class="btn btn-primary btn-sm" href="<%=basePath%>sysmember/WithdrawUnfreeze?serialNumber=201601050319343295" onclick="return confirm('你确定要解冻吗')">解冻</a>
						<!-- <a class="btn btn-primary btn-sm" href="<%=basePath%>sysmember/WithdrawPayFuIou?serialNumber=201601050319343295" onclick="return confirm('你确定要审核通过吗')">富友打款</a> --> 
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
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">选择打款方式</h4>
         </div>
         <form action="<%=basePath%>sysmember/withdrawAudit" method="get">
         <div class="modal-body">
         	<input type="hidden" name="serialNumber" value="" id="serialNumber">
            <select class="form-control" name="channelName" style="width: 200px;">
            	<option value="FUIOU" selected="selected">富友</option>
            	<option value="BEIFU">贝付</option>
            </select>
        
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">提交 </button>
         </div>
          </form>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

<script type="text/javascript">
	$(function(){
		$("#status").val("");
		
		$('.time').datetimepicker({
			format : 'yyyy-mm-dd',
			language: 'zh-CN',
		    weekStart: 1,
		    todayBtn: 1,			
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			autoclose : false
		}).on('changeDate', function(ev) {
			$('.time').datetimepicker('hide');
		});
	});
	
	function audit(serialNumber){
		$("#serialNumber").val(serialNumber);		
		$("#myModal").modal();
	}
</script>
<!-- 容器结束 -->
</body>
</html>