package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
























