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
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/ying/iconfont.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/style/bootstrap.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/webupload/webuploader.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/webupload/demo.css">
<link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
<link
	href="<%=basePath%>resources/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>resources/ueditor1_4_3_1/lang/zh-cn/zh-cn.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>产品信息详细页
		</h2>

		<form action="<%=basePath%>subject/sys/edit" method="post"
			id="valForm">
			<input type="hidden" name="serial_number" value="${subject.serial_number }">
		<input type="hidden" name="create_date" value="${subject.create_date }">
			<input type="hidden" name="folder_id" id="folderId"
				value="${subject.folder_id }"> <input type="hidden"
				name="id" value="${subject.id }">
			<div class="tablelist">
				<!-- 表单 -->
				<div class="row bdlist">
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">名称：</label>

							<div class="col-sm-9">
								<input name="name" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.name }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">合同编号：</label>

							<div class="col-sm-9">
								<input name="serial_no" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.serial_no }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">起投金额(元)：</label>

							<div class="col-sm-9">
								<input name="floor_amount" class="form-control"
									placeholder="请输入文本" type="text"
									value="${subject.floor_amount }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">年化收益(%)：</label>

							<div class="col-sm-9">
								<input name="year_rate" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.year_rate }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">状态：</label>

							<div class="col-sm-9">
								<select class="form-control" name="status">
									<c:forEach items="${subjectstatu }" var="statu">
										<option value="${statu.statu }"
											${subject.status==statu.statu?"selected='selected'":"" }>${statu.name }</option>
									</c:forEach>

								</select> <span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">投资期限(天)：</label>

							<div class="col-sm-9">
								<input name="period" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.period }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">借款人姓名：</label>

							<div class="col-sm-9">
								<input name="borrowername" class="form-control"
									placeholder="请输入文本" type="text"
									value="${subject.borrowername }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group amount">
							<label class="col-sm-3 control-label">总金额(元)：</label>

							<div class="col-sm-9">
								<input name="amount" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.amount }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">类型</label>
							<div class="col-sm-9">
								<input type="hidden" name="type" id="type" value="${subject.type }" > <select
									class="form-control" name="type1" disabled="disabled">
									<c:forEach items="${subjecttype }" var="statu">
										<option value="${statu.statu }"
											${subject.type==statu.statu?"selected='selected'":"" }>${statu.name }</option>
									</c:forEach>
								</select> <span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">借款用途</label>

							<div class="col-sm-9">
								<input name="purpose" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.purpose }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">保障方式</label>

							<div class="col-sm-9">
								<select class="form-control" name="safeguard_way">
									<c:forEach items="${safeguardway }" var="statu">
										<option value="${statu.statu }"
											${subject.safeguard_way==statu.statu?"selected='selected'":"" }>${statu.name }</option>
									</c:forEach>
								</select> <span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group experStatus">
							<label class="col-sm-3 control-label">可使用体验金</label>

							<div class="col-sm-9">
								<select class="form-control" name="exper_status">
									<c:forEach items="${experstatus }" var="statu">
										<option value="${statu.statu }"
											${subject.exper_status==statu.statu?"selected='selected'":"" }>${statu.name }</option>
									</c:forEach>
								</select> <span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group raiseStart">
							<label class="col-sm-3 control-label">募集开始时间：</label>
							<div class="col-sm-9">
								<input name="raise_start" class="form-control time"
									placeholder="请输入文本" type="text" value="${subject.raise_start }">
								<span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group raiseEnd">
							<label class="col-sm-3 control-label">募集结束时间：</label>

							<div class="col-sm-9">
								<input name="raise_end" class="form-control time"
									placeholder="请输入文本" type="text" value="${subject.raise_end }">
								<span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group startDate">
							<label class="col-sm-3 control-label">标的开始时间：</label>

							<div class="col-sm-9">
								<input name="start_date" class="form-control time"
									placeholder="请输入文本" type="text" value="${subject.start_date }">
								<span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group endDate">
							<label class="col-sm-3 control-label">标的结束时间：</label>

							<div class="col-sm-9">
								<input name="end_date" class="form-control time"
									placeholder="请输入文本" type="text" value="${subject.end_date }">
								<span style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>
						<div class="form-group bought">
							<label class="col-sm-3 control-label">已购人数：</label>

							<div class="col-sm-9">
								<input name="bought" class="form-control" placeholder="请输入文本"
									type="text" value="${subject.bought }"> <span
									style="visibility: hidden">验证提示预留位置</span>
							</div>
						</div>

					</div>
				</div>
				<!--  
				<h2>
					<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>特定属性
				</h2>
				<div class="row bdlist typicalPanel">
					<div class="form-group col-md-6">
						<label class="col-sm-3 control-label">债权编号：</label>
						<div class="col-sm-9">
							<input name="subjectFieldRecords[0].id" value="5426"
								type="hidden"> <input
								name="subjectFieldRecords[0].fieldValue" value="45454"
								class="form-control" placeholder="请输入文本" type="text"> <span
								style="visibility: hidden">验证提示预留位置</span>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label class="col-sm-3 control-label">企业认证：</label>
						<div class="col-sm-9">
							<input name="subjectFieldRecords[1].id" value="5427"
								type="hidden"> <input
								name="subjectFieldRecords[1].fieldValue" value="545241"
								class="form-control" placeholder="请输入文本" type="text"> <span
								style="visibility: hidden">验证提示预留位置</span>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label class="col-sm-3 control-label">债权人：</label>
						<div class="col-sm-9">
							<input name="subjectFieldRecords[2].id" value="5428"
								type="hidden"> <input
								name="subjectFieldRecords[2].fieldValue" value="454545"
								class="form-control" placeholder="请输入文本" type="text"> <span
								style="visibility: hidden">验证提示预留位置</span>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label class="col-sm-3 control-label">保障平台：</label>
						<div class="col-sm-9">
							<input name="subjectFieldRecords[3].id" value="5429"
								type="hidden"> <input
								name="subjectFieldRecords[3].fieldValue" value="45545"
								class="form-control" placeholder="请输入文本" type="text"> <span
								style="visibility: hidden">验证提示预留位置</span>
						</div>
					</div>
				</div>
				-->
				<div class="row bdlist">
					<div class="col-md-12">
						<h2>
							<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>产品速览
						</h2>
						<div>
							<script id="editor" type="text/plain" name="commentt"
								style="height:500px;"><p>${subject.commentt}</p></script>
						</div>
					</div>
				</div>
				<div class="row bdlist">
					<div class="col-md-12">
						<h2>
							<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>项目详情
						</h2>
						<div>
							<script id="editor1" type="text/plain" name="projectdetails"
								style="height:500px;"><p>${subject.projectdetails}</p></script>
						</div>
					</div>
				</div>
				<div class="row bdlist">
					<div class="col-md-12">
						<h2>
							<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>安全保障
						</h2>
						<div>
							<script id="editor2" type="text/plain" name="safetycontrol"
								style="height:500px;"><p>${subject.safetycontrol}</p></script>
						</div>
					</div>
				</div>

				<div class="tablebaocun">
					<br>
					<button type="submit" class="btn btn-primary btn-sm"
						style="margin-left: 40%; margin-bottom: 20px; padding: 10px 30px">保存</button>
				</div>

			</div>
		</form>
		<div class="row bdlist ajaxContainer">

			<meta name="keywords"
				content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
			<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
			<link href="<%=basePath%>resources/web/images/icon.ico"
				type="image/x-icon" rel="shortcut icon">


			<div class="col-md-12">
				<h2>
					<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>标的附件
				</h2>

				<form action="<%=basePath%>subject/sys/attchment"
					enctype="multipart/form-data" method="post" class="attachmentForm">
					<label class="control-label col-sm-3 ">图片预览</label> <input
						id="input-24" type="file" multiple class="file-loading"
						name="files">
				</form>
			</div>


			<script src='<%=basePath%>resources/dist/js/jquery.min.js'></script>
			<script src='<%=basePath%>resources/js/jquery.form.js'></script>
			<script
				src="<%=basePath%>resources/dist/js/bootstrapValidator.min.js"></script>
			<script
				src="<%=basePath%>resources/bootstrap-fileinput/js/bootstrap.min.js"
				type="text/javascript"></script>
			<script
				src="<%=basePath%>resources/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js"
				type="text/javascript"></script>
			<script
				src="<%=basePath%>resources/bootstrap-fileinput/js/fileinput.min.js"
				type="text/javascript"></script>
			<script
				src="<%=basePath%>resources/bootstrap-fileinput/js/fileinput_locale_LANG.js"
				type="text/javascript"></script>
			<script
				src="<%=basePath%>resources/bootstrap-fileinput/js/fileinput_locale_zh.js"
				type="text/javascript"></script>

			<link rel="stylesheet"
				href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
			<script type="text/javascript"
				src="<%=basePath%>resources/date/bootstrap-datetimepicker.js"
				charset="UTF-8"></script>
			<script type="text/javascript"
				src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js"
				charset="UTF-8"></script>

			<script type="text/javascript">
 $(function () {
  			$("#input-24").fileinput({
                initialPreview: [
                        '<img src="<%=basePath%>${subject.folder_id}" class="file-preview-image" >',
                ],
                language: "zh",
                overwriteInitial: true,
                maxFileSize: 1000,
                allowedFileTypes: ["image"],
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                initialCaption: "选择上传的附件图片",
            });
            $("#input-24").closest("form").ajaxForm(function (data) {
                $(".attachmentForm :submit").attr("disabled","disabled");
                $("#folderId").val("upload/"+data.code);
                alert("上传成功");
            })
        });
        
        
      <%--   function delimg(imgid){
        	var url="<%=basePath%>subject/sys/editViewJson";		
        	$.get(url,{'imgid':imgid,'folderId':514},function(data){
        		$(".ajaxContainer").empty();
    			$(".ajaxContainer").append(data);
        	}); 
        } --%>
    </script>
		</div>
		<!-- 内容结束 -->
	</div>
	<!-- 容器结束 -->
