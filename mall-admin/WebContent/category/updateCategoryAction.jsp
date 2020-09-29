<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//utf-8 형식으로 통일
	request.setCharacterEncoding("utf-8"); 
	int categoryId = Integer.parseInt(request.getParameter("no"));
	String categoryName = request.getParameter("categoryName");
	Category category = new Category();
	//id 받아오기
	//category.categoryId = categoryId;
	category.setCategoryId(categoryId);
	//name 변경
	//category.categoryName = categoryName;
	category.setCategoryName(categoryName);
	//dao에 있는 업데이트 메소드로 값을 보냄
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	//작업이 끝나면 다시 리스트로 보냄
	response.sendRedirect("/mall-admin/category/categoryList.jsp");

%>