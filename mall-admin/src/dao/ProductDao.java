package dao;
import java.sql.*;
import java.util.*;
import vo.*;
import commons.*;
public class ProductDao {
   
	 //상품 수정 메서드
    public void updateProduct(Product product) throws Exception{
       //DBUTIL..
       DBUtil dbUtil = new DBUtil();
       Connection conn = dbUtil.getConnection();
       //sql문
      String sql ="update product set product_name = ?, product_price = ?, product_content = ? where product_id = ?";
       //
       PreparedStatement stmt = conn.prepareStatement(sql);
       stmt.setString(1, product.getProductName());
       stmt.setInt(2, product.getProductPrice());
       stmt.setString(3, product.getProductContent());
       stmt.setInt(4, product.getProductId());
       //
       stmt.executeLargeUpdate();
    }
	
	//soldout 수정 추가메서드
   public void updateProductSoldout(int productId,String productSoldout) throws Exception {
      //DBUTIL..
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      //SQL문
      String sql = "update product set product_soldout = ? where product_id = ?";
      PreparedStatement stmt = conn.prepareStatement(sql);
      if(productSoldout.equals("Y")) {
         stmt.setString(1, "N");
      }else {
         stmt.setString(1, "Y");
      }
      stmt.setInt(2, productId);
      stmt.executeUpdate();
      //
      //int row = stmt.executeUpdate();
      //System.out.println();
   }
   
