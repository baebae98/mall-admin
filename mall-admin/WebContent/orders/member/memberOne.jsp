<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

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
		<title>memberOne.jsp</title>
		
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
		
			String memberEmail = "";
			if (request.getParameter("memberEmail") != null) { // null인지 아닌지 체크
				memberEmail = request.getParameter("memberEmail");
			}
		
			
			Member member = new Member();
			member.setMemberEmail(memberEmail);
			
			MemberDao memberDao = new MemberDao();
			memberDao.selectMemberOne(member);
		%>
		
		<div class="container">
			
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>회원 정보</h1>
				<p>회원 정보를 확인하는 페이지입니다.</p>
			</div>
			
			<br><br>
			
			<table class="table table-hover" style="text-align: center">
				<%
					String memberName = member.getMemberName();
					String memberDate = member.getMemberDate();
					String memberSubscription = member.getMemberSubscription();
				%>
				<tr>
					<td>이름</td>
					<td><%=memberName %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=memberEmail %></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><%=memberDate %></td>
				</tr>
				<tr>
					<td>가입/탈퇴 여부</td>
					<td>
						<%
							if (memberSubscription.equals("Y")) {	// 가입되어있을 때
								%>정상가입<%
							} else {	// 탈퇴한 회원일 때
								%>탈퇴한 사용자<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>강제탈퇴</td>
					<td>
						<%
							if (memberSubscription.equals("Y")) {	// 가입되어있을 때
								%><button type="button" class="btn btn-danger btn-sm" onclick="location.href='<%=request.getContextPath() %>/member/memberDeleteAction.jsp?memberEmail=<%=memberEmail %>'">강제탈퇴</button><%
							} else {	// 탈퇴한 회원일 때
								%>탈퇴완료<%
							}
						%>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>