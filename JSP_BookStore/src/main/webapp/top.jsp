<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>BookStore</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
	.jumbotron {
		text-align: center;
	}
  </style>
</head>
<body>
<nav class="navbar" style="margin-bottom: 0;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp">BookStore</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<%=request.getContextPath()%>/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
	<div class="jumbotron" style="height: 150px;">
		<img src="<%=request.getContextPath()%>/images/booklogo.png" style="width: 200px; height: 100px;"> 
	</div>
</nav>

</body>
</html>
