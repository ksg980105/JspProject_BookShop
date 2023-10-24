<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../top.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원가입</title>
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
	.container{
		background-image: url("../../images/man.jpg");
		background-repeat: no-repeat;
		background-position: right;
		background-size: 350px;
	}
  </style>
</head>
<body>

<div class="container">
  <h2 align="center">회원가입</h2><br><hr>
  <form class="form-horizontal" action="<%=request.getContextPath()%>/bookstore/member/registerPro.jsp" method="post" onSubmit="return registermem()">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">이름:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px; opacity: 1;" placeholder="Enter name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" placeholder="Enter id" name="id">&nbsp;
        <button type="button" class="btn btn-default" onClick="return duplicate()">중복체크</button>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="password">비밀번호:</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" style="width:200px;" placeholder="Enter password" name="password">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="repassword">비밀번호 확인:</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" style="width:200px;" placeholder="Enter repassword" name="repassword" onkeyup="repasswordCheck()">
        &nbsp;
        <span id="pwmessage" ></span>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ssn">주민등록번호:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" placeholder="Enter ssn1" name="ssn1">&nbsp; _ &nbsp;
        <input type="text" class="form-control" style="width:200px;" placeholder="Enter ssn2" name="ssn2">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" placeholder="Enter email" name="email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ssn">핸드폰 번호:</label>
      <div class="col-sm-10">
      	<select name="hp1" style="width:100px;">
			<option value="010">010
			<option value="011">011
			<option value="012">012
			<option value="013">013
		</select>
		&nbsp; _ &nbsp;
        <input type="text" class="form-control" style="width:100px;" placeholder="Enter hp2" name="hp2">&nbsp; _ &nbsp;
        <input type="text" class="form-control" style="width:100px;" placeholder="Enter hp3" name="hp3">
      </div>
    </div>
    <br><hr>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" class="btn btn-default" value="가입하기">&nbsp;
        <a href="<%=request.getContextPath()%>/login.jsp">
        	<input type="button" class="btn btn-default" value="취소">
        </a>
      </div>
    </div>
  </form>
</div>

</body>
</html>
