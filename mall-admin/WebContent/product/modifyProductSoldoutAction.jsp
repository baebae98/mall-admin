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

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyProductSoldoutAction.jsp</title>
	</head>
	<body>
		<%
			//요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			// addProduct로부터 파라미터를 받아온다.
			int productId = Integer.parseInt(request.getParameter("productId"));
			String productSoldout = request.getParameter("productSoldout");
			
			System.out.println("productId: " + productId);
			System.out.println("productSoldout: " + productSoldout);
			
			Product product = new Product();	// 프로덕트 데이터 타입을 생성
			product.setProductId(productId);
			product.setProductSoldout(productSoldout);
			
			ProductDao productDao = new ProductDao();
			productDao.updateProductSoldout(product); // 프로덕트 타입의 productName을 insertProduct 메소드를 통해 처리한다.
			
			response.sendRedirect(request.getContextPath() + "/product/productUpdateForm.jsp?productId=" + productId); // 페이지 이동
		%>
	</body>
</html>


