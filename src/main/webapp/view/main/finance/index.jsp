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
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/ying/iconfont.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/bootstrap.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/webupload/webuploader.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/webupload/demo.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
        <link href="<%=basePath%>resources/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/lang/zh-cn/zh-cn.js"></script>
        <title>后台首页</title>
    </head>
    <body>

    <div class="box-right-main">
        <h2>
            <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>产品信息详细页
        </h2>

        <form action="<%=basePath%>subject/sys/add" method="post" id="valForm">
           
            <div class="tablelist">
                <!-- 表单 -->
                <div class="row bdlist">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名称：</label>

                            <div class="col-sm-9">
                                <input name="name" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">合同编号：</label>

                            <div class="col-sm-9">
                                <input name="serial_no" class="form-control" placeholder="请输入文本"  type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">起投金额(元)：</label>

                            <div class="col-sm-9">
                                <input name="floor_amount" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">年化收益(%)：</label>

                            <div class="col-sm-9">
                                <input name="year_rate" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态：</label>

                            <div class="col-sm-9">
                                <select class="form-control" name="status">
                                <c:forEach items="${subjectstatu }" var="statu" >
                                <option value="${statu.statu }">${statu.name }</option>
                                </c:forEach>
                       
                                </select>
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">投资期限(天)：</label>

                            <div class="col-sm-9">
                                <input name="period" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">借款人姓名：</label>

                            <div class="col-sm-9">
                                <input name="borrowername" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group amount" style="display: none;">
                            <label class="col-sm-3 control-label">总金额(元)：</label>

                            <div class="col-sm-9">
                                <input name="amount" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">类型</label>

                            <div class="col-sm-9">
                                <select class="form-control" name="type">
                                        	<c:forEach items="${subjecttype }" var="statu" >
                                <option value="${statu.statu }">${statu.name }</option>
                                </c:forEach>
                                </select>
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">借款用途</label>

                            <div class="col-sm-9">
                                <input name="purpose" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">保障方式</label>

                            <div class="col-sm-9">
                                <select class="form-control" name="safeguard_way">
                                      <c:forEach items="${safeguardway }" var="statu" >
                                <option value="${statu.statu }">${statu.name }</option>
                                </c:forEach>
                                </select>
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group experStatus">
                            <label class="col-sm-3 control-label">可使用体验金</label>

                            <div class="col-sm-9">
                                <select class="form-control" name="exper_status">
                                   <c:forEach items="${experstatus }" var="statu" >
                                <option value="${statu.statu }">${statu.name }</option>
                                </c:forEach>
                                </select>
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group raiseStart" style="display: none;">
                            <label class="col-sm-3 control-label">募集开始时间：</label>

                            <div class="col-sm-9">
                                <input name="raise_start" class="form-control time" disabled="disabled" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group raiseEnd" style="display: none;">
                            <label class="col-sm-3 control-label">募集结束时间：</label>

                            <div class="col-sm-9">
                                <input name="raise_end" class="form-control time" disabled="disabled" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group startDate" style="display: none;">
                            <label class="col-sm-3 control-label">标的开始时间：</label>

                            <div class="col-sm-9">
                                <input name="start_date" class="form-control time" disabled="disabled" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group endDate" style="display: none;">
                            <label class="col-sm-3 control-label">标的结束时间：</label>

                            <div class="col-sm-9">
                                <input name="end_date" class="form-control time" disabled="disabled" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
                            </div>
                        </div>
                        <div class="form-group bought">
                            <label class="col-sm-3 control-label">已购人数：</label>

                            <div class="col-sm-9">
                                <input name="bought" class="form-control" placeholder="请输入文本" type="text">
                                <span style="visibility: hidden">验证提示预留位置</span>
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
                <input name="subjectFieldRecords[0].fieldId" value="FANG_CHAN_ZHENG" type="hidden">
                <input name="subjectFieldRecords[0].fieldValue" class="form-control" placeholder="请输入文本" type="text">
                <span style="visibility: hidden">验证提示预留位置</span>
            </div>
        </div>
        <div class="form-group col-md-6">
            <label class="col-sm-3 control-label">企业认证：</label>
            <div class="col-sm-9">
                <input name="subjectFieldRecords[1].fieldId" value="FANG_CHAN_ZHENG2" type="hidden">
                <input name="subjectFieldRecords[1].fieldValue" class="form-control" placeholder="请输入文本" type="text">
                <span style="visibility: hidden">验证提示预留位置</span>
            </div>
        </div>
        <div class="form-group col-md-6">
            <label class="col-sm-3 control-label">债权人：</label>
            <div class="col-sm-9">
                <input name="subjectFieldRecords[2].fieldId" value="FANG_CHAN_ZHENG3" type="hidden">
                <input name="subjectFieldRecords[2].fieldValue" class="form-control" placeholder="请输入文本" type="text">
                <span style="visibility: hidden">验证提示预留位置</span>
            </div>
        </div>
        <div class="form-group col-md-6">
            <label class="col-sm-3 control-label">保障平台：</label>
            <div class="col-sm-9">
                <input name="subjectFieldRecords[3].fieldId" value="FANG_CHAN_ZHENG4" type="hidden">
                <input name="subjectFieldRecords[3].fieldValue" class="form-control" placeholder="请输入文本" type="text">
                <span style="visibility: hidden">验证提示预留位置</span>
            </div>
        </div>
