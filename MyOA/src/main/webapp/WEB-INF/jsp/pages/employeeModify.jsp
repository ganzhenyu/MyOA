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
					<h1 class="page-header">员工列表</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form action="employeeModify" method="post">
								<div class="form-group">
									<label>工号：</label> 
									<input type="hidden" name="id" value="${employee==null?0:employee.id}">
									<input type="hidden" name="isManager" value="${employee==null?0:employee.isManager}"> 
									<input value="${employee.nr}" name="nr" class="form-control" placeholder="员工工号由系统制定" readonly="readonly">
								</div>
								<div class="form-group">
									<label>姓名：</label> 
									<input value="${employee.name}" name="name" class="form-control" />
								</div>
								<div class="form-group">
									<label>密码：</label> 
									<input value="${employee.password}" name="password" class="form-control" />
								</div>
								<div class="form-group">
									<label>所属部门：</label> 
									<select name="department.id">
									<c:forEach var="d" items="${departments}">
										<c:if test="${employee.department.id == d.id}">
											<option value="${d.id}" selected="selected">${d.name}</option>
										</c:if>
										<c:if test="${employee.department.id != d.id}">
											<option value="${d.id}">${d.name}</option>
										</c:if>
									</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>性别：</label>
									<div class="radio">
										<label> <input type="radio" name="gender"
											id="optionsRadios1" value="1"
											<c:if test="${employee.status == 1}">checked</c:if>>男
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="gender"
											id="optionsRadios2" value="0"
											<c:if test="${employee.status == 0}">checked</c:if>>女
										</label>
									</div>
								</div>
								<c:if test="${employee!=null}">
									<div class="form-group">
										<label>员工状态：</label>
										<div class="radio">
											<label> <input type="radio" name="status"
												id="optionsRadios1" value="0"
												<c:if test="${employee.status == 0}">checked</c:if>>注销
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="status"
												id="optionsRadios2" value="1"
												<c:if test="${employee.status == 1}">checked</c:if>>可用
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="status"
												id="optionsRadios3" value="2"
												<c:if test="${employee.status == 2}">checked</c:if>>暂停
											</label>
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<button type="button">返回</button>
									<button type="submit">保存</button>
								</div>
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