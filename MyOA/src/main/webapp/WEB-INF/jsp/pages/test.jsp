<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/static/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/themes/default/style.min.css" />
 <link href="${pageContext.request.contextPath}/static/JSAjaxFileUploader/JQuery.JSAjaxFileUploader.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/static/css/stream-v1.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
<style type="text/css">
body{
	position: relative;
}
        #ll{
            position: absolute;
            width: 250px;
        }
        body>ul{
        position: absolute;
        
	        z-index: 100000!important;
	    }
        .collapse.in{
            z-index: -50;
        }
        #neibu{ 
          height:100%;
          width:100%;    	
          text-align: center;        	
        }
        #neibu h1{
        	
        	font-color:#ffff;
        	height: 500px;
        	line-height:500px;        	
        	background-color: 
        }
         #neibu div{
         padding-top:150px;
         }
         #neibu li{
         	list-style-type:none;        	
        	text-align: center;  
        	text-hight:150px;
        	font-size:18px;
        	float:left;
        	width:185px!important;
        	higth:50px!important;  
        	margin-top:30px;
        	overflow:hidden!important;    	
        }
         #im{
         	margin-top:200px;
         	margin: 0 auto;
         	display:block;
         	
         }
        #xx{
          overflow:hidden; 
        }
       #sp{
       	higth:70px;  
       	overflow:hidden;    	
       }
       #spn{
       margin-top:10px;
       display:block;
       }
     
       #sou{
       	width:100%;
       	height: 100%;
       	padding-top: 180px;
       	padding-left: 250px;
       }
       #sousuo{
       	width:550px;
       	
       }
        #tb table{
            border-collapse: collapse;              
            width: 600px;         
        }

        #tb td {
            text-align: center;
            padding-top: 5px;
            width: 25%;
        }

        #tb tr {
            background-color: #E3E3E3;
            line-height: 35px;
        }

        .showImg {
            width: 50px;
            height: 50px;
        }

    </style>
</head>

