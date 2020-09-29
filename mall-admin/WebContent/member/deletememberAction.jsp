<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//utf-8로 인코딩 통일 
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	Member member = new Member();
	member.setMemberEmail(memberEmail);
	
	//DAO에서 DB가져옴.
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(member);
	
	//삭제 완료하면 다시 리스트로
	response.sendRedirect("/mall-admin/member/memberList.jsp");
%>