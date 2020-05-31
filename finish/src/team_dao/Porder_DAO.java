package team_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import team_vo.Porder_VO;

public class Porder_DAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public Porder_DAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	
	//order 테이블에 정보 입력 - addData
	public void addData(Porder_VO vo) {
		
		sb.setLength(0);
		sb.append("insert into p_order ");
		sb.append("values (sysdate, P_order_PNO_SEQ.nextval, ?, ?, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getMemno());
			pstmt.setString(2, vo.getPname());
			pstmt.setInt(3, vo.getPprice());
			pstmt.setString(4, vo.getStatus());
			pstmt.setString(5, vo.getTdate());
			System.out.println("addData");
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}//addData() end
	
	
	//memno로 전체조회
    public ArrayList<Porder_VO> getMyreserve(String memno){
        ArrayList<Porder_VO> list = new ArrayList<Porder_VO>();
        
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
           
             Porder_VO vo = new Porder_VO(odate, ono, mno, pname, pprice, status, tdate);   
             list.add(vo);
           }
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return list;
     }//getAllData() end
	

    
  //오더 상품별 순위 5개 전체조회 수정
    public ArrayList<String> getAllorder2(){
    	ArrayList<String> list = new ArrayList<String>();
    	
    	sb.setLength(0);
    	sb.append("select * from ");
    	sb.append("(select pname, count(pname) as max ");
    	sb.append("from p_order ");
    	sb.append("group by pname ");
    	sb.append("order by max desc) ");
    	sb.append("where rownum < 10 ");
    	
    	int max = 0;
    	
    	try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				max = rs.getInt("max");
				list.add(pname);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return list;
    }
    
    
    
    
    
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
