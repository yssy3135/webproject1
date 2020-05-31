package team_dao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.VO.BoardVO;
import team_vo.VO.CommentVO;

public class ProjectDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	
	
	public ProjectDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	//게시글 입력 메소드 - addData()
			
	public void addData(BoardVO vo) {
		sb.setLength(0);
		sb.append("insert into board " );
		sb.append("values (board_bno_seq.nextval,?,?,?,sysdate,0,0,0,?,?,0 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContents());
	
			pstmt.setString(4, vo.getProex());
			pstmt.setString(5, vo.getSpot());
			
//			pstmt.setInt(5, vo.getStatus());
//			pstmt.setInt(6, vo.getHits());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addData() end
			
	// 전체 게시글 조회 - getAllData() - 페이징 처리를 위해 시작번호, 끝번호가 필요
	public ArrayList<BoardVO> getAllData(int startNo,int endNo){
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		sb.setLength(0);
		sb.append("select * " );
		sb.append("from (select rownum RN,BNO,TITLE,WRITER,CONTENTS,TO_CHAR(REGDATE,'YY/MM/DD'),IP,STATUS,HITS,RE,SPOT,UP " );
		sb.append("from (select * from board " );
		sb.append("where ip = 0 " );
		sb.append("order by bno desc) " );
		sb.append("where rownum <= ?) " );
		sb.append("WHERE RN >=? " );
		

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
				String regdate = rs.getString("TO_CHAR(REGDATE,'YY/MM/DD')");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");
				int hits = rs.getInt("hits");
				String proex = rs.getString("re");
				String spot = rs.getString("spot");
				int up = rs.getInt("up");
				
			
				BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits, spot, up,proex);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}// getAllData(startNo,endNo) end
	
	
	
	public ArrayList<BoardVO> seach(String word,int startNo,int endNo){
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		sb.setLength(0);
		sb.append("select * " );
		sb.append("from (select rownum RN,BNO,TITLE,WRITER,CONTENTS,TO_CHAR(REGDATE,'YY/MM/DD'),IP,STATUS,HITS,SPOT,UP " );
		sb.append("from (select * from board " );
		sb.append("where ip = 0 and (contents like ? or title like ? ) " );
		sb.append("order by bno desc) " );
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
				
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String contents = rs.getString("contents");
				String regdate = rs.getString("TO_CHAR(REGDATE,'YY/MM/DD')");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");
				int hits = rs.getInt("hits");
				String spot = rs.getString("spot");
				int up = rs.getInt("up");
				
				BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits, spot,up);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}// getAllData(startNo,endNo) end
	
	
	// 공지
	public ArrayList<BoardVO> notice(int num){
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		sb.setLength(0);
		
		sb.append("select * ");
		sb.append("from (select * ");
		sb.append("		from board " );
		sb.append("		where ip = 1 " );
		sb.append("		order by ip desc) ");
		sb.append("where rownum <=? ");
		  
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, num);
			
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
				String spot = rs.getString("spot");
				int up = rs.getInt("up");
				
				BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits, spot,up);
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
		sb.append("from board ");
		
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
		sb.append("from board ");
		sb.append("where ip = 0 and (contents like ? or title like ? ) " );
		
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
	public BoardVO getData(int bno) {
		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("where bno = ? " );
		
		BoardVO vo = null;
		
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
			int status = rs.getInt(7);
			int hits = rs.getInt(8);
			String proex = rs.getString(9);
			String spot = rs.getString(10);
			int recommend = rs.getInt(11);
			

			vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits, spot, recommend, proex);
			System.out.println(recommend);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
		
	}//getData() end
	
	// 게시글 수정 메소드 - (제목, 내용) -modifyData()
	public void modifyData(BoardVO vo) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set title = ?, contents = ?, spot = ? ");
		sb.append("where bno = ? " );
		System.out.println("내용"+vo.getContents());
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContents());
			pstmt.setString(3, vo.getSpot());
			pstmt.setInt(4, vo.getBno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//modifyData() end
	
	//게시글 삭제 메소드 - 게시글 번호 - deleteData()
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
		
		
		
		
	}// deleteData() end
	
	 // 조회수 증가 메소드
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
		
	}
	
	public void status(int bno) {
		
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set status = -1 ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public int getstatus(int bno) {
		
		sb.setLength(0);
		sb.append("select status ");
		sb.append("from board ");
		sb.append("where bno = ? ");
		int status = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			status = rs.getInt("status");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
		
	}
	
	
	public void comment(CommentVO vo) {
		sb.setLength(0);
		sb.append("insert into recomment " );
		sb.append("values (recomment_seq.nextval,?,?,sysdate,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			pstmt.setInt(1, vo.getRe_bno()); // 게시물 번호
			pstmt.setString(2, vo.getRe_writer());
			pstmt.setString(3, vo.getRe_contents());
	
		
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<CommentVO> getallcomment(int bno) {
		sb.setLength(0);
		sb.append("select rno,re_writer,re_contents,re_regdate " );
		sb.append("from recomment ");
		sb.append("where re_bno = ?  ");
		sb.append("order by re_regdate desc ");
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			pstmt.setInt(1, bno); // 게시물 번호

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int cno = rs.getInt("rno");
				String writer = rs.getString("re_writer");
				String contents = rs.getString("re_contents");
				String regdate = rs.getString("re_regdate");

				
				CommentVO vo = new CommentVO();
				vo.setCno(cno);
				vo.setRe_writer(writer);
				vo.setRe_contents(contents);
				vo.setRe_regdate(regdate);
				
				System.out.println(writer);
				System.out.println(contents);
				System.out.println(regdate);
				
				
				list.add(vo);
				
				
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	public void boardcomodify(CommentVO vo) {
		
		sb.setLength(0);

		sb.append("update recomment ");
		sb.append("set RE_CONTENTS = ? ");
		sb.append("where rno = ? ");
		
		System.out.println(vo.getRe_contents());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getRe_contents());
			pstmt.setInt(2, vo.getCno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}
	public void boardcodelete(CommentVO vo) {
		
		sb.setLength(0);

		sb.append("delete recomment ");
		sb.append("where rno = ? ");
		
		System.out.println(vo.getRe_contents());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getCno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}
	
	
	
	
	
	
	public void up(int bno) {
			sb.setLength(0);
			sb.append("update board ");
			sb.append("set up = up+1 ");
			sb.append("where bno = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, bno);
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
	
	
	public void down(int bno) {
		
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set up = up-1 ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
	
	
	
	public int commentcount(int bno){
		
		sb.setLength(0);
		sb.append("select count(rownum) ");
		sb.append("from recomment ");
		sb.append("where RE_BNO = ? ");

		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt(1);
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	} //getAllReply()end

	
	
	
			
}
