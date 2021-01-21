<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">	
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
				<a class="nav-link btn btn-Info" href="/mall-admin/notice/noticeList.jsp">[공지관리]
			</a>
			<!-- < %request.getContent% > --></li>
			<li class="nav-item">
			<a class="nav-link btn btn-Info" href="/mall-admin/member/memberList.jsp">[회원관리]</a>
			<!-- < %request.getContent% > -->
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="nav-item">
				<a class="nav-link btn btn-Info"><%=(session.getAttribute("loginAdminId"))%>님 반갑습니다.</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn btn-Info" href="/mall-admin/logoutAction.jsp">로그아웃</a>
			</li>
		</ul>
	</div>
</nav>