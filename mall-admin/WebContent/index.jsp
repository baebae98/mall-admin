<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	//로그인이 아이디가 = null이면  로그인페이지로 이동
if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;//위 코드 실행하고 끝내주는 코드, 안쓰게 되면 밑에 코드  실행됨.
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Index</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--w3school.com 사이트에서 가져옴  -->
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron text-center">
		<div align="center">
			<h1>관리자 메인 페이지</h1>
			<h4>쇼핑몰 어드민</h4>
		</div>
	</div>
	<div class="container">
		<br/>
		<div class="container text-center">
			<img src="./image/2.jpg"> <img src="./image/1.jpg">
		</div>
		<br/>
		<table class="table table-hover tb-width center">
	            <tr>
	                <th width="20%">제작자</th>
	                <td width="80%">배형준</td>
	            </tr>
	            <tr>
	            	<th>이메일</th>
	            	<td>piskk74@naver.com</td>
	            </tr>
	            <tr>
	                <th>프로젝트 기간</th>
	                <td>2020.09.29 ~ 2020.10.16 / 2020.01.21 ~ ?</td>
	            </tr>
	            <tr>
	                <th>프로젝트 설명</th>
	                <td>
	                	이 프로젝트는 모델1과 메서드 활용에 익숙해지기 위해 제작된 프로젝트이며, 
	                	쇼핑몰 어드민 프로젝트입니다.
						개발환경으로는 자바이클립스IDE와 HeidiSQL(mariaDB)를 이용하였습니다.
					</td>
	            </tr>
			</table>
	</div>
</body>
</html>