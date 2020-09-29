<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*"%>
<%@ page import = "dao.*"%>
<%
	//utf-8형식으로 통일
	request.setCharacterEncoding("utf-8");
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String noticeDate = request.getParameter("noticeDate");
	
	Notice notice = new Notice();
	//id 받아오기
	notice.setNoticeId(noticeId);
	//title 
	notice.setNoticeTitle(noticeTitle);
	//content
	notice.setNoticeContent(noticeContent);
	//date
	notice.setNoticeDate(noticeDate);
	//dao에 있는 업데이트 메소드를 이용하여 값을 보냄
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNotice(notice);
	//작업이 끝나면 다시 리스트로
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
%>
