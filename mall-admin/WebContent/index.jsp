<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%
	//로그인이 아이디가 = null이면  로그인페이지로 이동
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;//위 코드 실행하고 끝내주는 코드, 안쓰게 되면 밑에 코드  실행됨.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"><!--w3school.com 사이트에서 가져옴  -->
</head>
<body>
<div class="container-fluid jumbotron text-center"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
   <h1>관리자 메인 페이지</h1>
   <p><%=(session.getAttribute("loginAdminId"))%>님 반갑습니다.</p>
   	<div>
      <jsp:include page="/inc/menu.jsp"></jsp:include>
  	</div> 
  	
  	<br/>이 프로그램은 모델1과 메서드 활용에 익숙해지기 위해 제작된 프로그램이며<br/>
  	<strong>개발환경</strong>으로는 자바이클립스IDE와 HeidiSQL(mariaDB)를 이용하였습니다.<br/>
 	<strong><br/>
 	(전체 페이징은 시간남으면 구현)</strong>

	<strong>-상품관리:수정,-클리어</strong><br/>

	<strong>-주문관리:수정,-클리어</strong><br/>

	<strong>-공지관리:삭제,수정,상세보기 추가-클리어 (수정페이지 :시간 수정해야함.)</strong><br/>

	<strong>-회원관리:삭제 - 클리어</strong><br/>

	
  
  	<div class="container text-center">
  		 <img src="./image/2.jpg"> <img src="./image/1.jpg">
  	</div>
  	</div>
</body>
</html>