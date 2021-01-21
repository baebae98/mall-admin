<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<title>addCategory.jsp</title>
		
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
					if ($("#categoryName").val() == "") {	// categoryName 공백인 경우 수행
						alert("카테고리 이름을 입력해주세요");
						return;
					}
					$("#addForm").submit();
				});	
			});
		</script>
	</head>
	<body>
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>카테고리 입력</h1>
				<p>상품 카테고리를 추가하는 페이지입니다. 카테고리 이름을 입력해주세요.</p>
			</div>
			
			<br>
			
			<div>
				<form method="post" action="<%=request.getContextPath() %>/category/addCategoryAction.jsp" id="addForm">
					<table class="table table-striped" style="text-align: center">
						<tr>
							<td>카테고리 이름</td>
							<td>
								<input type="text" class="form-control" name="categoryName" id="categoryName">
							</td>
							<td>
								<button type="button" class="btn btn-dark" id="btn">카테고리 추가</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<br><br>
		</div>
	</body>
</html>