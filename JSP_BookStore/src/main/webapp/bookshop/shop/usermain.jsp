<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="usertop.jsp"%>
<%
    CategoryDao cdao = CategoryDao.getInstance();
    ArrayList<CategoryBean> categories = cdao.getAllcategory();
    
    ProductDao pdao = ProductDao.getInstance();
    ArrayList<ProductBean> list = pdao.getAllProduct();
%>
<!DOCTYPE html>
<html>
<head>
  <title>메인</title>
 <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
 <link type="text/css" rel="stylesheet" href="css/style.css"/>
 <style>
	.catpion{
		display: block;
	}
 </style>
</head>
<body>
  <div style="margin: 10px;">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">전체</a></li>
      <%
        for (CategoryBean category : categories) {
      %>
        <li><a href="#<%=category.getCname()%>" data-toggle="tab"><%=category.getCname()%></a></li>
      <%
        }
      %>
    </ul>
    <div class="tab-content">
      <div class="tab-pane fade in active" id="home">
        <div class="container">
          <div class="row">
            <%
              ArrayList<ProductBean> allProducts = pdao.getAllProduct();
              for (ProductBean pb : allProducts) {
                String imgPath = request.getContextPath() + "/bookshop/images/" + pb.getPimage();
            %>
            <div class="col-md-4">
              <div class="thumbnail">
                <a href="product_info.jsp?pname=<%=pb.getPname()%>"><img src="<%=imgPath%>" style="width: 200px; height: 200px;"></a>
                <div class="caption">
                  <p align="center"><%=pb.getPname()%></p>
                  <p align="center"><%=pb.getPrice()%>원</p>
                  <font style="color: red">point: <%=pb.getPoint()%>p</font>
                  <a href=""><img src="img/cartbtn.gif" style="width: 100px;"></a>
                  <a href=""><img src="img/orderbtn.gif" style="width: 100px;"></a>
                </div>
              </div>
            </div>
            <%
              }
            %>
          </div>
        </div>
      </div>
      <%
        for (CategoryBean category : categories) {
          ArrayList<ProductBean> categoryProducts = pdao.getAllProductByCategory(category.getCname());
      %>
      <div class="tab-pane fade" id="<%=category.getCname()%>">
        <div class="container">
          <div class="row">
            <%
              for (ProductBean pb : categoryProducts) {
                String imgPath = request.getContextPath() + "/bookshop/images/" + pb.getPimage();
            %>
            <div class="col-md-4">
              <div class="thumbnail">
                <a href="product_info.jsp?pname=<%=pb.getPname()%>"><img src="<%=imgPath%>" style="width: 200px; height: 200px;"></a>
                <div class="caption">
                  <p align="center"><%=pb.getPname()%></p>
                  <p align="center"><%=pb.getPrice()%>원</p>
                  <font style="color: red">point: <%=pb.getPoint()%>p</font>
                  <a href=""><img src="img/cartbtn.gif" style="width: 100px;"></a>
                  <a href=""><img src="img/orderbtn.gif" style="width: 100px;"></a>
                </div>
              </div>
            </div>
            <%
              }
            %>
          </div>
        </div>
      </div>
      <%
        }
      %>
    </div>
  </div>
</body>
</html>
