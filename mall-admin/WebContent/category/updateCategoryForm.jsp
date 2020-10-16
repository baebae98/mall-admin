<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- w3school.com 사이트에서 가져온 부트스트랩코드  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 스크립트-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#updateForm").val=""){
				alert("카테고리를 입력해주세요.");
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
	int categoryId = Integer.parseInt(request.getParameter("no"));
	String categoryName = "";

	
%>
 <div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
<h1>수정하기</h1>
<form method="post" action="/mall-admin/category/updateCategoryAction.jsp" id="updateForm">
<table class="table table-dark table-striped table-hover">
	<tr>
		<td>category_id</td><!--readonly 처리를 하여 읽기만 가능하게함. 수정불가 -->
		<td><input type="text" name="no" value="<%=categoryId%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>category_name</td>
		<td><input type="text" name="categoryName" value="<%=categoryName%>" id="categoryName"></td>
	</tr>
</table>
<div>
	<button type="button" id="btn">수정</button>
	<a href="/mall-admin/category/categoryList.jsp">돌아가기</a>
</div>
</form>
</div>
</body>
</html>