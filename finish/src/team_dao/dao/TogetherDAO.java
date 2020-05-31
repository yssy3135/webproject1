package team_dao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import connection.GOOT7XEConnection;
import connection.OracleXEConnection;
import team_vo.VO.TogetherVO;

public class TogetherDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	
	
	public TogetherDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	//게시글 입력 메소드 - addData()
			
	public void addData(TogetherVO vo) {
		sb.setLength(0);
		sb.append("insert into together " );
		sb.append("values (together_seq.nextval,?,0,0,?,?,?,?,?,?,?,?,sysdate,0,0 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getTbtitle());

			//아이디 받아와야함
			pstmt.setString(2, vo.getTbid());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getSchedule());
			pstmt.setString(5, vo.getTbspot());
			pstmt.setString(6, vo.getTbthema());
			pstmt.setString(7, vo.getTbproduct());
			pstmt.setString(8, vo.getTbage());
			pstmt.setString(9, vo.getTbgender());
				
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addData() end
			
	// 전체 게시글 조회 - getAllData()
	public ArrayList<TogetherVO> getAllData(){
		
		ArrayList<TogetherVO> list = new ArrayList<TogetherVO>();
		
		sb.setLength(0);
		sb.append("select * from together ");
		sb.append("order by bno desc ");
		
		//db로부터 빨리받아오는게 중요
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int tbnum = rs.getInt(1);
				 String tbtitle = rs.getString(2);
				 int tbheart = rs.getInt(3);
				 int tbstatus = rs.getInt(4);
				 String tbid = rs.getString(5);
				 String contents = rs.getString(6);
				 String schedule = rs.getString(7);
				 String tbspot = rs.getString(8);
				 String tbthema = rs.getString(9);
				 String tbproduct = rs.getString(10);
				 String tbage = rs.getString(11);
				 String tbgender = rs.getString(12);
				 String tbdate = rs.getString(13);
				 String tbip = rs.getString(14);
				 int tbhits = rs.getInt(15);
				
				TogetherVO vo = new TogetherVO(tbnum, tbtitle, tbheart, tbstatus, tbid, contents, schedule, tbspot, tbthema, tbproduct, tbage, tbgender, tbdate, tbip, tbhits);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}// getAllData() end
	
	
	
	
	
public ArrayList<TogetherVO> getAllData(int startNo,int endNo){
		
		ArrayList<TogetherVO> list = new ArrayList<TogetherVO>();
		sb.setLength(0);
		sb.append("select * " );
		sb.append("from (select rownum RN,tbnum,tbtitle,tbstatus,tbid,tbcontents,tbspot,tbhits,tbregdate " );
		sb.append("from (select * from together " );
		sb.append("where tbip = 0  " );
		sb.append("order by tbnum desc) " );
		sb.append("where rownum <= ?) " );
		sb.append("WHERE RN >=? " );
		

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				 int tbnum = rs.getInt("tbnum");
				 String tbtitle = rs.getString("tbtitle");
				 int tbstatus = rs.getInt("tbstatus");
				 String tbid = rs.getString("tbid");
				 String tbspot = rs.getString("tbspot");
				 int tbhits = rs.getInt("tbhits");
				 String tbregdate = rs.getString("tbregdate");
				
				
				TogetherVO vo = new TogetherVO();
				
				vo.setTbnum(tbnum);
				vo.setTbtitle(tbtitle);
				vo.setTbstatus(tbstatus);
				vo.setTbid(tbid);
				vo.setTbspot(tbspot);
				vo.setTbhits(tbhits);
				vo.setTbdate(tbregdate);
			
				
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}// getAllData(startNo,endNo) end




public ArrayList<TogetherVO> titleop(String word,int startNo,int endNo){
	
	ArrayList<TogetherVO> list = new ArrayList<TogetherVO>();
	sb.setLength(0);
	sb.append("select * " );
	sb.append("from (select rownum RN,tbnum,tbtitle,tbstatus,tbid,tbcontents,tbspot,tbhits,tbregdate " );
	sb.append("from (select * from together " );
	sb.append("where tbip = 0 and (tbid like ? OR tbcontents like ? OR TBSPOT LIKE ?) " );
	sb.append("order by tbnum desc) " );
	sb.append("where rownum <= ?) " );
	sb.append("WHERE RN >=? " );
	

	try {
		pstmt = conn.prepareStatement(sb.toString());
	
		pstmt.setString(1, word);
		pstmt.setString(2, word);
		pstmt.setString(3, word);
		pstmt.setInt(4, endNo);
		pstmt.setInt(5, startNo);
		
		rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			
			 int tbnum = rs.getInt("tbnum");
			 String tbtitle = rs.getString("tbtitle");
			 int tbstatus = rs.getInt("tbstatus");
			 String tbid = rs.getString("tbid");
			 String tbspot = rs.getString("tbspot");
			 int tbhits = rs.getInt("tbhits");
			 String tbregdate = rs.getString("tbregdate");
			
			
			TogetherVO vo = new TogetherVO();
			
			vo.setTbnum(tbnum);
			vo.setTbtitle(tbtitle);
			vo.setTbstatus(tbstatus);
			vo.setTbid(tbid);
			vo.setTbspot(tbspot);
			vo.setTbhits(tbhits);
			vo.setTbdate(tbregdate);
		
			
			
			list.add(vo);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	
	
	return list;
	
}// getAllData(startNo,endNo) end


public int gettitleTotalCount(String word) {
	sb.setLength(0);
	sb.append("select count(*) cnt " );
	sb.append("from together ");
	sb.append("where 'tbid' like ? OR tbcontents like ? OR TBSPOT LIKE ? " );
	
	int cnt = 0;
	try {
		pstmt = conn.prepareStatement(sb.toString());

		pstmt.setString(1, word);
		pstmt.setString(2, word);
		pstmt.setString(3, word);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		
//		cnt = rs.getInt(1); <X>
		
		cnt = rs.getInt("cnt");
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return cnt;
} // getTotalCount() end0




public ArrayList<TogetherVO> status(int status){
	
	ArrayList<TogetherVO> list = new ArrayList<TogetherVO>();
	sb.setLength(0);
	sb.append("select * " );
	sb.append("from (select rownum RN,tbnum,tbtitle,tbstatus,tbid,tbcontents,tbspot,tbhits,tbregdate " );
	sb.append("from (select * from together " );
	sb.append("where tbstatus = ?) " );
	sb.append("order by tbnum desc) " );

	

	try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setInt(1, status);

		
		rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			
			 int tbnum = rs.getInt("tbnum");
			 String tbtitle = rs.getString("tbtitle");
			 int tbstatus = rs.getInt("tbstatus");
			 String tbid = rs.getString("tbid");
			 String tbspot = rs.getString("tbspot");
			 int tbhits = rs.getInt("tbhits");
			 String tbregdate = rs.getString("tbregdate");
			
			
			TogetherVO vo = new TogetherVO();
			
			vo.setTbnum(tbnum);
			vo.setTbtitle(tbtitle);
			vo.setTbstatus(tbstatus);
			vo.setTbid(tbid);
			vo.setTbspot(tbspot);
			vo.setTbhits(tbhits);
			vo.setTbdate(tbregdate);
		
			
			
			list.add(vo);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	
	
	return list;
	
}// getAllData(startNo,endNo) end


public ArrayList<TogetherVO> notice(int num){
	
	ArrayList<TogetherVO> list = new ArrayList<TogetherVO>();
	sb.setLength(0);
	sb.append("select * ");
	sb.append("from (select * ");
	sb.append("		from together " );
	sb.append("		where tbip = 1 " );
	sb.append("		order by tbip desc) ");
	sb.append("where rownum <=? ");
	

	try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setInt(1, num);
	
		
		rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			
			 int tbnum = rs.getInt("tbnum");
			 String tbtitle = rs.getString("tbtitle");
			 int tbstatus = rs.getInt("tbstatus");
			 String tbid = rs.getString("tbid");
			 String tbspot = rs.getString("tbspot");
			 int tbhits = rs.getInt("tbhits");
			 String tbregdate = rs.getString("tbregdate");
			
			
			TogetherVO vo = new TogetherVO();
			
			vo.setTbnum(tbnum);
			vo.setTbtitle(tbtitle);
			vo.setTbstatus(tbstatus);
			vo.setTbid(tbid);
			vo.setTbspot(tbspot);
			vo.setTbhits(tbhits);
			vo.setTbdate(tbregdate);
		
			
			
			list.add(vo);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	
	
	return list;
	
}// getAllData(startNo,endNo) end


	
	// 데이터 한건 조회 메소드 - 게시글번호 - getData();
	public TogetherVO getData(int tbnum) {
		sb.setLength(0);
		sb.append("select * from together ");
		sb.append("where tbnum = ? " );
		System.out.println("연결");
		TogetherVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1,tbnum);
			
			rs = pstmt.executeQuery();
			rs.next();
			

		
			 String tbtitle = rs.getString(2);
			 int tbheart = rs.getInt(3);
			 int tbstatus = rs.getInt(4);
			 String tbid = rs.getString(5);
			 String contents = rs.getString(6);
			 String schedule = rs.getString(7);
			 String tbspot = rs.getString(8);
			 String tbthema = rs.getString(9);
			 String tbproduct = rs.getString(10);
			 String tbage = rs.getString(11);
			 String tbgender = rs.getString(12);
			 String tbdate = rs.getString(13);
			 String tbip = rs.getString(14);
			 int tbhits = rs.getInt(15);
			 
			 System.out.println(tbtitle);
			
			vo = new TogetherVO(tbnum, tbtitle, tbheart, tbstatus, tbid, contents, schedule, tbspot, tbthema, tbproduct, tbage, tbgender, tbdate, tbip, tbhits);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
		
	}//getData() end
	
	// 게시글 수정 메소드 - (제목, 내용, 현황 완료) -modifyData()
	public void modifyData(TogetherVO vo) {
		sb.setLength(0);
		sb.append("update together ");
		sb.append("set tbtitle = ?, tbcontents = ? ,tbstatus = ? ,tbschedule = ?,tbspot = ? ,tbthema = ? ,tbproduct = ? , tbage= ?, tbgender = ? ");
		sb.append("where tbnum = ? " );
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTbtitle());
			pstmt.setString(2, vo.getContents());
			pstmt.setInt(3, vo.getTbstatus());
			pstmt.setString(4, vo.getSchedule());
			pstmt.setString(5, vo.getTbspot());
			pstmt.setString(6, vo.getTbthema());
			pstmt.setString(7, vo.getTbproduct());
			pstmt.setString(8, vo.getTbage());
			pstmt.setString(9, vo.getTbgender());
			pstmt.setInt(10, vo.getTbnum());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//modifyData() end
	
	//게시글 삭제 메소드 - 게시글 번호 - deleteData()
	public void deleteData(int tbnum) {
		
		sb.setLength(0);
		sb.append("delete together ");
		sb.append("where tbnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, tbnum);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}// deleteData() end
	
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) cnt " );
		sb.append("from together ");
		
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
	
	public void raiseHits(int tbnum) {
		sb.setLength(0);
		sb.append("update together ");
		sb.append("set tbhits = tbhits+1 ");
		sb.append("where tbnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, tbnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void up(int bno)	{
		sb.setLength(0);
		sb.append("update together ");
		sb.append("set tbheart = tbheart+1 ");
		sb.append("where tbnum = ? ");
		
		
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
		sb.append("update together ");
		sb.append("set tbheart = tbheart-1 ");
		sb.append("where tbnum = ? ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	
	
	public void finish(int bno)	{
		sb.setLength(0);
		sb.append("update together ");
		sb.append("set tbstatus = 1 ");
		sb.append("where tbnum = ? ");
		
		
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
