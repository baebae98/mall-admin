<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1>상품 추가</h1>
	<form method="post" action ="/mall-admin/product/addProductAction.jsp">
	<table class="table table-dark table-striped table-hover">
		<tr>
			<td>category_id</td>
			<td>
				<select name="categoryId">
				<%
					for(Category c : categoryList){
				%>
					<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName() %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>product_name</td>
			<td>
			<input type="text" name="productName">
			</td>
		</tr>
		<tr>
			<td>product_price</td>
			<td>
			<input type="text" name="productPrice">
			</td>
		</tr>
		<tr>
			<td>product_content</td>
			<td>
				<textarea rows="5" cols="80" name="productContent"></textarea>
			</td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td>
				<input type="radio" name="productSoldout" value="N" checked="checked">품절 아님
				<input type="radio" name="productSoldout" value="Y">품절
			</td>
		</tr>
		<tr>
			<td><button type="submit" class="btn btn-danger">입력</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>