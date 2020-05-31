package team_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.QnABoardVO;

public class QnABoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public QnABoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	public void addData(QnABoardVO vo) {
		
		sb.setLength(0);
		sb.append("insert into qnaboard ");
		sb.append("values ( qnaboard_bno_seq.nextval, ?,?,?,sysdate,0,? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getBcontents());
			pstmt.setString(4, vo.getBpassword());
		
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//addData() end
	
	public ArrayList<QnABoardVO> getAllData(int startNo, int endNo){
		ArrayList<QnABoardVO> list = new ArrayList<QnABoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM (SELECT ROWNUM,BNO,BTITLE,MNAME,BCONTENTS,BREGDATE,BHITS,BPASSWORD ");
		sb.append("FROM (SELECT * FROM QNABOARD ");
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
				int bhits = rs.getInt("bhits");
				String bpassword = rs.getString("bpassword");
			
				
				
				QnABoardVO vo = new QnABoardVO(bno, btitle, mname, bcontents, bregdate, bhits, bpassword);
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
		sb.append("from qnaboard ");
		
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
	public QnABoardVO getData(int bno) {
		
		sb.setLength(0);
		sb.append("select * from qnaboard ");
		sb.append("where bno = ? ");
		
		QnABoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
		
			String btitle = rs.getString("btitle");
			String mname = rs.getString("mname");
			String bcontents = rs.getString("bcontents");
			String bregdate = rs.getString("bregdate");
			int bhits = rs.getInt("bhits");
			String bpassword = rs.getString("bpassword");
		
			
			
			vo = new QnABoardVO(bno, btitle, mname, bcontents, bregdate, bhits, bpassword);
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;		
	}//getData() end
	
	
	
	// 게시글 수정 메소드 - (제목, 내용) - modifyData()
	public void modifyData(QnABoardVO vo) {
		sb.setLength(0);
		sb.append("update qnaboard ");
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
		sb.append("delete qnaboard ");
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
		sb.append("update qnaboard ");
		sb.append("set bhits = bhits+1 ");
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
	
	
	//비밀번호 체크 메소드
	public boolean passwordOk(int bno, String password) {
		
		boolean ok = false;
		
		sb.setLength(0);
		sb.append("select * from qnaboard ");
		sb.append("where bno = ? and bpassword = ? ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			ok = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return ok;
	}
	
	//게시글(제목) 검색
		public ArrayList<QnABoardVO> searchbtitle(String searchtext){
			
			ArrayList<QnABoardVO> list = new ArrayList<QnABoardVO>();
			
			String query = 
					"select * from qnaboard where btitle like ? ";
			
			
			try {	

				pstmt = conn.prepareStatement(query);
				
				System.out.println(query);
				
	
				pstmt.setString(1, '%'+searchtext+'%');
				
				
				rs = pstmt.executeQuery();
				
				System.out.println(rs.next());
				while(rs.next()) {
					int bno = rs.getInt("bno");
					String btitle = rs.getString("btitle");
					String mname = rs.getString("mname");
					String bcontents = rs.getString("bcontents");
					String bregdate = rs.getString("bregdate");
					int bhits = rs.getInt("bhits");
					String bpassword = rs.getString("bpassword");
				
					
					QnABoardVO vo =
					new QnABoardVO(bno, btitle, mname, bcontents, bregdate, bhits, bpassword);
			
					
					list.add(vo);
					System.out.println(vo.toString());
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}//getAllData() end
	
		
	//게시글(내용) 검색
		public ArrayList<QnABoardVO> searchbcontents(String searchtext){
					
			ArrayList<QnABoardVO> list = new ArrayList<QnABoardVO>();
					
			String query = 
						"select * from qnaboard where bcontents like ? ";
					
					
			try {	

				pstmt = conn.prepareStatement(query);
						
				System.out.println(query);
					
			
				pstmt.setString(1, '%'+searchtext+'%');
					
						
				rs = pstmt.executeQuery();
						
				System.out.println(rs.next());
				while(rs.next()) {
					int bno = rs.getInt("bno");
					String btitle = rs.getString("btitle");
					String mname = rs.getString("mname");
					String bcontents = rs.getString("bcontents");
					String bregdate = rs.getString("bregdate");
					int bhits = rs.getInt("bhits");
					String bpassword = rs.getString("bpassword");
						
							
					QnABoardVO vo =
					new QnABoardVO(bno, btitle, mname, bcontents, bregdate, bhits, bpassword);
				
							
					list.add(vo);
					System.out.println(vo.toString());
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			return list;
		}
	
		//게시글(작성자) 검색
				public ArrayList<QnABoardVO> searchmname(String searchtext){
					
					ArrayList<QnABoardVO> list = new ArrayList<QnABoardVO>();
					
					String query = 
							"select * from qnaboard where mname like ? ";
					
					
					try {	

						pstmt = conn.prepareStatement(query);
						
						System.out.println(query);
						
			
						pstmt.setString(1, '%'+searchtext+'%');
						
						
						rs = pstmt.executeQuery();
						
						System.out.println(rs.next());
						while(rs.next()) {
							int bno = rs.getInt("bno");
							String btitle = rs.getString("btitle");
							String mname = rs.getString("mname");
							String bcontents = rs.getString("bcontents");
							String bregdate = rs.getString("bregdate");
							int bhits = rs.getInt("bhits");
							String bpassword = rs.getString("bpassword");
						
							
							QnABoardVO vo =
							new QnABoardVO(bno, btitle, mname, bcontents, bregdate, bhits, bpassword);
					
							
						list.add(vo);
						System.out.println(vo.toString());
					}
						
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
			return list;
		}
}
