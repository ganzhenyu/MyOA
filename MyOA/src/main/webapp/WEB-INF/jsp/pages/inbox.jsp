<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.sams.com/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>新建邮箱</title>

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
        .panel-body{
            margin-top: 20px;

        }
        .page-header{
            box-shadow: 10px 6px 9px #858585;
        }
         .gradeA td {
        	font-size:16px;
        }
        
          .gradeA p{ 
            white-space:nowrap;
            display:inline;
      	 }
        
        .page-header span{
            font-size: 15px;
            color: #b4b4b4;
        }
        .panel-body{
            margin: 0px;
            padding: 0px;

        }
        .gradeA td span{
        	 color: #b4b4b4;
        }
         .gradeA .font-con{
        	color: #63a464;
        }
        
        #dataTables-example_wrapper th{
        	font-size:14px;
        }
        .gradeA a:hover{
        	text-decoration:none;
        	color:#555555fa;
        }
        
        	div.pager a {
				text-decoration: none;
				border: solid 1px gray;
				padding: 1px 3px;
			}
			
			div.pager span.current {
				padding: 1px 3px;
				background-color: gray;
				color: white;
			}
			
			div.pager span.pageInfo {
				margin-left: 10px;
			}
			.draftHou td{text-align: center;}  
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
	            <h1 class="page-header"><i class="fa fa-envelope-square" aria-hidden="true"></i> 收件箱&nbsp;&nbsp;<span>(共${mrilist.size()} 封,其中 <a href="">未读邮件</a>？封)</span></h1>
	        </div>
	   
	        <!-- /.col-lg-12 -->
	    </div>
	    <form action="mRdelete">
	    <!-- /.row -->
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                	<button type="submit" id="del" class="btn btn-info"><i class="fa fa-trash-o"></i> 删除</button>
	                </div>
	                <!-- /.panel-heading  <input type=checkbox> -->
	                <div class="panel-body">
	                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	                        <div class="row">
	                            <div class="col-sm-12">
	                            
	                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
	                                    <thead>
	                                        <tr role="row">
	                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width:50px;"><input id="ckbAll" type="checkbox"/> 全选</th>
	                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:40px;"><i class="fa fa-envelope-o"></i> <i class="fa fa-paperclip"></i></th>
	                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 70px;">发件人</th>
	                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 480px;">主题</th>
	                                            <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 120px;">时间</th>
	                                       		<th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">操作</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    
	                                    <c:forEach var="c" items="${mrilist}" >
	                                    <c:if test="${c.status==0}">
	                                    	<tr class="gradeA odd" role="row">
	                                    	
		                                       <td class="sorting_1"><input name="chkItem" type="checkbox" value="${c.id}"></td>
		                                       <c:if test="${c.isread==1}">
		                                           <td><a href="reply?id=${c.id}"><i class="fa fa-file-text-o" aria-hidden="true"></i></a></td>
		                                        </c:if>
		                                        <c:if test="${c.isread==0}">
		                                           	<td><a href="reply?id=${c.id}"><i class="fa fa-envelope-o" aria-hidden="true"></i></a></td>
		                                        </c:if>
		                                        <td><a href="reply?id=${c.id}">${c.message.employee.name} </a></td>
		                                        <td class="center"><a href="reply?id=${c.id}">${c.message.title} <span class="font-con">- - </span>
			                                        <span>
		                                            	<c:if test="${fn:length(c.message.content)>60}">
													       <c:out value="${fn:substring(c.message.content,0,58)}" />
													       ...
													    </c:if>
													    <c:if test="${fn:length(c.message.content)<=60}">${c.message.content}</c:if>
		                                            </span>
		                                        </a>
		                                        </td>
		                                        <td class="center"><a href="reply?id=${c.id}">${c.message.sendTime}</a></td>
	                                            <td class="center">
		                 							<a class="btn btn-social-icon btn-twitter" href="mrdelete?id=${c.id}"><i class="fa fa-trash-o"></i></a>
		                                            <a class="btn btn-social-icon btn-flickr"  href="reply?id=${c.id}"><i class="fa fa-edit"></i></a>
		                                            <a class="btn btn-social-icon btn-bitbucket" href="mrUpdatestatus?id=${c.id}"><i class="fa fa-bitbucket"></i></a>
	                                       
	                                            </td>
	                                        </tr>
	                                        
	                                        </c:if>
	                                    </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-sm-8"> </div>
	                            <div class="col-sm-4">
	                                <div class="panel-body-a">						
										<tags:pager urlFormat="?pageNum=${pageNum-1}&isSent=${param.isSent}=%d"
										pageSize="1" numbers="5" totalRows="${totalPages}" curPage="${param.pageNum}" />
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
	    </form>
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
	
	<!-- pageing-->
	<script src="${pageContext.request.contextPath}/static/js/paging.js"></script>
	
	<script>

    $("#del").click(function(){
        if($("input[type='checkbox']").is(':checked')) {
            return true;
        }
        alert('请选择删除邮件');
    });
    /*编辑转发
    $("#transmit").click(function(){
        if($("input[type='checkbox']").is(':checked')) {
            return true;
        }
        alert('未选择任何邮件');
    });*/
	/*垃圾箱
    $("#dustbin").click(function(){
        if($("input[type='checkbox']").is(':checked')) {
            return true;
        }
        alert('未选择任何邮件');
    });*/
    
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