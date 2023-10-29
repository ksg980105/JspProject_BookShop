<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="mallCart" class="my.shop.cart.CartBean" scope="session"/>

<%
	String pnum = request.getParameter("pnum");
	String pqty = request.getParameter("pqty");
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getAllProductByPnum(Integer.parseInt(pnum));
	
	if(pb.getPqty() < Integer.parseInt(pqty)){
%>

	<script type="text/javascript">
		alert('주문 수량 초과');
		location.href="cartlist.jsp";
	</script>
<%
		return; //주문수량 초과시 넘어가지 못하도록
	}
	
	mallCart.updatecart(pnum, pqty);
%>
	<script type="text/javascript">
		alert('주문수량 수정 성공');
		location.href="cartlist.jsp";
	</script>