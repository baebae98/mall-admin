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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<Script>
		$(document).ready(function(){
			$("#btn").click(function(){ // 폼 유효성 검사 (form validation checking)
			if($("#productName").val().length<1){
				alert("이름을 입력해 주세요.");
				return;
			}else if($("#productPrice").val().length<1){
				alert("가격을 입력해 주세요.");
				return;
				}else if($("#productContent").val().length<1){
					alert("설명을 입력해 주세요.");
					return;
					}
			$("#addForm").submit();
			});
		});
</Script>
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
	<form method="post" action ="/mall-admin/product/addProductAction.jsp" id="addForm">
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
			<input type="text" name="productName" id="productName">
			</td>
		</tr>
		<tr>
			<td>product_price</td>
			<td>
			<input type="text" name="productPrice" id="productPrice">
			</td>
		</tr>
		<tr>
			<td>product_content</td>
			<td>
				<textarea rows="5" cols="80" name="productContent" id="productContent"></textarea>
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
			<td><button type="button" class="btn btn-danger" id="btn">입력</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>