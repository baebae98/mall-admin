<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"><!--w3school.com 사이트에서 가져옴  -->
<body>
<div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->
<%
	//페이징
	int currentPage = 1; //현재 페이지
	int endPage = 0; // 마지막 페이지
	//페이지 값
	if(request.getParameter("currentPage") !=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> list = categoryDao.selectCategoryList(currentPage);
	
	//Dao 클래스에서 최대 페이지 값 메소드 호출
	endPage = categoryDao.getCategoryEndPage();
	
	
%>

<%

%>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>categoryList</h1>
	<div>
		<a href="/mall-admin/category/addCategory.jsp">[상품카테고리 추가]</a>
	</div>
	
	<table class="table table-dark table-striped table-hover" >
		<thead>
			<tr>
				<th>category_id</th>
				<th>category_name</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list){
			%>
			<tr>
				<td><%=c.getCategoryId() %></td>
				<td><%=c.getCategoryName() %></td>
				<td><a href="updateCategoryForm.jsp?no=<%=c.getCategoryId()%>">수정</a></td>
				<td><a href="deleteCategoryAction.jsp?no=<%=c.getCategoryId()%>">삭제</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<!-- 페이징 -->
	<ul class="pagination">
		
			<%
				// 현재 페이지가 1페이지 보다 클 시
				if(currentPage > 1){
			%>
					<li class="page-item"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=1">처음</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage-1 %>">이전</a></li>
			<%
				// 현재 페이지가 1페이지 일 시
				}else{
			%>
				
			<%
				}// 현재 페이지q
			%>
				
					<li class="page-item " ><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage%>"><%=currentPage %></a></li>
			<%
				// 현재 페이지가 마지막 페이지보다 작을 시
				if(currentPage < endPage){
			%>
					<li class="page-item"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage+1 %>">다음</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=endPage %>">맨끝</a></li>
			<%
				// 현재 페이지가 마지막 페이지 일 시
				}else{
			%>
					
			<%
				}
			%>	
	</ul>
	</div>
</body>
</html>