<%@page import="java.text.SimpleDateFormat"%>
<%@page import="my.board.BoardBean"%>
<%@page import="my.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../shop/usertop.jsp"%>

<script src="../../js/jquery.js" type="text/javascript"></script>
<script src="script.js" type="text/javascript"></script>

<style>
	body{
		text-align: center;
	}
	body{
	  	position: static;
	  	width: 100%;
	  	height: 100%;
	  	margin: 0;
	  	padding: 0;
	}
	.background-overlay{
	  	position: absolute;
	  	top: 0;
	  	right: 0;
	  	bottom: 0;
	  	left: 0;
	  	background-image: url('images/44.jpeg');
	  	background-repeat: no-repeat;
	  	background-attachment: fixed;
	  	background-size: cover;
	  	opacity: 0.3;
	  	z-index: -1;
	}
	.container{
	  	position: static;
	  	z-index: 100;
	  	background-color: rgba(255,255,255,0.0);
	  	padding: 10px;
	}
</style>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getArticle(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

<body>
<b>글수정</b>
<div class="background-overlay"></div>
<form method="post" name="updateForm" action="updateProc.jsp?num=<%=num%>&pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<table border="1" width="450"align="center">
		<tr>
			<td width="150" align="center">이 름</td>
			<td width="300" align="left">
				<input type="text" name="writer" maxlength="10" value="<%=bb.getWriter()%>">
			</td>
		</tr>
		<tr>
			<td width="150" align="center">제 목</td>
			<td width="300" align="left">
				<input type="text" name="subject" maxlength="50" value="<%=bb.getSubject()%>">
			</td>
		</tr>
		<tr>
			<td width="150" align="center">Email</td>
			<td width="300" align="left">
				<input type="text" name="email" maxlength="10" value="<%=bb.getEmail()%>">
			</td>
		</tr>
		<tr>
			<td width="150" align="center">내 용</td>
			<td width="300">
				<textarea name="content" id="ta" rows="15" cols="50"><%=bb.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<td width="150" align="center">비밀번호</td>
			<td width="300" align="left">
				<input type="password" name="passwd" maxlength="10">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="button" value="목록보기" onClick="location.href='board_list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</form>
</body>