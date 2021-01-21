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
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
		<div class="container">
			<h1>상품 추가</h1>
		</div>
	</div>>
	<div class="container">
	<form method="post" action ="/mall-admin/product/addProductAction.jsp" id="addForm">
	<table class="table table-dark table-striped table-hover">
		<tr>
			<td>category_id</td>
			<td>
				<select class="form-control" name="categoryId">
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
				<input class="form-control" type="text" name="productName" id="productName">
			</td>
		</tr>
		<tr>
			<td>product_price</td>
			<td>
				<input class="form-control" type="text" name="productPrice" id="productPrice">
			</td>
		</tr>
		<tr>
			<td>product_content</td>
			<td>
				<textarea class="form-control" rows="5" name="productContent" id="productContent"></textarea>
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