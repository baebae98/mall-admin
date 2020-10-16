<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정폼</title>
</head>
<!-- w3school.com 사이트에서 가져온 부트스트랩 코드 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){ // 폼 유효성 검사 (form validation checking)
		if($("#productName").val().length<1){
			alert("이름을 입력해 주세요.");
			return;
		}else if($("#productPrice").val().length<1){
			alert("가격을 입력해 주세요.");
			return;
		}
		$("#updateForm").submit();
		});
	});
</script>
<body>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");
	
	//DB에서 데이터를 받아옴.
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productName = request.getParameter("productName");
	String productPrice = request.getParameter("productPrice");
	String productContent = request.getParameter("productContent");
	
	//DB에서 데이터를 받아오기 위해 DAO를 사용
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
	
	
%>
 <div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
<h1>수정하기</h1>
<form method="post" action="/mall-admin/product/updateProductAction.jsp" id="updateForm">
<table class="table table-dark table-striped table-hover">
	<tr>
		<td>product_id</td><!-- readonly 처리를 하여 읽기만 가능하게 함. 수정불가 -->
		<td><input type="text" name="productId" value="<%=product.getProductId()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>product_name</td>
		<td><input type="text" name="productName" value="<%=product.getProductName()%>" id="productName"></td>
	</tr>
	<tr>
		<td>product_price</td>
		<td><input type="text" name="productPrice" value="<%=product.getProductPrice()%>" id="productPrice"></td>
	</tr>
	<tr>
		<td>product_content</td>
		<td><input type="text" name="productContent" value="<%=product.getProductContent()%>" id="productContent"></td>
	</tr>
</table>
<div>
	<button type="button" id="btn" class="btn btn-danger">수정</button>
	<a href="/mall-admin/product/productList.jsp">돌아가기</a>
</div>
</form>
</div>
</body>
</html>