<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="my.shop.cart.CartBean" scope="session"/>
<%
	String pnum = request.getParameter("pnum");

	mallCart.deleteProduct(pnum);
%>

<script type="text/javascript">
	alert('삭제 성공');
	location.href="cartlist.jsp";
</script>