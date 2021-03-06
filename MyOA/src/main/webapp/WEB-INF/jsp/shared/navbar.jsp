<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/pages/index">首页</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	<li class="dropdown">
            		<label>使用者：${sessionScope.loginUser.name}</label>
            	</li>
                <li class="dropdown">
                    <label>当前时间：</label><div id="show" style="display: inline;"></div>
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    	<li id="information" date-id="${sessionScope.loginUser.id}"><i class="fa fa-gear fa-fw"></i> 个人信息
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/pages/out"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                        <li><a href="${pageContext.request.contextPath}/pages/index"><i class="fa fa-sign-out fa-fw"></i> 主页</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->


            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="搜索">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        
                     <c:if test="${r11!=null||r12!=null}">
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> &nbsp;组织管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                           
                           		<c:if test="${r11!=null}">
                            	<li> 
                                    <a href="${pageContext.request.contextPath}/pages/departmentIndex">部门管理</a>
                                </li>
                              	</c:if>
                              	
                              	<c:if test="${r12!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/employeeRetrieve">员工检索</a>
                                </li>
								<li>
                                    <a href="${pageContext.request.contextPath}/pages/employeeModify">添加员工</a>
                                </li>
								</c:if>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                       </c:if>
                       <c:if test="${r61!=null||r62!=null}">
                       <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>&nbsp; 系统管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <c:if test="${r61!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/role">角色管理</a>
                                </li>
                             </c:if>
                             <c:if test="${r62!=null}">
                                  <li>
                                    <a href="${pageContext.request.contextPath}/pages/roleManage">为角色分配权限</a>
                                  </li>
                             </c:if> 
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </c:if>
                         <c:if test="${r41!=null||r42!=null}">
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>&nbsp; 公告发布管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                               <c:if test="${r43!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/ann_audit">公告审核</a>
                                </li>
                                </c:if>
                                 <c:if test="${r42!=null}">
								<li>
                                    <a href="${pageContext.request.contextPath}/ann_add">公告申请</a>
                                </li>
                               
								<li>
                                    <a href="${pageContext.request.contextPath}/ann_compile">公告拟稿</a>
                                </li>
                                 </c:if>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </c:if>
                        <c:if test="${r21!=null||r22!=null||r23!=null}">
						<li>
                            <a href="#"><i class="fa fa-envelope fa-fw"></i>&nbsp; 信息管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                              	<c:if test="${r22!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/newEmail">新建信息</a>
                                </li>
                                 <li>
                                    <a href="${pageContext.request.contextPath}/pages/dispatch?id=${loginUser.id}">发送列表</a>
                                </li>
                               
                                </c:if>
                                <c:if test="${r23!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/manuscript?id=${loginUser.id}">草稿列表</a>
                                </li>
                                 </c:if>
                                 <c:if test="${r21!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/inbox?id=${loginUser.id}">接受信息</a>
                                    <input type="hidden" name="id" value="${loginUser.id}">
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/retrieve?id=${loginUser.id}">回收列表</a>
                                </li>
                               </c:if>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                         </c:if>
                          <c:if test="${r31!=null||r32!=null}">
                         <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>&nbsp; 日程管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <c:if test="${r21!=null}">
                         		<li>
                                    <a href="${pageContext.request.contextPath}/meeting">定制会议</a>
                                </li>
                             </c:if>  
                              <c:if test="${r31!=null}"> 
                                <li>
                                    <a href="${pageContext.request.contextPath}/activity">我的日程</a>
                                </li>
                                </c:if> 
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						  </c:if>
						 <c:if test="${r51!=null}"> 
                        <li id="l">
                            <a href="#" id="json0"><i class="fa fa-files-o fa-fw"></i>&nbsp; 文件管理<span class="fa arrow"></span></a>
                             <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/pages/indextest">文件导航</a>
                                </li>
                                
                                    <div id="jsTree"></div>
                                </ul>                          
                            <!-- /.nav-second-level -->
                        </li>
                        </c:if>
						
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
            
		<!-- /.modal -->
        </nav>
        
        <script type="text/javascript">
		window.onload = function() {
			var show = document.getElementById("show");
			setInterval(function() {
				var time = new Date(); // 程序计时的月从0开始取值后+1   
				var m = time.getMonth() + 1;
				var t = time.getFullYear() + "-" + m + "-" + time.getDate()
						+ " " + time.getHours() + ":" + time.getMinutes() + ":"
						+ time.getSeconds();
				show.innerHTML = t;
			}, 1000);
			
			$("#information").click(function () {
				$.ajax({
		            url: '../ajax/fetchEmployee',
		            data : {
		                "id":$(this).attr("date-id")
		            },
		            dataType: 'json',
		            type: 'get',
		            success: function (json) {
		                $("#loadEmployeeNr").val(json.nr);
		                $("#loadEmployeename").val(json.name);
		                if(json.gender==0){
		                	$("#loadEmployeeGender").val("女");
		                }else{
		                	$("#loadEmployeeGender").val("男");
		                }
		                $("#loadEmployeeDepartment").val(json.department.name);
		                if(json.isManager==1){
			                $("#loadEmployeeManage").val("部门主管");
		                }else{
		                	$("#loadEmployeeManage").val("员工");
		                }
		                $("#informationDiv").modal("show");//显示弹出框
		            }
		        });
			});
		};
		</script>
