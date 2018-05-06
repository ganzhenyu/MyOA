<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>基于Bootstrup 3可预览的HTML5文件上传插件</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bost/css/default.css">
<link href="${pageContext.request.contextPath}/static/bost/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	
<!--[if IE]>
	<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>

	<div class="htmleaf-container">
		
		
		<div class="container kv-main" >                    
            <form enctype="multipart/form-data" name="myfile">           
                <div class="form-group">                    
                    <input id="file-1" type="file" multiple class="file" name="myfile" data-overwrite-initial="false" data-min-file-count="1">                   					
                </div>
                <hr>
             
            </form>
        </div>
		
					
	</div>
	
	<script src="${pageContext.request.contextPath}/static/bost/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bost/js/fileinput.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bost/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bost/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
    	
	     $("#file-1").fileinput({
		        uploadUrl: 'addDocument?parentId=${parentId}&creatorId=${creatorId}', // you must set a valid URL here else you will get an error
		        allowedFileExtensions : ['jpg', 'png','gif','txt','docx','pdf'],
		        overwriteInitial: false,
		        maxFileSize: 1000,
		        maxFilesNum: 10,	        
		        //allowedFileTypes: ['image', 'video', 'flash'],
		        slugCallback: function(filename) {
		            return filename.replace('(', '_').replace(']', '_');
		        }
			});
			//文件上传前触发事件

		
		</script>
</body>
</html>