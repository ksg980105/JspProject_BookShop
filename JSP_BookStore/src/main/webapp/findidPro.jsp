<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	
	MemberDao mdao = MemberDao.getInstance();
	String id = mdao.getfindId(name,ssn1,ssn2);

	String msg, url;
	if(id != ""){
		msg = "아이디는 ["+id+"] 입니다.";
		url = "login.jsp";
	}else{
		msg = "일치하는 아이디가 없습니다.";
		url = "findid.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>