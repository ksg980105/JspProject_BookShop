<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admintop.jsp"%>

<%
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllcategory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>상품등록</title>
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
  		background-image: url('../../images/background/shop.jpg');
  		background-repeat: no-repeat;
  		background-attachment: fixed;
  		background-size: cover;
  		opacity: 0.2;
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
<div class="container" style="margin-top: 0px;">
  <h2 align="center">상품등록</h2>
  <form class="form-horizontal" action="product_inputPro.jsp" enctype="multipart/form-data" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="pname">상품명:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" name="pname">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pcategory">카테고리 선택:</label>
      <div class="col-sm-10">
      &nbsp;
        <select name="pcategory" style="width:100px; margin-top: 5px;">
      <%
      	if(lists.size()==0){
      %>
      		<option value="">카테고리 없음</option>
      <%
      	}else{
      	for(int i=0; i<lists.size(); i++){
      		CategoryBean cb = lists.get(i);
      %>
        	<option value="<%=cb.getCname()%>"><%=cb.getCname()%></option>
      <%} 
      }%>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="publisher">출판사:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" name="publisher">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pimage">상품 이미지:</label>
      <div class="col-sm-10">
        <input type="file" style="width:200px;" name="pimage">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pqty">갯수:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" name="pqty">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">가격:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width:200px;" name="price">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="summary">줄거리:</label>
      <div class="col-sm-10">
        <textarea rows="5" cols="40" name="summary" style="resize: none;"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="point">포인트:</label>
      <div class="col-sm-10">
      	 <input type="text" class="form-control" style="width:200px;" name="point">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" class="btn btn-default" value="등록하기">&nbsp;
        <a href="<%=request.getContextPath()%>/bookshop/admin/adminmain.jsp">
        	<input type="button" class="btn btn-default" value="취소">
        </a>
      </div>
    </div>
  </form>
</div>

</body>
</html>