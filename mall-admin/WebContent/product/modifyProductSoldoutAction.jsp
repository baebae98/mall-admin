<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %><!-- 이거는 여기 파일에서 필요없음. -->
<%@ page import="dao.*" %>

<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productSoldout = request.getParameter("productSoldout");
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductSoldout(productId,productSoldout);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+productId);
%>