   //상품 상세보기
   public Product selectProductOne(int productId) throws Exception{
      Product product = null;
      //DBUTIL..
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
       //SQL
      String sql = "select * from product where product_id = ?";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setInt(1, productId);
      ResultSet rs = stmt.executeQuery();
      if(rs.next()) {
         product = new Product();
         /*product.productId = rs.getInt("product_id");
         product.categoryId = rs.getInt("category_id");
         product.productName = rs.getString("product_name");
         product.productPrice = rs.getInt("product_price");
         product.productContent = rs.getString("product_content");
         product.productSoldout = rs.getString("product_soldout");
         product.productPic = rs.getString("product_pic"); //default.jpg*/
         product.setProductId(rs.getInt("product_id"));
         product.setCategoryId(rs.getInt("category_id"));
         product.setProductName(rs.getString("product_name"));
         product.setProductPrice(rs.getInt("product_price"));
         product.setProductContent(rs.getString("product_content"));
         product.setProductSoldout(rs.getString("product_soldout"));
         product.setProductPic(rs.getString("product_pic"));
      }
      conn.close();
      return product;
   }
   //상품 입력 메서드
   public void insertProduct(Product product) throws Exception {
	    //DBUTIL...
	    DBUtil dbUtil = new DBUtil();
      	Connection conn = dbUtil.getConnection();
         //SQL
         String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) values(?,?,?,?,?)";
         PreparedStatement stmt = conn.prepareStatement(sql);
         stmt.setInt(1, product.getCategoryId());
         stmt.setString(2, product.getProductName());
         stmt.setInt(3, product.getProductPrice());
         stmt.setString(4, product.getProductContent());
         stmt.setString(5, product.getProductSoldout());
         //실행
         stmt.executeLargeUpdate();
   }
   //상품 목록 메서드
   public ArrayList<Product> selectProductList(int currentPage) throws Exception {
         ArrayList<Product> list = new ArrayList<Product>();
         
         //db 
         String driver = "org.mariadb.jdbc.Driver";
         String dbaddr = "jdbc:mariadb://localhost:3306/mall";
         String dbid = "root";
         String dbpw = "java1004";
         Class.forName(driver);
         Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);
         //SQL
         String sql = "select product_id, category_id, product_name, product_price, product_soldout from product order by product_id desc limit ?, ?";
         PreparedStatement stmt = conn.prepareStatement(sql);
         stmt.setInt(1, (currentPage-1)*10);
         stmt.setInt(2, 10);
         ResultSet rs = stmt.executeQuery();
         while(rs.next()) {
            Product p = new Product();
           //p.productId = rs.getInt("product_id");
           //p.categoryId = rs.getInt("category_id");
           //p.productName = rs.getString("product_name");
           //p.productPrice = rs.getInt("product_price");
           //p.productSoldout = rs.getString("product_soldout");
           p.setProductId(rs.getInt("product_id"));
         p.setCategoryId(rs.getInt("category_id"));
         p.setProductName(rs.getString("product_name"));
         p.setProductPrice(rs.getInt("product_price"));      
         p.setProductSoldout(rs.getString("product_soldout"));
            list.add(p);
         }
         //사용다했으면 종료 시켜주는 코드
         conn.close();
         return list;   
      }
   
   public ArrayList<Product> selectProductListByCategoryId(int categoryId, int currentPage) throws Exception {
         ArrayList<Product> list = new ArrayList<Product>();
         
         //DB주소,포트,아이디,비번
         String driver = "org.mariadb.jdbc.Driver";
         String dbaddr = "jdbc:mariadb://localhost:3306/mall";
         String dbid = "root";
         String dbpw = "java1004";
         Class.forName(driver);
         Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);
         //SQL
         String sql = "select product_id, category_id, product_name, product_price, product_soldout from product where category_id = ? order by product_id desc limit ?, ?";
         PreparedStatement stmt = conn.prepareStatement(sql);
         stmt.setInt(1, categoryId);
         stmt.setInt(2, (currentPage-1)*10);
         stmt.setInt(3, 10);
         ResultSet rs = stmt.executeQuery();
         
         while(rs.next()) {
            Product p = new Product();
           //p.productId = rs.getInt("product_id");
           //p.categoryId = rs.getInt("category_id");
           //p.productName = rs.getString("product_name");
           // p.productPrice = rs.getInt("product_price");
           // p.productSoldout = rs.getString("product_soldout");
           p.setProductId(rs.getInt("product_id"));
         p.setCategoryId(rs.getInt("category_id"));
         p.setProductName(rs.getString("product_name"));
         p.setProductPrice(rs.getInt("product_price"));      
         p.setProductSoldout(rs.getString("product_soldout"));
            list.add(p);
         }
         
         conn.close();//사용다햇으면 종료
         return list;   
      }
   //상품 삭제 메서드
    public void deleteProduct(Product product) throws Exception{
      
       DBUtil dbUtil = new DBUtil();
       Connection conn = dbUtil.getConnection();
       
       String sql ="delete from product where product_id=?";
      
       PreparedStatement stmt = conn.prepareStatement(sql);
       stmt.setInt(1, product.getProductId());
     
       stmt.executeLargeUpdate();
    }
   //페이징메서드
       public int getProductEndPage() throws Exception{
         
          int endPage = 1;
       
          DBUtil dbUtil = new DBUtil();
          Connection conn = dbUtil.getConnection();
          String sql = "select count(*) from product"; 
        
          PreparedStatement stmt = conn.prepareStatement(sql);
          ResultSet rs = stmt.executeQuery();
          
          if(rs.next()) {
             endPage = rs.getInt("count(*)");
             if(endPage%10 == 0) {
                endPage = (int)(endPage/10);
             }else {
                endPage = (int)(endPage/10) + 1;
             }
          }
       
       
       conn.close();
       return endPage;

    }
      //페이징메서드
       public int getProductEndPage(int categoryId) throws Exception{
        
          int endPage = 1;
      
          DBUtil dbUtil = new DBUtil();
          Connection conn = dbUtil.getConnection();
          String sql = "select count(*) from product where category_id = ?"; 
         
          PreparedStatement stmt = conn.prepareStatement(sql);
          stmt.setInt(1, categoryId);
          ResultSet rs = stmt.executeQuery();
          
          if(rs.next()) {
             endPage = rs.getInt("count(*)");
             if(endPage%10 == 0) {
                endPage = (int)(endPage/10);
             }else {
                endPage = (int)(endPage/10) + 1;
             }
          }
       
       
       conn.close();
       return endPage;

    }
     //사진 수정 메서드
     public void updateProductPic(Product product)throws Exception{
    	 //DBUtil..
    	 DBUtil dbUtil =new DBUtil();
    	 Connection conn = dbUtil.getConnection();
    	 //sql
    	 String sql="update product set product_pic =? where product_id=?";
    	 PreparedStatement stmt= conn.prepareStatement(sql);
    	 stmt.setString(1, product.getProductPic());
    	 stmt.setInt(2, product.getProductId());
    	 stmt.executeUpdate();
    	 //사용다하면 종료시켜주는 코드
    	 conn.close();
     }
   }