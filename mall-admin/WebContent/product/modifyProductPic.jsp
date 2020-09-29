<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 수정 폼</title>
</head>
<body>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
	%>
	<!-- 기존 string 방식을 사용하지 않고 cos.war을 이용해 쉽게 작업을 함. -->
	<h1>상품 이미지 수정</h1>
	<form method="post" action="/mall-admin/product/modifyProductPicAction.jsp" enctype="multipart/form-data">
		<input type="hidden" name="productId" value="<%=productId%>">
		<div>
		이미지 선택 :
		<input type="file" name="productPic">	
		</div>
		<div>
			<button type="submit">이미지 수정</button>
		</div>
	</form>
</body>
</html>