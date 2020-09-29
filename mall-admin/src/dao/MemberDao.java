package dao;

import commons.DBUtil;
import vo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MemberDao {
	
	//회원 목록 출력하는 메서드
	public ArrayList<Member> selectMemberList() throws Exception{
		//리스트지정
		ArrayList<Member> list = new ArrayList<Member>();
		//DBUtil 메서드에서 DB에 관한 정보를 불러옴. 중복(짧게 쓰기위해)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//쿼리문//String sql="select* from member";
		String sql="SELECT member_email,member_pw,member_name,member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs= stmt.executeQuery();
		while(rs.next()) {
			Member member = new Member();
			/*member.memberEmail = rs.getString("member_email");
			member.memeberPw = rs.getString("member_pw");
			member.memberName = rs.getString("member_name");
			member.memberDate = rs.getString("member_date");*/
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberPw(rs.getString("member_pw"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
			list.add(member);
			
		}
		//데이터베이스닫기
		conn.close();
		return list;//리턴
	}
	//회원 삭제 메서드
		public void deleteMember(Member member) throws Exception{
			//DBUTIL..
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//sql
			String sql="delete from member where member_email=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, member.getMemberEmail());
			//실행
			 stmt.executeLargeUpdate();
			
			conn.close();//사용다했으면 종료
		}
}
