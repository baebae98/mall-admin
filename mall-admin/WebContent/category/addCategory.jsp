<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid jumbotron text-center"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
	<h1>관리자 메인 페이지</h1>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>카테고리 입력</h1>
	<form method="post" action ="/mall-admin/category/addCategoryAction.jsp">
		<div>category_name</div>
		<div><input type="text" name="categoryName"></div><br/>
		<div><button type="submit" class="btn btn-danger">카테고리 추가</button></div>
	</form>
	</div>
</body>
</html>