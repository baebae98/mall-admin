<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

<%
	if (session.getAttribute("loginAdminId") == null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>

<%
	//요청 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// memberEmail 파라미터를 받아온다.
	String memberEmail = request.getParameter("memberEmail");
	
	Member member = new Member();	// Member 데이터 타입을 생성
	member.setMemberEmail(memberEmail);
	
	MemberDao memberDao = new MemberDao();
	memberDao.updateMemberSubscription(member); // Member 타입의 memberEmail, memberScbscription을  updateMemberSubscription 메소드를 통해 처리한다.
	
	response.sendRedirect(request.getContextPath() + "/member/memberOne.jsp?memberEmail=" + memberEmail); // 페이지 이동
%>