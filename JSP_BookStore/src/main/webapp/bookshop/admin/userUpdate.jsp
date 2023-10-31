<%@page import="my.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admintop.jsp"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
%>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
	body{
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
  		background-image: url('../../images/background/a3.jpg');
  		background-size: 100%;
  		opacity: 0.2;
  		z-index: -1;
  	}
  	.container{
  		z-index: 100;
  		background-color: rgba(255,255,255,0.0);
  		padding: 10px;
  	}
  </style>
</head>
<body>
<div class="background-overlay"></div>
<form method="post" action="userUpdatePro.jsp?no=<%=no%>">
<div class="container">
  <h2 align="center">정보 수정</h2>
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
    		if(mb.getNo()==no){
    %>
    		<tr class="success">
		        <td><%=mb.getNo()%></td>
		        <td><%=mb.getName()%></td>
		        <td><%=mb.getId()%></td>
		        <td>
		        	<input type="text" name="password" size="10" value="<%=mb.getPassword()%>">
		        </td>
		        <td>
		        	<%=mb.getSsn1()%> - <%=mb.getSsn2()%>
		        </td>
		        <td>
					<input type="text" name="email" size="10" value="<%=mb.getEmail()%>">
				</td>
		        <td>
					<input type="text" name="hp1" size="5" value="<%=mb.getHp1()%>"> - 
					<input type="text" name="hp2" size="5" value="<%=mb.getHp2()%>"> -
					<input type="text" name="hp3" size="5" value="<%=mb.getHp3()%>">   
		        </td>
		        <td>
		        	<input type="submit" name="updateuser" value="수정하기">
		        	<a href="<%=request.getContextPath()%>/bookshop/admin/userSelect.jsp">
					  	<input type="button" style="width:50px;height:30px;" value="취소">
					</a>
		        </td>
		      </tr>
    <%
    		}else{
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
        		<input type="button" name="updateuser" value="수정">
        	</a>
        </td>
      </tr>  
      <%	} 
    	}
    }
      %>    
    </tbody>
  </table>

</div>
</form>
</body>
</html>