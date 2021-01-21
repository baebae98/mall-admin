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
		<title>modifyProductPic.jsp</title>
		
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
			System.out.println("productId: " + productId);
		%>
	
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>상품 이미지 수정</h1>
				<p>상품 이미지를 추가, 수정하는 페이지입니다.</p>
			</div>
			
			<br>
		
			<form method="post" action="<%=request.getContextPath() %>/product/modifyProductPicAction.jsp" enctype="multipart/form-data">
				<input type="hidden" name="productId" value="<%=productId %>">
				<table width="100%" style="text-align: center">
					<tr>
						<td width="80%">
							<input type="file" class="form-control" name="productPic">
						</td>
						<td width="20%">
							<button type="submit" class="btn btn-dark">이미지 업로드</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;">
							파일 최대 업로드 크기: 100MByte
						</td>
					</tr>
				</table>
			</form>
			
			<br><br>
		</div>
	</body>
</html>