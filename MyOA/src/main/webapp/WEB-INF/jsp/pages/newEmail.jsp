<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 附件插件框 -->
 <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
<link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fileinput.css">
<script src="${pageContext.request.contextPath}/static/js/fileinput.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/fileinput_locale_fr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/fileinput_locale_es.js" type="text/javascript"></script>

<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/static/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styletwo.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">

<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
 
   /*.file-caption-main{
      border: 3px dashed red;
      width:800px;
      height:20px;
   }*/
    
    
    
   .file-caption-main .input-group-btn{
    	 margin-top: 10px;
    }   
        .panel-body{
            margin-top: 10px;

        }
        .panel-body input,textarea,select{
            margin-left: 20px;
        }

        .panel-body #btn,#but{
            border: none;
            background-color:#ffffff;
            box-shadow: 4px 4px 6px #818181;
        }
      
        .page-header{
            box-shadow: 10px 6px 9px #858585;

        }
        .toup .xuxian{
            border-bottom: 1px  dotted #9e9e9e;
            width: 96%;
            margin: 0px 0px 20px 40px;
        }
       .toup .addressee{
        	color:#9e9e9e;
        	font-size:14px;
        }
        .panel-body label{
        	font-size:20px;
        }
        .divbuttom{
        	 width:140px;
        	 height:36px;
        	 border-left: 4px solid #818181;        
        	 float: left;
        	 margin-bottom:10px;
        }
        .form-group{
        	clear:both;
        }
        .content{
        	padding-top:80px;
        }
  
    </style>
    <script type="application/javascript">
    $(function () {
		$("#ztreeid li").click(function() {			
			var bool = true;
			var list=$("#receivers").val().split(",");
			for(var i = 0;i<list.length;i++){
				if(list[i]==$(this).text()){
					list.splice(i,1);
					bool = false;
					break;
				}
			}
			console.log(list);
			$("#receivers").val(list.toString());
			if(bool){
				var receivers= $("#receivers").val();
				if(receivers==null || receivers==""){
					$("#receivers").val(receivers+$(this).text());
				}else{
					$("#receivers").val(receivers+","+$(this).text());
				}
				
			}
		})
		$("#btn").click(function () {
			
			$("input[name='isSent']").val(0);
			$("#from").submit();
		})
		$("#but").click(function () {
			$("input[name='isSent']").val(1);
			$("#from").submit();
		})
	})
		//<span class="addressee">dd</span>
    </script>
</head>

