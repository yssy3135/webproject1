	package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.FestivalVO;

public class FestivalDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public FestivalDAO() {
		// TODO Auto-generated constructor stub
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	//축제정보 입력 메소드 - insertFestival()
	public void insertFestival(FestivalVO vo) {
		sb.setLength(0);
		sb.append("insert into festival ");
		sb.append("values (?, ?, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getLocation());
			pstmt.setString(2, vo.getFname());
			pstmt.setString(3, vo.getFimg());
			pstmt.setString(4, vo.getFdate());
			pstmt.setString(5, vo.getFdate1());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//insertFestival() end
	
	//축제정보 조회 메소드 - selectFestival()
	public ArrayList<FestivalVO> selectFestival(){
		ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();
		
		sb.setLength(0);
		sb.append("SELECT LOCATION, FNAME, FIMG, TO_CHAR(FDATE, 'YYYY/MM/DD') FDATE, TO_CHAR(FDATE1, 'YYYY/MM/DD') FDATE1 ");
		sb.append("FROM FESTIVAL ");
		sb.append("ORDER BY FDATE1 DESC " );

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String location = rs.getString("location");
				String fname = rs.getString("fname");
				String fimg = rs.getString("fimg");
				String fdate = rs.getString("fdate");
				String fdate1 = rs.getString("fdate1");
				
				FestivalVO vo = new FestivalVO(location, fname, fimg, fdate, fdate1);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//selectFestival() end

	
	//페이징처리를 위한 총 게시물 파악 메소드
		public int getTotalCount() {
			sb.setLength(0);
			sb.append("select count(*) cnt "); 		//board 안엔 카운터라는 컬럼이 없기때문에 별칭을 달아야한다.
			sb.append("from festival ");
			
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
		
		//축제 삭제 메소드 - deleteFestival()
		public void deleteFestival(String fname) {
			sb.setLength(0);
			sb.append("delete festival ");
			sb.append("where fname = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, fname);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//deleteTema() end
		
		//축제이미지 조회 메소드 - selectFimg()
		public FestivalVO selectFimg(String fname) { 
			sb.setLength(0);
			sb.append("select * from festival ");
			sb.append("where fname = ? ");
			
			FestivalVO vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, fname);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				String location = rs.getString("location");
				String fimg = rs.getString("fimg");
				String fdate = rs.getString("fdate");
				String fdate1 = rs.getString("fdate1");
				
				vo = new FestivalVO(location, fimg, fdate, fdate1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;
		}
		
		
}
