<%@page import="java.util.Vector"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="usertop.jsp"%>

<jsp:useBean id="mallCart" class="my.shop.cart.CartBean" scope="session"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	Vector<ProductBean> clist = mallCart.getAllProduct();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>장바구니 수정</title>
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
	  	
        #product > .cart > form {}

        #product > .cart > form > table {
            width: 70%;
            border-bottom: 1px solid #d3d3d3;
            border-collapse: collapse;
            border-spacing: 0;
        }

        #product > .cart > form > table tr { border-bottom: 1px solid #d3d3d3 ;  background-color: white;}

        #product > .cart > form > table th:first-child {width: 60px;}

        #product > .cart > form > table th {
            padding: 12px 0;
            border-top: 2px solid #000;
            border-bottom: 1px solid #d3d3d3;
            background: #fff;
            color: #383838;
            font-size: 0.95em;
            text-align: center;
            letter-spacing: -0.1em;
        }

        #product > .cart > form > table .empty { display: none ;}

        #product > .cart > form > table td { text-align: center;}

        #product > .cart > form > table td:last-child {
            color: #ff006c;
            font-weight: bold;
        }

        #product > .cart > form > table th > input {}

        

        #product > .cart > form > table tr > td > input {}

        #product > .cart > form > table td > article {
            padding: 6px;
            overflow: hidden;
        }

        #product > .cart > form > table td > article > a {
            float: left;
            display: inline-block;
        }

        #product > .cart > form > table td > article > a > img { width: 80px;}

        #product > .cart > form > table td > article > div {
            float: left;
            margin-left: 10px;
        }

        #product > .cart > form > table td > article > div > h2 { text-align: left; }

        #product > .cart > form > table td > article > div > p {
            text-align: left;
            color: #bl;
            margin-top: 0px;
        }

        #product > .cart > form > input[name=del] {
            border-color: #bdbdbd;
            border-bottom-color: #828282;
            background: #fafafa;
            color: #4d4d4d;
            padding: 6px 11px;
            border-width: 1px;
            margin-top: 0px;
        }

        #product > .cart > form > .total {
        	margin-top: -120px;
            float: right;
            width: 360px;
            height: 350px;
            padding: 10px;
            margin-right: 20px;
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
    
    <script>
		function updateCart(pnum, pqty) {
		    location.href = 'cartUpdatePro.jsp?pnum=' + pnum + '&pqty=' + pqty;
		}
	</script>
</head>
<body>
<div class="background-overlay"></div>
    <div id="wrapper">
        <main id="product">
            <section class="cart">
                <nav>
                    <h1>장바구니</h1>
                </nav>
               <form action="#">
                    <table border="0" name="tab">
                        <tr>
                            <th>이미지</th>
                            <th>제목</th>
                            <th>주문수량</th>
                            <th>판매가</th>
                            <th>포인트</th>
                            <th>소계</th>
                            <th>수정/삭제</th>
                        </tr>
                        <%
                        	int count = 0;
                        	int price = 0;
                        	int point = 0;
                        	int productPrice;
                        	if(clist.size()==0){
                        %>
                        <tr>
                            <td colspan="6">장바구니에 상품이 없습니다.</td>
                        </tr>
                        
                        <%
                        	} else{
                        	for(int i=0; i<clist.size(); i++){
                        		ProductBean pb = clist.get(i);
                        		String imgPath = request.getContextPath() + "/bookshop/images/" + pb.getPimage();
                        		count += pb.getPqty();			//전체 주문상품 수
                        		price += pb.getPrice() * pb.getPqty(); 	//전체 가격
                        		point += pb.getPoint() * pb.getPqty();	//전체 포인트
                        		productPrice = pb.getPrice() * pb.getPqty();
                        		if(pnum == pb.getPnum()){
                        %>
                        <tr>
                            <td><article>
                               <img src="<%=imgPath%>" style="width: 50px;">
                            </article></td>
                            <td><%=pb.getPname()%></td>
                            <td><input type="text" id="pqty_<%=i%>" name="pqty" size="5" value="<%=pb.getPqty()%>"></td>
                            <td><%=pb.getPrice()%></td>
                            <td><%=pb.getPoint()%></td>
                            <td><%=productPrice%></td>
                            <td>
                            	<input type="button" value="수정하기" onClick="updateCart('<%=pb.getPnum()%>', document.getElementById('pqty_<%=i%>').value)">
                            	<input type="button" value="취소" onClick="location.href = 'cartlist.jsp'">
                            </td>
                        </tr>
                         <%}else{ %>
                         <tr>
                            <td><article>
                               <img src="<%=imgPath%>" style="width: 50px;">
                            </article></td>
                            <td><%=pb.getPname()%></td>
                            <td><%=pb.getPqty()%></td>
                            <td><%=pb.getPrice()%></td>
                            <td><%=pb.getPoint()%></td>
                            <td><%=productPrice%></td>
                            <td>
                            	<input type="button" value="수정" onClick="location.href = 'cartUpdate.jsp?pnum=<%=pb.getPnum()%>&pqty=<%=pb.getPqty()%>'">
                            	<input type="button" value="삭제" onClick="location.href = 'cartDeletePro.jsp'">
                            </td>
                        </tr>
                         <%} %>
                        <%} %>
                      <%} %>
                    </table>
                    <div class="total">
                        <h2>전체합계</h2>
                        <table>
                            <tr>
                                <td>상품수</td>
                                <td><%=count%>개</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td><%=price%>원</td>
                            </tr>
                            <tr>
                                <td>포인트</td>
                                <td><%=point%>p</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td><%=price%>원</td>
                            </tr>
                        </table>
                        <input type="submit" value="주문하기">
                    </div>
               </form>
            </section>
        </main>
    </div>
</body>
</html>