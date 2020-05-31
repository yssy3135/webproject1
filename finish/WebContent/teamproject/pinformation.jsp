<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보</title>

<%
	String no = request.getParameter("pno");
	String day = request.getParameter("startday");
	
	Trip_DAO dao = new Trip_DAO();
	Trip_VO vo = new Trip_VO();
	
	if(no!=null){
		int pno = Integer.parseInt(no);
		vo = dao.getData(pno);
	}
%>

<style type="text/css">
	
	#ordertable, #reserTable{
		width : 100%;
		border-top: 1px solid #222;
	}
	
	#ordertable th, #ordertable td, #reserTable th, #reserTable td{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		padding: 10px;
		letter-spacing: 0.05em;
		border-bottom: 1px solid #d4d4d4; 
	}
	
	#ordertable th, #reserTable th{
		width : 20%;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		letter-spacing: 0.05em;
		border-right: 1px solid #d4d4d4;
	}
	
	#btdiv input{
		width : 100px;
		height : 50px;
	}
	
	#pinfocon{
		width: 1200px;
		height: 80%;
		margin : 0px auto;
		margin-top: 50px;
	}
	
	#pinfocon h1, #pinfocon h4, #pinfocon h2, #reservation h1, #reservation h2{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		letter-spacing: 0.05em;
	}
	
	#pinfocon h1{
		margin-bottom: 5px;
	}
	
	#pinfocon h2, #reservation h2{
	 	margin-bottom: 7px;
	 }
	
	#imgdiv, #btdiv{
		text-align: center;
	}
	
	#reserTable{
		border-collapse :collapse;
		width: 100%
	}
	
	#reservation input, #reservation select{
		width : 300px;
		height : 25px;
	}
	
	#reservation{
		margin : 0px auto;
		margin-top: 50px;
		margin-bottom: 100px;
		width : 1200px;
		height : 80%;
	}
	
	.bt{
		width : 100px;
		height : 50px;
	}

	#rv{
		width: 100%;
		height: 90px;
		margin-bottom: 2px;
	}
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//예약 취소 여부 메세지
		$('#reservationCancel').click(function(){
			var result = confirm("예약을 취소하시겠습니까?");
			
			if(result) { 
				history.go(-1)();
			}else { 
				return;
			}
		});	
	
	});
	
	
	function orderlist(){
		var mname = $('input[name=rv_name]').val();
		var day = $('#sday').text();
		//alert(payway+mname+day);
		
		//나중에 수정해보기
		location.href = "main.jsp?fno=order.jsp?pno=<%=vo.getPno()%>&mname="+mname+"&day="+day;
	};
</script>
</head>
<body>
<form name="orderinfo" method="post">
	<div id="pinfocon">
		<div id="rv">
			<h1>여행예약하기</h1>
			<h4>
				국내 여행의 Total서비스를 제공하는 전문업체 나혼자간다와 함께하세요. <br />
				궁금하신점이 있으시면 고객센터로 문의주세요. <br />
			</h4>
		</div>
		<hr />
		<div id="imgdiv">
			<img src="../teamProimage/information.png" alt="상품정보" />
		</div>
		
		<h2>상품정보</h2>
		
		<table id="ordertable">
			<tr>
				<th>상품이름</th>
				<td><%=vo.getPname() %></td>
			</tr>
			<tr>
				<th>여행코스</th>
				<td><%=vo.getCourse() %></td>
			</tr>
			<tr>
				<th>출발일</th>
				<td id="sday"><%= day %></td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><%=vo.getPprice() %></td>
			</tr>
			
		</table>
	</div>


	<div id="reservation">
		<br />
		
		<div id="imgdiv">
		<img src="../teamProimage/information2.png" alt="" />
		</div>
		
		<h2>예약자 및 여행자 정보</h2>
		<%
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
		%>
			<table id="reserTable">
				<tr>
					<th>예약자ID</th>
					<td><%=memvo.getId() %></td>

					<th>예약자명</th>
					<td><input type="text" name="rv_name" value="<%=memvo.getName() %>"/></td>
					
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="s_gender" id="">
							<option value="man">남</option>
							<option value="woman">여</option>
						</select>
					</td>
					<th>생년월일</th>
					<td><input type="date" value="<%=memvo.getBirth() %>" /></td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td><input type="text" value="<%=memvo.getHp() %>"placeholder="-를 제외하고 작성해주세요 ex)01011112222" name=""/></td>
					
					<th>이메일</th>
					<td><input type="email" placeholder="abc@naver.com" value="<%=memvo.getEmail()%>"/></td>
				</tr>
				<tr>
					<th>고객요청</th>
					<td colspan="3"><textarea rows="5" cols="100" style="resize: none"></textarea></td>
				</tr>
				
			</table>
			
			<div id="btdiv">
				<input type="button" value="예약하기" class = "bt" onclick="orderlist()"/>
				<input type="button" value="취소" class = "bt" id="reservationCancel"/>
			</div>
		</div>
	</form>
	
</body>
</html>