<body>
	<div id="wrapper">
	
	 <!--共有部分 -->
		<c:import url="../shared/navbar.jsp"></c:import>

		<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">邮件箱</h1>
                    
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                         <form action="upload" method="post"  role="form" class="toup" id="from" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-9">
                                	<c:if test="${mById.id>0}">
                               			<input type="hidden" name="id" value="${mById.id}">
                               		</c:if>
                                  	<input type="hidden" name="employee.id" value="${loginUser.id}">
                               		<input type="hidden" name="status" value="0">
                               	    <input type="hidden" name="isSent" value="0">                                 		
                                     	<div class="form-group">
                                          <label id="addname"><i class="fa fa-user-circle" aria-hidden="true"></i> 收件人：</label>
                                          <!--<c:if test="${mById.employee.name!=null}">
                                          	<span class='addressee'><input type='checkbox' checked='checked' value="${mById.employee.id}" style="display: none;" name='listReceiversid'/><input type='checkbox' checked='checked' value="${mById.employee.name}" name='listReceivers'/><label>${mById.employee.name}</label></span>
                                          </c:if> -->  
                                          <input class="form-control" id="receivers" readonly="readonly" name="receivers" value="${mById.receivers}">
                                          <%-- <c:if test="${mById.receivers!=null}">
                                          	<span class='addressee'>
                                          	<input type='checkbox' checked='checked' value="${mById.employee.id}" style="display: none;" name='listReceiversid'/>
                                          	<input type='checkbox' checked='checked' value="${mById.receivers}" name='listReceivers'/><label>${mById.receivers}</label>
                                          	</span>
                                          </c:if> --%>
                         
                                          <p></p>
                                      </div>
                                      <div class="form-group">
                                          <label><i class="fa fa-tags" aria-hidden="true"></i> 标题</label>
                                          <input class="form-control" name="title" value="${mById.title}">
                                          <p></p>
                                      </div>
                                      <div class="form-group">
                                          <label><i class="fa fa-bars" aria-hidden="true"></i> 内容</label>
                                          <textarea id="content" name="content" class="ckeditor form-control">${mById.content}</textarea>
                                      </div>
                                      <div class="form-group">
                                          <label>附件</label>
									     <input type="hidden" name="name" value="">
									     <input type="file" name="file" value="" >                         
					            	  </div>
							               <!--
							            <div class="form-group">
							               <label>附件</label>
							                  <input type="hidden" name="name" value="">
						                    <input id="file-4" class="file" type="file" multiple data-preview-file-type="any" data-upload-url="#">
						                </div>
						                <hr>
						      			
                						 <c:forEach var="s" items="${mById.attachments}">
                                          			<input class="form-control"  value="${s.name}">
                                         </c:forEach> -->
                                        <div class="dataTables_length" id="dataTables-example_length">
                                            <label>重要程度
                                                <p></p>
                                                <select name="level" aria-controls="dataTables-example" class="form-control input-sm">
                                                    <c:if test="${mById.level==1}">
                                                    	<option value="1">普通</option>
                                                    </c:if>
                                                    <c:if test="${mById.level==2}">
                                                    	<option value="2">重要</option>
                                                    </c:if>
                                                    <c:if test="${mById.level==3}">
                                                    	<option value="3">紧急</option>
                                                    </c:if>
                                                    <option value="1">普通</option>
                                 					<option value="2">重要</option>
                                                    <option value="3">紧急</option>                   
                                                </select>
                                            </label>
                                        </div>
										<div class="divbuttom">
                                 			<p class="cssbuttom">
                                 				
		                                 			 <button type="button" class="btn btn-default" id="btn">存草稿</button>
		                                        	 <button type="button" class="btn btn-default" id="but" >提交</button>
	                                        	
                                 			</p>
                                 		</div>
                                    <!-- 
                                    <div class="form-group">
                                            <label>附件</label>
                                            <form action="test_upload" method="post" enctype="multipart/form-data">  
											     <input type="hidden" name="name" value="hhh">
											     <input type="file" name="file" value="" >
											     <input type="submit" value="上传">  
											 </form>  
                                        </div>
                                      -->
                                </div>
                         		
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-3">
                                   <div class="content">
									    <!-- .list以下（包含.list）以下为本插件内容，需要的同学可复制里面部分即可。 -->
									    <div class="list">
									        <ul>
									        	<c:forEach var="c" items="${departments}">
										            <li>
										                <p class="title"><a href="employee?did${c.id}"></a>${c.name}</p>
											            <ul class='list-se' id="ztreeid">
											                <p class="title">${c.name}</p>
											               	<c:forEach var="r" items="${c.employee}">
											                   	<li date-id="${r.id}"><p>${r.name} <${r.nr}></p></li>
											                </c:forEach>
											             </ul>
										             </li>
									            </c:forEach>
									        </ul>
									    </div>
									</div>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                         </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
		<!-- /#page-wrapper -->
	</div>
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
	
	<script src="${pageContext.request.contextPath}/static/js/style.js"></script>
	<script type="text/javascript">  
	    $(function(){  
	   
	    	
	    });
	    
	</script> 
</body>
<script type="text/javascript">
    jQuery(document).ready(function($)
    {
        $('.list ul li p').clickdown();
        $('.list-se p[class=title]').clickup();
        $('.list>ul>li').ad();
    });
</script>
</html>
