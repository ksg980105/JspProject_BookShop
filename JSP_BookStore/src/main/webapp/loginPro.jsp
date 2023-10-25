<%@page import="my.member.MemberBean"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.getAllByIdandPw(id,password);
	
	String msg,url;
	if(mb != null){ //계정정보 있을때
		if(mb.getId().equals("admin")){	//관리자 계정
			msg = mb.getName()+"관리자님 환영합니다.";
			url = "bookshop/admin/adminmain.jsp";
		}else{	//사용자 계정
			msg = mb.getName()+"님 환영합니다.";
			url = "bookshop/shop/usermain.jsp";
		}
		session.setAttribute("memid", mb.getId());
		session.setAttribute("memno", mb.getNo());
		
	}else{	//계정정보 없을때
		msg = "아이디나 비밀번호가 틀렸습니다.";
		url = request.getContextPath()+"/login.jsp";
		
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>