<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String publisher = request.getParameter("publisher");
	String pqty = request.getParameter("pqty");
	String price = request.getParameter("price");
	String point = request.getParameter("point");
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.updateProduct(pnum, publisher, pqty, price, point);
	
	if (cnt != -1){
%>
		<script type="text/javascript">
			alert('수정 성공!');
			location.href="product_list.jsp";
		</script>
<%
	}
%>

