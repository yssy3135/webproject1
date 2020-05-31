package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.ProductVO;

public class ProductDAO {
	/*
	// DBMS에 접근하도록 싱클톤 패턴 객체를 만들ㄹ었으므로 필요 없음
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	*/
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public ProductDAO() {
		/*
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("conn : "+conn);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		conn = OracleXEConnection.getInstance().getConnection();
		
	}
	
	
	//상품정보 입력하는 메소드 - addData()
	public int addData(ProductVO vo) {
		sb.setLength(0);
		sb.append("insert into product ");
		sb.append("values (product_pno_seq.nextval, ?, ?, ?, ?, ?, ?, ? ) ");
		
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPname());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setInt(3, vo.getDcratio());
			pstmt.setString(4, vo.getProdesc());
			pstmt.setInt(5, vo.getQty());
			pstmt.setString(6, vo.getImgfile());
			pstmt.setString(7, vo.getBigfile());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}//addData() end
	
	
	
	//상품 정보를 '전체'조회하는 메소드 - getAllData()
	public ArrayList<ProductVO> getAllData() {
		sb.setLength(0);
		sb.append("select * from product ");
		
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pno = rs.getInt(1);
				String pname = rs.getString(2);
				int price = rs.getInt(3);
				int dcratio = rs.getInt(4);
				String prodesc = rs.getString(5);
				int qty = rs.getInt(6);
				String imgfile = rs.getString(7);
				String bigfile = rs.getString(8);
				
				ProductVO vo = new ProductVO(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//getAllData() end
	
	
	
	//상품정보를 조회 - 상품번호로 조회하는 메소드 - getData()
	public ProductVO getData(int pno){	//상품번호로 조회하는거니까 상품번호를 받을수 있도록 매개변수를 열어둔다
		//select * from product where pno = ?
		//SQL문을 생각해봤을때 pno를 받아야하니까 매개변수 저렇게 열어둔다
		
		sb.setLength(0);
		sb.append("select * from product ");
		sb.append("where pno = ? ");
		
		ProductVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String pname = rs.getString(2);
			int price = rs.getInt(3);
			int dcratio = rs.getInt(4);
			String prodesc = rs.getString(5);
			int qty = rs.getInt(6);
			String imgfile = rs.getString(7);
			String bigfile = rs.getString(8);
			
			vo = new ProductVO(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}//getData() end
	
	
	// 개별 상품이름으로 조회  getDataByName()
	public ProductVO getDataByName(String pname) {
		
		sb.setLength(0);
		sb.append("select * from product ");
		sb.append("where pname = ? ");
		
		ProductVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, pname);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int pno = rs.getInt(1);
			int price = rs.getInt(3);
			int dcratio = rs.getInt(4);
			String prodesc = rs.getString(5);
			int qty = rs.getInt(6);
			String imgfile = rs.getString(7);
			String bigfile = rs.getString(8);
			
			vo = new ProductVO(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}//getDataByName() end -- 안되는디
	
	
	// 새롭게 추가한 상품의 정보를 변경 - 가격, 할인율, 수량  - modifyData()
	public void modifyData(ProductVO vo) {
		sb.setLength(0);
		sb.append("update product ");
		sb.append("set price = ?, dcratio = ?, qty = ? ");
		sb.append("where pno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPrice());
			pstmt.setInt(2, vo.getDcratio());
			pstmt.setInt(3, vo.getQty());
			pstmt.setInt(4, vo.getPno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//modifyData() end

	
	// 새롭게 추가한 상품 삭제 - deleteData()
	public void deleteData(int pno) {
		sb.setLength(0);
		sb.append("delete product ");
		sb.append("where pno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}//deleteData() end
	
	
	
	
	
	
	
	
	

}
