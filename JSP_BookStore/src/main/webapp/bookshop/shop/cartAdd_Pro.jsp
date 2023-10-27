<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="my.shop.cart.CartBean" scope="session"/>

<%
	request.setCharacterEncoding("UTF-8");

	String pname = request.getParameter("pname"); //상품 이름
	int pqty = Integer.parseInt(request.getParameter("pqty")); //주문수량
	ProductDao pdao = ProductDao.getInstance();
	
	mallCart.addProduct(pname,pqty); //ex)10번상품 3개 주문한다.
	response.sendRedirect("cartlist.jsp");
%>