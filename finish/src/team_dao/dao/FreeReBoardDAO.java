package team_dao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.VO.FreecommentVO;

public class FreeReBoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public FreeReBoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	
	public void insertReply(FreecommentVO vo,int bno) {
		
//		insert into reboard
//		values(seq, 아이디, 댓글내용 ,sysdate, 게시글 번호);
		
		sb.setLength(0);
		sb.append("insert into FREECOMMENT ");
		sb.append("values(FREECOMMENT_SEQ.nextval,?,?,sysdate,?) " );
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, bno);
			pstmt.setString(2,vo.getRe_writer());
			pstmt.setString(3, vo.getRe_contents());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}//insertReply() end
	
	
	public ArrayList<FreecommentVO> getAllReply(int bno){
		ArrayList<FreecommentVO> list = new ArrayList<FreecommentVO>();
		
		sb.setLength(0);
		sb.append("select * from FREECOMMENT ");
		sb.append("where F_BNO = ? ");
		sb.append("order by rno asc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				FreecommentVO vo = new FreecommentVO(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(5), rs.getString(4));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	} //getAllReply()end
	
	public void modify(FreecommentVO vo) {
		
		sb.setLength(0);

		sb.append("update FREECOMMENT ");
		sb.append("set F_CONTENTS = ? ");
		sb.append("where RNO = ? ");
		
		System.out.println(vo.getRe_contents());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getRe_contents());
			pstmt.setInt(2, vo.getRno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}
	
	
	public void delete(FreecommentVO vo) {
		
		sb.setLength(0);

		sb.append("delete FREECOMMENT ");
		sb.append("where RNO = ? ");
		
		System.out.println(vo.getRe_contents());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getRno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}
	
	
	
	public int commentcount(int bno){
		
		sb.setLength(0);
		sb.append("select count(rownum) ");
		sb.append("from FREECOMMENT ");
		sb.append("where F_BNO = ? ");

		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt(1);
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	} //getAllReply()end
	
	
	
	
	
	
	
	
}



