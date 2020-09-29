<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName =request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");
	response.sendRedirect("/mall-admin/product/productList.jsp");
	
	Product product = new Product();
	/*product.categoryId = categoryId;
	product.productName = productName;
	product.productPrice = productPrice;
	product.productContent = productContent;
	product.productSoldout = productSoldout;*/
	product.setCategoryId(categoryId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	
	ProductDao productDao = new ProductDao();
	productDao.insertProduct(product);
	
%>