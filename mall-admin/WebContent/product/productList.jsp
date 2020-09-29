<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	//위에 소스코드 치고 들어가는걸 방지 하기위함? 보안 떄문에 쓰는 코드
	//로그인 아이디가 =null이면 로그인페이지로 이동
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
	}else /*if(session.getAttribute("loginAdminId")!=null){
	//로그인 아이디가 null이 아니면 페이지로 이동
	response.sendRedirect("/mall-admin/index.jsp");
	return; //코드 실행이 다되면 종료시켜주는 코드
	}*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 어드민페이지</title>
<!--w3school.com 사이트에서 가져옴  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container"> <!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->	
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		//인코딩
		request.setCharacterEncoding("UTF-8");
		//카테고리번호//카테고리 검색을 위해 request의 parameter에서 받아옴
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		//페이징코드
				int currentPage = 1; //현재페이지
				int rowPage = 10; //페이지당 출력 개수
				int endPage = 0; //마지막 페이지
				//페이지값
				if(request.getParameter("currentPage")!=null){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
		//상품을 출력하기 위해 Dao사용함
		ProductDao productDao = new ProductDao();
		//JSP 페이지 쿼리로 받아온 cateogryId로 검색 조건을 결정함
		//-1을 받아오면 전체리스트 출력, 이외에는 categoryId에 해당하는 상품만 출력
		ArrayList<Product> productList = null;
		if(categoryId == -1){		
			productList = productDao.selectProductList(currentPage);
		}else{
			productList = productDao.selectProductListByCategoryId(categoryId, currentPage);
		}
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	
	<h1>상품 목록</h1>
	<div>
		<a href="/mall-admin/product/productList.jsp">[목록으로]</a>
		<%
		int i = 0;
			for(Category c : categoryList) {
				i++;
		%>
				<a href="/mall-admin/product/productList.jsp?categoryId=<%=c.getCategoryId()%>">
					[<%=c.getCategoryName()%>]
				</a>
		<%		
		if(i%5==0){
		%>
		
		<br>
		<%	
				}
			}
		%>
	</div>
	
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList) {
					if(p.getProductSoldout().equals("Y")) {
			%>
						<tr>
							<td><del><a href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></del></td>
							<td><del><%=p.getCategoryId()%></del></td>
							<td><del><%=p.getProductName()%></del></td>
							<td><del><%=p.getProductContent() %></del></td>
							<td><del><%=p.getProductPrice()%></del></td>
							<td>품절</td>
							<td><a href="updateProductForm.jsp?productId=<%=p.getProductId()%>">수정</a></td>
							<td><a href="deleteProductActon.jsp?no=<%=p.getProductId()%>">삭제</a></td>
						</tr>	
			<%			
					} else {
						
			%>
						<tr>
							<td><a href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></td>
							<td><%=p.getCategoryId()%></td>
							<td><%=p.getProductName()%></td>
							<td><%=p.getProductContent() %></td>
							<td><%=p.getProductPrice()%></td>
							<td>판매중</td>
							<td><a href="updateProductForm.jsp?productId=<%=p.getProductId()%>">수정</a></td>
							<td><a href="deleteProductActon.jsp?no=<%=p.getProductId()%>">삭제</a></td>
						</tr>	
			<%
					}
				}
			%>
		</tbody>
	</table>
	<div>
	<a href="/mall-admin/product/addProduct.jsp">상품추가</a>
	</div>
	<!-- 페이징 -->
	<table border="1">
	<tr>
	
	<%
		//현재 페이지가 1보다 클 때
		if(currentPage > 1){
	%>
		<td><a href="/mall-admin/category/categoryList.jsp?currnetPage=1">처음</a></td>
		<td><a href="/mall-admin/category/categoryList.jsp?currnetPage=<%=currentPage%>">이전</a></td>
	<%
		//현재 페이지가  마지막 페이지보다 작을 때는..
		}else{
	%>
		<!-- 테이블 크기 조정 -->
		<td style="width:30px"></td>
		<td style="width:30px"></td>
	<%
		}//현재페이지
	%>
		<th style="width:30px"><%=currentPage %></th>
	<%
		//현재 페이지가 마지막 페이지보다 작을떄
		if(currentPage<endPage){
	%>
		<td><a href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage+1%>">다음</a></td>
		<td><a href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage%>">마지막</a></td>
	<%
		}else{
	%>
		<!-- 테이블 크기 조정 -->
		<td style="width:30px"></td>
		<td style="width:30px"></td>
	<%
		}
	%>
	</tr>
	</table>
	</div>
</body>
</html>