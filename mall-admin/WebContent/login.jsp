<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	//아이디가 null이 아니면 로그인 되어 있는 상태로 뜸.
if (session.getAttribute("loginAdminId") != null) {
	System.out.println("이미 로그인되어 있는 상태");
	response.sendRedirect("/mall-admin/index.jsp");
	return;//이 기능을 끝내기 위해 그러면 밑에 코드 실행x
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="jumbotron">
			<div align="center">
				<h1>Mall-admin 로그인</h1>
				<h4>쇼핑몰 어드민</h4>
			</div>
	</div>
	<form method="post" action="/mall-admin/LoginAction.jsp">
		<div align="center">
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자 로그인</h3>
			<table style="margin-top: 30px">
				<tr>
					<td>&nbsp;</td>
					<td>Admin ID&nbsp;</td>
					<td><input class="form-control" type="text" name="adminId" value="admin@goodee.com"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>Admin PW&nbsp;</td>
					<td><input class="form-control" type="password" name="adminPw" value="1234"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td colspan="2" style="padding-top: 20px">
						<button type="submit" class="btn btn-danger btn-block">로그인</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>