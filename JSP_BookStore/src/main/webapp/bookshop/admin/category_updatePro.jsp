<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String cname = request.getParameter("cname");
	
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.updateCategory(cname, cnum);
	
	if(cnt != -1){
%>
	<script type="text/javascript">
		alert('수정 성공!');
		location.href="category_list.jsp";
	</script>
<%
	}
%>