<body>

    <div id="wrapper">

     <c:import url="../shared/navbar.jsp"></c:import>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Tasks!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Orders!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Support Tickets!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Bar Chart Example
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Date</th>
                                                    <th>Time</th>
                                                    <th>Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>3326</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:29 PM</td>
                                                    <td>$321.33</td>
                                                </tr>
                                                <tr>
                                                    <td>3325</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:20 PM</td>
                                                    <td>$234.34</td>
                                                </tr>
                                                <tr>
                                                    <td>3324</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:03 PM</td>
                                                    <td>$724.17</td>
                                                </tr>
                                                <tr>
                                                    <td>3323</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:00 PM</td>
                                                    <td>$23.71</td>
                                                </tr>
                                                <tr>
                                                    <td>3322</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:49 PM</td>
                                                    <td>$8345.23</td>
                                                </tr>
                                                <tr>
                                                    <td>3321</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:23 PM</td>
                                                    <td>$245.12</td>
                                                </tr>
                                                <tr>
                                                    <td>3320</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:15 PM</td>
                                                    <td>$5663.54</td>
                                                </tr>
                                                <tr>
                                                    <td>3319</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:13 PM</td>
                                                    <td>$943.45</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-8">
                                    <div id="morris-bar-chart"></div>
                                </div>
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-badge"><i class="fa fa-check"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                            <p><small class="text-muted"><i class="fa fa-clock-o"></i> 11 hours ago via Twitter</small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero laboriosam dolor perspiciatis omnis exercitationem. Beatae, officia pariatur? Est cum veniam excepturi. Maiores praesentium, porro voluptas suscipit facere rem dicta, debitis.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem dolorem quibusdam, tenetur commodi provident cumque magni voluptatem libero, quis rerum. Fugiat esse debitis optio, tempore. Animi officiis alias, officia repellendus.</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium maiores odit qui est tempora eos, nostrum provident explicabo dignissimos debitis vel! Adipisci eius voluptates, ad aut recusandae minus eaque facere.</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge danger"><i class="fa fa-bomb"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus numquam facilis enim eaque, tenetur nam id qui vel velit similique nihil iure molestias aliquam, voluptatem totam quaerat, magni commodi quisquam.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates est quaerat asperiores sapiente, eligendi, nihil. Itaque quos, alias sapiente rerum quas odit! Aperiam officiis quidem delectus libero, omnis ut debitis!</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge info"><i class="fa fa-save"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis minus modi quam ipsum alias at est molestiae excepturi delectus nesciunt, quibusdam debitis amet, beatae consequuntur impedit nulla qui! Laborum, atque.</p>
                                            <hr>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                                                    <i class="fa fa-gear"></i> <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Action</a>
                                                    </li>
                                                    <li><a href="#">Another action</a>
                                                    </li>
                                                    <li><a href="#">Something else here</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">Separated link</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi fuga odio quibusdam. Iure expedita, incidunt unde quis nam! Quod, quisquam. Officia quam qui adipisci quas consequuntur nostrum sequi. Consequuntur, commodi.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge success"><i class="fa fa-graduation-cap"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat tempore officia voluptas debitis consectetur culpa amet, accusamus dolorum fugiat, animi dicta aperiam, enim incidunt quisquam maxime neque eaque.</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications Panel
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-money fa-fw"></i> Payment Received
                                    <span class="pull-right text-muted small"><em>Yesterday</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                            <a href="#" class="btn btn-default btn-block">View Details</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i> Chat
                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-refresh fa-fw"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-check-circle fa-fw"></i> Available
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-times fa-fw"></i> Busy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-clock-o fa-fw"></i> Away
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-sign-out fa-fw"></i> Sign Out
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 12 mins ago
                                            </small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 13 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 14 mins ago</small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 15 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                        <div class="panel-footer">
                            <div class="input-group">
                                <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="btn-chat">
                                        Send
                                    </button>
                                </span>
                            </div>
                        </div>
                        <!-- /.panel-footer -->
                    </div>
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/static/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/vendor/morrisjs/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
  
    <script src="${pageContext.request.contextPath}/static/dist/js/sb-admin-2.js"></script>
    <script src="${pageContext.request.contextPath}/static/dist/jstree.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/ios-parallax.js"></script> 
    <script t src="${pageContext.request.contextPath}/static/js/pdfobject.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/static/vendor/jquery.cookie-1.4.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/stream-v1.js"></script>
	

    <script>
        $(function() {         	
        	 var nodess=new Array();
        	 var inx=0;
        	 var mm;
        	 
        	 //点击后展开树节点
             $('#json0').click(function() {
            	 var htm="<div id='sou'>"+            	
            	  "<h3>搜索功能</h3> "+           	                  	
            	  "<input type='text' class='form-control' placeholder='输入关键词' aria-describedby='sizing-addon1' id='sousuo'> "+            	
            	  "<button class='btn btn-default' type='button'>搜 索</button> "+            	            	               	            	 
            	  "</div>"           	           	 
            	  $("#page-wrapper").html(htm)        	 
            	var node=this.id;
            	var ss=node.charAt(node.length-1);
              //加载树节点
             $("#jsTree").jstree({                		
                       "core" : {  
                           "themes" : {  
                               "responsive": false  
                           },   
                           // so that create works  
                           "check_callback" : true,  
                           //绑定树节点数据                          
                           'data' : function (obj, callback) {                          	   
                               var jsonstr="[]";  
                               var jsonarray = eval('('+jsonstr+')'); 
                            //加载根部节点，每次加载两层节点
                           	$.getJSON("dm-lode?id=0",function(jsonfromList){
                        		var arrays= jsonfromList; 
                        		//绑定第一次节点
                                for(var i=0 ; i<arrays.length; i++){                                      
                                    var arr = {  
                                            "id":"json"+arrays[i].id,  
                                            "parent":ss==0?"#":node,  
                                            "text":arrays[i].name,
                                            "type":arrays[i].type,
                                            "path":arrays[i].fileUrl,
                                    }                                 
                                    jsonarray.push(arr);
                                    //绑定第二层节点
                                    for(var s=0 ; s<arrays[i].documents.length; s++){
                                    	var arrs = {  
                                                "id":"json"+arrays[i].documents[s].id,  
                                                "parent":"json"+arrays[i].id,  
                                                "text":arrays[i].documents[s].name, 
                                                "type":arrays[i].documents[s].type,
                                                "path":arrays[i].documents[s].fileUrl,
                                        }  
                                    	jsonarray.push(arrs);
                                    }                                   
                                }                         
                                callback.call(this, jsonarray); 
                        	});                                                          
                           }  
                       }, 
                       //自定义树形图图片样式
                       "types" : {
                           "FOLDER": {

                               "icon" : "${pageContext.request.contextPath}/static/images/FOLDER.png"
                             },
                           "docx": {

                               "icon" : "${pageContext.request.contextPath}/static/images/docx.png"

                             },
                           "txt": {
                               "icon" : "${pageContext.request.contextPath}/static/images/txt.png"
                               },
                          "jpg": {
                               "icon" : "${pageContext.request.contextPath}/static/images/jpg.png"
                               }
                       },
                       //启用自定义功能，自定义菜单，右键菜单
                       "plugins" : [ "types","contextmenu"]
                       //给树每个节点绑定一个点击事件，并把点击对象传过去
                   }).bind("select_node.jstree", function(event, data) {  
                	   var inst = data.instance;                 	
                       var selectedNode = inst.get_node(data.selected); 
                       var selectid=selectedNode.id;
                       //点击过后异步加载下两层方法
                       loadConfig(inst, selectedNode);                                                                 
                   }).bind("rename_node.jstree",function(event,data){  //重命名绑定事件
                	   console.log(data.node.id);               	   
                   		var xxs=data.node.id;
                	   var kk;
                       if(xxs.length>5){
                      	 var cha=xxs.length-4;
                      	 kk=xxs.substring(4,4+cha);   
                       	}else{
                    	  kk=xxs.charAt(xx.length-1);   
                       	} 
                	 	$.getJSON("modifier?id="+kk+"&name="+data.text+"",function(jsonfromList){
                	 		
                	 	})                	                  	   
                   })                                                 
           });               
             function loadConfig(inst, selectedNode){  
                 var temp = selectedNode.text;                 
                 inst.open_node(selectedNode); 
                 //获取节点ID，更具ID截取子字符串取得异步加载所需参数
                 var xx=selectedNode.id;               
                 if(xx.length>5){
                	 var cha=xx.length-4;
                	 mm=xx.substring(4,4+cha);   
                 }else{
                	 mm=xx.charAt(xx.length-1);   
                 } 
                 //加载子节点方法，并把子节点加载进树
                 $.getJSON("dm-lode?id="+mm+"",function(data){
                	      var arrays=data;
                          for(var i=0 ; i<arrays.length; i++){                                          
                              for(var s=0 ; s<arrays[i].documents.length; s++){
                            	//填充第三层树节点
                              	var arrs = {  
                                          "id":"json"+arrays[i].documents[s].id,  
                                          "parent":"json"+arrays[i].id,  
                                          "text":arrays[i].documents[s].name,  
                                          "type":arrays[i].documents[s].type,
                                          "path":arrays[i].documents[s].fileUrl,
                                  }
                              	inst.create_node(document.getElementById("json"+arrays[i].id),arrs,"last"); 
                              }                            
                          }
                 });
                 	//加载文件信息异步方法
                   	$.getJSON("me-lode?id="+mm+"",function(data){
              		var arrays= data;
              		//清空页面数据
              		$("#page-wrapper").empty();   
              		//获取对象以及其子集合
              		$.getJSON("me-lode?id="+mm +"",function(mapJakcson){	
              			//判断文件类型，文件夹
              			 if(selectedNode.type=="FOLDER"){ 
              				console.log(mapJakcson.documents);
              				 if(mapJakcson.documents.length==0){
              					 //文件夹为空显示
              					$("#page-wrapper").html("<div id='neibu'><h1>该文件夹为空</h1><div>") 
              				 }else{
              					 //有文件夹则显示所有文件夹
              					var ht="<div id='neibu'><ul>"
              					for(var m=0;m<mapJakcson.documents.length;m++){                    						
              						ht+="<li hight='70px' id='lili"+mapJakcson.documents[m].id+"' class='libian' ><img src='${pageContext.request.contextPath}/static/images/"+mapJakcson.documents[m].type+"2.png' /><span id='sp'>"+mapJakcson.documents[m].name+"<span> </li>";
              					}
              					ht+="</ul></div>";
              					$("#page-wrapper").html(ht);
              				 } 
              				 //显示图片文件并且提供下载
                   		}else if(mapJakcson.type=="jpg"){
                   			$("#page-wrapper").html("<div id='neibu'><div><img src='${pageContext.request.contextPath}/static/"+mapJakcson.fileUrl+"' id='im' style='display: inline-block; vertical-align: middle;' /> <span id='spn'><a href='${pageContext.request.contextPath}/static/"+mapJakcson.fileUrl+"' download=''><button>下载</button></a></span></div></div>")                     		                			
                   		}else if(mapJakcson.type=="docx"){
                   			var is = layer.load();
                   			$.getJSON("readDocx?path="+mapJakcson.fileUrl+"",function(json){
                   			 	layer.close(is);
                   				PDFObject.embed("${pageContext.request.contextPath}/static/"+json.hrefs+"","#page-wrapper",{height: "720px"});
                   						
                   			})
                   		  
                   		}else if(mapJakcson.type=="txt"){
                   			var ii = layer.load();
                   			$.getJSON("readTxt?path="+mapJakcson.fileUrl+"",function(json){
                   				layer.close(ii);
                   				PDFObject.embed("${pageContext.request.contextPath}/static/"+json.hrefs+"","#page-wrapper",{height: "720px"});                   						
                   			})
                   		}else{
                   			//其他文件类型可以继续扩展
                   			$("#page-wrapper").html("<div id='neibu'><h1>该文件暂不支持预览</h1><a href='${pageContext.request.contextPath}/static/"+mapJakcson.fileUrl+"' download=''><button>下载</button></a></div>");
                   		}                   			          			
          			})                  		              		              		              		
              	})              	
              		
              }
             
             //绑定右键菜单
             $.jstree.defaults.contextmenu = {
                     select_node:true,//设置当前节点是否为选中状态 true表示选中状态
                     show_at_node:true,//设置右键菜单是否和节点对齐 true表示对齐                     
                     items : function (o,cb) { // Could be an object directly                    	
                    	 if(o.type!="FOLDER"){                              		 
                    		return {
                    			"rname" : {     	                                   
                                    "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                    "label"                : "重命名",  //Create这一项的名称 可自定义
                                    "icon":"${pageContext.request.contextPath}/static/images/rename.png",                                  
                                    "action"            : function (data) {  //点击Create这一项触发该方法
                                    	 var inst = $.jstree.reference(data.reference),
                                         obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性                                                                          
                                         inst.edit(data.reference,obj.val);                                                                                                                     
                                    }
                                },
                                "delete":{                           	 
                                     "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                     "label"                : "删除",  //Create这一项的名称 可自定义
                                     "icon":"${pageContext.request.contextPath}/static/images/delete.png",                                  
                                     "action"            : function (data) {  //点击Create这一项触发该方法
                                         var inst = $.jstree.reference(data.reference),
                                             obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性       
                                         var xx=obj.id;  
                                         var ll;
                                         if(xx.length>5){
                                        	 var cha=xx.length-4;
                                        	 ll=xx.substring(4,4+cha);   
                                         }else{
                                        	 ll=xx.charAt(xx.length-1);   
                                         }
                                         var msg = "您真的确定要删除吗？删除后不可恢复！"; 
                                         if (confirm(msg)==true){ 
                                        		$.getJSON("delete?id="+ll+"",function(jsonfromList){
                                             		inst.delete_node (obj);
                                             	})
                                         }else{ 
                                         	 return false; 
                                         } 
                                     }
                               },
                               "down":{                             	  
                                    "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                    "label"                : function(){if(o.type=="jpg"){return "查看";}else{return "下载";}},  //Create这一项的名称 可自定义
                                    "icon":"${pageContext.request.contextPath}/static/images/down.png",                                  
                                    "action"            : function (data) {  //点击Create这一项触发该方法
                                        var inst = $.jstree.reference(data.reference),
                                            obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性
                                                                     
                                        location.href="${pageContext.request.contextPath}/static/"+obj.original.path+"";                                                                        
                                    }
                              }
                               
                    		}
                    	 }else{
                    		 return {
                    			 "cre":{                               	
                                      "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                      "label"                : "新建",  //Create这一项的名称 可自定义
                                      "icon":"${pageContext.request.contextPath}/static/images/add.png",                                  
                                      "action"            : function (data) {  //点击Create这一项触发该方法     
                                      var inst = $.jstree.reference(data.reference),
                                      obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性 
                                      var xx=obj.id;  
                                      var ll;
                                      if(xx.length>5){
                                     	 var cha=xx.length-4;
                                     	 ll=xx.substring(4,4+cha);   
                                      }else{
                                     	 ll=xx.charAt(xx.length-1);   
                                      }                                     
                                  	  $.getJSON("addfile?parentId="+parseInt(ll)+"&type="+obj.type+"",function(json){
                                  	  inst.create_node(obj, {"id":"json"+json.id+"","parent":""+obj.id+"","type":"FOLDER"}, "last", function (new_node) {
                                             setTimeout(function () { inst.edit(new_node); },0);//新加节点后触发 重命名方法,即 创建节点完成后可以立即重命名节点
                                             $("#json"+obj.parent+"").click();
                                  	  });
                                  	 
                                  	})                                                                                                                                                                                                                                                                                
                                   }
                                },
                                "rname" : {     	                                 
                                    "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                    "label"                : "重命名",  //Create这一项的名称 可自定义
                                    "icon":"${pageContext.request.contextPath}/static/images/rename.png",                                  
                                    "action"            : function (data) {  //点击Create这一项触发该方法、                                    
                                        var inst = $.jstree.reference(data.reference),
                                        obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性                                                                          
                                        inst.edit(data.reference,obj.val);                                        
                                    }
                                },
                                "loads" : {     	 
                                    
                                    "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                    "label"                : "上传",  //Create这一项的名称 可自定义
                                    "icon":"${pageContext.request.contextPath}/static/images/rename.png",                                  
                                    "action"            : function (data) {  //点击Create这一项触发该方法
                                        var inst = $.jstree.reference(data.reference),
                                        obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性                                  
                                        var xx=obj.id;  
                                        var ll;
                                        if(xx.length>5){
                                       	 var cha=xx.length-4;
                                       	 ll=xx.substring(4,4+cha);   
                                        }else{
                                       	 ll=xx.charAt(xx.length-1);   
                                        }
                                    	$("#page-wrapper").html(" <div id='i_select_files'>"+
                                    			"</div>"+

                                    	"<div id='i_stream_files_queue'>"+
                                    	"</div>"+
                                    	"<button onclick='javascript:_t.upload();''>开始上传</button>|<button onclick='javascript:_t.stop();'>停止上传</button>|<button onclick='javascript:_t.cancel();'>取消</button>"+
                                    	"|<button onclick='javascript:_t.disable();'>禁用文件选择</button>|<button onclick='javascript:_t.enable();'>启用文件选择</button>"+
                                    	"<br>"+
                                    	"Messages:"+
                                    	"<div id='i_stream_message_container' class='stream-main-upload-box' style='overflow: auto;height:200px;'>"+
                                    	"</div>");   
                                    	var config = {
                                    			browseFileId : "i_select_files", /** 选择文件的ID, 默认: i_select_files */
                                    			browseFileBtn : "<div>请选择文件</div>", /** 显示选择文件的样式, 默认: `<div>请选择文件</div>` */
                                    			dragAndDropArea: "i_select_files", /** 拖拽上传区域，Id（字符类型"i_select_files"）或者DOM对象, 默认: `i_select_files` */
                                    			dragAndDropTips: "<span>把文件(文件夹)拖拽到这里</span>", /** 拖拽提示, 默认: `<span>把文件(文件夹)拖拽到这里</span>` */
                                    			filesQueueId : "i_stream_files_queue", /** 文件上传容器的ID, 默认: i_stream_files_queue */
                                    			filesQueueHeight : 200, /** 文件上传容器的高度（px）, 默认: 450 */
                                    			messagerId : "i_stream_message_container", /** 消息显示容器的ID, 默认: i_stream_message_container */
                                    			multipleFiles: true /** 多个文件一起上传, 默认: false */
                                    		    uploadURL : "/upload" /** HTML5上传的URI */
                                    		};
                                    		var _t = new Stream(config);

                                    		
                                    	
                                    }
                                },
                                "delete":{
                               	  "separator_before"    : false,//Create这一项在分割线之前
                                     "separator_after"    : false,//Create这一项在分割线之后
                                     "_disabled"            : false, //false表示 create 这一项可以使用; true表示不能使用
                                     "label"                : "删除",  //Create这一项的名称 可自定义
                                     "icon":"${pageContext.request.contextPath}/static/images/delete.png",                                  
                                     "action"            : function (data) {  //点击Create这一项触发该方法
                                      var inst = $.jstree.reference(data.reference),
                                      obj = inst.get_node(data.reference);//获得当前节点,可以拿到当前节点所有属性
                                                                   
                                         var xx=obj.id;  
                                         var ll;
                                         if(xx.length>5){
                                        	 var cha=xx.length-4;
                                        	 ll=xx.substring(4,4+cha);   
                                         }else{
                                        	 ll=xx.charAt(xx.length-1);   
                                         }
                                         var msg = "您真的确定要删除吗？删除后不可恢复！"; 
                                         if (confirm(msg)==true){ 
                                        		$.getJSON("delete?id="+ll+"",function(jsonfromList){
                                             		inst.delete_node (obj);
                                             	})
                                         }else{ 
                                         	 return false; 
                                         } 
                                     
                                         
                                     }
                               },
                               
                    		 } 
                    	 }
                     	cb();
                        }};
             
             
            
        });
      
        
      
     
        
    </script>
</body>
	
</html>
