<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admintop.jsp"%>

<head>
  <title>상품 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<div class="container">
  <h2 align="center">상품 관리</h2>
  <table class="table">
    <thead>
      <tr class="active">
        <th>이름</th>
        <th>카테고리</th>
        <th>출판사</th>
        <th>갯수</th>
        <th>가격</th>
        <th>포인트</th>
        <th>관리</th>
      </tr>
    </thead>
    <tbody>
    <%
    	ProductDao pdao = ProductDao.getInstance();
    	ArrayList<ProductBean> lists = pdao.getAllProduct();
    	for(int i=0; i<lists.size(); i++){
    		ProductBean pb = lists.get(i);
    %>
      <tr class="info">
        <td><%=pb.getPname()%></td>
        <td><%=pb.getPcategory()%></td>
        <td><%=pb.getPublisher()%></td>
        <td><%=pb.getPqty()%></td>
        <td><%=pb.getPrice()%></td>
        <td><%=pb.getPoint()%></td>
        <td>
        	<a href="productUpdate.jsp?pnum=<%=pb.getPnum()%>">
        		<input type="button" value="수정">
        	</a>
        	<a href="productDeletePro.jsp?pnum=<%=pb.getPnum()%>">
        		<input type="button" value="삭제">
        	</a>
        </td>
      </tr>
      <%} %>
    </tbody>
  </table>
</div>

</body>
</html>