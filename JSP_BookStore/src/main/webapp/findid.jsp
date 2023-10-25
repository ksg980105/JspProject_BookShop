<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../top.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../../script.js" type="text/javascript"></script>
  <style>
	.col-sm-10{
		display: flex;
	}
  </style>
</head>
<body>

<div class="container" style="margin-top: 0;">
  <h2 align="center">아이디 찾기</h2><hr>
  <form class="form-horizontal" action="findidPro.jsp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">이름:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px; opacity: 1;" placeholder="Enter name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ssn">주민등록번호:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" placeholder="Enter ssn1" name="ssn1">&nbsp; _ &nbsp;
        <input type="text" class="form-control" style="width:200px;" placeholder="Enter ssn2" name="ssn2">
      </div>
    </div>
    <hr>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" class="btn btn-default" value="아이디 찾기">&nbsp;
        <a href="<%=request.getContextPath()%>/login.jsp">
        	<input type="button" class="btn btn-default" value="취소">
        </a>
      </div>
    </div>
  </form>
</div>

</body>
</html>
