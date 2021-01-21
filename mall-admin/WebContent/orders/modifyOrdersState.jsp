<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrdersState수정폼</title>
<!-- 스크립트-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
	// 인코딩 설정
	request.setCharacterEncoding("utf-8");
	// 주문상태 수정을 위한 ordersId 값 받기
	int ordersId = 0;
	if(request.getParameter("ordersId") != null) {
		ordersId = Integer.parseInt(request.getParameter("ordersId"));
	}
	// 현재 등록된 주문 상태를 받기 위한 변수
	String ordersState = null;
	if(request.getParameter("ordersState") != null) {
		ordersState = request.getParameter("ordersState");
	}
	// 주문상태 목록 쿼리를 받기 위한 Dao,ArrayList 객체 생성
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<String> list = null;
	// 주문상태 목록 쿼리 결과를 리스트에 담음
	list = ordersDao.selectOrdersStateList();
	%>
	<div class="jumbotron">
		<h1>주문 상태 수정</h1>
	</div>
	<form method="post" action="/mall-admin/orders/modifyOrdersStateAction.jsp">
		<table class="table table-dark table-striped table-hover">
			<tr>
				<td>주문번호</td>
				<td>
					<input class="form-control"  type="text" name="ordersId" value="<%=ordersId%>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>현재 주문상태</td>
				<td>
					<input class="form-control"  type="text" value="<%=ordersState%>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>주문상태 변경</td>
				<td>
					<select class="form-control" name="ordersState">
							<%
								if (ordersState.equals("결제완료")) {
									%><option value="결제완료" selected="selected">결제완료</option><%
								} else {
									%><option value="결제완료">결제완료</option><%
								}
							
								if (ordersState.equals("배송준비중")) {
									%><option value="배송준비중" selected="selected">배송준비중</option><%
								} else {
									%><option value="배송준비중">배송준비중</option><%
								}
								
								if (ordersState.equals("배송완료")) {
									%><option value="배송완료" selected="selected">배송완료</option><%
								} else {
									%><option value="배송완료">배송완료</option><%
								}
								
								if (ordersState.equals("주문취소")) {
									%><option value="주문취소" selected="selected">주문취소</option><%
								} else {
									%><option value="주문취소">주문취소</option><%
								}
							%>
							</select>
				</td>
			</tr>
		</table>
		<button class="btn btn-secondary" type="submit" id="btn">수정하기</button>
</form>
</div>
</body>
</html>