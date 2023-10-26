<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String pname = request.getParameter("pname");
	String pcategory = request.getParameter("pcategory");
	String publisher = request.getParameter("publisher");
	String pimage = request.getParameter("pimage");
	String pqty = request.getParameter("pqty");
	String price = request.getParameter("price");
	String summary = request.getParameter("summary");
	String point = request.getParameter("point");
	
	System.out.println("pqty" + pqty);
	
	//이미지 처리
	int maxSize = 1024*1024*10;
	String configFolder =""; 
	String encoding="UTF-8";
	String saveFolder="bookshop/images"; 
	
	configFolder=config.getServletContext().getRealPath("bookshop/images");
	//C:\JSP_ksg\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_BookStore\bookshop\images
	
	MultipartRequest mr = new MultipartRequest(request,
												configFolder, 
												maxSize, 
												encoding, 
												new DefaultFileRenamePolicy()
											 );
	String fs_filename = mr.getFilesystemName("pimage");
	System.out.println("fs_filename:"+fs_filename);
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.insertProduct(mr);
	
	String msg, url;
	if(cnt > 0){
		msg = "등록 성공";
		url = "product_list.jsp";
	}else{
		msg = "등록 실패";
		url = "product_input.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>





















