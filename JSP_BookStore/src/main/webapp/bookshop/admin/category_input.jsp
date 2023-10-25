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
 </head>
<body>

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