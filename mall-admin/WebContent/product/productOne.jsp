<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품상세보기</title>

</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<!-- 컨테이너~얘도 부트스트랩에서 가져옴 -->
	<div class="container"> 
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	//디버깅
	System.out.println(productId+"<--productId");
	Product product = new ProductDao().selectProductOne(productId); //코드가 짧아짐  
	
	
%>
	<h1>상품 상세보기</h1>
	<a href="/mall-admin/product/productList.jsp">[목록으로]</a>
	<table class="table table-dark table-striped table-hover"> <!-- border= 테이블에 선을 긋는 코드/ -->
		<tr>
			<th>product_pic</th>
			<td><img src="/mall-admin/image/<%=product.getProductPic()%>"><a href="/mall-admin/product/modifyProductPic.jsp?productId=<%=product.getProductId()%>">수정</a></td>
		</tr>
		
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId() %></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName() %></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.getCategoryId()%></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPic() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td>
				<%
					if(product.getProductSoldout().equals("Y")) {
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[품절]</a>
				<%	
					} else {
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[판매중]</a>
				<%		
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a href="updateProductForm.jsp?productId=<%=product.getProductId()%>">[수정]</a></td>
			<td><a href="deleteProductActon.jsp?no=<%=product.getProductId()%>">[삭제]</a></td>
		</tr>
	</table>
	</div>
</body>
</html>