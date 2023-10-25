<%@page import="my.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admintop.jsp"%>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2 align="center">전체 사용자 조회</h2>
  <table class="table">
    <thead>
      <tr class="active">
        <th>번호</th>
        <th>이름</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>주민등록번호</th>
        <th>이메일</th>
        <th>핸드폰번호</th>
        <th>관리</th>
      </tr>
    </thead>
    <tbody>
    <%
    	MemberDao mdao = MemberDao.getInstance();
    	ArrayList<MemberBean> lists = mdao.getAlluser();
    	
    	for(int i=0; i<lists.size(); i++){
    		MemberBean mb = lists.get(i);
    		if(mb.getId().equals("admin")){
    %>
    		<tr class="danger">
		        <td><%=mb.getNo()%></td>
		        <td><%=mb.getName()%></td>
		        <td><%=mb.getId()%></td>
		        <td><%=mb.getPassword()%></td>
		        <td>
		        	<%=mb.getSsn1()%> - <%=mb.getSsn2()%>
		        </td>
		        <td><%=mb.getEmail()%></td>
		        <td>
					<%=mb.getHp1()%> - <%=mb.getHp2()%> - <%=mb.getHp3()%>        
		        </td>
		        <td>
		        	<a href="userUpdate.jsp?no=<%=mb.getNo()%>">
		        		<input type="button" name="updateuser" value="수정">
		        	</a>
		        	<a href="userDeletePro.jsp?no=<%=mb.getNo()%>">
		        		<input type="button" name="updateuser" value="삭제">
		        	</a>
		        </td>
		      </tr>  
    <%			
    		}else{
    %>
      <tr class="info">
        <td><%=mb.getNo()%></td>
        <td><%=mb.getName()%></td>
        <td><%=mb.getId()%></td>
        <td><%=mb.getPassword()%></td>
        <td>
        	<%=mb.getSsn1()%> - <%=mb.getSsn2()%>
        </td>
        <td><%=mb.getEmail()%></td>
        <td>
			<%=mb.getHp1()%> - <%=mb.getHp2()%> - <%=mb.getHp3()%>        
        </td>
        <td>
        	<a href="userUpdate.jsp?no=<%=mb.getNo()%>">
        		<input type="button" value="수정">
        	</a>
        	<a href="userDeletePro.jsp?no=<%=mb.getNo()%>">
        		<input type="button" value="삭제">
        	</a>
        </td>
      </tr>  
      <%	} 
    	}
      %>    
    </tbody>
  </table>
</div>

</body>
</html>