package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.GOOT7XEConnection;
import connection.OracleXEConnection;
import team_vo.VO.BoardVO;

public class BoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public BoardDAO() {
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
	
	
	//전체 게시글을 조회 - getAllData()
	public ArrayList<BoardVO> getAllData(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("order by bno asc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt(1);
				String title = rs.getString(2);
				String writer = rs.getString(3);
				String contents = rs.getString(4);
				String regdate = rs.getString(5);
				String ip = rs.getString(6);
				int status = rs.getInt(7);
				int hits = rs.getInt(8);

				BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits);
				list.add(vo);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}//getAllData() end
	
	
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
	
	
	
	
	
	
}
