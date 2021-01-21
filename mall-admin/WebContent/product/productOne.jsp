<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>productOne.jsp</title>
		
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
			int productId = Integer.parseInt(request.getParameter("productId"));
			System.out.println("productId: " + productId);	// productId 디버깅
			
			Product product = new ProductDao().selectProductOne(productId); // 하나의 메소드만 호출할 때 사용
			System.out.println(product);
		%>
		
		<div class="container">
		
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>상품 상세보기</h1>
				<p>상품정보를 확인하는 페이지입니다. 상품정보 확인, 수정, 삭제가 가능합니다.</p>
			</div>
			
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<td width="30%">상품 이미지</td>
					<td width="70%">
						<img width="300px" height="300px" src="<%=request.getContextPath() %>/image/<%=product.getProductPic() %>">
					</td>
				</tr>
				<tr>
					<td>상품 고유번호</td>
					<td><%=product.getProductId() %></td>
				</tr>
				<tr>
					<td>카테고리 번호</td>
					<td><%=product.getCategoryId() %></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><%=product.getProductName() %></td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><%=product.getProductPrice() %></td>
				</tr>
				<tr>
					<td>상품 내용</td>
					<td><%=product.getProductContent() %></td>
				</tr>
				<tr>
					<td>품절/판매 여부</td>
					<td>
						<!-- a href="<%=request.getContextPath() %>/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId() %>&productSoldout=<%=product.getProductSoldout() %>"-->
							<%
								if (product.getProductSoldout().equals("Y")) { // 품절시
									%><button type="button" class="btn btn-danger btn-sm">&nbsp;&nbsp;품절&nbsp;&nbsp;</button><%
								} else {	// 판매중
									%><button type="button" class="btn btn-success btn-sm">판매중</button><%
								}							
							%>
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-info" onclick="location.href='<%=request.getContextPath() %>/product/productUpdateForm.jsp?productId=<%=productId %>&productName=<%=product.getProductName() %>'">수정</button>
						&nbsp;
						<button type="button" class="btn btn-danger" onclick="location.href='<%=request.getContextPath() %>/product/productDeleteAction.jsp?productId=<%=productId %>'">삭제</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>