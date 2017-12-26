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
 
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

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
     <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>修改用户</h2>
	<form id="addAccountForm" method="post" class="form-horizontal" action="<%=basePath%>sys/docreateAccount">
		<input type="hidden" name="id" value="${users.id}">
           <div class="form-group">
           
               <label class="col-sm-3 control-label">用户名</label>
               <div class="col-lg-5">
                   <input type="text" class="form-control"  id="userName" value="${users.user_name}" disabled="disabled"/>
               </div>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">密码</label>
               <div class="col-lg-5">
                   <input type="password" class="form-control" name="passwordqqq" value="${users.password}"/>
               </div>
               <span style="color: red;padding-left: 10px;">密码不填写则不修改原账号密码</span>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">手机号</label>
               <div class="col-lg-5">
                   <input type="text" class="form-control" name="mobile_phone"  value="${users.mobile_phone}"/>
               </div>
           </div>
           <div class="form-group">
                <div class="group">
                	<label class="col-sm-3 control-label">角色</label>
            	<div class="col-lg-5">
	                <select id="wy_provice"  name="role_id" data-bv-notempty data-bv-notempty-message="请选择角色" class="form-control">
	                 <option value="" >选择角色</option>
                    <c:forEach items="${list}" var="list">
                	<option value="${list.id}" ${userRoleRelation.role_id==list.id?"selected='selected'":"" }>${list.cname}</option>
                	</c:forEach>
                	</select>
           		</div>
                </div>
           </div>
            <div class="form-group">
             <label class="col-sm-3 control-label"></label>
                <div class="col-lg-5">
                 <button type="submit" class="btn btn-primary btn-sm">确认</button>
            	</div>
           </div>
      </form> 
    
    </div>
  <script src="<%=basePath%>resources/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#wy_provice").val(1);	
	
    $('#addAccountForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                mobilePhone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^1[3-9][0-9]\d{8}$/,
                            message: '手机号格式不正确'
                        }
                    }
                }
            }
        })
        <%-- .on('success.form.bv', function(e) {
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function(result) {
            	alert(result.msg);
            	window.location.href="<%=basePath%>sys/userlist";
            }, 'json');
        }); --%>
});
</script>
</body>
</html>
