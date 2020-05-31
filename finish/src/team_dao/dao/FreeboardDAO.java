package team_dao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.VO.freeboardVO;

public class FreeboardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	
	
	public FreeboardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	//게시글 입력 메소드 - addData()
			
	public void addData(team_vo.VO.freeboardVO vo) {
		sb.setLength(0);
		sb.append("insert into freeboard " );
		sb.append("values (FREEBOARD_SEQ.nextval,?,?,?,sysdate,0,0,0 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContents());
			//pstmt.setString(4, vo.getIp());
//			pstmt.setInt(5, vo.getStatus());
//			pstmt.setInt(6, vo.getHits());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addData() end
			
	// 전체 게시글 조회 - getAllData() - 페이징 처리를 위해 시작번호, 끝번호가 필요
	public ArrayList<freeboardVO> getAllData(int startNo,int endNo){
		
		ArrayList<freeboardVO> list = new ArrayList<freeboardVO>();
		sb.setLength(0);
		sb.append("select * " );
		sb.append("from (select rownum RN,FBNO,FTITLE,FWRITER,FCONTENTS,FREGDATE,FIP,FHITS,FUP " );
		sb.append("from (select * from freeboard " );
		sb.append("where fip = 0 " );
		sb.append("order by fbno desc) " );
		sb.append("where rownum <= ?) " );
		sb.append("WHERE RN >=? " );
		

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				int bno = rs.getInt("fbno");
				String title = rs.getString("ftitle");
				String writer = rs.getString("fwriter");
				String contents = rs.getString("fcontents");
				String regdate = rs.getString("fregdate");
				String ip = rs.getString("fip");
				int hits = rs.getInt("fhits");
				int recommend = rs.getInt("fup");
				
				freeboardVO vo = new freeboardVO(bno, title, writer, contents, regdate, ip, hits, recommend);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}// getAllData(startNo,endNo) end
	
	
	
	public ArrayList<freeboardVO> search(String word,int startNo,int endNo){
		
		ArrayList<freeboardVO> list = new ArrayList<freeboardVO>();
		sb.setLength(0);
		sb.append("select * " );
		sb.append("from (select rownum RN,FBNO,FTITLE,FWRITER,FCONTENTS,FREGDATE,FIP,FHITS,FUP " );
		sb.append("from (select * from freeboard " );
		sb.append("where fip = 0 and (fcontents like ? or ftitle like ? ) " );
		sb.append("order by fbno desc) " );
		sb.append("where rownum <= ?) " );
		sb.append("WHERE RN >=? " );
		

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, word);
			pstmt.setString(2, word);
			pstmt.setInt(3, endNo);
			pstmt.setInt(4, startNo);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				int bno = rs.getInt("fbno");
				String title = rs.getString("ftitle");
				String writer = rs.getString("fwriter");
				String contents = rs.getString("fcontents");
				String regdate = rs.getString("fregdate");
				String ip = rs.getString("fip");
				int hits = rs.getInt("fhits");
				int recommend = rs.getInt("fup");
				
				freeboardVO vo = new freeboardVO(bno, title, writer, contents, regdate, ip, hits, recommend);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}// getAllData(startNo,endNo) end
	
	//공지
	public ArrayList<freeboardVO> notice(int num){
		
		ArrayList<freeboardVO> list = new ArrayList<freeboardVO>();
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from (select * ");
		sb.append("		from freeboard " );
		sb.append("		where fip = 1 " );
		sb.append("		order by fip desc) ");
		sb.append("where rownum <=? ");
		

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				int bno = rs.getInt("fbno");
				String title = rs.getString("ftitle");
				String writer = rs.getString("fwriter");
				String contents = rs.getString("fcontents");
				String regdate = rs.getString("fregdate");
				String ip = rs.getString("fip");
				int hits = rs.getInt("fhits");
				int recommend = rs.getInt("fup");
				
				freeboardVO vo = new freeboardVO(bno, title, writer, contents, regdate, ip, hits, recommend);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}// getAllData(startNo,endNo) end
	
	
	
	
		
	// 총게시물 파악 메소드
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) cnt " );
		sb.append("from freeboard ");
		
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
//			cnt = rs.getInt(1); <X>
			
			cnt = rs.getInt("cnt");
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	} // getTotalCount() end0
	
	
	public int searchCount(String word) {
		sb.setLength(0);
		sb.append("select count(*) cnt " );
		sb.append("from freeboard ");
		sb.append("where fip = 0 and (fcontents like ? or ftitle like ? ) ");
		
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			
			pstmt.setString(1, word);
			pstmt.setString(2, word);
			
			rs = pstmt.executeQuery();
			rs.next();
			
//			cnt = rs.getInt(1); <X>
			
			cnt = rs.getInt("cnt");
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	} // getTotalCount() end0
	
	
	
	// 데이터 한건 조회 메소드 - 게시글번호 - getData();
	public freeboardVO getData(int bno) {
		sb.setLength(0);
		sb.append("select * from freeboard ");
		sb.append("where fbno = ? " );
		
		freeboardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1,bno);
			
			rs = pstmt.executeQuery();
			rs.next();
			

			String title = rs.getString(2);
			String writer = rs.getString(3);
			String contents = rs.getString(4);
			String regdate = rs.getString(5);
			String ip = rs.getString(6);
			int hits = rs.getInt(7);
			int up = rs.getInt(8);
			System.out.println(contents);
			vo = new freeboardVO(bno, title, writer, contents, regdate, ip, hits, up);
			
		
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
		
	}//getData() end
	
	// 게시글 수정 메소드 - (제목, 내용) -modifyData()
	public void modifyData(freeboardVO vo) {
		sb.setLength(0);
		sb.append("update freeboard ");
		sb.append("set ftitle = ?, fcontents = ? ");
		sb.append("where fbno = ? " );
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
	
	//게시글 삭제 메소드 - 게시글 번호 - deleteData()
	public void deleteData(int bno) {
		
		sb.setLength(0);
		sb.append("delete freeboard ");
		sb.append("where fbno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}// deleteData() end
	
	 // 조회수 증가 메소드
	public void raiseHits(int bno) {
		sb.setLength(0);
		sb.append("update freeboard ");
		sb.append("set fhits = fhits+1 ");
		sb.append("where fbno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void up(int bno)	{
		sb.setLength(0);
		sb.append("update freeboard ");
		sb.append("set fup = fup+1 ");
		sb.append("where fbno = ? ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	
	public void down(int bno)	{
		sb.setLength(0);
		sb.append("update freeboard ");
		sb.append("set fup = fup-1 ");
		sb.append("where fbno = ? ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	

	
	

}
