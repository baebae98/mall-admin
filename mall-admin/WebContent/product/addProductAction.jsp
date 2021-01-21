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
		<title>addProductAction.jsp</title>
	</head>
	<body>
		<%
			//요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			// addProduct로부터 파라미터를 받아온다.
			String strCategoryId = request.getParameter("categoryId");		// 파라미터 확인 후 integer로 형변환
			String productName = request.getParameter("productName");
			String strProductPrice = request.getParameter("productPrice");	// 파라미터 확인 후 integer로 형변환
			String productContent = request.getParameter("productContent");
			String productSoldout = request.getParameter("productSoldout");
			
			System.out.println(strCategoryId);
			System.out.println(productName);
			System.out.println(strProductPrice);
			System.out.println(productContent);
			System.out.println(productSoldout + "\n");
			
			// 입력되지 않은 값이 존재할 경우
			if (strCategoryId.equals("") || productName.equals("") || strProductPrice.equals("") || productContent.equals("")) { 
				%>
					<script type="text/javascript">
						alert("입력되지 않은 값이 있습니다.\n확인해주세요."); // 경고창 띄우기
						history.back();	// 상품 추가 페이지로 되돌아가기
					</script>
				<%				
			} else {	// 정상적인 입력값을 받아왔을 경우
				int categoryId = Integer.parseInt(strCategoryId);
				int productPrice = Integer.parseInt(strProductPrice);
				
				Product product = new Product();	// 프로덕트 데이터 타입을 생성
				product.setCategoryId(categoryId);
				product.setProductName(productName);
				product.setProductPrice(productPrice);
				product.setProductContent(productName);
				product.setProductSoldout(productSoldout);
				
				ProductDao productDao = new ProductDao();
				productDao.insertProduct(product); // 프로덕트 타입의 productName을 insertProduct 메소드를 통해 처리한다.
				
				response.sendRedirect(request.getContextPath() + "/product/productList.jsp"); // 페이지 이동
			}
		%>
	</body>
</html>


