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
			alert('카테고리명을 입력하세요.');
			$('input[name="cname"]').focus();
			return false;
		}
  }
  </script>
  <style>
	.col-md-4 {
		display: flex;
	}
	.col-sm-10{
		display: flex;
	}
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
  		background-image: url('../../images/background/a1.jpg');
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
<form method="post" action="category_updatePro.jsp?cnum=<%=cnum%>" onSubmit="return updatecategory()">
<div class="background-overlay"></div>
<div class="container">
  <h2 align="center">카테고리 수정</h2>
  <table class="table" style="margin-left: 350px; margin-top: 50px; width: 300px;">
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
