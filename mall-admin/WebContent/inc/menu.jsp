<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item">
			<a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">Goodee Shop&nbsp;<font size="2">[관리자]</font></a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath() %>/index.jsp">HOME</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath() %>/category/categoryList.jsp">상품 카테고리 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath() %>/product/productList.jsp">상품 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath() %>/orders/ordersList.jsp">주문 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath() %>/notice/noticeList.jsp">공지 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath() %>/member/memberList.jsp">회원 관리</a>
		</li>
	</ul>
	
	<ul class="navbar-nav mr-right">
		<li class="nav-item">
			<font color="white"><%=session.getAttribute("loginAdminId") %></font><font color="gray">님 환영합니다.</font>
			&nbsp;
		</li>
		<li class="nav-item">
			<button type="button" class="btn btn-danger btn-sm" onclick="location.href='<%=request.getContextPath() %>/logoutAction.jsp'">로그아웃</button>
		</li>
	</ul>
</nav>