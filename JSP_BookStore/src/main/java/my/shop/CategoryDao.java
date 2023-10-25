package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static CategoryDao instance = new CategoryDao();
	
	public static CategoryDao getInstance() {
		return instance;
	}
	
	private CategoryDao(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	public int insertCategory(CategoryBean cb) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "insert into category values(cateseq.nextval,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, cb.getCname());
		cnt = ps.executeUpdate();
		
		return cnt;
	}
}
