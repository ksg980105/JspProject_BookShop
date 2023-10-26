<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admintop.jsp"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <title>카테고리 등록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<div class="background-overlay"></div>
<div class="container" align="center">
  <h2>카테고리 등록</h2>
  <br>
  <form action="category_Pro.jsp" method="post">
    <div class="form-group">
      <label for="category_name">카테고리명</label>
      <input type="text" class="form-control" style="width:200px;" name="cname">
    </div>
    <button type="submit" style="width:200px;" class="btn btn-default">등록</button><br><br>
  </form>
</div>

</body>
</html>