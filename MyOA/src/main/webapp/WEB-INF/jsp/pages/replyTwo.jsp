<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>回复</title>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Bootstrap SOCIAL -->
<link href="${pageContext.request.contextPath}/static/vendor/bootstrap-social/bootstrap-social.css"	rel="stylesheet">


<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.css"	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/static/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/static/vendor/font-awesome/css/font-awesome.min.css"rel="stylesheet" type="text/css">

     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  
    <style type="text/css">
        #page-wrapper>.row {
            margin-top:20px;
        }


        .panel-body{
            padding: 0px;
            border-top:3px solid #ffffff ;
        }

        .panel-body .row:nth-of-type(1){
            background-color: #f5f5f5;
            margin: 0px;
        }
        .pan-center{
            padding:10px 15px;
            height: 180px;

            }
        .pan-center dt{
            font-size: 20px;
            color: #7dcf7e;

        }
        .pan-center dd{
            font-size: 14px;
            color: #a8a8a8;
            line-height: 30px;
        }
        .pan-contens{
            height: 220px;
            border-bottom: 1px solid #c0c0c0;
            padding: 25px 0px 0px 80px;
        }

        .dataTables_paginate{
            background-color: #f5f5f5;
            height: 40px;

        }
        .dataTables_paginate ul{
            margin: 0px;
            padding: 3px;
            height: 40px;
            float: right;
        }
        .hei{
        	 height: 20px;
        }
        .panel-heading button a:hover{
        	text-decoration:none;
        	color:#4e934f;
        }
    </style>

    <script type="application/javascript">

    </script>
</head>

<body>
	<div id="wrapper">
	
	 <!--共有部分 -->
		<c:import url="../shared/navbar.jsp"></c:import>
		<div id="page-wrapper">
		    <div class="row">
		        <div class="col-lg-12">
		
		        </div>
		        <!-- /.col-lg-12 -->
		    </div>
		    <!-- /.row -->
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="panel panel-default">
		                <div class="panel-heading">
		                    <button type="button" id="returning" class="btn btn-default"> <a href="dispatch"><i class="fa fa-mail-reply-all"></i></a></button>
		                    <button type="button" id="del" class="btn btn-default"><i class="fa fa-trash-o"></i> <a href="mfasongdelete?id=${mById.id}">删除</a></button>
		                    <button type="button" id="transmit" disabled="disabled" class="btn btn-default"><i class="fa fa-edit"></i> <a href="">编辑转发</a></button>
		                    <button type="button" id="dustbin" class="btn btn-default"><i class="fa fa-bitbucket"></i> <a href="messageUpdatestatus?id=${mById.id}">移动到垃圾箱</a> </button>
		                </div>
		                <!-- /.panel-heading  <input type=checkbox> -->
		                <div class="panel-body">
		                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
		                        <div class="row">
		                            <div class="col-sm-8">
		                                <div class="pan-center">
		                                    <dl>
		                                        <dt> <i class="fa fa-tags"></i> ${mById.title} </dt>
		                                        <dd>发件人：${mById.employee.name} <i class="fa fa-user"></i></dd>
		                                        <dd class="dtime">时间：<fmt:formatDate value="${mById.sendTime}" pattern="yyyy年MM月dd日  HH:mm:ss"/></dd>
		                                        <dd>收件人：${mById.receivers} <i class="fa fa-user-circle-o" aria-hidden="true"></i></dd>
		                                        <dd>重要性：
		                                        	<c:if test="${mById.level==1}">
		                                          	   <td class="center">普通</td>
		                                            </c:if>
		                                            <c:if test="${mById.level==2}">
		                                          	   <td class="center">重要</td>
		                                            </c:if>
		                                            <c:if test="${mById.level==3}">
		                                          	   <td class="center">紧急</td>
		                                            </c:if>
														&nbsp;		&nbsp;		
		                                         </dd>
		                                    </dl>
		                                </div>
		                            </div>
		                            <div class="col-sm-2"></div>
		                            <div class="col-sm-2">
		                                <div class="m_portrait">
		                                    <div></div>
		                                    <img src="${pageContext.request.contextPath}/static/images/default_headpic.png" alt="头像" class="img-circle">
		                                </div>
		
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-sm-12">
		                            <p class="hei"> </p>
		                            	<textarea id="content" name="topic.content" class="ckeditor form-control">${mById.content}</textarea>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <!-- /.panel-body -->
		            </div>
		            <!-- /.panel -->
		        </div>
		        <!-- /.col-lg-12 -->
		    </div>
		    <!-- /.row -->
		</div>
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/static/dist/js/sb-admin-2.js"></script>

		<!-- ckeditor Theme 文本框 -->
	<script src="${pageContext.request.contextPath}/static/ckeditor/ckeditor.js"></script>
	<!-- pageing-->
	<script src="${pageContext.request.contextPath}/static/js/paging.js"></script>
	
	<script>
    $("#ckbAll").click(function () {
        var flag = this.checked;
        $("[name = chkItem]").each(function () {
            this.checked = flag;
        });
    });

    $("[name = chkItem]").click(function (){
        if($("[name = chkItem]").length == $("[name = chkItem]:checked").length){
            $("#ckbAll").prop("checked", true);
        }else{
            $("#ckbAll").prop("checked", false);
        }
    });
   

</script>

</body>

</html>