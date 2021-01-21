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
		<title>productUpdateForm.jsp</title>
		
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
				<h1>상품정보 수정</h1>
				<p>상품정보를 수정하는 페이지입니다.</p>
			</div>
			
			<form method="post" action="<%=request.getContextPath() %>/product/productUpdateAction.jsp">
				<table class="table table-hover" style="text-align: center;">
					<tr>
						<td width="30%">상품 이미지</td>
						<td width="70%">
							<img width="300px" height="300px" src="<%=request.getContextPath() %>/image/<%=product.getProductPic() %>">
							<br><br>
							<button type="button" class="btn btn-dark btn-sm" onclick="location.href='<%=request.getContextPath() %>/product/modifyProductPic.jsp?productId=<%=productId %>'">이미지 수정</button>
						</td>
					</tr>
					<tr>
						<td>상품 고유번호</td>
						<td><input type="text" class="form-control" value="<%=product.getProductId() %>" name="productId" readonly="readonly"></td>
					</tr>
					<tr>
						<td>카테고리 번호</td>
						<td><input type="text" class="form-control" value="<%=product.getCategoryId() %>" readonly="readonly"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" class="form-control" value="<%=product.getProductName() %>" name="productName"></td>
					</tr>
					<tr>
						<td>상품 가격</td>
						<td><input type="text" class="form-control" value="<%=product.getProductPrice() %>" name="productPrice"></td>
					</tr>
					<tr>
						<td>상품 내용</td>
						<td><textarea class="form-control" rows="10" cols="40" name="productContent"><%=product.getProductContent() %></textarea></td>
					</tr>
					<tr>
						<td>품절/판매 여부</td>
						<td>
							<a href="<%=request.getContextPath() %>/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId() %>&productSoldout=<%=product.getProductSoldout() %>">
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
							<button type="submit" class="btn btn-dark">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>