<%@page import="my.shop.cart.CartBean"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="my.shop.cart.CartBean" scope="session"/>
<%
	request.setCharacterEncoding("UTF-8");

	String pname = request.getParameter("pname");
	int pqty = Integer.parseInt(request.getParameter("pqty"));
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getAllProductByPname(pname);
	
	//전체금액
	int total = pb.getPrice()*pqty;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>즉시 구매</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="./css/product.css">
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
	  		background-image: url('../board/images/22.jpeg');
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
        #product > .cart > form > .total {
            float: none;
            width: 360px;
            height: 350px;
            padding: 10px;
            background: #fff;
            border: 1px solid #d3d3d3;
            box-sizing: border-box;
        }

        #product > .cart > form > .total > h2 {
            width: 100%;
            font-weight: bold;
            font-size: 16px;
            border-bottom: 1px solid #111;
            margin-bottom: 10px;
            padding-bottom: 10px;
            box-sizing: border-box;
            color: #1e1e1e;
        }

        #product > .cart > form > .total > table { width: 100%; }

        #product > .cart > form > .total > table tr:nth-last-child(1) td {
            font-size: 20px;
        }

        #product > .cart > form > .total > table tr:nth-last-child(1) td:last-child {
            color: #ff006c;
            font-size: 20px;
            font-weight: bold;
        }

        #product > .cart > form > .total > table td {
            padding: 10px 0;
            font-size: 14px;
            color: #555;
        }

        #product > .cart > form > .total > table td:last-child { text-align: right; }

        #product > .cart > form > .total > input[type=submit] {
            width: 100%;
            height: 56px;
            font-size: 26px;
            border-width: 1px;
            border-color: #d81818;
            border-bottom-color: #9e1212;
            background: #ed2f2f;
            background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
            color: #fff;
            box-sizing: border-box;
            margin-top: 0px;
        }
    </style>
</head>
<body>
<div class="background-overlay"></div>
    <div id="wrapper">
        <main id="product">
            <section class="cart">
                <nav>
                    <h1 align="center">결제</h1>
                </nav>
               <form action="caculate.jsp">
                    
                    <div class="total" style="margin: auto;">
                        <h2>전체합계</h2>
                        <table>
                            <tr>
                                <td>상품명</td>
                                <td><%=pname%></td>
                            </tr>
                            <tr>
                                <td>상품수</td>
                                <td><%=pqty%>개</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td><%=pb.getPrice()%>원</td>
                            </tr>
                            <tr>
                                <td>포인트</td>
                                <td><%=pb.getPoint()%>p</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td><%=total%></td>
                            </tr>
                        </table>
                        <%
                        	mallCart.addProduct(pname, pqty);
                        %>
                        <input type="submit" value="주문하기">
                    </div>
               </form>
            </section>
        </main>
    </div>
</body>
</html>
