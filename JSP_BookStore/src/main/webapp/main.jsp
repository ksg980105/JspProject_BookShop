<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
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
  		background-image: url('images/background/dd.jpg');
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
</head>
<body>
<div class="background-overlay"></div>
<div class="container">
  <h2>오프라인 매장</h2>
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="images/홍대점.jpeg" alt="Lights" style="width:100%">
          <div class="caption">
            <p style="text-align: center;">홍대점</p>
          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="images/건대점.jpeg" alt="Nature" style="width:100%">
          <div class="caption">
            <p style="text-align: center;">건대점</p>
          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="images/서울대입구점.jpeg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p style="text-align: center;">서울대입구점</p>
          </div>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="images/홍대점.jpeg" alt="Lights" style="width:100%">
          <div class="caption">
            <p style="text-align: center;">홍대점</p>
          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="images/건대점.jpeg" alt="Nature" style="width:100%">
          <div class="caption">
            <p style="text-align: center;">건대점</p>
          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="images/서울대입구점.jpeg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p style="text-align: center;">서울대입구점</p>
          </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>


