<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon"
	rel="shortcut icon">
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/font/iconfont.css"
	rel="stylesheet">
<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>

<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">
	
</head>
<body>
<form action="<%=basePath%>finance" method="get" id="form1">
        <input type="hidden" id="pageid" name="page">
        </form>
<div class="ajaxContainer">
        <!-- 异步内容开始 -->
        <c:forEach items="${ prods.getContent() }" var="prod">
         <ul class="tbList">
                        <li class="first">
                            <span class="ico jp"></span>
                            <h2><b>${prod.name }</b></h2>
                            <i></i>
                        </li>
                        <c:if test="${prod.type!=0 }">
                        <li class="second" style="width:630px;">
                            <div class="txt1">
                                <h2>${prod.year_rate }%</h2>
                                <p>年化收益</p>
                            </div>
                            <div class="txt2">
                                <h2>${prod.period }</h2>
                                <p>期限(天)</p>
                            </div>
                            <div class="txt2">
                                <h2>${prod.floor_amount }
                                </h2>
                                <p>起购金额(元)</p>
                            </div>

                        </li>
                       
                    </c:if>
                    <c:if test="${prod.type==0}">
                     <li class="second">
                        <div class="txt1" style="width:115px; margin-left:40px;">
                            <h2>${prod.year_rate }%</h2>
                            <p>年化收益</p>
                        </div>
                        <div class="txt2" style="width:120px;margin-left:40px;">
                            <h2>${prod.floor_amount }</h2>
                            <p>起购金额(元)</p>
                        </div>
                    </li>
                    <li class="six three" style="width:290px;">
                        <p>已购人数：${prod.buyer_count }
                        人
                            <br>
                            管理人：${prod.product_manager_name }<br>
                            投资方向：${prod.invest_points }
                        </p>
                    </li>
                    
                    
                    
                    </c:if>
                     <li class="five"><a class="abtn" href="<%=basePath%>finance/financeView/${prod.id}">购买</a></li>
                    </ul>
        
        
        
        </c:forEach>
                   
           
            
             
                
        <!-- 异步内容结束 -->
	
	
	<div class="llpage">
	<div class="in"><a
									href="javascript:getJsonInfo(${prods.getNumber()+1 })">首页</a>
								<a class="prev_page" href="javascript:getJsonInfo(${prods.getNumber()+1-1>=1?prods.getNumber():prods.getNumber()+1 })">上页</a> 
								<a
									href="javascript:getJsonInfo(${prods.getNumber()+1+1<prods.getTotalPages()?prods.getNumber()+1+1:prods.getTotalPages() })"
									class="next_page" rel="next">下页</a>
								<a
									href="javascript:getJsonInfo(${prods.getTotalPages()})">尾页</a>	
							</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>
    </div>
  	<script type="text/javascript">
						function getJsonInfo(id) {
							$("#pageid").val(id);
							$(form1).submit();
						}
					</script>   	

</body>
</html>