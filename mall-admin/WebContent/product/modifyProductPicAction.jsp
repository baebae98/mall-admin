<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

<%
	if (session.getAttribute("loginAdminId") == null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>

<%
	// productId, productPic를 파라미터로 받음
	// 이미지 파일을 서버의 /image 폴더에 새로운 이름으로 저장.
	// 저장된 이미지의 이름을 상품 테이블에서 수정 ex) default.jpg -> 새로 업로드한 이미지의 이름으로 변경

	/*
	String productId = request.getParameter("productId");	// 상품 고유번호
	String productPic = request.getParameter("productPic");	// 상품 이미지
	
	System.out.println("productId: " + productId);
	System.out.println("productPic: " + productPic);
	*/
	
	// cos.jar 라이브러리 사용
	
	//String path = application.getRealPath("WebContent\\image");
	String path = application.getRealPath("image");
	System.out.println("myPath: " + path); // 업로드 위치
	
	//String saveDirectory = config.getServletContext().getRealPath("WebContent/image");	// 업로드 위치
	//System.out.println("image: " + saveDirectory); // 업로드 위치
	
	int maxFileSize = 100 * 1024 * 1024; // 파일 최대크기 : 100MB
	
	//DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();	// 파일 이름 정책
		
	// request(요청받은 데이터), path(저장 디렉토리 지정), maxPostSize(파일 최대 크기), utf-8(인코딩 방법), dfp(파일 이름 정책)
	MultipartRequest multi = new MultipartRequest(request, path, maxFileSize, "utf-8", new DefaultFileRenamePolicy());
	int productId = Integer.parseInt(multi.getParameter("productId"));	// 상품 고유번호
	System.out.println(productId);
	
	//System.out.println(multi.getOriginalFileName("productPic")); // 업로드된 파일 이름
	
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")); // 새로 생성된 파일 이름
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	
	response.sendRedirect(request.getContextPath() + "/product/productOne.jsp?productId=" + productId); // 페이지 이동
%>