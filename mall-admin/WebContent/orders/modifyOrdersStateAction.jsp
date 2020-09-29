<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	//주문상태 수정을 위한 ordersId 값 받기
	int ordersId = 0;
	if(request.getParameter("ordersId") != null) {
		ordersId = Integer.parseInt(request.getParameter("ordersId"));
	}

	// 수정할 주문 상태를 받기 위한 변수
	String ordersState = null;
	if(request.getParameter("ordersState") != null) {
		ordersState = request.getParameter("ordersState");
	}
	System.out.println(ordersId + "<- 주문번호");
	System.out.println(ordersState + "<- 주문상태");
	
	// 수정하는 주문 상태 vo에 담기
	Orders orders = new Orders();
	//orders.ordersId = ordersId;
	//orders.ordersState = ordersState;
	orders.setOrdersId(ordersId);
	orders.getOrdersState();
	
	// dao 쿼리 실행하기
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersState(orders);
	
	response.sendRedirect("/mall-admin/orders/ordersList.jsp");
%>
