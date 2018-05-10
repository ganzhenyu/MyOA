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
<title>MyOA主页</title>
<!-- jQuery -->

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
<style type="text/css">
.option {
	margin: 0 auto;
	width: auto;
	height: 730px;
	margin-bottom: 50px;
	padding-left: 50px;
	padding-top: 50px;
}

.option .options {
	padding-bottom: 30px;
}

.edit-panel legend {
	width: 92%;
}

fieldset {
	width: auto;
}

fieldset div {
	line-height: 30px;
}

fieldset .div {
	margin-left: 100px;
}

.panel-head {
	margin-left: 50px;
}

.update {
	width: 100px;
	height: 35px;
	border: none;
	background-color: #6CB33E;
	border-radius: 5px;
	color: #fff;
}

.delete {
	width: 100px;
	height: 35px;
	border: none;
	background-color: red;
	border-radius: 5px;
	color: #fff;
}

.update:hover, .delete:hover {
	background-color: #EA36E5;
}

.edit-button {
	width: 100px;
	height: 35px;
	border: none;
	background-color: blue;
	border-radius: 5px;
	color: #fff;
}
</style>
</head>

<body>

	<div id="wrapper">
 
		<c:import url="../shared/navbar.jsp"></c:import>
		<div id="page-wrapper">
		<div class="main-content-inner">

			<div class="row" style="margin-top: 5px;">
				<div class="col-md-1"></div>
				<div class="col-md-9">
					<h2>
						<i class="fa fa-address-card-o" aria-hidden="true">角色权限管理</i>
					</h2>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row" style="margin-top: 25px;">
				<div class="col-md-1"></div>
				<div class="col-md-9">
					<button class="btn btn-default" data-toggle="modal"
						data-target="#myModal">新增角色</button>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row" style="margin-top: 25px;">
				<div class="col-md-1"></div>
				<div class="col-md-9" id="Role">
					<table class="table" style="text-align: center;">
						<tbody>
							<tr style="font-size: 18px; font-weight: bold;">
								<td style="width: 10%;">ID</td>
								<td style="width: 20%;">角色</td>
								<td style="width: 30%;">权限</td>
								<td style="width: 40%;">操作</td>
							</tr>
						</tbody>
						<c:forEach var="r" items="${role}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${r.name}</td>
								<td>
									<button type="button" class="edit-button" data-id="${r.id}"
										data-toggle="modal" data-target=".bs-example-modal-lg">权限设置</button>
								</td>
								<td>
									<button class="update" data-toggle="modal"
										data-target="#myModal">修&nbsp;&nbsp;改</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="hidden" value="${r.id}" />
									<button class="delete" data-id="${r.id}">删&nbsp;&nbsp;除</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>

			<!-- Large modal -->


			<div class="modal fade bs-example-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">

						<form method="post" action="addFunction" id="listform">
							<input type="hidden" name="id" id="fid" />
							<div class="panel admin-panel">
								<div class="panel-head">
									<h2>
										<i class="fa fa-american-sign-language-interpreting"
											aria-hidden="true">&nbsp;角色权限</i>
									</h2>
								</div>
								<div class="option">

									<c:forEach var="c" items="${function}">
										<div class="options">
											<fieldset class="edit-panel">
												<legend>${c.name}</legend>
												<c:forEach var="v" items="${functioNot}">
													<c:if test="${c.id == v.parentId}">
														<div class="div">
															<div style="width: 210px; float: left;">
														
																	<input id="${v.id}" type="checkbox" name="checked" class="checkedId"
																		value="${v.id}" />&nbsp;${v.name}
					                      
															</div>
														</div>
													</c:if>
												</c:forEach>
											</fieldset>
										</div>
									</c:forEach>

									<div class="button-group" style="margin-left: 650px;">
										<button id="Submit" type="submit" class="btn btn-default">保存</button>
										<button class="btn btn-default" data-dismiss="modal">关闭</button>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>

			<!-- Modal 添加新角色/修改角色 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<form action="updateRole" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Role Management</h4>
							</div>
							<div class="modal-body">
								<label>角色名称：<input id="RoleTitle" type="text" value=""
									name="name" /></label>
							</div>
							<div class="modal-footer">
								<input type="hidden" name="id" value="" id="RoleId" />
								<button type="submit" class="btn btn-primary">确认</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
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

	
	
	<script>
		var ids = [];
		$(function() {

			//删除角色
			$("#Role").delegate(".delete", "click", function() {
				var id = $(this).attr("data-id");
				//询问是否删除
				if (confirm("确定删除该角色吗？")) {
					$.ajax({
						url : "deleteRole",
						type : "GET",
						data : {
							"id" : id
						},
						dataType : "json",
						success : function(data) {
							if (data.ok) {								
								window.location.href = "role";
							} else {
								alert("删除失败");
							}
						}
					});

				}

			});

			//根据Id查询
			$("#Role").delegate(".update", "click", function() {
				var title = $(this).parent().prev().prev().text();
				var roleId = $(this).next().val();
				$("#RoleTitle").val(title);
				$("#RoleId").val(roleId);
			});

			//根据Id查询相关权限
			$("#Role").delegate(
					".edit-button",
					"click",
					function() {
						
						var id = $(this).attr("data-id");
						
						$.ajax({
							url : "roleFunction",
							type : "GET",
							data : {
								"id" : id
							},
							dataType : "json",
							success : function(json) {
								$("#fid").val(id);
								$(".checkedId").prop("checked",false);
								//把查到的Id 赋值
								var ids = json;
								for (var m = 0;m<ids.length; m++) {																	
									$("#"+ids[m]+"").prop("checked",true);
									
								}

							}
						});

					});

		});
	</script>
</body>

</html>






































