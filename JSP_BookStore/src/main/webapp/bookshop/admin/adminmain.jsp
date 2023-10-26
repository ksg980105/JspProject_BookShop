<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="my.shop.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="admintop.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllcategory();
	
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> list = pdao.getAllProduct();
%>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  		background-image: url('../../images/background/shop.jpg');
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
		<h2>상품</h2>
		<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" href="#home">전체</a></li>
			<%
    	for(int i=0; i<lists.size(); i++){
    		CategoryBean cb = lists.get(i);
    %>
			<li><a data-toggle="pill" href="#<%=cb.getCname()%>"><%=cb.getCname()%></a></li>
			<%} %>
		</ul>

		<div class="tab-content">
			<br>
			<div id="home" class="tab-pane fade">
			
			</div>

			<div id="소설" class="tab-pane fade">
			</div>
		</div>

	</div>
	<div class="container">
		<div class="row">
			<%
		      int count = 0;
		      for(int i = 0; i < list.size(); i++) {
		        count++;
		        ProductBean pb = list.get(i);
		        String imgPath = request.getContextPath() + "/bookshop/images/" + pb.getPimage();
		    %>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="/w3images/lights.jpg" target="_blank"> <img
						src="<%=imgPath%>" alt="Lights"
						style="width: 200px; height: 200px;">
					</a>
					<div class="caption">
						<p><%=pb.getPname() %></p>
					</div>
				</div>
			</div>
			<%
        // 3개의 제품을 표시한 후 줄을 바꿉니다.
        if (count % 3 == 0) {
    %>
		</div>
		<div class="row">
			<%
        }
      }
    %>
		</div>
	</div>

</body>
</html>