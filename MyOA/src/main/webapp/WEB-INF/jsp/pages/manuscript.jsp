<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.sams.com/tags" prefix="tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>草稿箱</title>

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
            padding:15px 5px;
        }
      
		 .col-sm-12{
		 	padding:0px;
		 }
        .page-header{
            box-shadow: 10px 6px 9px #858585;
        }
         .gradeA td span{
        	 color: #b4b4b4;
        }
        
         .gradeA td {
        	font-size:16px;

        }
        
         .gradeA p{ 
            white-space:nowrap;
            display:inline;
      	 }
        
         .gradeA .font-con{
        	color: #63a464;
        }
        
        .page-header span{
            font-size: 14px;
            color: #b4b4b4;
        }
   		#dataTables-example_wrapper th{
   			 font-size: 14px;
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
			  <h1 class="page-header"><i class="fa fa-pagelines" aria-hidden="true"></i> 草稿箱&nbsp;&nbsp;<span>(共${mlist.size()}封)</span></h1>
		</div>
      </div>
   <form action="mdel" method="post">
   <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                  <button type="submit" id="del" class="btn btn-info"><i class="fa fa-trash-o"></i> <a href="mdel">删除</a></button>
                </div>
                <!-- /.panel-heading  <input Wheckbox> -->
                
                <div class="panel-body">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row">
                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width:75px;"><input id="ckbAll" type="checkbox"/> 全选</th>
                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:56px;"><i class="fa fa-envelope-o"></i> <i class="fa fa-paperclip"></i></th>
                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 110px;">收件人</th>
                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 780px;">主题</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 214px;">时间</th>
                                            <th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:74px;">重要性</th>
                                        	<th tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 166px;">操作</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach var="c" items="${mlist}" >
                                        <tr class="gradeA odd" role="row">
                                          <td class="sorting_1"><input name="chkItem" type="checkbox" value="${c.id}"></td>
                                            <td><i class="fa fa-envelope-o"></i></td>
                                            <td>${c.receivers}</td>
                                            <td class="center">${c.title}<span class="font-con">- - </span>
                                            	<span>
	                                            	<c:if test="${fn:length(c.content)>66}">
												       <c:out value="${fn:substring(c.content,0,63)}" />
												       ...
												    </c:if>
												    <c:if test="${fn:length(c.content)<=66}">${c.content}</c:if>
	                                            </span>
											</td>
                                            <td class="center">${c.sendTime}</td>
                                            <c:if test="${c.level==1}">
                                          	   <td class="center">普通</td>
                                            </c:if>
                                            <c:if test="${c.level==2}">
                                          	   <td class="center">重要</td>
                                            </c:if>
                                            <c:if test="${c.level==3}">
                                          	   <td class="center">紧急</td>
                                            </c:if>
                                              <td class="center">
	                 								<a class="btn btn-social-icon btn-twitter" href="mcaogaodelete?id=${c.id}"><i class="fa fa-trash-o"></i></a>
	                                            	<a class="btn btn-social-icon btn-flickr" href="mById?id=${c.id}"> <i class="fa fa-edit"></i></a>
	                                            	<a class="btn btn-social-icon btn-bitbucket" href="messageUpdatestatus?id=${c.id}"><i class="fa fa-bitbucket"></i></a>
	                                          </td>
                                        </tr>
                                         </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8"> </div>
                            <div class="col-sm-4">
                                 <div class="panel-body-a">						
									<tags:pager urlFormat="manuscript?isSent=${param.isSent}&pageNum=%d"
									pageSize="1" numbers="5" totalRows="${totalPages}" curPage="${param.pageNum}" />
								</div>		 
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
	
	<script>

    $("#del").click(function(){
        if($("input[type='checkbox']").is(':checked')) {
            return true;
        }
        alert('请选择删除邮件');
    });

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