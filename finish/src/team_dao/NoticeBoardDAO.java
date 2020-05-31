package team_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.NoticeBoardVO;

public class NoticeBoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public NoticeBoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	public void addData(NoticeBoardVO vo) {
		
		sb.setLength(0);
		sb.append("insert into noticeboard ");
		sb.append("values (noticeboard_bno_seq.nextval, ?,?,?,sysdate ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getBcontents());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//addData() end
	
	public ArrayList<NoticeBoardVO> getAllData(int startNo, int endNo){
		ArrayList<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM (SELECT ROWNUM,BNO,BTITLE,MNAME,BCONTENTS,BREGDATE ");
		sb.append("FROM (SELECT * FROM NOTICEBOARD ");
		sb.append("ORDER BY BNO DESC ) ");
		sb.append("WHERE ROWNUM <= ? ) ");
		sb.append("WHERE ROWNUM >= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int bno = rs.getInt("bno");
				String btitle = rs.getString("btitle");
				String mname = rs.getString("mname");
				String bcontents = rs.getString("bcontents");
				String bregdate = rs.getString("bregdate");

				
				NoticeBoardVO vo = new NoticeBoardVO(bno, btitle, mname, bcontents, bregdate );
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//getAllData(startNo, endNo) end
	
	
	//페이징처리를 위한 총 게시물 파악 메소드
	public int getTotalCount() {

		sb.setLength(0);
		sb.append("select count(*) cnt "); 		//board 안엔 카운터라는 컬럼이 없기때문에 별칭을 달아야한다.
		sb.append("from noticeboard ");
		
		int cnt = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			//cnt = rs.getInt(1); // 이렇게쓰면안됨!!! 1은 컬럼인덱스이기 때문.
			cnt = rs.getInt("cnt"); 	//컬럼 인덱스 대신에 컬럼네임을 적을수있으니 별칭을 쓴다!
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;	
		
	}
	
	
	
	
	
	// 데이터 한 건만 조회 - 게시글 번호로 조회 - getData()
	public NoticeBoardVO getData(int bno) {
		
		sb.setLength(0);
		sb.append("select * from noticeboard ");
		sb.append("where bno = ? ");
		
		NoticeBoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			String btitle = rs.getString(2);
			String mname = rs.getString(3);
			String bcontents = rs.getString(4);
			String bregdate = rs.getString(5);
		
			
			vo = new NoticeBoardVO(bno, btitle, mname, bcontents, bregdate );
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;		
	}//getData() end
	
	

	// 게시글 수정 메소드 - (제목, 내용) - modifyData()
	public void modifyData(NoticeBoardVO vo) {
		sb.setLength(0);
		sb.append("update noticeboard ");
		sb.append("set btitle = ?, bcontents = ? ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontents());
			pstmt.setInt(3, vo.getBno());
			
			pstmt.executeUpdate();
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//modifyData() end
	
	
	
	// 게시글 삭제 메소드 - 게시글번호로 - deleteData()
	public void deleteData(int bno) {
		sb.setLength(0);
		sb.append("delete noticeboard ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//deleteData() end

	
	

}
