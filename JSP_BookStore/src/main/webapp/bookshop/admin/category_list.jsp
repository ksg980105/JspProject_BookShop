<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admintop.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllcategory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>카테고리 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
	.col-md-4 {
		display: flex;
	}
	.col-sm-10{
		display: flex;
	}
	body{
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
  		background-image: url('../../images/background/a1.jpg');
  		background-size: 100%;
  		opacity: 0.2;
  		z-index: -1;
  	}
  	.container{
  		z-index: 100;
  		background-color: rgba(255,255,255,0.0);
  		padding: 10px;
  	}
</style>
</head>
<body>
<div class="background-overlay"></div>
<div class="container">
  <h2 align="center">카테고리 관리</h2>
  <table class="table" style="margin-left: 350px; margin-top: 50px; width: 300px;">
      <tr>
        <th>카테고리명</th>
        <th>관리</th>
      </tr>
      <%
    	for(int i=0; i<lists.size(); i++){
    		CategoryBean cb = lists.get(i);
      %>
      <tr>
        <td><%=cb.getCname()%></td>
        <td>
			<a href="category_update.jsp?cnum=<%=cb.getCnum()%>"><input type="button" value="수정"></a>
			<a href="category_deletePro.jsp?cnum=<%=cb.getCnum()%>"><input type="button" value="삭제"></a>
		</td>
      </tr>
      <%} %>
  </table>
</div>

</body>
</html>
