<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->
	<div class="container"> 
	<%
		//변수
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		//DB에서 값을 불러옴.
		Notice notice = new NoticeDao().selectNoticeOne(noticeId);
	%>
		<h1>공지사항 상세보기</h1>
		<table class="table table-dark table-striped table-hover"> <!-- border= 테이블에 선을 긋는 코드/ -->
			<tr>
				<td>notice_id</td>
				<td><%=notice.getNoticeId() %></td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><%=notice.getNoticeTitle() %></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><%=notice.getNoticeContent() %></td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td><%=notice.getNoticeDate() %></td>
			</tr>
			<tr>
				<td><a href="updateNoticeForm.jsp?noticeId=?<%=notice.getNoticeId() %>">[수정]</a></td>
				<td><a href="deleteNoticeAction.jsp?noticeId=<%=notice.getNoticeId()%>">[삭제]</a></td>
			</tr>
		</table>
	</div>
</body>
</html>