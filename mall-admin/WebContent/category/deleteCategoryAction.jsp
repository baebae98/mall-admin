<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8"); //글자 인코딩
	int categoryId = Integer.parseInt(request.getParameter("no"));
	Category category = new Category();
	//category.categoryId = categoryId;
	category.setCategoryId(categoryId);
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");

%>