<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="my.shop.cart.CartBean" scope="session"/>
<%@ include file="usertop.jsp"%>

<style>
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
	  	background-image: url('../board/images/11.jpeg');
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

	String pname = request.getParameter("pname");
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getAllProductByPname(pname);
	String imgPath = request.getContextPath() + "/bookshop/images/" + pb.getPimage();
%>
<div class="background-overlay"></div>
<table style="width: 80%; height: 80%; margin: auto;">
	<tr>
		<td width="30%"><img src="<%=imgPath%>" style="width: 300px; height: 500px;"></td>
		<td style="font-size: 20px; font-family: Arial;">
			<font color="blue">책 제목</font> : <%=pname%><br><br>
			<font color="blue">카테고리</font> : <%=pb.getPcategory()%><br><br>
			<font color="blue">출판사</font> : <%=pb.getPublisher()%><br><br>
			<font color="blue">남은</font> 수량 : <%=pb.getPqty()%><br><br>
			<font color="blue">가격</font> : <%=pb.getPrice()%><br><br>
			<font color="blue">줄거리</font> : <%=pb.getSummary()%><br><br>
			<font color="blue">지급 포인트</font> : <font color="red"><%=pb.getPoint()%></font><br><br>
			
			
			<form action="cartAdd_Pro.jsp" method="post">
			    <select name="pqty" style="width: 80px;">
			        <%
			            int num = pb.getPqty();
			            for(int i = 0; i < num; i++) {
			        %>
			        <option value="<%=i+1%>"><%=i+1%></option>
			        <%
			            }
			        %>
			    </select>
			    
			    <input type="hidden" name="pname" value="<%=pname%>">
				<input type="image" src="img/cartbtn.gif" width="100px">
			</form>
		</td>
	</tr>
</table>