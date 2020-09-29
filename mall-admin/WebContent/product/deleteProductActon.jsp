<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//utf-8로 인코딩 통일 
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("no"));
	Product product = new Product();
	//product.productId = productId;
	product.setProductId(productId);
	
	ProductDao productDao = new ProductDao();
	
	productDao.deleteProduct(product);
	
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>
