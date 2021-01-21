<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>

<%
	//Session 보안코드 //비정상적인 들어오는것을 방지하기 위함.
	//로그인 아이디가 =null 이면 로그인페이지로 이동
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		
		return;//코드 실행이 다되면 종료시켜주는 코드
	}

	//수정쪽 시간 확인해야함.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판목록 어드민페이지</title>
<!--w3school.com 사이트에서 가져옴  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		//페이지 전체의 인코딩 통일 request에도 UTF-8사용
		request.setCharacterEncoding("utf-8");
		//noticeId 변수 설정
		int noticeId = -1;
		if(request.getParameter("noticeId") !=null){
		noticeId= Integer.parseInt(request.getParameter("noticeId"));
		}
		
		NoticeDao noticeDao = new NoticeDao();
	
	
		//리스트출력 변수,호출
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<div class="jumbotron">
		<div class="container">
			<h1>공지사항 목록</h1>
		</div>
	</div>
	<div class="container">
	<a href="/mall-admin/notice/addNotice.jsp">공지사항추가</a>
	<!--table  스타일: class=...... -->
	<table class="table table-dark table-striped table-hover">
	<thead>
		<tr>
			<th>notice_id</th> 		<!-- 게시판번호 -->
			<th>notice_title</th>	<!-- 게시판 제목 -->
			<th>notice_content</th> <!-- 게시판 내용 -->
			<th>notice_date</th> 	<!-- 게시판 올린시간 -->
			<th>수정</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<%
			for(Notice n : noticeList ){
		%>
		<tr>
			<td><a href="/mall-admin/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeId() %></a></td>
			<td><%=n.getNoticeTitle() %></td>
			<td><%=n.getNoticeContent() %></td>
			<td><%=n.getNoticeDate() %></td>
			<td><a href="updateNoticeForm.jsp?noticeId=<%=n.getNoticeId()%>">수정</a></td>
			<td><a href="deleteNoticeAction.jsp?noticeId=<%=n.getNoticeId()%>">삭제</a></td>
		</tr>
		<%
			}
		%>
	</tbody>
	</table>
	</div>
</body>
</html>