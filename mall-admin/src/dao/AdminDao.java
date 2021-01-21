package dao;

import java.sql.*;
import vo.Admin;
import commons.DBUtil;

public class AdminDao {
	// 아이디, 패스워드 일치여부를 확인하는 메소드
	public Admin login(Admin admin) throws Exception {
		// 반환할 객체 생성 (기본값 null)
		Admin returnAdmin = null;
		
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = "select admin_id, admin_pw from admin where admin_id = ? and admin_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);   
        
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		
		// SQL 명령 실행
		ResultSet rs = stmt.executeQuery();
		
		// 데이터베이스 내용 불러오기
		while(rs.next()) {
			returnAdmin = new Admin(); // 관리자 계정 객체 생성
			returnAdmin.setAdminId(rs.getString("admin_id"));	// 아이디 반환
		}
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
		
		// 최종 데이터 반환
		return returnAdmin;	// null이면 로그인 실패, null이 아니면 로그인 성공 및 admin_id 반환
	}
}