<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>    
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
     <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>添加角色</h2>
     
       <form class="form-horizontal col-xs-pull-3" id="addroleForm" name="addroleForm" method="post" action="<%=basePath%>sys/addRole">
        	<div class="form-group">
            <label class="col-sm-3 control-label">角色名</label>
            <div class="col-lg-5">
                <input type="text" class="form-control" name="cname" />
            </div>
            </div>
            <div class="form-group">
                 <label class="col-sm-3 control-label">英文名</label>
                 <div class="col-lg-5">
                     <input type="text" class="form-control" name="ename" id="ename" />
                 </div>
             </div>
            <div class="form-group">
                 <label class="col-sm-3 control-label">描述</label>
                 <div class="col-lg-5">
                     <input type="text" class="form-control" name="remark" id="remark" />
                 </div>
             </div>
            <div class="form-group">
            	  <label class="col-sm-3 control-label"></label>
            	  <div class="col-lg-5">
                 <button type="submit" class="btn btn-primary btn-sm">确认 </button>
                 </div>
            </div>
       </form>
  </div>
  
  <script src="<%=basePath%>resources/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   <%--  $('#addroleForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	cname: {
                    message: '角色名不能为空',
                    validators: {
                        notEmpty: {
                            message: '角色名不能为空'
                        }
                    }
                },
                ename: {
                    validators: {
                        notEmpty: {
                            message: '权限不能为空'
                        },
                        remote: {
                            url: '<%=basePath%>sys/checkRoleExsit',
                            message: '权限名称已被占用'
                        }
                    }
                }
            }
        })
         --%>
       <%--  .on('success.form.bv', function(e) {
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function(result) {
            	alert(result.msg);
            	window.location.href="<%=basePath%>sys/rolelist";
            }, 'json');
        }); --%>
});
</script>
</body>
</html>
