package commons;
import java.sql.*;

/*
 * DBUtil�� �ݺ��Ǵ� ����,����̹���������,db������ ���ϰ� ª�� �������� ���� �޼����̴�. 
 */
public class DBUtil {
   public Connection getConnection() throws Exception{
      //db ���� ����
      String driver = "org.mariadb.jdbc.Driver";
      String dbaddr = "jdbc:mariadb://localhost:3306/mall";
      String dbid = "root";
      String dbpw = "java1004";
                           
      //����̹� ��������
      Class.forName(driver);
               
      //db����
      Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);
      return conn;
   }
}