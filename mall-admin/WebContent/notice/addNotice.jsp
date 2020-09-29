<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
		<h1>공지사항 추가</h1>
		<form method="post" action="/mall-admin/notice/addNoticeAction.jsp">
			<table class="table table-dark table-striped table-hover">
				
				<tr>
					<td>notice_title</td>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<td>notice_content</td>
					<td><input type="text" name="noticeContent"></td>
				</tr>
				<tr>
					<td><button type="submit" class="btn btn-danger">입력</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>