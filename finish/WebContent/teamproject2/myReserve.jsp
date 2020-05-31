<%@page import="team_dao.Porder_DAO"%>
<%@page import="team_vo.Porder_VO"%>
<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
	#myReImg{
		width : 150px;
		height : 100px;
	}
	
	#myRe{
		width : 100%;
		margin : 0 auto;
	}
	
	#myRe h2{
		width: 100%;
		border-bottom: 1px solid black;
		line-height: 60px;
	}
	
	#Retable{
		margin-top : 30px;
		margin-left : 30px;
		width : 90%;
	}
	
	#Retable th{
		height: 40px;
		border-bottom: 1px solid gray;
		background-color: #9BE3DE;
	}
	
	#Retable td{
		padding-left: 10px;
	}

</style>

<%  

	Cookie[] clist = request.getCookies();
	
	String memno = null;
	
	if(clist != null){
		for(Cookie c : clist){
			if(c.getName().equals("projectLogin")){
				memno = URLDecoder.decode(c.getValue(),"UTF-8");
			}
		}
		
	}

	Trip_DAO dao = new Trip_DAO();
	Trip_VO vo = new Trip_VO();
	
	Porder_DAO odao = new Porder_DAO();
	Porder_VO ovo = new Porder_VO();
	
	ArrayList<Porder_VO> orderList = new ArrayList<Porder_VO>();
	ArrayList<Trip_VO> tripList = new ArrayList<Trip_VO>();
	
	
	orderList = odao.getMyreserve(memno);
	
%>


<script type="text/javascript">
	$(document).ready(function(){
	
	var IMP = window.IMP; 
	IMP.init("imp60539131");
	var orderNo = "";
	var price = "";
	var ono="";
	var status ="";
		
		$('.pay').click(function(){
			

			ono = $(this).parent().parent().children().first().text();
			orderNo = $(this).parent().parent().children().next('#pname').text();
			price = $(this).parent().parent().children().next('#price').text();
			
			
			status = $(this).parent().parent().children().next('#status').text();
			
			if(status == "입금완료"){
				alert('이미 결제 완료 되었습니다.')
			}else{
				pay();
				
			}

		});//
 
	 function pay(){
		 
	 IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : orderNo,
		    amount : price,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'http://localhost:9090/Web_goott/teamproject/main.jsp'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
/* 		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
				 alert(msg);
		         document.location.href = "../teamproject2/payOk.jsp?ono="+ono;


		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	 
	 }
		
		
		
	$('.no').click(function(){
		ono = $(this).parent().parent().children().first().text();
		status = $(this).parent().parent().children().next('#status').text();
		
		
		document.location.href="../teamproject2/payNo.jsp?ono="+ono+"&status="+status;
	});

	
});	
	
</script>

</head>
<body>
	<div id="myRe">
		<h2>나의 예약 현황</h2>
		<table id="Retable">
			<tr>
				<th>예약번호</th>
				<th>상품이미지</th>
				<th>상품정보</th>
				<th>가격</th>
				<th>예약일</th>
				<th>상태</th>
				<th>결제</th>
			</tr>
			
		
		
			<tr>
				<%
					for(int i =0; i<orderList.size(); i++){ 
				%>
				
				<%
					//trip vo 의 상품정보를 가져올거야.
					vo = dao.getData2(orderList.get(i).getPname());
				
				%>
				<td><%=orderList.get(i).getOno() %></td>
				<td><img src="<%=vo.getMainimg() %>" alt="trip.mainimg" id="myReImg"/></td>
				<td id="pname"><a href="../teamproject/main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>"><%=vo.getPname() %></a></td>
				<td id="price"><%=vo.getPprice() %></td>
				<td><%=orderList.get(i).getOdate() %></td>
				<td id = "status"><%=orderList.get(i).getStatus() %></td>
				<td><input type="button" value="결제" class="pay" />
					<br />
					<input type="button" value="취소" class="no"/>
				</td>
			</tr> 
				<%
					}
				%> 
		
		</table>
	</div>
</body>
</html>