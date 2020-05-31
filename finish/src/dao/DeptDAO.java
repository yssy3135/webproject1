package dao;
// DAO (Data Access Object) : DB에 쉽게 접근하기 위한 객체

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.DeptVO;

public class DeptDAO {
	//변수를 final로 선언하는 이유? final=변수나 메소드가 더이상 변경 불가능하게
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	//객체 호출시 DB 접속이 완료되게 하고 싶음
	public DeptDAO() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("conn : "+conn);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
		
	}//생성자 end
	
	// 1건 정보 조회 - 부서번호를 입력받아서 부서번호, 부서이름, 부서위치 정보를 return
	// 레코드별로 정보를 주기 때문에 총 3개의 정보가 나옴. = 배열로된 자료형 사용
	//DeptVO를 자료형으로 씀. 메소드(selectOne)은 유의미하게
	public DeptVO selectOne(int deptno) {			//사용자가 입력한 값을 받아야하기 때문에 매개변수 열어주어야함
	
		sb.append("select * from dept ");
		sb.append("where deptno = ? ");
		
		DeptVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String dname = rs.getString(2);
			String loc = rs.getString(3);
			
			vo = new DeptVO(deptno, dname, loc);	//생성자를 통해서 내보냄
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return vo; 
	}//selectOne() end
	
	
	//데이터 추가
//	public void insertOne(int deptno, String dname, String loc) {
//		
//	}
	
	public int insertOne(DeptVO vo) {	//()사용자가 입력할 수 있도록 매개변수를 열어놓는것
		
		sb.setLength(0); 	//0하면 버퍼안의 내용이 지워짐
		sb.append("insert into dept ");
		sb.append("values (?, ?, ? ) ");
		
		int result = -1;			//이거 왜하더라
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getDeptno());
			pstmt.setString(2, vo.getDname());
			pstmt.setString(3, vo.getLoc());
			
			result = pstmt.executeUpdate();
			//System.out.println("result : "+result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}// insertOne() end
	
	//데이터 수정
	public void updateOne(DeptVO vo) {
		sb.setLength(0);
		sb.append("update dept ");
		sb.append("set dname = ?, loc = ? ");
		sb.append("where deptno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			//물음표의 값을 할당
			pstmt.setString(1, vo.getDname());
			pstmt.setString(2, vo.getLoc());
			pstmt.setInt(3, vo.getDeptno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// updateOne end
	
	//데이터 삭제
	public void deleteOne(int deptno) {
		sb.setLength(0);
		sb.append("delete dept ");
		sb.append("where deptno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// deleteOne() end
	
	//전체 조회
	public ArrayList selectAll() {	//전체 조회기때문에 매개변수 필요x
		
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		
		sb.setLength(0);
		sb.append("select * from dept ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			//실행 - 물음표 채울 필요 없으니 바로 실행
			rs = pstmt.executeQuery();
			
			//레코드별로 처리
			while(rs.next()) {
				//현재 레코드에서 각각 값을 가져오기
				int deptno = rs.getInt(1);
				String dname = rs.getString(2);
				String loc = rs.getString(3);
				
				//vo 객체에 값을 전달
//				DeptVO vo = new DeptVO();
//				vo.setDeptno(deptno);
//				vo.setDname(dname);
//				vo.setLoc(loc);
				DeptVO vo = new DeptVO(deptno, dname, loc);
				
				//Collection(ArrayList사용했음)에 담기
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}// seletAll()
	
	
	//자원 반납
	public void close() {
		if(rs!=null) {
			try {
				rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	

}
