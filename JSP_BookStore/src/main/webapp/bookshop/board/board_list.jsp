<%@page import="my.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="my.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../shop/usertop.jsp"%>

<style>
	body{
		text-align: center;
	}
	table{
		margin: auto;
		text-align: left;
	}
	body{
	  	position: static;
	  	width: 100%;
	  	height: 70%;
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
	BoardDao bdao = BoardDao.getInstance();

	int pageSize = 10; //한페이지에 보일 개수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	int count = bdao.getArticleCount();
	int number = count - (currentPage-1) * pageSize;
	
	ArrayList<BoardBean> articleLists = bdao.getArticles(startRow, endRow);
	
%>
<body>
<div class="background-overlay"></div>
<hr>
	<b>글 목록(전체 글:<%=count%>)</b>
	<table border="0" style="float: right; margin-right: 10px; margin-bottom: 10px;">
		<tr>
			<td>
				<a href="writeForm.jsp">
					<button type="button" class="btn btn-success">글쓰기</button>
				</a>
			</td>
		</tr>
	</table>
	<%
		if(count == 0){
	%>
	<table class="table table-hover">
		<tr>
			<td colspan="6">
				게시판에 글이 없습니다.
			</td>
		</tr>
	</table>
	<%} else{ %>
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
		<%
			for(int i=0; i<articleLists.size(); i++){
				BoardBean bb = articleLists.get(i);
		%>
		<tr>
			<td><%=number--%></td>	
			<td>
				<%
					int wid = 0; //폭설정
					if(bb.getRe_level()>0){	//답글종류
						wid = bb.getRe_level() * 20;
				%>
						<img src="images/level.gif" width="<%=wid%>">
						<img src="images/re.gif" width="25px;">
				<%
					}else{ //원글

					}
				%>
				<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>">
					<%=bb.getSubject()%>				
				</a>
			<%
				if(bb.getReadcount()>=10){
			%>
				<img src="images/hot.gif" width="25px;">
			<%
				}
			%>
			</td>
			<td>
				<%=bb.getWriter()%>
			</td>
			<td>
				<%=sdf.format(bb.getReg_date())%>
			</td>
			<td>
				<%=bb.getReadcount()%>
			</td>
			<td>
				<%=bb.getIp()%>
			</td>
		</tr>
		<%}%>
	</table>
	<%} %>
	<!-- 페이지 설정 -->
		<%
			if(count > 0 ){
				int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
							// pageSize:10 =>14:2 20:2 전체 페이지 개수
						
				int pageBlock = 3; // 보일수있는 최대 페이지 개수
				int startPage = ((currentPage-1)/pageBlock * pageBlock)+1;
				int endPage = startPage + pageBlock - 1;

				if(endPage > pageCount){	//9>7 endpage가 pagecount보다 크면 
					endPage = pageCount;	//endpage를 7로 만든다.
				}
				
				if(startPage>3){
			%>
					<a href="board_list.jsp?pageNum=<%=startPage-3%>">[이전]</a>
			<%		
				}
				for(int i=startPage; i<=endPage; i++){
			%>
					<a href="board_list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
			<%					
				}
				if(endPage < pageCount){
			%>
					<a href="board_list.jsp?pageNum=<%=startPage+3%>">[다음]</a>
			<%		
				}
			}
		%>
</body>