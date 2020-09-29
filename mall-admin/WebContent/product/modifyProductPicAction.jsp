<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><!-- 외부라이브러리 사용 -->
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//1. 상품아이디와 이미지파일을 받는다.
	//2. 이미지파일을 서버 /images 폴더에 새로운이름으로 저장
	//3. 저장된 이미지의 이름을 상품테이블에서 수정한다. ex)default.jpg - > 새로생선된 사진이름으로
	//request.getparameter 는 url 인코딩을 넘길떄만 사용할 수 있는 api
	//현재폼은 다른 데이터폼을 사용하여 못넘김 이코드로는 그래서 밑에 두 코드는 null값
	//String productId = request.getParameter("productId"); //null값
	//String productPic = request.getParameter("productPic");//null값
	//출력코드 --테스트용
	//System.out.println(productId+"<--productId");
	//System.out.println(productPic+"<--productPic");
	
	//cos.jar 외부라이브러리 사용(내부 라이브러리 사용도 가능하지만 사용방법이 복잡함.)//cos는 자동으로 저장해줌.//파일 이름을 만들어주는 객체
	DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();
	int size= 1024 * 1024 *100; //파일 크기 100M
	String path = application.getRealPath("image");//이미지폴더의 실제위치로 찾아주는 코드 //D:\javawork\mall-admin\WebContent\image
	MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",dfp); //dfp 대신  new DefaultFileRenamePolicy();넣어도됨
	int productId =Integer.parseInt(multi.getParameter("productId")); //multi.getParameter("productId");
	System.out.println(productId+"<--productId");//출력되는지 테스트
	//System.out.println(multi.getOriginalFileName("productPic")+"<--파일원본이름");//출력되는지 테스트
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")+"<--새로생성된 이름");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	// update product set product_pic =? where product_id=?
	// productDAO.updateProductPic(product);
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	
	//위에 코드 정상실행되면 다시 리스트로
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>
