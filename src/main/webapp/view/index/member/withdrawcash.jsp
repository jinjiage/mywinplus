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
<link href="<%=basePath%>resources/web/font/iconfont.css"
	rel="stylesheet">
<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script src="<%=basePath%>resources/web/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/web/location/area.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/web/location/location.js"></script>

<script type="text/javascript">
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
</head>
<body>
	
	<div class="admin-right">
		<div class="tbConBox">
			<div class="tab">
				<a class="select" href="javascript:;">我要提款</a> <a
					href="javascript:;">提款记录</a>
			</div>
			<div id="conBox">
				<div class="box" style="display: block">

					<table class="txTable" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="140" align="right">账户余额：</td>
							<td><strong> <f:formatNumber pattern="00.00"
										value="${memberAccount.useable_balance }"></f:formatNumber>
							</strong>元</td>
						</tr>
						<tr>
							<td align="right">提款银行卡：</td>
							<td><strong> <c:forEach items="${withdrawstatus }"
										var="with">
										<c:if test="${with.statu==memberBankcards.type }">${with.name }-${memberBankcards.card_no }</c:if>
									</c:forEach>
							</strong> <input type="hidden" id="withdrawBankCard"
								value="${memberBankcards.card_no }"></td>
						</tr>
						<tr>
							<td align="right">提款金额：</td>
							<td><input class="tytxt" type="text" id="withdrawAmount"
								style="width: 250px"></td>
						</tr>

						<tr>
							<td align="right">提款密码：</td>
							<td><input type="password" class="tytxt" id="withdrawPW"
								style="display: inline; width: 250px;"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><button class="tybutton" id="withdrawConfirm">提交</button></td>
						</tr>
					</table>
				</div>
				<div class="box">

					<meta name="keywords"
						content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
					<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
					<link href="<%=basePath%>resources/web/images/icon.ico"
						type="image/x-icon" rel="shortcut icon">

				
					<div>
					<iframe src="<%=basePath%>account/withdraw/reco" style="width: 100%; height: 350px;border: 0px"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade errorInfo infoModal" id="withdrawErrorModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
            <div class="modal-header">
                <span>通知</span>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <div id="withdrawError"></div>
                <button class="btn btn-success confirmBtn" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade errorInfo infoModal" id="setWithdrawPWResultModel" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
					<div class="modal-header">
						<span>通知</span>
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					</div>
					<div class="modal-body">
						<div id="setwithdrawError"></div>
						<button class="btn btn-success confirmBtn" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
</div>
	<script type="text/javascript">
	$("#setWithdrawPWResultModel").on('hidden.bs.modal', function () { window.location.reload(); });
	function withdrawPWError(txt) {
		if (txt) {
			$('#setWithdrawPWForm #withdrawPWGroup').addClass('has-error');
			$('#setWithdrawPWForm #withdrawPWGroup .error-info').text(txt);
		} else {
			$('#setWithdrawPWForm #withdrawPWGroup').removeClass('has-error');
			$('#setWithdrawPWForm #withdrawPWGroup .error-info').text('');
		}
	}

	function withdrawPWConfirmError(txt) {
		if (txt) {
			$('#setWithdrawPWForm #withdrawPWConfirmGroup').addClass('has-error');
			$('#setWithdrawPWForm #withdrawPWConfirmGroup .error-info').text(txt);
		} else {
			$('#setWithdrawPWForm #withdrawPWConfirmGroup').removeClass('has-error');
			$('#setWithdrawPWForm #withdrawPWConfirmGroup .error-info').text('');
		}
	}

	var setWithdrawPw = function() {
		var withdrawPw = $("#setWithdrawPWModel #withdrawPW").val();
		var pattter = new RegExp(/^[a-zA-Z0-9!@#$%^&*()_+|]{8,30}$/);
		if (!withdrawPw) {
			withdrawPWError('提款密码不能为空');
			return;
		} else {
			if (!pattter.test(withdrawPw)) {
				withdrawPWError('8-30位数字和字母组成');
				return;
			}
			withdrawPWError(false);
		}
		var withdrawPwConfirm = $("#setWithdrawPWModel #withdrawPWConfirm").val();
		if (!withdrawPwConfirm) {
			withdrawPWConfirmError('确认提款密码不能为空');
			return;
		} else {
			if (withdrawPwConfirm != withdrawPw) {
				withdrawPWConfirmError('两次输入的提款密码不一致');
				return;
			}
			withdrawPWConfirmError(false);
		}
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : '<%=basePath%>account/withdraw/setwithdrawpwd', 
			data : {
				password : withdrawPw		
			},
			success : function(resp) {
				if (resp.code == 0) {
					$("#setwithdrawError").html("设置提款密码成功");
				} else {
					$("#setwithdrawError").html(resp.msg);
				}
				$("#setWithdrawPWModel").modal("hide");
				$("#setWithdrawPWResultModel").modal();
			}
		});
	}

	$("#withdrawConfirm").click(function () {
		var bankCard = $("#withdrawBankCard").val();
		var withdrawAmount = $("#withdrawAmount").val();
		var withdrawPW = $("#withdrawPW").val();
		if ($.trim(withdrawAmount) == "") {
			$("#withdrawError").html("请填写提款金额");
			$("#withdrawErrorModal").modal();
			$("#withdrawAmount").focus();
			return;
		}
		if (isNaN(withdrawAmount)) {
			$("#withdrawError").html("请填写正确的提款金额");
			$("#withdrawErrorModal").modal();
			$("#withdrawAmount").val("");
			$("#withdrawAmount").focus();
			return;
		}
		if (withdrawAmount < 10) {
			$("#withdrawError").html("提款金额不可少于10元");
			$("#withdrawErrorModal").modal();
			$("#withdrawAmount").val("");
			$("#withdrawAmount").focus();
			return;
		}
		if ($.trim(withdrawPW) == "") {
			$("#withdrawError").html("请填写提款密码");
			$("#withdrawErrorModal").modal();
			$("#withdrawPW").focus();
			return;
		}
		$("#withdrawConfirm").addClass("disabled");

		$.ajax({
			type : "POST",
			dataType : "json",
			async : true,
			url : '<%=basePath%>account/withdraw/submitWithdraw',
			data : {
				amount : withdrawAmount,
				withdrawalPassword:withdrawPW,
				bankCard: bankCard

			},
			success : function(resp) {
					
				if (resp.code == 0) {
					$("#withdrawError").html("您的提现申请已受理，您的提款金额会在三个工作日内到账，我们会以短信的形式通知您。");
					$("#withdrawErrorModal").modal();
					$("#withdrawErrorModal").on('hide.bs.modal', function () {
						window.location.reload();
					});
					setTimeout(function () { $("#withdrawErrorModal").modal('hide'); }, 3000);
				} else {
					$("#withdrawError").html(resp.msg);
					$("#withdrawErrorModal").modal();
				}
				$("#withdrawConfirm").removeClass("disabled");
			}
		});

	});
	</script>
</body>
</html>