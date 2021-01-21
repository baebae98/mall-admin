<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

<%
	if (session.getAttribute("loginAdminId") == null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>

<%
	//요청 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// productId 파라미터를 받아온다.
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	Product product = new Product();	// 프로덕트 데이터 타입을 생성
	product.setProductId(productId);
	
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(product); // 프로덕트 타입의 productId를 deleteProduct 메소드를 통해 처리한다.
	
	response.sendRedirect(request.getContextPath() + "/product/productList.jsp"); // 페이지 이동
%>