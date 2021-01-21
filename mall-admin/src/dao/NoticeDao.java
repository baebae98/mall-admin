package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DBUtil;	// 데이터베이스 접속정보
import vo.Notice;

public class NoticeDao {
	// 공지사항 추가하는 메소드
	public void insertNotice(Notice notice) throws Exception {	// 공지사항 타입을 입력받는다.
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?, ?, now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());		// Notice 타입의 noticeTitle을 입력받는다.
		stmt.setString(2, notice.getNoticeContent());	// Notice 타입의 noticeContent을 입력받는다.
		
		stmt.executeUpdate();
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
	}
	
	// 공지사항 삭제하는 메소드
	public void deleteNotice(Notice notice) throws Exception {
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = "delete from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, notice.getNoticeId());	// Notice 타입의 noticeId를 입력받는다.
		
		stmt.executeUpdate();
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
	}
	
	// 공지사항 수정하는 메소드
	public void updateNotice(Notice notice) throws Exception {	// 공지사항 타입을 입력받는다.
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = "update notice set notice_title = ?, notice_content = ?, notice_date = now() where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());		// Notice 타입의 noticeTitle을 입력받는다.
		stmt.setString(2, notice.getNoticeContent());	// Notice 타입의 noticeContent을 입력받는다.
		stmt.setInt(3, notice.getNoticeId());		// Notice 타입의 noticeId를 입력받는다.
		
		stmt.executeUpdate();
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
	}
	
	// 공지사항 목록을 출력하는 메소드
	public ArrayList<Notice> selectNoticeList(int limit1, int limit2) throws Exception {
		// ArrayList 생성
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice order by notice_date desc limit ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, limit1);	// 첫 번째 인자 (시작 데이터)
        stmt.setInt(2, limit2);	// 두 번째 인자 (데이터 개수)       
		
		// SQL 명령 실행
		ResultSet rs = stmt.executeQuery();
		
		// 데이터베이스 내용 불러오기
		while(rs.next()) {
			Notice notice = new Notice();	// 공지사항 객체 생성
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
			list.add(notice);	// 리스트에 데이터 추가
		}
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
		
		// 최종 데이터 반환
		return list;
	}
	
	// 공지사항 상세페이지 조회용
	public Notice selectNoticeOne(int noticeId) throws Exception {
		Notice notice = null;
		
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = ("select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?");
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);			// noticeId을 입력받는다.
		
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			notice = new Notice();	// 공지사항 객체 생성
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
		}
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
		
		return notice;
	}
	
	// 전체 공지사항의 전체 데이터 개수 구하기
	public int countAllData() throws Exception {
		int totalCount = 0;	// 기본값은 0으로
		
		DBUtil dbUtil = new DBUtil();	// 데이터베이스 정보가 담긴 객체 생성
		Connection conn = dbUtil.getConnection(); // 데이터베이스 접속
		
		// SQL 명령, 명령 준비
		String sql = "select count(*) from notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		// SQL 명령 실행
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		
		conn.close(); // 데이터베이스 사용을 다 했으면 접속을 종료한다.
				
		// 최종 데이터 반환
		return totalCount;
	}
}