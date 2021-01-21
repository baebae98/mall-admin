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
		<title>categoryUpdateForm.jsp</title>
		
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
		
			// categoryId, categoryName 파라미터를 받아온다
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			
			Category category = new CategoryDao().selectCategoryOne(categoryId);
			
			System.out.println("상품 이미지: " + category.getCategoryPic());
		%>
		
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>카테고리 수정</h1>
				<p>상품 카테고리를 수정하는 페이지입니다. 수정할 카테고리 이름을 입력해주세요.</p>
			</div>
			
			<br>
		
			<div>
				<form method="post" action="<%=request.getContextPath() %>/category/categoryUpdateAction.jsp">
					<table class="table table-striped" style="text-align: center">						
						<tr>
							<td width="30%">상품 이미지</td>
							<td width="70%">
								<img width="300px" height="300px" src="<%=request.getContextPath() %>/image/<%=category.getCategoryPic() %>">
								<br><br>
								<button type="button" class="btn btn-dark btn-sm" onclick="location.href='<%=request.getContextPath() %>/category/modifyCategoryPic.jsp?categoryId=<%=categoryId %>'">이미지 수정</button>
							</td>
						</tr>
						
						<tr>
							<td>카테고리 번호</td>
							<td><input type="text" class="form-control" name="categoryId" value="<%=categoryId %>" readonly="readonly"></td>
						</tr>					
						<tr>
							<td>카테고리 이름</td>
							<td><input type="text" class="form-control" name="categoryName" value="<%=category.getCategoryName() %>"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" class="btn btn-dark">카테고리 수정</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<br><br>
		</div>
	</body>
</html>