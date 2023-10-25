<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));

	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.deleteUser(no);
	
	if(cnt != -1){
%>
		<script type="text/javascript">
			alert('삭제성공!');
			location.href="userSelect.jsp";
		</script>
<%
	}
%>