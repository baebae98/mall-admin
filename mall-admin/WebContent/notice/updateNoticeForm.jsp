<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
</head>
<!-- w3school.com 사이트에서 가져온 부트스트랩 코드 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#noticeTitle").val().length<1){ //공지사항 제목 유효성 검사
				alert("공지사항 제목을 입력하시오");
				$("#noticeTitle").focus(); //유효성 검사가 실행되면 커서를 공지사항 제목쪽으로 이동	
				return;
			}else if($("#noticeContent").val().length<1){
				alert("공지사항 내용을 입력하시오");
				$("#noticeContent").focus();//유효성 검사가 실행되면 커서를 공지사항 내용으로 이동
				return;
			}
				$("#updateForm").submit();
		});
	});
</script>
<body>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");

	//DB에서 데이터를 받아옴
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String noticeDate = request.getParameter("noticeDate");
	
	//DB에서 데이터를 받아오기 위해 DAO를 사용
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeId);
%>
 <div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
 	<h1>공지사항 수정</h1>
 	<form method="post" action="/mall-admin/notice/updateNoticeAction.jsp" id="updateForm">
 	<table class="table table-dark table-striped table-hover">
 		<tr>
 			<td>notice_id</td>
 			<td><input type="text" name="noticeId" value="<%=notice.getNoticeId() %>" readonly ="readonly"></td>
 		</tr>
 		<tr>
 			<td>notice_title</td>
 			<td><input type="text" name="noticeTitle" value="<%=notice.getNoticeTitle() %>" id="noticeTitle"></td>
 		</tr>
 		<tr>
 			<td>notice_content</td>
 			<td><input type="text" name="noticeContent" value="<%=notice.getNoticeContent() %>" id="noticeContent"></td>
 		</tr>
 		<tr>
 			<td>notice_date</td>
 			<td><input type="text" name="noticeDate" value="<%=notice.getNoticeDate()%>" readonly="readonly"></td>
 		</tr>
 	</table>
 	<div>
 		<button type="button" class="btn btn-danger" id="btn">수정</button>
 		<a href="/mall-admin/notice/noticeList.jsp">돌아가기</a>
 	</div>
	</form>
</div>
</body>
</html>