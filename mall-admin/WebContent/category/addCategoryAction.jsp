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

	// addCategory로부터 categoryName 파라미터를 받아온다.
	String categoryName = request.getParameter("categoryName");
	Category category = new Category();	// 카테고리 데이터 타입을 생성
	category.setCategoryName(categoryName);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category); // 카테고리 타입의 categoryName을 insertCategory 메소드를 통해 처리한다.
	
	response.sendRedirect(request.getContextPath() + "/category/categoryList.jsp"); // 페이지 이동
%>