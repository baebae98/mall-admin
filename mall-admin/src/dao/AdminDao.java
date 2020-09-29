package dao;

import java.sql.*;

import vo.*;

/* 

 */

public class AdminDao {
	/* 
	
	 */
	public Admin login(Admin admin) throws Exception {
		Admin returnAdmin = null;
		String driver = "org.mariadb.jdbc.Driver";
		String dbaddr = "jdbc:mariadb://localhost:3306/mall";
		String dbid = "root";
		String dbpw = "java1004";
		
	
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);
		System.out.println(conn+"<-conn"); 
		
		
		String sql = "SELECT admin_id, admin_pw FROM admin WHERE admin_id=? AND admin_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//stmt.setString(1, admin.adminId);
		//stmt.setString(2, admin.adminPw);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		System.out.println(stmt+"<-stmt"); 
		
	
		ResultSet rs = stmt.executeQuery();
		System.out.println(rs+"<-rs"); 
		if (rs.next()) {
			returnAdmin = new Admin();
			//returnAdmin.adminId = rs.getString("admin_id");
			returnAdmin.setAdminId(rs.getString("admin_id"));
	
		}
		
		
		conn.close();
		
		
		return returnAdmin;
	}
}
