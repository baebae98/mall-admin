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
		<title>addProduct.jsp</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- jQuery를 이용하여 Form 유효성 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$("#btn").click(function() {	// 버튼 클릭시 폼 내용의 유효성 검사를 수행
					if ($("#categoryId").val() == "") {	// categoryId 미선택시 수행
						alert("카테고리를 선택해주세요");
						return;
					} else if ($("#productName").val() == "") {	// productName 공백인 경우 수행
						alert("상품명을 입력해주세요");
						return;
					} else if ($("#productPrice").val() == "") {	// productPrice 공백인 경우 수행
						alert("상품 가격을 입력해주세요");
						return;
					} else if ($("#productContent").val() == "") {	// productContent 공백인 경우 수행
						alert("상품 설명을 입력해주세요");
						return;
					}
					$("#addForm").submit();
				});	
			});
		</script>
	</head>
	<body>
		<%
			CategoryDao categoryDao = new CategoryDao();
			ArrayList<Category> categoryList = categoryDao.selectCategoryListAll();
		%>
	
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>상품 추가</h1>
				<p>상품을 추가하는 페이지입니다. 상품 이름을 입력해주세요.</p>
			</div>
			
			<br>
			
			<div>
				<form method="post" action="<%=request.getContextPath() %>/product/addProductAction.jsp" id="addForm">
					<table class="table table-striped" style="text-align: center">
						<tr>
							<td>카테고리</td>
							<td>
								<select name="categoryId" class="form-control" id="categoryId">
									<option value="">==== 카테고리 선택 ====</option>
									<%
										for (Category c : categoryList) {
											%><option value="<%=c.getCategoryId() %>"><%=c.getCategoryName() %></option><%
										}
									%>
								</select>
							</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input type="text" class="form-control" name="productName" id="productName"></td>
						</tr>
						<tr>
							<td>상품 가격</td>
							<td><input type="text" class="form-control" name="productPrice" id="productPrice"></td>
						</tr>
						<tr>
							<td>상품 설명</td>
							<td>
								<textarea class="form-control" rows="10" cols="40" name="productContent" id="productContent"></textarea>
							</td>
						</tr>
						<tr>
							<td>품절/판매 여부</td>
							<td>
								<div class="form-check">
									<label class="form-check-label">
										<input type="radio" class="form-check-input" name="productSoldout" value="N" checked="checked">판매중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="form-check-input" name="productSoldout" value="Y">품절
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-dark" id="btn">상품 추가</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<br><br>
		</div>
	</body>
</html>