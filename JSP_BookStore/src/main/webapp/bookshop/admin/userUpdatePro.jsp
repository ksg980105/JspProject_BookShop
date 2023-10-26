<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	
	MemberDao mdao = MemberDao.getInstance();
	
	int cnt = mdao.updateUser(no,password,email,hp1,hp2,hp3);
	
	String msg, url;
	if(cnt != -1){
		msg = "수정 성공!";
		url = request.getContextPath()+"/bookshop/admin/userSelect.jsp";
	}else{
		msg = "수정 실패";
		url = "userUpdate.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>