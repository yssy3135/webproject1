package team_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import team_vo.P_Member_VO;

public class P_Member_DAO {
	
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn =  null;
	
	public P_Member_DAO(){
		try {
			Class.forName(DRIVER);
			
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB연결 실패");
		}
//		System.out.println("ㅅㄱ");
	}
	
	//멤버 추가
	public int addData(P_Member_VO vo) {
		int result = -1;
		sb.setLength(0);
		sb.append("insert into P_Member ");
		sb.append("values (MEMNO_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getHp());
			pstmt.setString(7, vo.getEmail());
			result = pstmt.executeUpdate();
			
			System.out.println("P_Member_DAO.addData end");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}//add Data end
	
	
	public P_Member_VO selectOne(String memno) {
		
		sb.setLength(0);
		sb.append("select * from P_Member ");
		sb.append("where memno = ? ");
		
		P_Member_VO vo = new P_Member_VO();
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, memno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			vo.setMemno(rs.getInt(1));
			vo.setId(rs.getString(2));
			vo.setPw(rs.getString(3));
			vo.setName(rs.getString(4));
			vo.setBirth(rs.getString(5));
			vo.setGender(rs.getString(6));
			vo.setHp(rs.getString(7));
			vo.setEmail(rs.getString(8));
			
			System.out.println("p_member_dao selectOne end");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	}//select One end
	
	
	public boolean isExist(String id) {
		sb.setLength(0);
		sb.append("select * from p_member ");
		sb.append("where mid = ?  ");
		
		boolean isOk = false;
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			//rs.next가 있으면 true 없으면 false 다.
			
			isOk = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isOk; 
	}//isExist end 중복확인
	
	
	public int change(String memno, String pw,String hp, String email) {
		sb.setLength(0);
		sb.append("update p_member ");
		sb.append("set mpw = ? ,mhp =? , memail = ? ");
		sb.append("where memno = ? ");
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, hp);
			pstmt.setString(3, email);
			pstmt.setString(4, memno);

	
			
			result = pstmt.executeUpdate();
			
			System.out.println("회원정보 수정 P_MEMBER_DAO END");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	
	}//change end
	
	
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
	
	
	
	
	public int findPw(String id, String email) {
	      
	      sb.setLength(0);
	      sb.append("select * from P_Member ");
	      sb.append("where mid = ? and memail =?");
	      
	      int ok = -1 ;
	      
	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, id);
	         pstmt.setString(2, email);
	         
	         rs = pstmt.executeQuery();
	         
	         //rs.next가 있으면 true 없으면 false 다.
	         
	         if(rs.next()) {
	            ok = rs.getInt("memno");
	         }else {
	            
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return ok;
	}; //id, email 받아서 있으면 memno 돌려줌.
	
	
	public String findId(String name, String email) {
		      
		String returnId = "";
		      
		sb.setLength(0);
		sb.append("select * from P_Member ");
		sb.append("where mname = ? and memail =?");
		      
		try {
		         pstmt = conn.prepareStatement(sb.toString());
		         pstmt.setString(1, name);
		         pstmt.setString(2, email);
		         
		         rs = pstmt.executeQuery();
		         
		         //rs.next가 있으면 true 없으면 false 다.
		         
		         if(rs.next()) {
		            returnId = rs.getString("mid");
		         }else {
		            
		         }
		         
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      
		      return returnId ;
	}
	
	
	
}//end