</div>
-->
            </div>
       
       
         <div class="row bdlist">
            <div class="col-md-12">
	        <h2>
	            <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>产品速览
	        </h2>
	        <div>
			    <script id="editor" type="text/plain" name="commentt" style="height:500px;"></script>
			</div>
         </div>
        </div>
        
         <div class="row bdlist">
            <div class="col-md-12">
	        <h2>
	            <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>项目详情
	        </h2>
	        <div>
			    <script id="editor1" type="text/plain" name="projectdetails" style="height:500px;"></script>
			</div>
         </div>
        </div>
        
         <div class="row bdlist">
            <div class="col-md-12">
	        <h2>
	            <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>安全保障
	        </h2>
	        <div>
			    <script id="editor2" type="text/plain" name="safetycontrol" style="height:500px;"></script>
			</div>
         </div>
        </div>
        
         <div class="tablebaocun">
         	  <br>
              <button type="submit" class="btn btn-primary btn-sm" style="margin-left: 40%; margin-bottom: 20px; padding: 10px 30px">保存</button>
         </div>
        </form> 
       <div class="row bdlist">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>标的附件
                </h2>

                <form action="<%=basePath%>subject/sys/attchment" enctype="multipart/form-data" method="post" class="attachmentForm">
                    <label class="control-label col-sm-3 ">图片预览</label>
                    <input id="input-24" type="file" multiple class="file-loading" name="files">
        
                </form>
            </div>
        </div>
        <!-- 内容结束 -->
    </div>
    <!-- 容器结束 -->
    </body>
    <script src='<%=basePath%>resources/dist/js/jquery.min.js'></script>
    <script src='<%=basePath%>resources/js/jquery.form.js'></script>
    <script src="<%=basePath%>resources/dist/js/bootstrapValidator.min.js"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/fileinput.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/fileinput_locale_LANG.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/fileinput_locale_zh.js" type="text/javascript"></script>
    
   	<link rel="stylesheet" href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
	<script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
 
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
			autoclose : 1
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
                                max: 10,
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
            })
            
            

            $(":input[name=type]").change(function(){
                var type = $(this).val();
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
                $.get("<%=basePath%>subject/sys/subjectFields/" + type,function(page){
                    $(".typicalPanel").prev().remove();
                    $(".typicalPanel").remove();
                    $(".tablebaocun").before(page);
                })
            })

            $("#input-24").fileinput({
                language: "zh",
                overwriteInitial: false,
                maxFileSize: 1000,
                allowedFileTypes: ["image"],
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                initialCaption: "选择上传的附件图片",
            });

            $("#input-24").closest("form").ajaxForm(function (data) {
                $(".attachmentForm :submit").attr("disabled","disabled");
                $("#folderId").val("upload/"+data);
                alert("上传成功");
            })
       
        
        });
    </script>
    </html>