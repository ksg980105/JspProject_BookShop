package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	//전체 상품조회
	public ArrayList<ProductBean> getAllProduct() throws Exception {
		Connection conn = getConnection();
		
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		String sql = "select * from product";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			ProductBean pb = new ProductBean();
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setPcategory(rs.getString("pcategory"));
			pb.setPublisher(rs.getString("publisher"));
			pb.setPimage(rs.getString("pimage"));
			pb.setPqty(rs.getInt("pqty"));
			pb.setPrice(rs.getInt("price"));
			pb.setSummary(rs.getString("summary"));
			pb.setPoint(rs.getInt("point"));
			
			lists.add(pb);
		}
		return lists;
	}
	
	//카테고리에 따른 상품조회
	public void getAllProductByCategory() throws Exception {
		Connection conn = getConnection();
		
		String sql = "select * from product where category=?";
	}
	
	//상품 수정
	public int updateProduct(int pnum, String pcategory, String publisher, String pqty, String price, String point) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "update product set pcategory=?, publisher=?, pqty=?, price=?, point=? where pnum=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, pcategory);
		ps.setString(2, publisher);
		ps.setString(3, pqty);
		ps.setString(4, price);
		ps.setString(5, point);
		ps.setInt(6, pnum);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	//상품 삭제
	public int deleteProduct(int pnum) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "delete from product where pnum=?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
}





















