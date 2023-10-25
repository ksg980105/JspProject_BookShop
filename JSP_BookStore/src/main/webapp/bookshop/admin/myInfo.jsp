<%@page import="my.member.MemberBean"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admintop.jsp"%>

<%
	String id = request.getParameter("id");

	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.getAllByid(id);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>내 정보</title>
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
		background-image: url("../../images/privacy.jpeg");
		background-repeat: no-repeat;
		background-position: right;
		background-size: 400px;
	}
  </style>
</head>
<body>

<div class="container" style="margin-top: 0;">
  <h2 align="center">내 정보</h2><hr>
  <form class="form-horizontal" action="<%=request.getContextPath()%>/bookstore/member/registerPro.jsp" method="post" onSubmit="return registermem()">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">이름:</label>
      <div class="col-sm-10">
        <input type="text" readonly="readonly" class="form-control" style="width:200px; name="name" value="<%=mb.getName()%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디:</label>
      <div class="col-sm-10">
        <input type="text" readonly="readonly" class="form-control" style="width:200px;" name="id" value="<%=id%>">&nbsp;
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="password">비밀번호:</label>
      <div class="col-sm-10">
        <input type="password" readonly="readonly" class="form-control" style="width:200px;" name="password" value="<%=mb.getPassword()%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="repassword">비밀번호 확인:</label>
      <div class="col-sm-10">
        <input type="password" readonly="readonly" class="form-control" style="width:200px;" name="repassword" value="<%=mb.getPassword()%>">
        &nbsp;
        <span id="pwmessage" ></span>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ssn">주민등록번호:</label>
      <div class="col-sm-10">
        <input type="text" readonly="readonly" class="form-control" maxlength="6" style="width:200px;" name="ssn1" value="<%=mb.getSsn1()%>">&nbsp; _ &nbsp;
        <input type="text" readonly="readonly" class="form-control" maxlength="7" style="width:200px;" name="ssn2" value="<%=mb.getSsn2()%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일:</label>
      <div class="col-sm-10">
        <input type="text" readonly="readonly" class="form-control" style="width:200px;" placeholder="Enter email" name="email">
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
        <input type="text" readonly="readonly" class="form-control" style="width:100px;" name="hp2" value="<%=mb.getHp2()%>">&nbsp; _ &nbsp;
        <input type="text" readonly="readonly" class="form-control" style="width:100px;" name="hp3" value="<%=mb.getHp3()%>">
      </div>
    </div>
    <hr>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="reset" class="btn btn-default" value="돌아가기" onclick="history.go(-1)">&nbsp;
      </div>
    </div>
  </form>
</div>

</body>
</html>