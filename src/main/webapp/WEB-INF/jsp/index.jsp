<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Task Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Planning your life 2.0</a>
			<div class="navbar-collapse collapse">
				<!-- <ul class="nav navbar-nav">
					<li><a href="new-task">New Task</a></li>
					<li><a href="all-tasks">All Tasks</a></li>
				</ul> -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="all-tasks">All Tasks</a></li>
					<a href="new-task"><button class="btn btn-default navbar-btn">New Task</button></a>
   		 		</ul>
			</div>
		</div>		
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Task Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">									
									<tr><th>Task Name: ${task.name}</th>
										<th>							
											<a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a>
											<a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-remove"></span></a>
										</th>
									</tr>
									<tr><th>Task Description: ${task.description}</th></tr>						
																					
									<tr><th>Urgency: ${task.urgency}</th></tr>
									<tr></tr>
									<tr></tr>
									<br>			
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${task.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description" value="${task.description}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Urgency</label>
						<div class="col-md-7">
							<div class="col-sm-1">VERY LOW (0)</div>
							<input type="radio" class="col-sm-1" name="urgency" value="0"/>
							
							<div class="col-sm-1">LOW (1)</div>
							<input type="radio" class="col-sm-1" name="urgency" value="1"/>
							
							<div class="col-sm-1">MEDIUM (2)</div>
							<input type="radio" class="col-sm-1" name="urgency" value="2"/>
							
							<div class="col-sm-1">HIGH (3)</div>
							<input type="radio" class="col-sm-1" name="urgency" value="3" checked/>
							
						</div>				
					</div>		
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>