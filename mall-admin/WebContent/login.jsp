<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//아이디가 null이 아니면 로그인 되어 있는 상태로 뜸.
	if(session.getAttribute("loginAdminId") !=null){
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<h1>관리자 로그인</h1>
	<form method="post" action="/mall-admin/LoginAction.jsp">
	
	<table class=" table-dark table-striped table-hover">
		<tr>
			<td>관리자ID</td>
			<td><input type="text" name="adminId"></td>
		</tr>
		<tr>
			<td>관리자PW</td>
			<td><input type="password" name="adminPw"></td>
		</tr>
	</table><br/>
	<button type="submit" class="btn btn-danger text-right" >로그인</button>
	
	</form>
</body>
</html>