<%@page import="java.text.SimpleDateFormat"%>
<%@page import="my.board.BoardBean"%>
<%@page import="my.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../shop/usertop.jsp"%>

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
<div class="background-overlay"></div>
	<b>글내용 보기</b><hr>
	<table border class="table table-hover" align="center">
		<tr>
			<td width="125" align="center">글번호</td>
			<td width="125" align="center"><%=bb.getNum()%></td>
			<td width="125" align="center">조회수</td>
			<td width="125" align="center"><%=bb.getReadcount()%></td>
		</tr>
		<tr>
			<td width="125" align="center">작성자</td>
			<td width="125" align="center"><%=bb.getWriter()%></td>
			<td width="125" align="center">작성일</td>
			<td width="125" align="center"><%=sdf.format(bb.getReg_date())%></td>
		</tr>
		<tr>
			<td width="125" align="center">글제목</td>
			<td colspan="3" align="center" width="375"><%=bb.getSubject()%></td>
		</tr>
		<tr>
			<td width="125" align="center">글내용</td>
			<td colspan="3" align="center"><%=bb.getContent()%></td>
		</tr>
		<tr>
			<td colspan=4 align="center">
				<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=<%=bb.getRef()%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글목록" onClick="location.href='board_list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>	
	</table>
</body>