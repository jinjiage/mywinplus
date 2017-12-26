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
    <link rel="stylesheet" href="<%=basePath%>resources/sys/webupload/webuploader.css">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/webupload/demo.css">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/uploadify/uploadify.css">

    <link href="<%=basePath%>resources/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/lang/zh-cn/zh-cn.js"></script>
    <title>后台首页</title>
</head>
<body>

<div class="box-right-main">
    <h2>
        <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>私募/股权类编辑
    </h2>

    <form action="<%=basePath%>financeProductFunds/updateFinanceProductFunds" method="post" id="valForm" enctype="multipart/form-data">
    	<input type="hidden" name="id" value="${financeProductFunds.id }">
    	<input type="hidden" name="create_date" value="${financeProductFunds.create_date }">
    	<input type="hidden" name="type" value="${financeProductFunds.type }">
    	
    	<%-- <input type="hidden" name="period" value="${financeProductFunds.period}"> --%>
        <div class="tablelist">
            <!-- 表单 -->
            <div class="row bdlist">
                <div class="col-md-6">
                	 <div class="form-group">
                        <label class="col-sm-3 control-label">类别：</label>

                        <div class="col-sm-9">
                           	<select class="form-control" name="type" id="type" disabled="disabled">
                           		<c:forEach items="${financetype }" var="finance">
										<option value="${finance.statu }"
									${financeProductFunds.id==finance.statu?"selected='selected'":"" }	>${finance.name }</option>
									</c:forEach>
                           	</select>
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称：</label>

                        <div class="col-sm-9">
                            <input name="name" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.name }">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">起投金额(元)：</label>

                        <div class="col-sm-9">
                            <input name="floor_amount" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.floor_amount}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">年化收益(%)：</label>

                        <div class="col-sm-9">
                            <input name="year_rate" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.year_rate}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label">开始日期：</label>

                        <div class="col-sm-9">
                            <input name="start_date" class="form-control time" placeholder="请输入文本" type="text" value="${financeProductFunds.start_date}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">结束日期：</label>

                        <div class="col-sm-9">
                            <input name="end_date" class="form-control time" placeholder="请输入文本" type="text" value="${financeProductFunds.end_date}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">返佣比例：</label>

                        <div class="col-sm-9">
                            <input name="ratio" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.ratio}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label">状态：</label>

                        <div class="col-sm-9">
                           	<select class="form-control" name="status">
                           		<c:forEach items="${financestaus }" var="finance">
										<option value="${finance.statu }"
									${financeProductFunds.status==finance.statu?"selected='selected'":""}		>${finance.name }</option>
									</c:forEach>
                           	</select>
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                    <div class="form-group period">
                        <label class="col-sm-3 control-label">投资期限(天)：</label>

                        <div class="col-sm-9">
                            <input name="period" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.period}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row bdlist">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>基金专题/关于基金
                </h2>

                <div>
                    <div><textarea name="product_topic" id="productTopic" style="height: 300px;"><p>${financeProductFunds.product_topic }</p></textarea></div>
                    <script type="text/javascript"> var ue = UE.getEditor('productTopic');</script>
                </div>
            </div>
        </div>
        
         <div class="row bdlist">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>产品要素
                </h2>

                <div>
                    <div><textarea name="product_factor" id="productFactor" style="height: 300px;"><p>${financeProductFunds.product_factor }</p></textarea></div>
                    <script type="text/javascript"> var ue = UE.getEditor('productFactor');</script>
                </div>
            </div>
        </div>
       <!-- ===私募类=== -->
      <div class="row bdlist productStrategy">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>产品策略
                </h2>

                <div>
                    <div><textarea name="product_strategy" id="productStrategy" style="height: 300px;"><p>${financeProductFunds.product_strategy }</p></textarea></div>
                    <script type="text/javascript"> var ue = UE.getEditor('productStrategy');</script>
                </div>
            </div>
        </div>
        
        
        <div class="row bdlist product">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span> 基金经理
                </h2>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-sm-3 control-label">基金经理名称：</label>

                    <div class="col-sm-9">
                        <input name="product_manager_name" id="productManagerName1" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.product_manager_name }">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">基金经理头衔：</label>

                    <div class="col-sm-9">
                        <input name="product_manager_title" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.product_manager_title}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">基金经理简介：</label>

                    <div class="col-sm-9">
                        <input name="product_manager_desc" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.product_manager_desc}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">基金经理头像：</label>

                    <div class="col-sm-9">
                        <div id="avatar" style="text-align:left">
                            <input type="file" name="avatar_link" id="avatar_link">
                            <input type="hidden" name="product_manager_pic" id="productManagerPic" value="${financeProductFunds.product_manager_pic}"/>
                            <div id="" class='uploadvedio'>
                             	<a href="<%=basePath%>" target='_black'></a> 
                            	<a href=javascript:delimg('','filelink')>删除</a> 
                            </div>
                        </div>
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row bdlist productManager">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>基金经理详情
                </h2>

                <div>
                    <div><textarea name="product_manager" id="productManager" style="height: 300px;"><p>${financeProductFunds.product_manager}</p></textarea></div>
                    <script type="text/javascript"> var ue = UE.getEditor('productManager');</script>
                </div>
            </div>
        </div>

        <div class="row bdlist">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>私募合同
                </h2>

                <div>
                    <div><textarea name="contract" id="contract" style="height: 300px;"><p>${financeProductFunds.contract}</p></textarea></div>
                    <script type="text/javascript"> var ue = UE.getEditor('contract');</script>
                </div>
            </div>
        </div>

        <div class="row bdlist">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span> 银行账户
                </h2>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-sm-3 control-label">银行账户：</label>

                    <div class="col-sm-9">
                        <input name="bank_account" id="bankAccount" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.bank_account}">
                        <span style="color: red;">例：招商银行杭州高新支行|1234 5678 1234 123|杭州吉威投资管理有限公司</span>
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
            </div>
        </div>

         <!-- ===股权类=== -->
        <div class="row bdlist guquan" style="display: none;">
            <div class="col-md-12">
                <h2>
                    <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span> 股权信息
                </h2>
            </div>
            <div class="col-sm-6">
            	<div class="form-group">
                    <label class="col-sm-3 control-label">管理人名称：</label>

                    <div class="col-sm-9">
                        <input name="product_manager_name" id="productManagerName2" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.product_manager_name}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">投资方向：</label>

                    <div class="col-sm-9">
                        <input name="invest_points" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.invest_points}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">募集金额：</label>

                    <div class="col-sm-9">
                        <input name="amount" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.amount}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">已售金额：</label>

                    <div class="col-sm-9">
                        <input name="sold_amount" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.sold_amount}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">购买人数：</label>

                    <div class="col-sm-9">
                        <input name="buyer_count" class="form-control" placeholder="请输入文本" type="text" value="${financeProductFunds.buyer_count}">
                        <span style="visibility: hidden">验证提示预留位置</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="tablebaocun">
            <br>
            <button type="submit" class="btn btn-primary btn-sm" style="margin-left: 40%; margin-bottom: 20px; padding: 10px 30px">保存</button>
        </div>
    </form>
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

