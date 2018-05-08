<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${pageContext.request.contextPath}/static/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/static/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/static/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="wrapper">

		<c:import url="../shared/navbar.jsp"></c:import>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">员工检索</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form action="employeeRetrieve" method="post">
								<div class="form-group">
									<label>工号：</label> 
									<input value="${employee.nr}" name="nr" class="form-control" style="width: 10%;display: inline;">
									<label>姓名：</label> 
									<input value="${employee.name}" name="name" class="form-control" style="width: 10%;display: inline;"/>
									<label>所属部门：</label> 
									<select name="department.id">
										<option value="-1">请选择</option>
									<c:forEach var="d" items="${departments}">
										<c:if test="${employee.department.id == d.id}">
											<option value="${d.id}" selected="selected">${d.name}</option>
										</c:if>
										<c:if test="${employee.department.id != d.id}">
											<option value="${d.id}">${d.name}</option>
										</c:if>
									</c:forEach>
									</select>
									<label>性别：</label>
									<select name="gender">
										<option value="-1">请选择</option>
										<c:choose>
											<c:when test="${employee.gender == 1}">
												<option value="1" selected="selected">男</option>
											</c:when>
											<c:otherwise>
												<option value="1">男</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${employee.gender == 0}">
												<option value="0" selected="selected">女</option>
											</c:when>
											<c:otherwise>
												<option value="0">女</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<div class="form-group">
									<button type="submit">查询</button>
								</div>
							</form>
							<table width="100%"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>工号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>所在部门</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${employees}">
										<tr class="odd gradeX">
											<td>${e.nr}</td>
											<td><a href="employeeModify?id=${e.id}">${e.name}</a></td>
											<td><c:if test="${e.gender==0}">
                                        		女
                                        	</c:if> <c:if test="${e.gender==1}">
                                        		男
                                        	</c:if></td>
                                        	<td>${e.department.name}</td>
                                        	<td><c:if test="${e.status==0}">
                                        		注销
                                        	</c:if> <c:if test="${e.status==1}">
                                        		可用
                                        	</c:if> <c:if test="${e.status==2}">
                                        		暂停
                                        	</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
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

	<!-- DataTables JavaScript -->
	<script
		src="${pageContext.request.contextPath}/static/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="${pageContext.request.contextPath}/static/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>
</html>