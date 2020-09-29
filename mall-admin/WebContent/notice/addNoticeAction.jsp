<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//공지사항 추가 액션페이지
	
	//UTF-8로 통일
	request.setCharacterEncoding("utf-8");
	//int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle= request.getParameter("noticeTitle");
	String noticeContent=request.getParameter("noticeContent");
	//String noticeDate = request.getParameter("noticeDate");
	
	Notice notice = new Notice();
	//notice.setNoticeId(noticeId);
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	//notice.setNoticeDate(noticeDate);
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	
	//정상작동되면 다시 리스트로
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
%>