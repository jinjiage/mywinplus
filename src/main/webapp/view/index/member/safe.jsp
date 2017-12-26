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
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
<script src="<%=basePath%>resources/web/js/jquery.js"></script>


    <script src="<%=basePath%>resources/web/js/bootstrap.js"></script>
<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon"> 
	<script>
	$(function(){
		$(".picTab a").click(function(){
			if(!$(this).hasClass("select")){
				var num=$(this).index();
				$(this).addClass("select").siblings().removeClass("select");
				$(".txtCon p").eq(num).show().siblings().hide();
			}
		})
		$(".tbConBox .tab a").click(function(){
			if(!$(this).hasClass("select")){
				var num=$(this).index();
				$(this).addClass("select").siblings().removeClass("select");
				$("#conBox .box").eq(num).show().siblings().hide();
			}
		})
	})	
    </script>
<title>Insert title here</title>
</head>
<body>
<script>
  var menu_item="";
 $("#"+menu_item).addClass("select");
</script>
<div class="admin-right">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">安全中心</a>
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">
                    	<table class="safeTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                             
	                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></span></td>
	                            <td><p style="color:#ff503f">实名认证</p></td>
	                            <td>
	                            <c:if test="${! empty memberInfo.identity }">
	                              <f:formatNumber pattern="###***###" value="${memberInfo.identity }"></f:formatNumber>
	                            </c:if>
	                          
	                            
	                            </td>
	                            <td><p style="color:#888">保障账户安全，只有完成实名认证才能充值提款</p></td>
	                            <td>
	                            <c:if test="${identity==1 }">认证完成</c:if>
	                            <c:if test="${identity==0 }">
	                            <a onclick="$('#changeTelModal').modal(); return false;" href="javascript:;" class="renzheng">未认证</a>
	                    
	                            </c:if>
	                       </td>					 
   							                         
                          </tr>
							<tr>
								 
									<td class="first"><span class="iconfont active"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></span></td>
									<td><p style="color:#ff503f">绑卡认证</p></td>
									<td>
									<c:if test="${! empty memberBankcards.card_no }">已绑定</c:if>
									<c:if test="${ empty memberBankcards.card_no }">未绑定</c:if>
									</td>
									<td><p style="color:#888">保障账户安全，只有完成绑卡认证才能充值提款</p></td>
									<td>
									<c:if test="${! empty memberBankcards.card_no }">
									<a href="<%=basePath %>account/security/memberBankcardView" class="renzheng">查看</a>
									</c:if>
									<c:if test="${empty memberBankcards.card_no }">
									<a onclick="$('#changeTelModal').modal(); return false;" href="javascript:;" class="renzheng">绑定</a>
								
									</c:if>
									</td>					 
 
							</tr>
                          <tr>
                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61d;</a><em>&#xe61b;</em></span></td>
                            <td><p style="color:#ff503f">绑定手机</p></td>
                            <td>
                            <c:if test="${!empty memberInfo.mobile_Phone }">
                            <f:formatNumber pattern="########****" value="${memberInfo.mobile_Phone }"></f:formatNumber>
                          </c:if>
                           </td>
                            <td><p style="color:#888">手机号码是您在盈+金融的重要身份凭证</p></td>
                            <td>
                            <c:if test="${!empty memberInfo.mobile_Phone }"> 绑定完成</c:if>
                             <c:if test="${empty memberInfo.mobile_Phone }"> 
                           <a onclick="$('#changeTelModal').modal(); return false;" href="javascript:;" class="renzheng">绑定</a> 
                             </c:if>
                           </td>
                           
                          </tr>
                        
                          <tr>
                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61a;</a><em>&#xe61b;</em></span></td>
                            <td><p style="color:#ff503f">登录密码</p></td>
                            <td>${password==1?"已设置":"未设置" }</td>
                            <td><p style="color:#888">登录盈+金融网站时需要输入的密码</p></td>
                            <td><a onclick="$('#changePWModal').modal(); return false;" href="javascript:;" class="renzheng">修改</a></td>
                          </tr>
                          <tr>
                             
	                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61e;</a><em>&#xe61b;</em></span></td>
	                            <td><p style="color:#ff503f">提款密码</p></td>
	                            <td>${cardpassword==1?"已设置":"未设置" }</td>
	                            <td><p style="color:#888">保障资金安全，提款需要设置提款密码</p></td>
	                            <td>
	                            <c:if test="${cardpassword==1 }"> 设置完成</c:if>
	                            <c:if test="${cardpassword==0 }"><a onclick="$('#setWithdrawPWModel').modal(); return false;" href="javascript:;" class="renzheng">设置</a></c:if>
	                           </td>						 
								
							                          </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
   <div id="realNameModal" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="border-radius: 0px;">
			<div class="modal-header">
				<span>请进行实名登记</span>
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			</div>
			<div class="modal-body text-center">
				<form class="form-horizontal" id="realNameRegisterForm">
					<div class="form-group" id="fullNameGroup">
						<label class="control-label col-sm-3" for="fullName">真实姓名: </label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="fullName" placeholder="真实姓名" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
					<div class="form-group" id="idCodeGroup">
						<label class="control-label col-sm-3" for="idCode">身份证号码: </label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="idCode" placeholder="身份证号码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
				</form>
				<div class="col-sm-offset-1">
					<p class="text-left">
						实名信息提交后不可修改，请务必认真填写真实资料。
					</p>
					<p class="text-left">
						一个身份证只能绑定一个帐号
					</p>
					<p class="text-left">
						如遇到问题，请联系客服 <b>4000-999-158</b>
					</p>
                    <p class="text-left" style="color:#ff6a00">
                        我已知晓金融投资的市场风险和交易风险，清楚市场及交易细则。<br />经审慎考虑，决定自己参与，风险自担。
                    </p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="registerRealName();">提交</button>
				<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<div id="realNameRegisteredModal" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
			<div class="modal-header">
				<span>操作成功</span>
				<button type="button" class="close" data-dismiss="modal" >
					<span aria-hidden="true">×</span>
					<span class="sr-only">关闭</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="content">
					真实姓名和身份证号已登记
				</div>
			</div>
		</div>
	</div>
