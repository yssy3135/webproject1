<%@page import="team_vo.P_Member_VO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_vo.Porder_VO"%>
<%@page import="team_dao.Porder_DAO"%>
<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order.jsp</title>
<style type="text/css">
	#orderwrap{
		width: 450px;
		height: 260px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 100px;
		border: 8px solid #beebe9;
		border-radius: 70px;
	}
	
	#orderwrap img{
		width: 100px;
		height: 100px;
		margin-left: 180px;
		margin-top: 20px;
		margin-bottom: 10px;
	}
	
	#re{
		width: 100px;
		height: 100px;
		background-color: #ffe3ed;
		font-family: '나눔스퀘어_ac ExtraBold';
		font-size: 30px;
		margin-left: 90px;
	}
	
	#btnss{
		width: 400px;
		height: 100px;
	}
	
	#listbtn{
		margin-left: 130px;
	}
	
	#listbtn, #mainbtn{
		margin-top : 20px;
		width : 100px;
		height : 50px;
		background-color: #BEEBE9;
		outline : none;
		box-shadow: none;
		border : 1px solid #BEEBE9;
		font-size: 15px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		cursor: pointer;
	}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#mainbtn').click(function(){
			location.href = "../teamproject/main.jsp";
		});
		
		$('#listbtn').click(function(){
			location.href = "main.jsp?fno=../teamproject2/myPage.jsp";
		});
		
	});
</script>
</head>
<body>
<%
	String no = request.getParameter("pno");
	Trip_DAO dao = new Trip_DAO();
	Trip_VO vo = new Trip_VO();
	
	if(no!=null){
		int pno = Integer.parseInt(no);
		vo = dao.getData(pno);
	}
	
	P_Member_DAO memdao = new P_Member_DAO();
	
	Cookie[] clist = request.getCookies();

	String memno = null;
	
	if(clist != null){
		   for(Cookie c : clist){
		      if(c.getName().equals("projectLogin")){
		         memno = URLDecoder.decode(c.getValue(), "UTF-8");
			            
	       }
	    }
	      
	 }
	P_Member_VO memvo = memdao.selectOne(memno);
	
	
	int mno = Integer.parseInt(memno);
	String pname = vo.getPname();
	int pprice = vo.getPprice();
	String status = "입금전";
	String tdate = request.getParameter("day");
	
	Porder_DAO orderdao = new Porder_DAO();
	Porder_VO ordervo = new Porder_VO();
	
	ordervo.setMemno(mno);
	ordervo.setPname(pname);
	ordervo.setPprice(pprice);
	ordervo.setStatus(status);
	ordervo.setTdate(tdate); 
	
	orderdao.addData(ordervo);
	
%>

<div id="orderwrap">
	<img src="../teamProimage/reservation.png" alt="" /><br />
	<span id="re">예약이 완료되었습니다.</span>
	<div id="btnss">
		<input type="button" value="예약현황확인" id="listbtn"/>
		<input type="button" value="메인으로" id="mainbtn"/>	
	</div>
</div>

</body>
</html>