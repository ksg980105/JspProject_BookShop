<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	
	MemberDao mdao = MemberDao.getInstance();
	
	String pw = mdao.getfindPw(id,name,ssn1,ssn2);
	
	String msg, url;
	if(pw != ""){
		msg = "비밀번호는 ["+pw+"] 입니다.";
		url = "login.jsp";
	}else{
		msg = "일치하는 정보가 없습니다.";
		url = "findpw.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>