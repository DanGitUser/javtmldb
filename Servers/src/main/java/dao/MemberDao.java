package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import domain.Member;
import util.DBUtil;

//DAO
//DATA ACCESS OBJECT
public class MemberDao {
	// insert
	// select
	public static void main(String[] args) {
//		new MemberDao().insert(Member.builder().id("sample").pw("1234").name("개똥이").build());
		System.out.println(new MemberDao().selectOne(1L));
		System.out.println(new MemberDao().selectOne(3L));
	}
	
	public void insert(Member member) {
		// 1. 접속객체 취득 2. 문장생성 3. 실행 후 처리
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into Member (id, pw, name) values (?, ?, ?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			
			pstmt.executeQuery();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Member selectOne(String id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement("select * from Member where id = ?");
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = Member.builder()
						.no(rs.getLong("no"))
						.id(rs.getString("id"))
						.pw(rs.getString("pw"))
						.name(rs.getString("name"))
						.regDate(rs.getDate("regdate"))
						.build();
				return member;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Member selectOne(Long no) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement("select * from Member where no = ?");
			pstmt.setLong(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = Member.builder()
						.no(rs.getLong("no"))
						.id(rs.getString("id"))
						.pw(rs.getString("pw"))
						.name(rs.getString("name"))
						.regDate(rs.getDate("regdate"))
						.build();
				return member;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
