<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

<%
	if (session.getAttribute("loginAdminId") == null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyOrdersState.jsp</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%
			// 요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			int thisOrdersId = Integer.parseInt(request.getParameter("ordersId"));
			String thisOrdersState = request.getParameter("ordersState");
		
			OrdersDao ordersDao = new OrdersDao();
			ArrayList<Orders> ordersStateList = ordersDao.selectOrdersStateListAll(); // 주문상태 리스트 출력
		%>
		<div class="container">
			
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>주문 수정</h1>
				<p>상품 주문상태를 수정하는 페이지입니다.</p>
			</div>
			
			<form method="post" action="<%=request.getContextPath() %>/orders/modifyOrdersStateAction.jsp">
				<table class="table table-hover" style="text-align: center;">
					<tr>
						<td>주문 번호</td>
						<td>
							<input type="text" class="form-control" name="ordersId" value="<%=thisOrdersId %>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>주문 상태</td>
						<td>
							<select class="form-control" name="ordersState">
							<%
								if (thisOrdersState.equals("결제완료")) {
									%><option value="결제완료" selected="selected">결제완료</option><%
								} else {
									%><option value="결제완료">결제완료</option><%
								}
							
								if (thisOrdersState.equals("배송준비중")) {
									%><option value="배송준비중" selected="selected">배송준비중</option><%
								} else {
									%><option value="배송준비중">배송준비중</option><%
								}
								
								if (thisOrdersState.equals("배송완료")) {
									%><option value="배송완료" selected="selected">배송완료</option><%
								} else {
									%><option value="배송완료">배송완료</option><%
								}
								
								if (thisOrdersState.equals("주문취소")) {
									%><option value="주문취소" selected="selected">주문취소</option><%
								} else {
									%><option value="주문취소">주문취소</option><%
								}
							%>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-info">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>