</body>
<script type="text/javascript">
//实例化编辑器
var ue = UE.getEditor('editor');
var ue = UE.getEditor('editor1');
var ue = UE.getEditor('editor2');

	$(document).ready(function() {
		$('.time').datetimepicker({
			format : 'yyyy-mm-dd',
			language: 'zh-CN',
		    weekStart: 1,
		    todayBtn: 1,			
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			autoclose : true
		}).on('changeDate', function(ev) {
			$(this).focus();
			$('.time').datetimepicker('hide');
			$('#valForm').bootstrapValidator('revalidateField', 'raise_start');
			$('#valForm').bootstrapValidator('revalidateField', 'raise_end');
			$('#valForm').bootstrapValidator('revalidateField', 'start_date');
			$('#valForm').bootstrapValidator('revalidateField', 'end_date');
		});
	});

</script>

<script type="text/javascript">
        $(function () {
        	 var type = $("#type").val();
        	 if(type==0){
            	 $(".bought").show();
             	$(".amount").hide();
             	$(".raiseStart").hide();
             	$(".raiseEnd").hide();
            	$(".startDate").hide();
            	$(".endDate").hide();
            	$(".experStatus").show();
            	$("input[name='bought']").attr("disabled",false);
            	$("input[name='amount']").attr("disabled",true);
            	$("input[name='raise_start']").attr("disabled",true);
            	$("input[name='raise_end']").attr("disabled",true);
            	$("input[name='start_date']").attr("disabled",true);
            	$("input[name='end_date']").attr("disabled",true);
            	$("input[name='exper_status']").attr("disabled",false);
             }else{
            	$(".bought").hide();
             	$(".amount").show();
             	$(".raiseStart").show();
             	$(".raiseEnd").show();
             	$(".startDate").show();
            	$(".endDate").show();
            	$(".experStatus").hide();
            	$("input[name='bought']").attr("disabled",true);
            	$("input[name='amount']").attr("disabled",false);
            	$("input[name='raise_start']").attr("disabled",false);
            	$("input[name='raise_end']").attr("disabled",false);
            	$("input[name='start_date']").attr("disabled",false);
            	$("input[name='end_date']").attr("disabled",false);
            	$("input[name='exper_status']").attr("disabled",true);
             }
            $('#valForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '标的名称不能为空!'
                            },

                            stringLength: {
                                min: 2,
                                max: 100,
                                message: '标的名称长度为2-100个字符!'
                            }
                        }
                    },
                    serial_no: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '合同号不能为空!'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '合同号号称长度为6-20个数字?'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_]+$/,
                                message: '合同号不符合规范!'
                            }
                        }
                    },
                    floor_amount: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '起投金额不能为空!'
                            },
                            stringLength: {
                                min: 1,
                                max: 11,
                                message: '起投金额为1的倍数的金额!'
                            },
                            regexp: {
                                regexp: /^[0-9]+$/,
                                message: '起投金额为数字!'
                            }
                        }
                    },
                    year_rate: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '年化率不能为空!'
                            },
                            regexp: {
                                regexp: /^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$/,
                                message: '年化率为数字!'
                            }
                        }
                    },
                    period: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '投资期限不能为空!'
                            },
                            regexp: {
                                regexp: /^[0-9]+$/,
                                message: '投资期限为多少天!'
                            }
                        }
                    },
                    borrowername: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '借款人姓名不能为空!'
                            },
                            stringLength: {
                                min: 2,
                                max: 100,
                                message: '借款人姓名长度为2-100个字符!'
                            }
                        }
                    },
                    amount: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '总金额不能为空!'
                            },
                            stringLength: {
                                min: 3,
                                max: 20,
                                message: '总金额不能少于100'
                            },
                            regexp: {
                                regexp: /^[0-9]+$/,
                                message: '总金额为数字!'
                            }
                        }
                    },
                    raise_start: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '募集开始日期不能为空!'
                            }
                        }
                    },
                    raise_end: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '募集结束日期不能为空!'
                            }
                        }
                    },
                    start_date: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '标的开始日期不能为空!'
                            }
                        }
                    },
                    end_date: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '标的结束日期不能为空!'
                            }
                        }
                    },
                    purpose: {
                        message: '',
                        validators: {
                            notEmpty: {
                                message: '借款用途不能为空!'
                            },
                            stringLength: {
                                min: 3,
                                max: 200,
                                message: '借款用途长度为3-200个字符!'
                            }
                        }
                    }
                }
            });
            
        });
    </script>
</html>