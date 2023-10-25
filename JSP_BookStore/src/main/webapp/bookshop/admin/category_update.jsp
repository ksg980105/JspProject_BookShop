<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>

<%@ include file="admintop.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllcategory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>카테고리 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript">
  function updatecategory(){
		if($('input[name="cname"]').val()==""){
			alert('수정할 아이디를 입력하세요.');
			$('input[name="cname"]').focus();
			return false;
		}
	}
  </script>
</head>
<body>

<form method="post" action="category_updatePro.jsp?cnum=<%=cnum%>" onSubmit="return updatecategory()">
<div class="container">
  <h2 align="center">카테고리 관리</h2>
  <table class="table" style="margin-left: 350px; margin-top: 50px; width: 500px;">
      <tr>
        <th>카테고리명</th>
        <th>관리</th>
      </tr>
      <%
    	for(int i=0; i<lists.size(); i++){
    		CategoryBean cb = lists.get(i);
    		if(cnum == cb.getCnum()){
      %>
    		<tr>
    	        <td>
					<input type="text" name="cname" size="6">
				</td>
    	        <td>
    				<input type="submit" value="수정하기" onClick="return updatecategory()">
    				<input type="reset" value="취소" onclick="location.href='category_list.jsp'">
    			</td>
    	      </tr>
      
      <%
    		}else{
      %>
      <tr>
        <td><%=cb.getCname()%></td>
        <td>
			<a href="category_update.jsp?cnum=<%=cb.getCnum()%>"><input type="button" value="수정"></a>
			<input type="reset" value="취소" onclick="location.href='category_list.jsp'">
		</td>
      </tr>
      <%} 
      }
      %>
  </table>
</div>
</form>
</body>
</html>
