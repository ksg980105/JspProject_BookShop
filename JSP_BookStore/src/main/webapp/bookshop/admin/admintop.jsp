<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memid = (String)session.getAttribute("memid");
%>
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
      <a class="navbar-brand" href="<%=request.getContextPath()%>/bookshop/admin/adminmain.jsp">BookStore</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="userSelect.jsp">사용자관리</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
   	  <li class="active"><a href="myInfo.jsp?id=<%=memid%>"><%=memid%></a></li>
      <li><a href="<%=request.getContextPath()%>/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
	<div class="jumbotron" style="height: 150px;">
		<img src="<%=request.getContextPath()%>/images/booklogo.png" style="width: 200px; height: 100px;"> 
	</div>
</nav>

</body>
</html>
