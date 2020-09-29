<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%@ page import="java.util.*" %>
<%
	//Session 보안코드 //비정상적인 들어오는것을 방지하기 위함.
		//로그인 아이디가 =null 이면 로그인페이지로 이동
		if(session.getAttribute("loginAdminId")==null){
			response.sendRedirect("/mall-admin/login.jsp");
			
			return;//코드 실행이 다되면 종료시켜주는 코드
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<!--w3school.com 사이트에서 가져옴  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	//인코딩방법
	request.setCharacterEncoding("utf-8");
	//회원 목록을 출력하기위해 Dao사용
	MemberDao memberDao = new MemberDao();
	
	//회원 목록 dao에서 출력
	ArrayList<Member> memberList = memberDao.selectMemberList();
%>
<!-- 메뉴바 -->
<div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>회원 목록</h1>
	<table class="table table-dark talbe-striped table-hover">
		<thead>
			<tr>
				<td>member_email</td>	<!-- 회원이메일 -->
				<td>member_pw</td>		<!-- 회원비번 -->
				<td>member_name</td>	<!-- 회원이름-->
				<td>member_date</td>	<!-- 회원가입날짜-->
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : memberList){
			%>
			<tr>
				<td><%=m.getMemberEmail() %></td>
				<td><%=m.getMemberPw()%></td>
				<td><%=m.getMemberName() %></td>
				<td><%=m.getMemberDate() %></td>
				<td><a href="deletememberAction.jsp?memberEmail=<%=m.getMemberEmail() %>">삭제</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>