package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.EmpVO;

public class EmpDAO {
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	//객체 호출시 DB접속이 완료되도록
	public EmpDAO() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	// 1건 조회 (empno를 통해서 나머지 정보를 return 받기)
	public EmpVO selectOne(int empno) {
		//SQL문 작성
		sb.append("select * from emp ");
		sb.append("where empno = ? ");
		
		EmpVO vo = null;
		
		try {
			//문장 객체안에 SQL문 대입
			pstmt = conn.prepareStatement(sb.toString());
			System.out.println("conn : "+conn);
			
			pstmt.setInt(1, empno);
			
			//실행
			rs = pstmt.executeQuery();
			
			rs.next();
			//레코드별 로직정리
			String ename = rs.getString(2);
			String job = rs.getString(3);
			int mgr = rs.getInt(4);
			Date hiredate = rs.getDate(5);
			int sal = rs.getInt(6);
			int comm = rs.getInt(7);
			int deptno = rs.getInt(8);
			
			//생성자를 통해서 내보낸다.
			vo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	
	//데이터 추가
//	public int insertOne(EmpVO vo) {
//		
//		sb.setLength(0); 		//버퍼안의 내용 지우기
//		sb.append("insert into emp ");
//		sb.append("values (?, ?, ?, ?, ?, ?, ?, ? ) ");
//		
//		int result = -1;	//왜하지이거
//		
//		//문장객체 안에 SQL문 넣기
//		try {
//			pstmt = conn.prepareStatement(sb.toString());
//			pstmt.setInt(1, vo.getEmpno());
//			pstmt.setString(2, vo.getEname());
//			pstmt.setString(3, vo.getJob());
//			pstmt.setInt(4, vo.getMgr());
//			pstmt.setDate(5, vo.getHiredate());
//			pstmt.setInt(6, vo.getSal());
//			pstmt.setInt(7, vo.getComm());
//			pstmt.setInt(8, vo.getDeptno());
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		return result;
//	}
	
	//전체 조회
	public ArrayList selectAll() {
		
		ArrayList<EmpVO> empList = new ArrayList<EmpVO>();
		
		sb.setLength(0); 	//버퍼비우기
		sb.append("select * from emp ");
		
		try {
			//문장 객체에 SQL문을 넣고
			pstmt = conn.prepareStatement(sb.toString());
			//실행 - 물음표 안채워도되니까 바로 실행
			rs = pstmt.executeQuery();
			
			//레코드별 정리 (각각의 레코드 값을 가져오기)
			while(rs.next()) {
				int empno = rs.getInt(1);
				String ename = rs.getString(2);
				String job = rs.getString(3);
				int mgr = rs.getInt(4);
				Date hiredate = rs.getDate(5);
				int sal = rs.getInt(6);
				int comm = rs.getInt(7);
				int deptno = rs.getInt(8);
				
				EmpVO vo = new EmpVO(empno, ename, job, mgr, hiredate,
							sal,comm,deptno);
				
				empList.add(vo);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		return empList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
