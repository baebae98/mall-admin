<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("loginAdminId") != null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/index.jsp");	// 로그인이 되어있으면 index.jsp로 이동
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login.jsp</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- jQuery를 이용하여 Form 유효성 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$("#btn").click(function() {	// 버튼 클릭시 폼 내용의 유효성 검사를 수행
					if ($("#adminId").val() == "") {	// adminId 공백인 경우 수행
						alert("아이디를 입력해주세요");
						return;
					} else if ($("#adminPw").val() == "") {	// adminPw 공백인 경우 수행
						alert("비밀번호를 입력해주세요");
						return;
					}
					$("#loginForm").submit();
				});	
			});
		</script>
	</head>
	<body>
		<div class="container">
		
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="navbar-brand" href="#">Goodee Shop&nbsp;<font size="2">[관리자]</font></a>
					</li>
				</ul>
			</nav>
		
			<div class="jumbotron">
			<div align="center">
				<h1>Mall-admin 로그인</h1>
				<h4>쇼핑몰 어드민</h4>
			</div>
		</div>
		
			<form method="post" action="<%=request.getContextPath() %>/loginAction.jsp" id="loginForm">
				<div align="center">
				<table style="margin-top: 30px">
					<tr>
						<td>관리자 ID: </td>
						<td>
							<input type="text" class="form-control" name="adminId" placeholder="아이디" value="admin@goodee.com" id="adminId">
						</td>
					</tr>
					<tr>
						<td>관리자 PW: </td>
						<td>
							<input type="password" class="form-control" name="adminPw" placeholder="비밀번호" value="1234" id="adminPw">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="2">
							<button type="button" class="btn btn-danger btn-block" id="btn">로그인</button>
						</td>
					</tr>
				</table>
				</div>
			</form>
			
			<br><br>
		</div>
	</body>
</html>