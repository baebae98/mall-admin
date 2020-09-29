package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import commons.DBUtil;
import vo.*;
/*
 * 공지사항
 */
public class NoticeDao {
	
		//공지게시판 출력 메서드
		public ArrayList<Notice> selectNoticeList() throws Exception{
			//리스트지정
			ArrayList<Notice> list = new ArrayList<Notice>();
			//변수 생성과 connection 중복때문에 쓰는 코드
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();		
			//쿼리문
			//String sql="SELECT notice_id,notice_title FROM notice ORDER BY notice_date DESC LIMIT 0,2";
			String sql="select * from notice order by notice_date desc LIMIT 0,10";
			//데이터베이스 접속
			PreparedStatement stmt = conn.prepareStatement(sql);
			//결과문 출력
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
			/*	n.noticeId = rs.getInt("notice_id");
				n.noticeTitle = rs.getString("notice_title");
				n.noticeContent = rs.getString("notice_content");
				n.noticeDate = rs.getString("notice_date");*/
				n.setNoticeId(rs.getInt("notice_id"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getString("notice_date"));
				list.add(n);//위에값 출력해주는 코드
			}
			//데이터베이스 닫기
			conn.close();
			
			return list;
			
		}
		//공지사항추가 메서드
		public void insertNotice(Notice notice) throws Exception{
			//DBUTIL..
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql="insert into notice(notice_id,notice_title,notice_content,notice_date) values(?,?,?,now())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, notice.getNoticeId());
			stmt.setString(2, notice.getNoticeTitle());
			stmt.setString(3, notice.getNoticeContent());
			stmt.executeUpdate();
		}
		//공지사항 삭제 메서드
		public void deleteNotice(Notice notice) throws Exception{
			//DBUtil..
			DBUtil dbUtil =new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql="delete from notice where notice_id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, notice.getNoticeId());
			stmt.executeUpdate();
		}
		//공지사항 상세보기 메서드
		public Notice selectNoticeOne(int noticeId) throws Exception {
			Notice notice = null;
			//DBUtil..
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//sql
			//String sql="select notice_title,notice_content,notice_date from notice where notice_id=?";
			String sql="select * from notice where notice_id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeId);
			ResultSet rs= stmt.executeQuery();
			if(rs.next()) {
				notice = new Notice();
				notice.setNoticeId(rs.getInt("notice_id"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setNoticeDate(rs.getString("notice_date"));
			}
			conn.close();//사용다하면 종료
			return notice;
		}
		//공지사항 수정 메서드
		public void updateNotice(Notice notice)throws Exception{
			//DBUti..
			DBUtil dbUtil = new DBUtil();
			Connection conn= dbUtil.getConnection();
			//sql
			String sql="Update notice set notice_title=?, notice_content=? where notice_id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			stmt.setInt(3, notice.getNoticeId());
			stmt.executeUpdate();
			
			conn.close();
		}
}
