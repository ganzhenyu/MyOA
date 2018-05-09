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
                <a class="navbar-brand" href="index">首页</a>
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
                        <li><a href="out"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
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
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> &nbsp;组织结构管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<li>
                                    <a href="departmentIndex">部门管理</a>
                                </li>
                                <li>
                                    <a href="employeeRetrieve">员工检索</a>
                                </li>
								<li>
                                    <a href="employeeModify">添加员工</a>
                                </li>
				
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                       <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>&nbsp; 系统管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">角色管理</a>
                                </li>
                                <li>
                                    <a href="login.html">为用户分配角色</a>
                                </li>
                                  <li>
                                    <a href="login.html">为角色分配权限</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>&nbsp; 公告发布管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/ann_audit">公告审核</a>
                                </li>
								<li>
                                    <a href="${pageContext.request.contextPath}/ann_add">公告申请</a>
                                </li>
								<li>
                                    <a href="${pageContext.request.contextPath}/ann_compile">公告拟稿</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="#"><i class="fa fa-envelope fa-fw"></i>&nbsp; 信息管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">新建信息</a>
                                </li>
                                <li>
                                    <a href="buttons.html">草稿列表</a>
                                </li>
                                <li>
                                    <a href="notifications.html">接受信息</a>
                                </li>
                                <li>
                                    <a href="typography.html">发送列表</a>
                                </li>
                             
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>&nbsp; 日程管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                         		<li>
                                    <a href="${pageContext.request.contextPath}/meeting">定制会议</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/activity">我的日程</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						  
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>&nbsp; 文件管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                               
                                <li>
                                    <a href="#">文件导航</a>
                                </li>
                          
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
						
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
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
		};
		</script>
