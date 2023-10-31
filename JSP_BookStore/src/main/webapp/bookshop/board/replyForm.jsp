<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css" type="text/css">

<%@ include file="../shop/usertop.jsp"%>

<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
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
	request.setCharacterEncoding("UTF-8");

	String ref = request.getParameter("ref");
	String re_step = request.getParameter("re_step");
	String re_level = request.getParameter("re_level");
	String pageNum = request.getParameter("pageNum");

	System.out.println(ref);
	System.out.println(re_step);
	System.out.println(re_level);
%>


<script src="../../js/jquery.js" type="text/javascript"></script>
<script src="script.js" type="text/javascript"></script>

<body>
<b>글쓰기</b>
<div class="background-overlay"></div>
<form method="post" name="replyForm" action="replyProc.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<table class="table" width="450" align="center">
		<tr>
			<td align="right" colspan="2">
				<a href="board_list.jsp">글목록</a>
			</td>
		</tr>
		<tr>
			<td width="150" align="center">이 름</td>
			<td width="300">
				<input type="text" name="writer" maxlength="10" value="홍길동">
			</td>
		</tr>
		<tr>
			<td width="150" align="center">제 목</td>
			<td width="300">
				<input type="text" name="subject" maxlength="50" value="어떤글">
			</td>
		</tr>
		<tr>
			<td width="150" align="center">Email</td>
			<td width="300">
				<input type="text" name="email" maxlength="10" value="aa@xx.com">
			</td>
		</tr>
		<tr>
			<td width="150" align="center">내 용</td>
			<td width="300">
				<textarea name="content" id="ta" rows="15" cols="50">호호호</textarea>
			</td>
		</tr>
		<tr>
			<td width="150" align="center">비밀번호</td>
			<td width="300">
				<input type="password" name="passwd" maxlength="10" value="1234">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="button" value="목록보기" onClick="location.href='board_list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</form>
</body>