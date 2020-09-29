<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
   request.setCharacterEncoding("utf-8"); //글자 인코딩
   
   String adminId = request.getParameter("adminId");
   String adminPw = request.getParameter("adminPw");
   
   Admin paramAdmin = new Admin();
  // paramAdmin.adminId = adminId;
  // paramAdmin.adminPw = adminPw;
  	paramAdmin.setAdminId(adminId);
  	paramAdmin.setAdminPw(adminPw);
   
   AdminDao adminDao = new AdminDao();
   Admin loginAdmin = adminDao.login(paramAdmin);
   
   
   
   if(loginAdmin == null){
	   //아이디 또는 비밀번호 틀릴시'로그인실패'
	  // System.out.println("로그인 실패");
	   response.sendRedirect("/mall-admin/login.jsp");
	   
   }else{
	   //로그인 '성공'
	   System.out.println("로그인 성공");
	   
	   //로그인을 성공하면 로그인 정보를 session에 저장 
	   //session.setAttribute("loginAdminId", loginAdmin.adminId);//세션에 변수 만드는 방법 // setAttribute = 속성 :변수의 또다른 뜻
	   session.setAttribute("loginAdminId",loginAdmin.getAdminId());//세션에 캡슐화
	   
	   response.sendRedirect("/mall-admin/index.jsp"); //로그인 성공하면 메인화면으로 자동이동
   }
 
   /*
   	(page(우리가 처음사용하던것) < rquest(아직사용x) < session < application(전역))
   */
   
  %>
   
   
   
   
 <%
  /* //아이디 비밀번호 임시 지정
   String sysId = "admin";
   String sysPw = "1234";
   
   if(adminId.equals(sysId) && adminPw.equals(sysPw)) {
      response.sendRedirect("/mall-admin/index.jsp"); //로그인에 성공하면 인덱스로 이동
      
   } else   
      {response.sendRedirect("/mall-admin/login.jsp"); //실패했을 시 다시 로그인페이지로 
   }*/
%> 