package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() {
		return instance;
	}
	
	private ProductDao(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	//상품등록
	public int insertProduct(MultipartRequest mr) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "insert into product values(proseq.nextval,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, mr.getParameter("pname"));
		ps.setString(2, mr.getParameter("pcategory"));
		ps.setString(3, mr.getParameter("publisher"));
		ps.setString(4, mr.getFilesystemName("pimage"));
		ps.setString(5, mr.getParameter("pqty"));
		ps.setString(6, mr.getParameter("price"));
		ps.setString(7, mr.getParameter("summary"));
		ps.setString(8, mr.getParameter("point"));
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
}





















