<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

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
		<title>noticeOne.jsp</title>
		
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
		<%
			int noticeId = Integer.parseInt(request.getParameter("noticeId"));
			System.out.println("noticeId: " + noticeId);	// noticeId 디버깅
			
			Notice notice = new NoticeDao().selectNoticeOne(noticeId); // 하나의 메소드만 호출할 때 사용
			System.out.println(notice);
		%>
		
		<div class="container">
		
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>공지사항 조회</h1>
				<p>공지사항을 확인하는 페이지입니다. 공지사항 조회, 수정, 삭제가 가능합니다.</p>
			</div>
			
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<td>번호</td>
					<td><%=notice.getNoticeId() %></td>
				</tr>
				<tr>
					<td>게시일자</td>
					<td><%=notice.getNoticeDate() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=notice.getNoticeTitle() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><%=notice.getNoticeContent() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-info" onclick="location.href='<%=request.getContextPath() %>/notice/noticeUpdateForm.jsp?noticeId=<%=noticeId %>'">수정</button>
						&nbsp;
						<button type="button" class="btn btn-danger" onclick="location.href='<%=request.getContextPath() %>/notice/noticeDeleteAction.jsp?noticeId=<%=noticeId %>'">삭제</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>