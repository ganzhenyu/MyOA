<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="ture" /></title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/static/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/static/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- fullcalendar -->
<link
	href='${pageContext.request.contextPath}/static/vendor/fullcalendar/fullcalendar.min.css'
	rel='stylesheet' />
<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">


<!-- js -->
<script
	src='${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js'></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap-datetimepicker.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"
	type="text/javascript"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script
	src="${pageContext.request.contextPath}/static/vendor/raphael/raphael.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/vendor/morrisjs/morris.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script
	src="${pageContext.request.contextPath}/static/dist/js/sb-admin-2.js"></script>

<!-- fullcalendar -->
<script
	src='${pageContext.request.contextPath}/static/vendor/fullcalendar/lib/moment.min.js'></script>
<script
	src='${pageContext.request.contextPath}/static/vendor/fullcalendar/fullcalendar.min.js'></script>

<!-- layer -->
<script
	src='${pageContext.request.contextPath}/static/vendor/layer/layer.js'></script>
<!-- ckeditor -->
<script
	src='${pageContext.request.contextPath}/static/vendor/ckeditor/ckeditor.js'></script>
<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath}/static/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/vendor/datatables-responsive/dataTables.responsive.js"></script>
<body>
	<div id="wrapper">
		<tiles:insertAttribute name="navbar" />
		<tiles:insertAttribute name="main" />
	</div>
</body>
</html>