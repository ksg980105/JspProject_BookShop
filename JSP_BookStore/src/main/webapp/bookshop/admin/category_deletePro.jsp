<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.deleteCategory(cnum);
	
	if(cnt != -1){
%>
	<script type="text/javascript">
		alert('삭제 성공!');
		location.href="category_list.jsp";
	</script>
<%
	}
%>