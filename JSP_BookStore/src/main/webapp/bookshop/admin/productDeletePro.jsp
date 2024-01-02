<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));

	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.deleteProduct(pnum);
	
	if(cnt != -1){
%>
		<script type="text/javascript">
			alert('삭제 성공!');
			location.href="product_list.jsp";
		</script>
<%
	}
%>