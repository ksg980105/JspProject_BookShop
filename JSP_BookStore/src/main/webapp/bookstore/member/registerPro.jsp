<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mb" class="my.member.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>

<%
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.insertMember(mb);
	
	String msg,url;
	
	if(cnt != 0){
		msg = "가입 성공";
		url = request.getContextPath()+"/login.jsp";
	}else{
		msg = "가입 실패";
		url = request.getContextPath()+"/register.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>