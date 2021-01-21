<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

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
		<title>index.jsp</title>
		
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
	
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>HOME</h1>
				<h4>쇼핑몰 관리자 페이지</h4>
			</div>
			<br>
				<br/>
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
					</td>
	            </tr>
	            <tr>
	            	<th>개발환경</th>
	            	<td>
	            		<ul>
							<li>Operating System: Microsoft Windows 10 x64 Pro</li>
							<li>웹서버: Apache Tomcat 8.5.57</li>
							<li>DB: MariaDB 10.5.5</li>
							<li>Java: 1.8.0_261</li>
						</ul>
						<ul>
							<li>IDE: Eclipse IDE for Enterprise Java Developers (2020-06)</li>
							<li>사용된 언어: English, Korean(UTF-8), HTML, JSP, Javascript</li>
						</ul>
	            	</td>
	            </tr>
			</table>
			
		</div>
	</body>
</html>