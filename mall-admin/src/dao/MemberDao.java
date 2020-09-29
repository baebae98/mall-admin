package dao;

import commons.DBUtil;
import vo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MemberDao {
	
	//ȸ�� ��� ����ϴ� �޼���
	public ArrayList<Member> selectMemberList() throws Exception{
		//����Ʈ����
		ArrayList<Member> list = new ArrayList<Member>();
		//DBUtil �޼��忡�� DB�� ���� ������ �ҷ���. �ߺ�(ª�� ��������)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//������//String sql="select* from member";
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
		//�����ͺ��̽��ݱ�
		conn.close();
		return list;//����
	}
	//ȸ�� ���� �޼���
		public void deleteMember(Member member) throws Exception{
			//DBUTIL..
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//sql
			String sql="delete from member where member_email=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, member.getMemberEmail());
			//����
			 stmt.executeLargeUpdate();
			
			conn.close();//���������� ����
		}
}