<script src="<%=basePath%>resources/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>

<script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<script type="text/javascript">

     $(function () {
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
  			$('#valForm').bootstrapValidator('revalidateField', 'startDate');
 			$('#valForm').bootstrapValidator('revalidateField', 'endDate');
  		});
    	 
    	 
    	 var type = $("#type").val();
    	    if(type==0){
    	    	$(".guquan").hide();
    	    	$(".period").show();
    	    	$(".product_strategy").show();
    	    	$(".product").show();
    	    	$(".product_manager").show();

    	    	$("input[name='invest_points']").attr("disabled",true);
    	    	$("input[name='amount']").attr("disabled",true);
    	    	$("input[name='sold_amount']").attr("disabled",true);
    	    	$("input[name='buyer_count']").attr("disabled",true);
    	    	$("input[name='period']").attr("disabled",false);
    	    	$("input[name='product_strategy']").attr("disabled",false);
    	    	$("#productManagerName1").attr("disabled",false);
    	    	$("#productManagerName2").attr("disabled",true);
    	    	$("input[name='product_manager_title']").attr("disabled",false);
    	    	$("input[name='product_manager_desc']").attr("disabled",false);
    	    	$("input[name='product_danager_pic']").attr("disabled",false);
    	    	$("input[name='product_manager']").attr("disabled",false);
    	    }else{
    	    	$(".guquan").show();
    	    	$(".period").hide();
    	    	$(".productStrategy").hide();
    	    	$(".product").hide();
    	    	$(".product_manager").hide();

    	    	$("input[name='invest_points']").attr("disabled",false);
    	    	$("input[name='amount']").attr("disabled",false);
    	    	$("input[name='sold_amount']").attr("disabled",false);
    	    	$("input[name='buyer_count']").attr("disabled",false);
    	    	$("input[name='period']").attr("disabled",true);
    	    	$("input[name='product_strategy']").attr("disabled",true);
    	    	$("#productManagerName1").attr("disabled",true);
    	    	$("#productManagerName2").attr("disabled",false);
    	    	$("input[name='product_manager_title']").attr("disabled",true);
    	    	$("input[name='product_manager_desc']").attr("disabled",true);
    	    	$("input[name='product_manager_pic']").attr("disabled",true);
    	    	$("input[name='product_manager']").attr("disabled",true);
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
                            message: '名称不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '名称长度为2-100个字符!'
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
                
                product_manager_name: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '基金经理名称不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '基金经理名称长度为2-100个字符!'
                        }
                    }
                },
                product_manager_title: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '基金经理头衔不能为空!'
                        },
                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '基金经理头衔长度为2-100个字符!'
                        }
                    }
                },
                product_manager_pic: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '基金经理头像不能为空!'
                        }
                    }
                },
                product_manager_desc: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '基金经理简介不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 1000,
                            message: '基金经理简介长度为2-1000个字符!'
                        }
                    }
                },
                invest_points: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '投资方向不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '投资方向长度为2-100个字符!'
                        }
                    }
                },
                amount: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '募集金额不能为空!'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '募集金额为数字!'
                        }
                    }
                },
                sold_amount: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '已售金额不能为空!'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '已售金额为数字!'
                        }
                    }
                },
                buyer_count: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '购买人数不能为空!'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '购买人数为数字!'
                        }
                    }
                },
                start_date: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '开始日期不能为空!'
                        }
                    }
                },
                end_date: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '结束日期不能为空!'
                        }
                    }
                },
                ratio: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '返佣比例不能为空!'
                        }
                    }
                },
                bank_account: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '银行账号不能为空!'
                        }
                    }
                }

            }
        });
        $('#avatar_link').uploadify({
            'swf': '<%=basePath%>resources/uploadify/uploadify.swf', //指定上传控件的主体文件，默认‘uploader.swf’
            'uploader': '<%=basePath%>upload/fileupload', //指定服务器端上传处理文件
            'auto': true, //手动上传
            'buttonImage': '<%=basePath%>resources/uploadify/uploadify-browse.png', //浏览按钮背景图片
            'multi': false, //单文件上传
            'fileTypeExts': '*.gif; *.jpg; *.png;', //允许上传的文件后缀
            'fileSizeLimit': '10MB', //上传文件的大小限制，单位为B, KB, MB, 或 GB
            'successTimeout': 30, //成功等待时间
            'queueSizeLimit': 1,
            'fileObjName': 'file',
            'onUploadSuccess': function (file, data,response) {//每成功完成一次文件上传时触发一次
                var image = eval("[" + data + ']')[0];
                $(".uploadvedio").remove();
                $('#avatar').append("<div id=" + image.msg + " class='uploadvedio'> <a href=<%=basePath%>" + image.msg + " target='_black'>" + image.msg + "</a> " +
                        "<a href=javascript:delimg('" + image.msg + "','productManagerPic')>删除</a> </div>");
                $("#productManagerPic").val(image.msg);
            },
            'onUploadError': function (file, data, response) {//当上传返回错误时触发
                $('#avatar').append("<li>" + data + "</li>");

            }
        });
    });

    <!--删除图片-->
    function delimg(obj, tval) {
        var url = "<%=basePath%>upload/delimg";
        $.post(url, {'imgpath': obj}, function (data) {
            if (data.code == 0) {
                document.getElementById(obj).remove();
                document.getElementById(tval).value = "";
            }
        });
    }
</script>
</html>
