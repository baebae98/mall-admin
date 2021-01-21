<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
		$(document).ready(function(){
			$("#btn").click(function(){
				if($("#addForm").val == ""){
					$("#categoryNameHelper").text("카테고리 이름을 입력하세요.");
					return;
				}
					$("#addForm").submit();
			});
		});
</script>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
		<div class="container">
		 <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
		<div class="container-fluid jumbotron text-center">
		<h1>카테고리 입력</h1>
		<form method="post" action ="/mall-admin/category/addCategoryAction.jsp" id="addForm">
			<div>category_name</div>
			<div><input type="text" name="categoryName" id="categoryName"></div><br/>
			<span id="categoryNameHelper"></span>
			<div><button type="button" id="btn" class="btn btn-danger">카테고리 추가</button></div>
		</form>
		</div>
	</div>
</body>
</html>