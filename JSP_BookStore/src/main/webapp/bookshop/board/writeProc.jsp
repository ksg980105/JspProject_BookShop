<%@page import="my.board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bb" class="my.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	BoardDao bdao = BoardDao.getInstance();

	bb.setIp(request.getRemoteAddr());
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	int cnt = bdao.insertArticle(bb);

	if(cnt != -1){
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("writeForm.jsp");
	}
%>