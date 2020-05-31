package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.BoardVO;
import vo.TripVO;

public class TripDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	//객체 호출시 db 접속 완료되게 함
	public TripDAO() {
		// TODO Auto-generated constructor stub
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	//상품정보 입력 메소드 - insertData()
	public void insertData(TripVO vo) {
		sb.setLength(0);
		sb.append("insert into trip ");
		sb.append("values (?, trip_pno_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTema());
			pstmt.setString(2, vo.getPname());
			pstmt.setInt(3, vo.getPprice());
			pstmt.setInt(4, vo.getQty());
			pstmt.setString(5, vo.getPcontents());
			pstmt.setString(6, vo.getMainimg());
			pstmt.setString(7, vo.getDetailimg());
			pstmt.setString(8, vo.getCourse());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//insertData() end
	
	//페이징처리를 위한 총 게시물 파악 메소드
    public int getTotalCount() {
       sb.setLength(0);
       sb.append("select count(*) cnt ");       //board 안엔 카운터라는 컬럼이 없기때문에 별칭을 달아야한다.
       sb.append("from trip ");
          
       int cnt = 0;
       try {
          pstmt = conn.prepareStatement(sb.toString());
          
          rs = pstmt.executeQuery();
          
          rs.next();
          
          //cnt = rs.getInt(1); // 이렇게쓰면안됨!!! 1은 컬럼인덱스이기 때문.
          cnt = rs.getInt("cnt");          //컬럼 인덱스 대신에 컬럼네임을 적을수있으니 별칭을 쓴다!
          
          
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }
       return cnt;   
          
    }
 
	 //전체상품 목록 조회 메소드 - getAllData()
	 public ArrayList<TripVO> getAllData(int startNo, int endNo){
	    ArrayList<TripVO> list = new ArrayList<TripVO>();
	    
	    sb.setLength(0);
	    sb.append("SELECT * ");
	    sb.append("FROM (SELECT ROWNUM RN, tema, pno, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate ");
	    sb.append("FROM (SELECT * FROM TRIP ");
	    sb.append("ORDER BY PNO DESC ) ");
	    sb.append("WHERE ROWNUM <= ? ) ");
	    sb.append("WHERE RN >= ? ");
	    
	    
	    try {
	       pstmt = conn.prepareStatement(sb.toString());
	       pstmt.setInt(1, endNo);
	       pstmt.setInt(2, startNo);
	       
	       rs = pstmt.executeQuery();
	       
	       while(rs.next()) {
	          String tema = rs.getString("tema");
	          int pno = rs.getInt("pno");
	          String pname = rs.getString("pname");
	          int pprice = rs.getInt("pprice");
	          int qty = rs.getInt("qty");
	          String pcontents = rs.getString("pcontents");
	          String mainimg = rs.getString("mainimg");
	          String detailimg = rs.getString("detailimg");
	          String course = rs.getString("course");
	          String pdate = rs.getString("pdate");
	
	       
	          TripVO vo = new TripVO(pno, tema, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
	          
	          list.add(vo);
	       }
	    } catch (SQLException e) {
	       // TODO Auto-generated catch block
	       e.printStackTrace();
	    }
	    return list;
	 }//getAllData() end
	   
	
	
	
	//상품 삭제 메소드 - deleteTrip()
		public void deleteTrip(int pno) {
			sb.setLength(0);
			sb.append("delete trip ");
			sb.append("where pno = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pno);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//deleteTema() end
		
		
	
		//상품 한건 조회 메소드 - getData
		public TripVO getData(int pno) {
			
			sb.setLength(0);
			sb.append("select * from trip ");
			sb.append("where pno = ? ");
			
			TripVO vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pno);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				String tema = rs.getString("tema");
				String pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				int qty = rs.getInt("qty");
				String pcontents = rs.getString("pcontents");
				String mainimg = rs.getString("mainimg");
				String detailimg = rs.getString("detailimg");
				String course = rs.getString("course");
				String pdate = rs.getString("pdate");

				vo = new TripVO(tema, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;		
		}//getData() end
		
		//상품번호로 조회
		   public TripVO getData1(int pno) {
		      
		      sb.setLength(0);
		      sb.append("select * from trip ");
		      sb.append("where pno = ? ");
		      
		      TripVO vo = null;
		      
		      try {
		         pstmt = conn.prepareStatement(sb.toString());
		         pstmt.setInt(1, pno);
		         
		         rs = pstmt.executeQuery();
		         
		         rs.next();
		         
		         String tema = rs.getString(1);
		         String pname = rs.getString(3);
		         int pprice = rs.getInt(4);
		         int qty = rs.getInt(5);
		         String pcontents = rs.getString(6);
		         String mainimg = rs.getString(7);
		         String detailimg = rs.getString(8);
		         String course = rs.getString(9);
		         String pdate = rs.getString(10);

		         vo = new TripVO(tema, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
		         
		         
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      return vo;
		   }
	
		 //상품명으로 조회
			public TripVO getData2(String pname) {
				
				sb.setLength(0);
				sb.append("select * from trip ");
				sb.append("where pname = ? ");
				
				TripVO vo = null;
				
				try {
					pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, pname);
					
					rs = pstmt.executeQuery();
					
					rs.next();
					
					String tema = rs.getString(1);
					int pno = rs.getInt(2);
					int pprice = rs.getInt(4);
					int qty = rs.getInt(5);
					String pcontents = rs.getString(6);
					String mainimg = rs.getString(7);
					String detailimg = rs.getString(8);
					String course = rs.getString(9);
					String pdate = rs.getString(10);

					vo = new TripVO(tema, pname, pprice, qty, pcontents, mainimg, detailimg, course, pdate);
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return vo;
			}
	
}