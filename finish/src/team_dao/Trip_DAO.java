package team_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.Trip_VO;

public class Trip_DAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public Trip_DAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	//전체 상품조회
	public ArrayList<Trip_VO> selectAll() {
		
		sb.setLength(0);
		sb.append("select * from trip ");

		ArrayList<Trip_VO> list = new ArrayList<Trip_VO>();
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String tema = rs.getString(1);
				int pno = rs.getInt(2);
				String pname = rs.getString(3);
				int pprice = rs.getInt(4);
				int qty = rs.getInt(5);
				String pcontents = rs.getString(6);
				String mainimg = rs.getString(7);
				String detailimg = rs.getString(8);
				String course = rs.getString(9);
				String pdate = rs.getString(10);
				
					
				Trip_VO vo = new Trip_VO(tema, pno, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
										
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//selectAll() end
	
	
	//상품번호로 조회
	public Trip_VO getData(int pno) {
		
		sb.setLength(0);
		sb.append("select * from trip ");
		sb.append("where pno = ? ");
		
		Trip_VO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String tema = rs.getString(1);
			String pname = rs.getString(3);
			int pprice = rs.getInt(4);
			int qty = rs.getInt(5);
			String pcontents = rs.getString(6);
			String mainimg = rs.getString(7);
			String detailimg = rs.getString(8);
			String course = rs.getString(9);
			String pdate = rs.getString(10);

			vo = new Trip_VO(tema, pno, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	//상품명으로 조회
	public Trip_VO getData2(String pname) {
		
		sb.setLength(0);
		sb.append("select * from trip ");
		sb.append("where pname = ? ");
		
		Trip_VO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, pname);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String tema = rs.getString(1);
			int pno = rs.getInt(2);
			int pprice = rs.getInt(4);
			int qty = rs.getInt(5);
			String pcontents = rs.getString(6);
			String mainimg = rs.getString(7);
			String detailimg = rs.getString(8);
			String course = rs.getString(9);
			String pdate = rs.getString(10);

			vo = new Trip_VO(tema, pno, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//테마별 전체조회
	public ArrayList<Trip_VO> getTheme(String tema) {
		
		sb.setLength(0);
		sb.append("select * from trip ");
		sb.append("where tema = ? ");
		
		ArrayList<Trip_VO> list = new ArrayList<Trip_VO>();
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, tema);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pno = rs.getInt(2);
				String pname = rs.getString(3);
				int pprice = rs.getInt(4);
				int qty = rs.getInt(5);
				String pcontents = rs.getString(6);
				String mainimg = rs.getString(7);
				String detailimg = rs.getString(8);
				String course = rs.getString(9);
				String pdate = rs.getString(10);
				
				Trip_VO vo = new Trip_VO(tema, pno, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
				
				list.add(vo);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	//상품이름, 컨텐츠이름으로 검색
		public ArrayList<Trip_VO> getPname(String keyWord) {
			
			ArrayList<Trip_VO> list = new ArrayList<Trip_VO>();

			try {
				
				if(keyWord != null) {
					String sql = "select * from Trip ";
					sql += "where pname like '%"+ keyWord + "%' or pcontents like '%"+ keyWord + "%'";
					//System.out.println("sql = " + sql);
					
					pstmt = conn.prepareStatement(sql);	
					rs = pstmt.executeQuery(sql);
				}
				
				while(rs.next()){
					String tema = rs.getString(1);
					int pno = rs.getInt(2);
					String pname = rs.getString(3);
					int pprice = rs.getInt(4);
					int qty = rs.getInt(5);
					String pcontents = rs.getString(6);
					String mainimg = rs.getString(7);
					String detailimg = rs.getString(8);
					String course = rs.getString(9);
					String pdate = rs.getString(10);
					
					Trip_VO vo = new Trip_VO(tema, pno, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
					
					list.add(vo);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
		
		
		
	
}






















