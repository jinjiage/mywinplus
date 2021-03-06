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
         <link rel="stylesheet" href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
		<script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js"></script>
        <title>后台首页</title>
    </head>
<body>

                     <div class="box-right-main">
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>绑卡管理</h2>

                      <div class="tablelist">
                      <form action="<%=basePath%>sysmember/dahua" method="post" id="form1" name="empfrm">
                      
                        <input type="hidden" name="page" id="page">
                        <table class="table tabletop">
                        <tr>
                        <td style="width:130px;padding-left:30px">手机号：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="mobilePhone" placeholder="手机号" value=""></td>
                        <td style="width:130px;padding-left:30px">绑卡姓名：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="member.memberName" placeholder="绑卡姓名" value=""></td>
                        <td style="width:130px;padding-left:30px">绑卡卡号：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="cardNo" placeholder="绑卡卡号" value=""></td>
                         <td style="width:110px;padding-left:30px">注册时间：</td>
                        <td style="width:180px"><input type="text"  name="createDate" class="form-control time" placeholder="注册时间" readonly="readonly" value=""></td>
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
                          <td>绑卡人姓名</td>
                          <td>绑卡身份证</td>
                          <td>绑卡类型</td>
                          <td>绑卡卡号</td>
                          <td>绑卡地址</td>
                          <td>状态</td>
                          <td>添加时间</td>
                          <td>操作</td>
                          </tr>
                   <c:forEach items="${pageemp.getContent()}" var="member" varStatus="qq">
				    <tr class="text-center">
				    	<td>${qq.index+1}</td>
						<td>${member.member.mobile_Phone}</td>
						<td>${member.member.member_name}</td>
						<td>${member.member.identity}</td>
						<td>${member.type}</td>
						<td>${member.card_no }</td>
					    <td>${member.cardaddress}</td>
					    <td>${member.delflag==0?"正常":"删除"}</td>
					    <td>${member.create_date}</td>
                      <td>
                      <a href="<%=basePath%>sysmember/BankCard/${member.id}" class="btn btn-primary btn-sm" onclick="return confirm('你确定要解绑？')">解绑银行卡</a>
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
               
		
		
		
		              
                   
<!--       <script type="text/javascript">
      
      function    
      
      
      
      
      </script>                
                  -->     
               
               
               
               
               
                      

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
	<script type="text/javascript">
	$('.time').datetimepicker({
		format : 'yyyy-mm-dd',
		language: 'zh-CN',
		minView: 2,
	    todayBtn: 1
	}).on('changeDate', function(ev) {
		$('.time').datetimepicker('hide');
	});
	
	</script> 
<!-- 容器结束 -->
</body>
</html>