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

	// addNoticeForm으로부터 파라미터를 받아온다.
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	//System.out.println(noticeTitle);		// 공지 타이틀 디버깅
	//System.out.println(noticeContent);		// 공지 내용 디버깅
	
	Notice notice = new Notice();	// Notice 데이터 타입을 생성
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice); // Notice 타입의 noticeTitle, NoticeContent를 insertNotice 메소드를 통해 처리한다.
	
	response.sendRedirect(request.getContextPath() + "/notice/noticeList.jsp"); // 페이지 이동
%>