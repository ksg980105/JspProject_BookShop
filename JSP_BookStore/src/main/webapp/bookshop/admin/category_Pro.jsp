<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cname = request.getParameter("cname");	
%>

	<jsp:useBean id="cb" class="my.shop.CategoryBean"/>
	<jsp:setProperty property="*" name="cb"/>

<%
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.insertCategory(cb);
	
	if(cnt != -1){
%>
		<script type="text/javascript">
			alert('추가 완료!');
			location.href="<%=request.getContextPath()%>/bookshop/admin/adminmain.jsp";
		</script>
<%
	}
%>