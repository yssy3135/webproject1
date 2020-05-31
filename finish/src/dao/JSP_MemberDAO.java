package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.JSP_MemberVO;

public class JSP_MemberDAO {
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";	//변수 값이 수정 불가능하게 final 선언
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	//생성자 호출시 db접속 되게끔 처리
	public JSP_MemberDAO() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			//System.out.println(conn);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}//생성자 end
	
	//멤버 추가
	public void addData(JSP_MemberVO vo) {		//값을 받아오는곳. 매개변수 열기
		sb.setLength(0);
		sb.append("insert into JSP_MEMBER ");
		sb.append("values (JSP_MEMBER_MEMNO_SEQ.nextval, ?, ?, ?, ?, ?, sysdate, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId()); 		//첫번째 물음표에 vo변수의 getter를 사용하여 id를 가져온다
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getMp());
			pstmt.setString(6, vo.getEmail());
			
			pstmt.executeUpdate();			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//addData() end
	
	
	//전체 조회
	public ArrayList<JSP_MemberVO> getAllData(){
		
		ArrayList<JSP_MemberVO> list = new ArrayList<JSP_MemberVO>();
		
		sb.setLength(0);
		sb.append("select * from JSP_Member ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String mp = rs.getString("mp");
				String regdate = rs.getString("regdate");
				String email = rs.getString("email");
				
				int memno = rs.getInt("memno");
				
				JSP_MemberVO vo =
						new JSP_MemberVO(id, pw, name, birth, mp, memno, email, regdate);
				
				
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//getAllData() end
	
	//회원 정보 변경
	
	//회원 정보 삭제
	
	//존재하는 회원인지 여부를 확인하는 메소드 - (id, pw)
	public boolean isExist(String id, String pw) {
		
		sb.setLength(0);
		sb.append("select * from jsp_member ");
		sb.append("where id = ? and pw = ? ");
		
		//boolean isOk = true;	//로 기본값을  true를 하면 안됨. 에러가 났을때도 데이터가 넘어가는 경우가됨.
		boolean isOk = false;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			isOk = rs.next(); 	//얘가 조회가되면 true고 없으면 false이기 때문에 isOk에 실어줌
								//=존재여부만 파악해서 리턴
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isOk;
	}//isExist()end
	
	
	// id로만 존재하는 회원인지 여부를 파악하는 메소드
	public boolean isExistById(String id) {
		
		sb.setLength(0);
		sb.append("select * from jsp_member ");
		sb.append("where id = ? ");
		
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id); 		//첫번째 물음표에 사용자가 입력한값을 넣어라
			
			rs = pstmt.executeQuery();
			
			flag = rs.next();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
	}// isExistById() end
	
	
	
	
	
	
}






