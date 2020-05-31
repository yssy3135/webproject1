package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.P_MemberVO;
import vo.P_OrderVO;

public class P_MemberDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	//객체 호출시 db 접속 완료되게 함
	public P_MemberDAO() {
		// TODO Auto-generated constructor stub
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	
	//회원목록 조회 메소드 - selectMember()
	public ArrayList<P_MemberVO> selectMember(){
		ArrayList<P_MemberVO> list = new ArrayList<P_MemberVO>();
		
		sb.setLength(0);
		sb.append("select * from p_member ");
		sb.append("order by memno asc  ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int memno = rs.getInt("memno");
				String mid = rs.getString("mid");
				String mpw = rs.getString("mpw");
				String mname = rs. getString("mname");
				String mbirth = rs.getString("mbirth");
				String mgender = rs.getString("mgender");
				String mhp = rs.getString("mhp");
				String memail = rs.getString("memail");
				
				P_MemberVO vo = new P_MemberVO(memno, mid, mpw, mname, mbirth, mgender, mhp, memail);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//selectMember() end
	
	//페이징처리를 위한 총 게시물 파악 메소드
		public int getTotalCount() {
			sb.setLength(0);
			sb.append("select count(*) cnt "); 		//board 안엔 카운터라는 컬럼이 없기때문에 별칭을 달아야한다.
			sb.append("from p_member ");
			
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				//cnt = rs.getInt(1); // 이렇게쓰면안됨!!! 1은 컬럼인덱스이기 때문.
				cnt = rs.getInt("cnt"); 			//컬럼 인덱스 대신에 컬럼네임을 적을수있으니 별칭을 쓴다!
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return cnt;	
			
		}
		
		public int login(String id, String pw) {
			
			
			sb.setLength(0);
			sb.append("select * from P_Member ");
			sb.append("where mid = ? and mpw =?");
			
			int ok = -1;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				
				rs = pstmt.executeQuery();
				
				//rs.next가 있으면 true 없으면 false 다.
				
				if(rs.next()) {
					ok = rs.getInt("Memno");
				}else {
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return ok;
		};//id, pw 를 받아서 없으면 -1, 일치하면 memno를 되돌려줌.
		
		public P_MemberVO selectOne(String mid) {
		      
		      sb.setLength(0);
		      sb.append("select * from P_Member ");
		      sb.append("where mid = ? ");
		      
		      P_MemberVO vo = new P_MemberVO();
		      
		      try {
		         pstmt = conn.prepareStatement(sb.toString());
		         pstmt.setString(1, mid);
		         
		         rs = pstmt.executeQuery();
		         
		         rs.next();
		         
		         vo.setMemno(rs.getInt(1));
		         vo.setMid(rs.getString(2));
		         vo.setMpw(rs.getString(3));
		         vo.setMname(rs.getString(4));
		         vo.setMbirth(rs.getString(5));
		         vo.setMgender(rs.getString(6));
		         vo.setMhp(rs.getString(7));
		         vo.setMemail(rs.getString(8));
		         
		         System.out.println("p_memberdao selectOne end");
		         
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      
		      return vo;
		   }//select One end
		
		public P_MemberVO selectMid(int memno) {
		      
		      sb.setLength(0);
		      sb.append("select * from P_Member ");
		      sb.append("where memno = ? ");
		      
		      P_MemberVO vo = null;
		      
		      try {
		         pstmt = conn.prepareStatement(sb.toString());
		         pstmt.setInt(1, memno);
		         
		         rs = pstmt.executeQuery();
		         
		         rs.next();
					String mid = rs.getString("mid");
					String mpw = rs.getString("mpw");
					String mname = rs. getString("mname");
					String mbirth = rs.getString("mbirth");
					String mgender = rs.getString("mgender");
					String mhp = rs.getString("mhp");
					String memail = rs.getString("memail");
		         
					vo = new P_MemberVO(mid, mpw, mname, mbirth, mgender, mhp, memail);
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      
		      return vo;
		   }//select One end
}
