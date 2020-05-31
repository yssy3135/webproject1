package team_dao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.VO.TogetherCommentVO;



public class ToReBoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	
	
	public ToReBoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	
	
	
	public void modify(TogetherCommentVO vo) {
		
		sb.setLength(0);

		sb.append("update TOGETHERCOMMENT ");
		sb.append("set T_CONTENTS = ? ");
		sb.append("where TCNO = ? ");
		
		System.out.println(vo.getT_contents());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getT_contents());
			pstmt.setInt(2, vo.getTcno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}
	
	
	public void delete(TogetherCommentVO vo) {
		
		sb.setLength(0);

		sb.append("delete TOGETHERCOMMENT ");
		sb.append("where TCNO = ? ");
		
		System.out.println(vo.getT_contents());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getTcno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}
	
	
	public void insertReply(TogetherCommentVO vo,int bno) {
		
//		insert into reboard
//		values(seq, 아이디, 댓글내용 ,sysdate, 게시글 번호);
		
		sb.setLength(0);
		sb.append("insert into TOGETHERCOMMENT ");
		sb.append("values(TOGETHERCOMMENT_SEQ.nextval,? , ? , sysdate,? ) " );
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getT_bno());
			pstmt.setString(2, vo.getT_writer());
			pstmt.setString(3, vo.getT_contents());
			
			System.out.println(vo.getT_writer());
			System.out.println(vo.getT_bno());
			System.out.println(vo.getT_contents());
			
			
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}//insertReply() end
	
	//댓글 조회 메소드 - 전체조회/전체조회(윈글번호별)
	
		public ArrayList<TogetherCommentVO> getAllReply(int bno){
			ArrayList<TogetherCommentVO> list = new ArrayList<TogetherCommentVO>();
			
			sb.setLength(0);
			sb.append("select * from TOGETHERCOMMENT ");
			sb.append("where T_BNO = ? ");
			sb.append("order by TCNO asc ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, bno);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					TogetherCommentVO vo = new TogetherCommentVO(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(5), rs.getString(4) );
					
					
					list.add(vo);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		} //getAllReply()end
		
		
		public int commentcount(int bno){
	
			sb.setLength(0);
			sb.append("select count(rownum) ");
			sb.append("from togethercomment ");
			sb.append("where T_BNO = ? ");

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
