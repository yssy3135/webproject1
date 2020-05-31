package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.P_OrderVO;

public class P_OrderDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public P_OrderDAO() {
		// TODO Auto-generated constructor stub
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	///전체주문목록 조회 메소드 - selectOrder()
	   public ArrayList<P_OrderVO> selectOrder(int startNo, int endNo){
		      ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
		         
		      sb.setLength(0);
		      sb.append("SELECT * ");
		      sb.append("FROM (SELECT ROWNUM RN, ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE ");
		      sb.append("FROM (SELECT * FROM P_ORDER ");
		      sb.append("ORDER BY ODATE DESC ) ");
		      sb.append("WHERE ROWNUM <= ? ) ");
		      sb.append("WHERE RN >= ? ");
		      
		      /*
		       * sb.
		       * append("SELECT ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE "
		       * ); sb.append("FROM P_ORDER  "); sb.append("ORDER BY ODATE DESC ");
		       */
		      
		       try {
		         pstmt = conn.prepareStatement(sb.toString());
		         pstmt.setInt(1, endNo);
		         pstmt.setInt(2, startNo);

		         rs = pstmt.executeQuery();
		         
		         while(rs.next()){
		            String odate = rs.getString("odate");
		            int ono = rs.getInt("ono");
		            int memno = rs.getInt("memno");
		            String pname = rs.getString("pname");
		            int pprice = rs.getInt("pprice");
		            String status = rs.getString("status");
		            String tdate = rs.getString("tdate");
		            
		            P_OrderVO vo = new P_OrderVO(odate, ono, memno, pname, pprice, status, tdate);
		            
		            list.add(vo);
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      return list;
		   }//selectOrder() end
	
	//마이페이지 조회 메소드 - getData  
	   public P_OrderVO getData(int memno) {
		sb.setLength(0);
		sb.append("SELECT ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE ");
		sb.append("from p_order ");
		sb.append("where memno = ? ");
		
		P_OrderVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, memno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			String odate = rs.getString("odate");
			int ono = rs.getInt("ono");
			String pname = rs.getString("pname");
			int pprice = rs.getInt("pprice");
			String status = rs.getString("status");
			String tdate = rs.getString("tdate");
			
			vo = new P_OrderVO(odate, ono, pname, pprice, status, tdate);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}//getData() end
	
	
	//페이징처리를 위한 총 게시물 파악 메소드
		public int getTotalCount() {
			sb.setLength(0);
			sb.append("select count(*) cnt "); 		//board 안엔 카운터라는 컬럼이 없기때문에 별칭을 달아야한다.
			sb.append("from p_order ");
			
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
		
		
	//주문 (입금전+입금후) -selectOrderPrice()
	public String selectOrderPrice() {
		sb.setLength(0);
		sb.append("select to_char(sum(pprice), '999,999') sumprice ");
		sb.append("from p_order ");
		sb.append("where (status= '입금전' or status = '입금완료') and (to_date(odate, 'yy/mm/dd') = to_date(sysdate, 'yy/mm/dd'))	 ");
		
		String sumprice = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());	
			rs = pstmt.executeQuery();
			rs.next();
			
			sumprice = rs.getString("sumprice");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sumprice;
	}
		
	//결제(입금완료) - selectOk()
	public String selectOk() {
		sb.setLength(0);
		sb.append("select to_char(sum(pprice), '999,999') sumprice ");
		sb.append("from p_order ");
		sb.append("where status= '입금완료' and (to_date(odate, 'yy/mm/dd') = to_date(sysdate, 'yy/mm/dd')) ");

		String sumprice = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			
			sumprice = rs.getString("sumprice");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sumprice;
	}
	
	//환불(입금후취소) - selectCafter()
	public String selectCafter() {
		sb.setLength(0);
		sb.append("select to_char(sum(pprice), '999,999') sumprice ");
		sb.append("from p_order ");
		sb.append("where status= '입금후취소' and (to_date(odate, 'yy/mm/dd') = to_date(sysdate, 'yy/mm/dd')) ");

		String sumprice = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			
			sumprice = rs.getString("sumprice");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sumprice;
	}
	
	//입금전
	public int aA() {
		sb.setLength(0);
		sb.append("select count(*) before from p_order ");
		sb.append("where status = '입금전' and MONTHS_BETWEEN(SYSDATE, odate) <= 1 ");
		
		int before = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			
			before = rs.getInt("before");
			
		} catch (SQLException e) {			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return before;
	}
	
	//입금완료
	public int aB() {
		sb.setLength(0);
		sb.append("select count(*) ok from p_order ");
		sb.append("where status = '입금완료' and MONTHS_BETWEEN(SYSDATE, odate) <= 1 ");
		
		int ok = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			
			ok = rs.getInt("ok");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ok;
	}
	//입금전취소
	public int aC(){
		sb.setLength(0);
		sb.append("select count(*) cbefore from p_order ");
		sb.append("where status = '입금전취소' and MONTHS_BETWEEN(SYSDATE, odate) <= 1 ");
		
		int cbefore = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			
			cbefore = rs.getInt("cbefore");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cbefore;
	}
	
	//입금후취소
	public int aD(){
		sb.setLength(0);
		sb.append("select count(*) cafter from p_order ");
		sb.append("where status = '입금후취소' and MONTHS_BETWEEN(SYSDATE, odate) <= 1 ");
		
		int cafter = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			
			cafter = rs.getInt("cafter");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cafter;
	}
	

	//입금전
	public ArrayList<P_OrderVO> moenyBefore(){
		ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
		
		sb.setLength(0);
		sb.append("select ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE ");
		sb.append("FROM P_ORDER  ");
		sb.append("where status = '입금전' ");
		sb.append("order by odate desc  ");		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String odate = rs.getString("odate");
				int ono = rs.getInt("ono");
				int memno = rs.getInt("memno");
				String pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				String status = rs.getString("status");
				String tdate = rs.getString("tdate");
				
				P_OrderVO vo = new P_OrderVO(odate, ono, memno, pname, pprice, status, tdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//selectBefore() end
	
	//입금완료
		public ArrayList<P_OrderVO> moneyOk(){
			ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
			
			sb.setLength(0);
			sb.append("select ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE ");
			sb.append("FROM P_ORDER  ");
			sb.append("where status = '입금완료' ");
			sb.append("order by odate desc  ");
			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String odate = rs.getString("odate");
					int ono = rs.getInt("ono");
					int memno = rs.getInt("memno");
					String pname = rs.getString("pname");
					int pprice = rs.getInt("pprice");
					String status = rs.getString("status");
					String tdate = rs.getString("tdate");
					
					P_OrderVO vo = new P_OrderVO(odate, ono, memno, pname, pprice, status, tdate);
					
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}//selectOrder() end

		//입금전취소
				public ArrayList<P_OrderVO> moneyCbefore(){
					ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
					
					sb.setLength(0);
					sb.append("select ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE ");
					sb.append("FROM P_ORDER  ");
					sb.append("where status = '입금전취소' ");
					sb.append("order by odate desc  ");
					
				
					
					try {
						pstmt = conn.prepareStatement(sb.toString());
						rs = pstmt.executeQuery();
						
						while(rs.next()){
							String odate = rs.getString("odate");
							int ono = rs.getInt("ono");
							int memno = rs.getInt("memno");
							String pname = rs.getString("pname");
							int pprice = rs.getInt("pprice");
							String status = rs.getString("status");
							String tdate = rs.getString("tdate");
							
							P_OrderVO vo = new P_OrderVO(odate, ono, memno, pname, pprice, status, tdate);
							
							list.add(vo);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return list;
				}//selectOrder() end
				
				//입금후취소
				public ArrayList<P_OrderVO> moneyCbafter(){
					ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
					
					sb.setLength(0);
					sb.append("select ODATE, ONO, MEMNO, PNAME, PPRICE, STATUS, TO_CHAR(TDATE, 'YYYY-MM-DD') TDATE ");
					sb.append("FROM P_ORDER  ");
					sb.append("where status = '입금후취소' ");
					sb.append("order by odate desc  ");
				
					
					try {
						pstmt = conn.prepareStatement(sb.toString());
						rs = pstmt.executeQuery();
						
						while(rs.next()){
							String odate = rs.getString("odate");
							int ono = rs.getInt("ono");
							int memno = rs.getInt("memno");
							String pname = rs.getString("pname");
							int pprice = rs.getInt("pprice");
							String status = rs.getString("status");
							String tdate = rs.getString("tdate");
							
							P_OrderVO vo = new P_OrderVO(odate, ono, memno, pname, pprice, status, tdate);
							
							list.add(vo);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return list;
				}//selectOrder() end
				
				//memno로 전체조회
			    public ArrayList<P_OrderVO> getMyreserve(String memno){
			        ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
			        
			        sb.setLength(0);
			        sb.append("select * from p_order ");
			        sb.append("where memno = ? ");
			        
			        try {
			           pstmt = conn.prepareStatement(sb.toString());
			           pstmt.setString(1, memno);
			           rs = pstmt.executeQuery();
			           
			           while(rs.next()) {
			        	 String odate = rs.getString(1);
			             int ono = rs.getInt(2);
			             int mno = rs.getInt(3);
			             String pname = rs.getString(4);
			             int pprice = rs.getInt(5);
			             String status = rs.getString(6);
			             String tdate = rs.getString(7);
			           
			             P_OrderVO vo = new P_OrderVO(odate, ono, mno, pname, pprice, status, tdate);   
			             list.add(vo);
			           }
			        } catch (SQLException e) {
			           // TODO Auto-generated catch block
			           e.printStackTrace();
			        }  
			        return list;
			     }//getAllData() end
			    
			    //결제
			    public void payNo(String ono, String afterStatus) {
			        
			        sb.setLength(0);
			        sb.append("update p_order ");
			        sb.append("set status = ? ");
			        sb.append("where ono = ? ");
			        
			        try {
			           pstmt = conn.prepareStatement(sb.toString());
			           pstmt.setString(1, afterStatus);
			           pstmt.setString(2, ono);
			     
			           
			           pstmt.executeUpdate();
			           
			           System.out.println("결제 취소 DB");
			           
			        } catch (SQLException e) {
			           // TODO Auto-generated catch block
			           e.printStackTrace();
			        }
			        
			     }
			    
			    //결제2
			    public void pay(String ono) {
			        sb.setLength(0);
			        sb.append("update p_order ");
			        sb.append("set status = '입금완료' ");
			        sb.append("where ono = ? ");
			        
			        try {
			           pstmt = conn.prepareStatement(sb.toString());
			           pstmt.setString(1, ono);
			     
			           
			           pstmt.executeUpdate();
			           
			           System.out.println("결제완료 DB");
			           
			        } catch (SQLException e) {
			           // TODO Auto-generated catch block
			           e.printStackTrace();
			        }
			        

			     
			     }//pay end

				

}
