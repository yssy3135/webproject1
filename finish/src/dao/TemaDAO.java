package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.TemaVO;

public class TemaDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public TemaDAO() {
		// TODO Auto-generated constructor stub
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	//테마 추가 메소드 - insertTema()
	public void insertTema(TemaVO vo) {
		sb.setLength(0);
		sb.append("insert into tema ");
		sb.append("values (tema_seq.nextval, ?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTname());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//insertTema() end
	
	//테마 삭제 메소드 - deleteTema()
	public void deleteTema(int tno) {
		sb.setLength(0);
		sb.append("delete tema ");
		sb.append("where tno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, tno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//deleteTema() end
	
	//테마 검색 메소드 - selectTema()
	public ArrayList<TemaVO> selectTema(){
		ArrayList<TemaVO> list = new ArrayList<TemaVO>();
		
		sb.setLength(0);
		sb.append("select * from tema ");
		sb.append("order by tno desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tno = rs.getInt(1);
				String tname = rs.getString(2);
				
				TemaVO vo = new TemaVO(tno, tname);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//selectTema() end
	

}
