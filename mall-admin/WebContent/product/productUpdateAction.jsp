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
		<title>productUpdateAction.jsp</title>
	</head>
	<body>
		<%
			//요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			// productOne로부터 파라미터를 받아온다.
			String strProductId = request.getParameter("productId");		// 파라미터 확인 후 integer로 형변환
			String productName = request.getParameter("productName");
			String strProductPrice = request.getParameter("productPrice");	// 파라미터 확인 후 integer로 형변환
			String productContent = request.getParameter("productContent");
			
			System.out.println(productName);
			System.out.println(strProductPrice);
			System.out.println(productContent);
			
			// 입력되지 않은 값이 존재할 경우
			if (productName.equals("") || strProductPrice.equals("") || productContent.equals("")) { 
				%>
					<script type="text/javascript">
						alert("입력되지 않은 값이 있습니다.\n확인해주세요."); // 경고창 띄우기
						history.back();	// 상품 추가 페이지로 되돌아가기
					</script>
				<%				
			} else {	// 정상적인 입력값을 받아왔을 경우
				int productId = Integer.parseInt(strProductId);
				int productPrice = Integer.parseInt(strProductPrice);
				
				Product product = new Product();	// 프로덕트 데이터 타입을 생성
				product.setProductId(productId);
				product.setProductName(productName);
				product.setProductPrice(productPrice);
				product.setProductContent(productContent);
				
				ProductDao productDao = new ProductDao();
				productDao.updateProduct(product); // insertProduct 메소드를 통해 처리한다.
				
				response.sendRedirect(request.getContextPath() + "/product/productOne.jsp?productId=" + productId); // 페이지 이동
			}
		%>
	</body>
</html>