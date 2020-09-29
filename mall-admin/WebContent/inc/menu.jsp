<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	
	<!--w3school.com 사이트에서 가져옴  -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<nav class="navbar navbar-expand-sm bg-light bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link btn btn-Success" href="/mall-admin/index.jsp">[홈으로]</a>		
		</li>
		<li class="nav-item">
		<a class="nav-link btn btn-Warning" href="/mall-admin/category/categoryList.jsp">[상품 카테고리 관리]</a>
		</li>
		<li class="nav-item">
			<a class="nav-link btn btn-Info" href="/mall-admin/product/productList.jsp">[상품관리]</a>
		</li>
		<li class="nav-item">
			<a class="nav-link btn btn-Info" href="/mall-admin/orders/ordersList.jsp">[주문관리]</a>
		</li>
		<li class="nav-item">
			<a class="nav-link btn btn-Info" href="/mall-admin/notice/noticeList.jsp">[공지관리]</a><!-- < %request.getContent% > -->
		</li>
		<li class="nav-item">
			<a class="nav-link btn btn-Info" href="/mall-admin/member/memberList.jsp">[회원관리]</a><!-- < %request.getContent% > -->
		</li>
		<li class="nav-item">
			<a class="nav-link btn btn-Info" href="/mall-admin/logoutAction.jsp">로그아웃</a>
		</li>
	</ul>
	</nav>