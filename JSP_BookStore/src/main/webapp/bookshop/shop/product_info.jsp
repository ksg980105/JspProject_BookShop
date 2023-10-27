<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="usertop.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String pname = request.getParameter("pname");
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getAllProductByPname(pname);
	String imgPath = request.getContextPath() + "/bookshop/images/" + pb.getPimage();
%>

<table style="width: 80%; height: 80%; margin: auto;">
	<tr>
		<td width="30%"><img src="<%=imgPath%>" style="width: 300px; height: 500px;"></td>
		<td style="font-size: 20px; font-family: cursive;">
			<font color="blue">책 제목</font> : <%=pname%><br><br>
			<font color="blue">카테고리</font> : <%=pb.getPcategory()%><br><br>
			<font color="blue">출판사</font> : <%=pb.getPublisher()%><br><br>
			<font color="blue">남은</font> 수량 : <%=pb.getPqty()%><br><br>
			<font color="blue">가격</font> : <%=pb.getPrice()%><br><br>
			<font color="blue">줄거리</font> : <%=pb.getSummary()%><br><br>
			<font color="blue">지급 포인트</font> : <font color="red"><%=pb.getPoint()%></font><br><br>
			<a href=""><img src="img/cartbtn.gif" style="width: 100px;"></a>
                  <a href=""><img src="img/orderbtn.gif" style="width: 100px;"></a>
		</td>
	</tr>
</table>