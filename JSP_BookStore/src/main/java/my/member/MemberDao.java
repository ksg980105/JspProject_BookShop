package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	//회원가입
	public int insertMember(MemberBean mb) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "insert into member values(memberseq.nextval,?,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, mb.getName());
		ps.setString(2, mb.getId());
		ps.setString(3, mb.getPassword());
		ps.setString(4, mb.getSsn1());
		ps.setString(5, mb.getSsn2());
		ps.setString(6, mb.getEmail());
		ps.setString(7, mb.getHp1());
		ps.setString(8, mb.getHp2());
		ps.setString(9, mb.getHp3());
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	//중복체크
	public boolean searchId(String id) throws Exception {
		Connection conn = getConnection();
		boolean check = false;
		
		String sql = "select * from member where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		if(rs.next()) {
			check = true;
		}
		
		return check;
	}
	
	//아이디 찾기
	public String getfindId(String name, String ssn1, String ssn2) throws Exception {
		Connection conn = getConnection();
		String id = "";
		String sql = "select id from member where name=? and ssn1=? and ssn2=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, ssn1);
		ps.setString(3, ssn2);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			id = rs.getString("id");
		}
		return id;
	}
	
	//비밀번호 찾기
	public String getfindPw(String id, String name, String ssn1, String ssn2) throws Exception {
		Connection conn = getConnection();
		String pw = "";
		String sql = "select password from member where id=? and name=? and ssn1=? and ssn2=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, ssn1);
		ps.setString(4, ssn2);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			pw = rs.getString("password");
		}
		return pw;
	}
	
	//아이디 비밀번호로 정보 가져오기
	public MemberBean getAllByIdandPw(String id, String password) throws Exception {
		Connection conn = getConnection();
		MemberBean mb = null;
		String sql = "select * from member where id=? and password=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, password);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			mb = new MemberBean();
			mb.setNo(rs.getInt("no"));
			mb.setName(rs.getString("name"));
			mb.setId(rs.getString("id"));
			mb.setPassword(rs.getString("password"));
			mb.setSsn1(rs.getString("ssn1"));
			mb.setSsn2(rs.getString("ssn2"));
			mb.setEmail(rs.getString("email"));
			mb.setHp1(rs.getString("hp1"));
			mb.setHp2(rs.getString("hp2"));
			mb.setHp3(rs.getString("hp3"));
		}
		return mb;
	}
	
	//모든 유저 조회
	public ArrayList<MemberBean> getAlluser() throws Exception {
		Connection conn = getConnection();
		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		
		String sql = "select * from member order by no asc";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			MemberBean mb = new MemberBean();
			mb.setNo(rs.getInt("no"));
			mb.setName(rs.getString("name"));
			mb.setId(rs.getString("id"));
			mb.setPassword(rs.getString("password"));
			mb.setSsn1(rs.getString("ssn1"));
			mb.setSsn2(rs.getString("ssn2"));
			mb.setEmail(rs.getString("email"));
			mb.setHp1(rs.getString("hp1"));
			mb.setHp2(rs.getString("hp2"));
			mb.setHp3(rs.getString("hp3"));
			
			lists.add(mb);
		}
		return lists;
	}
	
	//유저정보 수정
	public int updateUser(int no, String password, String email, String hp1, String hp2, String hp3) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "update member set password=?, email=?, hp1=?, hp2=?, hp3=? where no=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, password);
		ps.setString(2, email);
		ps.setString(3, hp1);
		ps.setString(4, hp2);
		ps.setString(5, hp3);
		ps.setInt(6, no);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	//유저 삭제
	public int deleteUser(int no) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "delete from member where no=?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, no);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public MemberBean getAllByid(String id) throws Exception {
		Connection conn = getConnection();
		MemberBean mb = null;
		String sql = "select * from member where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			mb = new MemberBean();
			mb.setNo(rs.getInt("no"));
			mb.setName(rs.getString("name"));
			mb.setId(rs.getString("id"));
			mb.setPassword(rs.getString("password"));
			mb.setSsn1(rs.getString("ssn1"));
			mb.setSsn2(rs.getString("ssn2"));
			mb.setEmail(rs.getString("email"));
			mb.setHp1(rs.getString("hp1"));
			mb.setHp2(rs.getString("hp2"));
			mb.setHp3(rs.getString("hp3"));
		}
		return mb;
	}
}
























