package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.member.MemberBean;

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
	
	//카테고리 추가
	public int insertCategory(CategoryBean cb) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "insert into category values(cateseq.nextval,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, cb.getCname());
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	//모든 카테고리 가져오기
	public ArrayList<CategoryBean> getAllcategory() throws Exception {
		Connection conn = getConnection();
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		
		String sql = "select * from category order by cnum asc";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			CategoryBean cb = new CategoryBean();
			cb.setCnum(rs.getInt("cnum"));
			cb.setCname(rs.getString("cname"));
			
			lists.add(cb);
		}
		return lists;
	}
	
	//카테고리 이름수정
	public int updateCategory(String cname, int cnum) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "update category set cname=? where cnum=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, cname);
		ps.setInt(2, cnum);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public int deleteCategory(int cnum) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "delete from category where cnum=?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, cnum);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
}
