<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	//utf-8형식으로 통일
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	
	Product product = new Product();
	//id 받아오기
	product.setProductId(productId);
	//name 받아오기
	product.setProductName(productName);
	//price 받아오기
	product.setProductPrice(productPrice);
	//content 받아오기
	product.setProductContent(productContent);
	//DAO에 있는 업데이트 메소스들ㄹ 이용하여 값을 보냄
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product);
	//작업이 끝나면 다시 리스트로 보냄
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>