<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  	body{
  		position: static;
  		width: 100%;
  		height: 100%;
  		margin: 0;
  		padding: 0;
  	}
  	.background-overlay{
  		position: absolute;
  		top: 0;
  		right: 0;
  		bottom: 0;
  		left: 0;
  		background-image: url('images/background/bb.jpg');
  		background-repeat: no-repeat;
  		background-attachment: fixed;
  		background-size: cover;
  		opacity: 0.3;
  		z-index: -1;
  	}
  	.container{
  		position: static;
  		z-index: 100;
  		background-color: rgba(255,255,255,0.0);
  		padding: 10px;
  	}
  	
  </style>
 </head>
<body>

<div class="background-overlay"></div>

<div class="container" align="center">
  <h2>로그인</h2>
  <br>
  <form action="loginPro.jsp" method="post">
    <div class="form-group">
      <label for="email">ID</label>
      <input type="text" class="form-control" style="width:200px;" placeholder="Enter id" name="id">
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" style="width:200px;" placeholder="Enter password" name="password">
    </div>
    <button type="submit" style="width:200px;" class="btn btn-default">로그인</button><br><br>
    <input type="button" value="회원 가입" style="width:200px;" class="btn btn-default" onClick="location.href='<%=request.getContextPath()%>/bookshop/member/register.jsp'"><br><br>
    <input type="button" value="아이디찾기" style="width:200px;" class="btn btn-default" onClick="location.href='findid.jsp'"><br><br>
    <input type="button" value="비밀번호찾기" style="width:200px;" class="btn btn-default" onClick="location.href='findpw.jsp'">
  </form>
</div>

</body>
</html>

