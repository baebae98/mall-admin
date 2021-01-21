<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
			//console.log("ready"); //디버깅 코드
		$("#btn").click(function(){
			//console.log("click"); //디버깅 코드
			if($("#noticeTitle").val().length<1){ //공지사항 제목 유효성 검사
			alert("공지사항 제목을 입력하시오");
			$("#noticeTitle").focus(); //유효성 검사가 실행되면 커서를 공지사항 제목쪽으로 이동	
			return;
		}else if($("#noticeContent").val().length<1){
			alert("공지사항 내용을 입력하시오");
			$("#noticeContent").focus();//유효성 검사가 실행되면 커서를 공지사항 내용으로 이동
			return;
		}
			$("#addForm").submit();
			
		});
	})
</script>
</head>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<div class="jumbotron">
		<div class="container">
			<h1>공지사항 추가</h1>
		</div>
	</div>
	<div class="container">
	<form method="post" action="/mall-admin/notice/addNoticeAction.jsp" id="addForm">
			<table class="table table-dark table-striped table-hover">
				
				<tr>
					<td>notice_title</td>
					<td><input class="form-control" type="text" name="noticeTitle" id="noticeTitle"></td>
				</tr>
				<tr>
					<td>notice_content</td>
					<td><textarea class="form-control" rows="5"  name="noticeContent" id="noticeContent"></textarea></td>
				</tr>
				<tr>
					<td><button type="button" id="btn" class="btn btn-danger">입력</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>