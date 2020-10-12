<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//접속한 세션 지워주는 코드(갱신)
	session.invalidate();
	//지우면 로그인창으로 돌아감
	response.sendRedirect("/mall-admin/login.jsp");
%>
