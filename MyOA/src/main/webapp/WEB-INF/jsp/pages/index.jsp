<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css"
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/indexTab.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
	.eamil{
		 float: right;
		 width: 350px;
		 height: 45px;
		 position: absolute;
         top: 25px;        
       	 right:50px;
		 border: 1px solid  #b4b4b4;
		 padding:7px;
		 border-radius:5px;
		 background-color:#f1f1f1;
	}
	.eamil a{
		text-decoration:underline;
		color: #99e1f1;
	}
	.amimg{
		position: absolute;
         top: 0px;        
       	 right:20px;
	
	}
	.eatime{
		position: absolute;
        top: 10px;        
       	right:270px;
	}
</style>
</head>

<body>

	<div id="wrapper">

		<c:import url="../shared/navbar.jsp"></c:import>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">欢迎使用OA办公管理系统</h1>
					<c:forEach var="c" items="${messagrRe}"> 
						<div class="eatime"><fmt:formatDate value="${c.message.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </div>
					</c:forEach>
					<c:if test="${messagrRe.size()>0}">
						<div class="eamil"><i class="fa fa-user-circle fa-2x" aria-hidden="true"></i> 您有条未读邮件！ 点击<a href="inbox?isread=0&status=0&id=${loginUser.id}"> 查看 </a>更多未读邮件</div>
						<div class="amimg"><i class="fa fa-commenting fa-3x" aria-hidden="true"></i></div>
					</c:if>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="tab-wrapper">

					<ul class="tab-menu">
						<li class="active">收件箱</li>
						<li>未读邮件</li>
						<li>重要邮件</li>
					</ul>

					<div class="tab-content">
						<div>
							<table width="100%"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>标题</th>
										<th>发送人</th>
										<th>发送时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${AllMessage}">
									<tr class="odd gradeX">
										<td>${m.title}</td>
										<td>${m.employee.name}</td>
										<td>${m.sendTime}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
						<div>
							<table width="100%"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>标题</th>
										<th>发送人</th>
										<th>发送时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nrm" items="${NotReadMessage}">
									<tr class="odd gradeX">
										<td>${nrm.title}</td>
										<td>${nrm.employee.name}</td>
										<td>${nrm.sendTime}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
						<div>
							<table width="100%"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>标题</th>
										<th>发送人</th>
										<th>发送时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="lm" items="${LevelMessage}">
									<tr class="odd gradeX">
										<td>${lm.title}</td>
										<td>${lm.employee.name}</td>
										<td>${lm.sendTime}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
					</div>
					<!-- //tab-content -->
				</div>
				<!-- //tab-wrapper -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8" style="width: 40%; padding-left: 0px;">
					<div class="tab-wrapper">
						<ul class="tab-menu">
							<li class="active">公告</li>
						</ul>

						<div class="tab-content">
							<div>
								<table width="100%"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>主题</th>
											<th>发布日期</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="a" items="${announcements}">
										<tr class="odd gradeX">
											<td>${a.title}</td>
											<td><fmt:formatDate value="${a.approveTime}" type="both"/></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /.table-responsive -->
							</div>
						</div>
						<!-- //tab-content -->
					</div>
					<!-- //tab-wrapper -->
				</div>
				<div class="col-lg-4" style="width: 60%; padding-right: 0px;">
					<div class="tab-wrapper">
						<ul class="tab-menu">
							<li class="active">今天日程</li>
							<li>个人日程</li>
						</ul>

						<div class="tab-content">
							<div>
								<table width="100%"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>标题</th>
											<th>开始时间</th>
											<th>结束时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="at" items="${activityToday}">
										<tr class="odd gradeX">
											<td>${at.title}</td>
											<td><fmt:formatDate value="${at.startTime}" type="both"/></td>
											<td><fmt:formatDate value="${at.endTime}" type="both"/></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /.table-responsive -->
							</div>
							<div>
								<table width="100%"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>标题</th>
											<th>开始时间</th>
											<th>结束时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="af" items="${activityFuture}">
										<tr class="odd gradeX">
											<td>${af.title}</td>
											<td><fmt:formatDate value="${af.startTime}" type="both"/></td>
											<td><fmt:formatDate value="${af.endTime}" type="both"/></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /.table-responsive -->
							</div>
						</div>
						<!-- //tab-content -->
					</div>
					<!-- //tab-wrapper -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.min.js"></script>

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
	<script
		src="${pageContext.request.contextPath}/static/dist/js/index.js"></script>
</body>

</html>
