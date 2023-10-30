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

<script src="../../js/jquery.js" type="text/javascript"></script>
<script src="script.js" type="text/javascript"></script>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>


<body>
<div class="background-overlay"></div>
	<b>글삭제</b><hr>
	<form method="post" action="deleteProc.jsp" onsubmit="return writeSave()">
	<table border="1" style="width: 300px;">
		<tr height="40px;" align="center">
			<td>비밀번호를 입력해 주세요</td>
		</tr>
		<tr height="40px;" align="center">
			<td>비밀번호 : <input type="password" name="passwd" size="12">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
			</td>
		</tr>
		<tr height="40px;">
			<td align="center">
				<input type="submit" value="글삭제">
				<input type="button" value="글목록" onClick="location.href='board_list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
	</form>
</body>