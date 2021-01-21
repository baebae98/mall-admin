<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	// 인코딩은 UTF-8로
	request.setCharacterEncoding("UTF-8");
	
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	
	Admin paramAdmin = new Admin(); // 파라미터로 넘겨주는 객체
	paramAdmin.setAdminId(adminId);
	paramAdmin.setAdminPw(adminPw);
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paramAdmin);
	
	if (loginAdmin != null) { // ID와 PW의 일치여부
		// 로그인 정보를 Session에 저장
		session.setAttribute("loginAdminId", loginAdmin.getAdminId());	// 세션에 로그인 성공한 adminId를 저장
		
		// 로그인 성공시 index.jsp로 이동
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	else {	// 로그인에 실패했을 경우
		%>
			<script>
				alert("아이디 혹은 비밀번호가 틀렸습니다.\n다시 한 번 확인해주세요.");
				history.back();	// 로그인 실패시 이전 페이지로 이동
			</script>
		<%
	}
%>