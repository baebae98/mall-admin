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
	
	// ordersId, ordersState 파라미터를 받아온다.
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	String ordersState = request.getParameter("ordersState");
	
	Orders orders = new Orders();	// 카테고리 데이터 타입을 생성
	orders.setOrdersId(ordersId);
	orders.setOrdersState(ordersState);
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersState(orders); // Orders 타입의 ordersState를 updateOrdersState 메소드를 통해 처리한다.
	
	System.out.println(ordersId + "+" + ordersState);
	response.sendRedirect(request.getContextPath() + "/orders/ordersList.jsp"); // 페이지 이동
%>