</div>


	<div id="changeTelModal" class="modal fade infoModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="border-radius: 0px;">
				<div class="modal-header">
					<span>修改绑定手机</span>
					<button type="button" class="close" data-dismiss="modal" ><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				</div>
				<div class="modal-body text-center">
					<div class="form-horizontal" id="changeTelForm">
						<div class="form-group" id="fullNameGroup">
							<label class="control-label col-sm-3">原手机号码: </label>
							<div class="col-sm-5">
								<div style="line-height:30px;text-align: left;">1875803****</div>
							</div>
						</div>
						<div class="form-group" id="changeTelvCodeGroup">
							<label class="control-label col-sm-3" for="changeTelvCode">验证码: </label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="changeTelvCode" placeholder="手机验证码" />
							</div>
							<div class="col-sm-4 help-block text-left">
								<button class="btn clickBtn" id="changeTelVcodeBtn" onclick="changeTelSendVCode()" type="button">获取手机验证码</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="changeTel();">下一步</button>
					<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<div id="setNewTelModal" class="modal fade infoModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="border-radius: 0px;">
				<div class="modal-header">
					<span>绑定新手机</span>
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				</div>
				<div class="modal-body text-center">
					<div class="form-horizontal" id="setNewTelForm">
						<div class="form-group" id="NewTelGroup">
							<label class="control-label col-sm-3" for="NewTel">手机号码: </label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="NewTel" placeholder="手机号码" />
							</div>
							<div class="col-sm-4 help-block text-left">
								<span class="error-info"></span>
							</div>
						</div>
						<div class="form-group" id="setNewTelvCodeGroup">
							<label class="control-label col-sm-3" for="setNewTelvCode">验证码: </label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="setNewTelvCode" placeholder="手机验证码" />
							</div>
							<div class="col-sm-4 help-block text-left">
								<button class="btn clickBtn" id="setNewTelVcodeBtn" onclick="setNewTelSendVCode()" type="button">获取手机验证码</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="setNewTel()">确定</button>
					<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<div id="changeTelResultModal" class="modal fade infoModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
				<div class="modal-header">
					<span>操作成功</span>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
						<span class="sr-only">关闭</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<div class="content">
						修改绑定手机成功
					</div>
				</div>
			</div>
		</div>
	</div>

	



<div id="changePWModal" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="border-radius: 0px;">
			<div class="modal-header">
				<span>修改登录密码</span>
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			</div>
			<div class="modal-body text-center">
				<form class="form-horizontal" id="changePWModalForm">
					<div class="form-group" id="oldLoginPwGroup">
						<label class="control-label col-sm-3" for="oldLoginPw">原登录密码: </label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="oldLoginPw" placeholder="原登录密码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
					<div class="form-group" id="newLoginPwGroup">
						<label class="control-label col-sm-3" for="newLoginPw">新登录密码: </label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="newLoginPw" placeholder="新登录密码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
					<div class="form-group" id="newLoginPwConfirmGroup">
						<label class="control-label col-sm-3" for="newLoginPwConfirm">确认新密码: </label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="newLoginPwConfirm" placeholder="确认新密码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="changeLoginPW();">提交</button>
				<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<div id="changePWResultModal" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
			<div class="modal-header">
				<span>操作成功</span>
				<button type="button" class="close" data-dismiss="modal" >
					<span aria-hidden="true">×</span>
					<span class="sr-only">关闭</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="content">
					修改登录密码成功
				</div>
			</div>
		</div>
	</div>
</div>

    <div id="setWithdrawPWModel" class="modal fade infoModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content" style="border-radius: 0px;">
                <div class="modal-header">
                    <span>设置提款密码</span>
                    <button type="button" class="close" data-dismiss="modal" ><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                </div>
                <div class="modal-body text-center">
                    <form class="form-horizontal" id="setWithdrawPWForm">
                        <div class="form-group" id="withdrawPWGroup">
                            <label class="control-label col-sm-3" for="withdrawPW">提款密码: </label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="withdrawPW" placeholder="提款密码" />
                            </div>
                            <div class="col-sm-4 help-block text-left">
                                <span class="error-info"></span>
                            </div>
                        </div>
                        <div class="form-group" id="withdrawPWConfirmGroup">
                            <label class="control-label col-sm-3" for="withdrawPWConfirm">确认提款密码: </label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="withdrawPWConfirm" placeholder="确认提款密码" />
                            </div>
                            <div class="col-sm-4 help-block text-left">
                                <span class="error-info"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="setWithdrawPw();">提交</button>
                    <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    

<div id="setWithdrawPWResultModel" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
			<div class="modal-header">
				<span class="title">操作成功</span>
				<button type="button" class="close" data-dismiss="modal" >
					<span aria-hidden="true">×</span>
					<span class="sr-only">关闭</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="content">
					设置提款密码成功
				</div>
			</div>
		</div>
	</div>
</div>
  
</body>
<script type="text/javascript">
	var baseContext = "/mywinplus";
</script>
<script src="<%=basePath%>resources/web/js/security_realname.js"></script>
<script src="<%=basePath%>resources/web/js/security_changemobile.js"></script>
<script src="<%=basePath%>resources/web/js/security_changeloginpwd.js"></script>
<script src="<%=basePath%>resources/web/js/security_withdrawpwd.js"></script>
</body>
</html>