package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.BoardVO;

public class BoardV2_DAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public BoardV2_DAO() {
		conn = OracleXEConnection.getInstance().getConnection(); 		//connection 객체를 만들어왔기때문에 드라이버 어쩌구 안해도되고 불러오면됨
		
	}// 생성자 end
	
	
	// 게시글 입력메소드 - allData()
	public void addData(BoardVO vo) {
		
		sb.setLength(0);
		sb.append("insert into Board ");
		sb.append("values ( board_bno_seq.nextval, ?, ?, ?, sysdate, ?, 0, 0 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			//System.out.println(conn);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getIp());
			/*
			//null방지를 위해. hits도 사용자의 동작을 받아와야하니까.
			pstmt.setInt(5, vo.getStatus());
			pstmt.setInt(6, vo.getHits());
			*/
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//addData() end
	
	
	//전체 게시글을 조회 - getAllData()					이 부분 수정. (최신글 10개 단위로 페이지마다 끊어야하기 때문)
	//페이징 처리를 위해 시작번호, 끝번호가 필요
	public ArrayList<BoardVO> getAllData(int startNo, int endNo){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM (SELECT ROWNUM RN,BNO,TITLE,WRITER,CONTENTS,IP,HITS,REGDATE,STATUS ");
		sb.append("FROM (SELECT * FROM BOARD ");
		sb.append("ORDER BY BNO DESC ) ");
		sb.append("WHERE ROWNUM <= ? ) ");
		sb.append("WHERE RN >= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");
				int hits = rs.getInt("hits");
				
				BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits);
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
		sb.append("from board ");
		
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
	
	
	
	
	
	// 데이터 한 건만 조회 - 게시글 번호로 조회 - getData()
	public BoardVO getData(int bno) {
		
		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("where bno = ? ");
		
		BoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			String title = rs.getString(2);
			String writer = rs.getString(3);
			String contents = rs.getString(4);
			String regdate = rs.getString(5);
			String ip = rs.getString(6);
			int status = rs.getInt(7);
			int hits = rs.getInt(8);
			
			vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits);
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;		
	}//getData() end
	
	
	
	// 게시글 수정 메소드 - (제목, 내용) - modifyData()
	public void modifyData(BoardVO vo) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set title = ?, contents = ? ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContents());
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
		sb.append("delete board ");
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
	
	
	
	//조회수 증가 메소드
	public void raiseHits(int bno) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set hits = hits+1 ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// raiseHits() end
	
	
	
}
