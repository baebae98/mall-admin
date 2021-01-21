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
		<title>updateNoticeForm.jsp</title>
		
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
			// 요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			// noticeId 파라미터를 받아온다
			int noticeId = Integer.parseInt(request.getParameter("noticeId"));
			System.out.println("noticeId: " + noticeId);	// noticeId 디버깅
			
			Notice notice = new NoticeDao().selectNoticeOne(noticeId); // 하나의 메소드만 호출할 때 사용
		%>
		
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>공지사항 수정</h1>
				<p>공지사항을 수정하는 페이지입니다. 수정할 내용을 입력해주세요.</p>
			</div>
			
			<br>
		
			<div>
				<form method="post" action="<%=request.getContextPath() %>/notice/noticeUpdateAction.jsp">
					<table class="table table-striped" style="text-align: center">
						<tr>
							<td>번호</td>
							<td><input type="text" class="form-control" name="noticeId" value="<%=notice.getNoticeId() %>" readonly="readonly"></td>
						</tr>
						<tr>
							<td>게시일자</td>
							<td><input type="text" class="form-control" name="noticeDate" value="<%=notice.getNoticeDate() %>" readonly="readonly"></td>
						</tr>	
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" name="noticeTitle" value="<%=notice.getNoticeTitle() %>"></td>
						</tr>					
						<tr>
							<td>내용</td>
							<td><textarea class="form-control" name="noticeContent"><%=notice.getNoticeContent() %></textarea>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" class="btn btn-dark">공지사항 수정</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<br><br>
		</div>
	</body>
</html>