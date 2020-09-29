<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8"); //글자 인코딩
	String categoryName = request.getParameter("categoryName");
	Category category = new Category();
	//category.categoryName = categoryName;
	category.setCategoryName(categoryName);
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>
