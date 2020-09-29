<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������</title>
</head>
<!-- w3school.com ����Ʈ���� ������ ��Ʈ��Ʈ�� �ڵ� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<body>
<%
	//���� ���ڵ�
	request.setCharacterEncoding("utf-8");
	
	//DB���� �����͸� �޾ƿ�.
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productName = request.getParameter("productName");
	String productPrice = request.getParameter("productPrice");
	String productContent = request.getParameter("productContent");
	
	//DB���� �����͸� �޾ƿ��� ���� DAO�� ���
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
	
	
%>
 <div class="container"> <!-- �����̳�~�굵 ��Ʈ��Ʈ������ ������ -->	
<h1>�����ϱ�</h1>
<form method="post" action="/mall-admin/product/updateProductAction.jsp">
<table class="table table-dark table-striped table-hover">
	<tr>
		<td>product_id</td><!-- readonly ó���� �Ͽ� �б⸸ �����ϰ� ��. �����Ұ� -->
		<td><input type="text" name="productId" value="<%=product.getProductId()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>product_name</td>
		<td><input type="text" name="productName" value="<%=product.getProductName()%>"></td>
	</tr>
	<tr>
		<td>product_price</td>
		<td><input type="text" name="productPrice" value="<%=product.getProductPrice()%>"></td>
	</tr>
	<tr>
		<td>product_content</td>
		<td><input type="text" name="productContent" value="<%=product.getProductContent()%>"></td>
	</tr>
</table>
<div>
	<button type="submit" class="btn btn-danger">����</button>
	<a href="/mall-admin/product/productList.jsp">���ư���</a>
</div>
</form>
</div>
</body>
</html>