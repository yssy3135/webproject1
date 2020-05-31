<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String no = request.getParameter("pno");
	Trip_DAO dao = new Trip_DAO();
	Trip_VO vo = new Trip_VO();
	
	if(no!=null){
		int pno = Integer.parseInt(no);
		vo = dao.getData(pno);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
<style type="text/css">

	#contents{
		width: 1050px;
		height: 100%;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	#title{
		width: 100%;
		height: 80px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;	
		border-bottom: 1px solid #d4d4d4;
	}
	
	#mainimg{
		width: 100%;
		height: 600px;
		margin-bottom: 20px;
	}
	
	#title h3{
		font-size: 35px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	#title span{
		font-size: 20px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;	
	}

	#info{
		width: 100%;
		height: 500px;
	}
	
	#infotable{
		width: 100%;
		border-spacing: 0;
  		border-collapse: collapse;
  		box-sizing: border-box;
		border-top: 1px solid #222;
	}
	
	.infotr,.infotd{border-bottom: 1px solid #d4d4d4; font-family: '나눔스퀘어_ac Light'; font-weight: bold;}
	
	.infoth{width: 30%; height: 61px;}
	
	.infot{width: 70%; height: 61px;}
	
	#st_btn{
		width: 100%;
		height: 100px;
		text-align: right;
		float: left;
		margin-top: 20px;
	}
	
	#st_btn a{
		text-decoration: none;
	}
	
	#start_info{
		font-size: 20px;
		width: 80%;
		height: 100px;
		background-color: yellow;
		float: left;
	}
	
	#start_img{
		width: 50px;
		height: 50px;
		padding: 5px;
	}
	
	#st_day{
		padding: 5px;
	}
	
	#detail_tab{
		width: 100%;
		height: 60px;
	    display: table;
	}
	
	#detail_tab ul li{
		width: 350px;
		list-style-type: none;
		height: 60px;
		line-height: 60px;
		display: table-cell;
		font-size: 18px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: 1px solid #ddd;
		background: #f7f7f7;
		text-align: center;
		cursor: pointer;
	}
	
	#detail_tab ul li a{
	    display: block;
		text-decoration: none;
		width: 100%;
		height: 60px;
	}
	
	#detail_tab ul li.on{
		border: 1px solid #777;
		border-bottom: 1px solid #fff;
		color: #222;
	}
	
	.calender{
		width:325px;
		height: 178px; 
		border-left:1px solid #e1e1e1;
		border: 0;
		border-collapse: separate;
  		border-spacing: 2px;
		border-collapse: 0;
		text-align: center;
	    height: 33px;
	    background: #858b94;
	    color: #fff;
	    font-weight: 600;
	    border-right: 1px solid #a1a6ad;
	    float: left;
	}
	
	.calender th{
		text-align: center;
	    height: 33px;
	    background: #858b94;
	    color: #fff;
	    font-weight: 600;
	    border-right: 1px solid #a1a6ad;
	}
	
	.calender tr td{
		text-align: center;
	    background: #fff;
	    color: #666;
	    height: 28px;
	    border-right: 1px solid #e1e1e1;
	    border-bottom: 1px solid #e1e1e1;
	    font-size: 12px;
	    cursor: pointer;  
	}
	
	.mon{
		color:#f16e1f; 
		font-weight:600;  
		background:#fdfbf2;
	}
	
	.cal_month{
		height: 32px;
		width: 325.75px;
	    margin-bottom: 6px;
	    text-align: center;
	    color: #4c4c4c;
	    font-weight: 600;
	    font-size: 20px;
	}
	
	.cal_gruop4, .cal_gruop5{
		width: 325px;
	    float: left;
	    margin-right: 20px;
	    margin-top: 10px;
	    margin-bottom: 10px;
	    top: 0;
	    left: 0;
	}
	
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#li1').click(function(){
			$(this).addClass('on');
			$('#li2, #li3').removeClass('on');
			$('#detail_s').load("detailimage.jsp?pno=<%=vo.getPno() %>");
		});
		
		$('#li2').click(function(){
			$(this).addClass('on');
			$('#li1, #li3').removeClass('on');
			$('#detail_s').load("detailreview.jsp?pno=<%=vo.getPno() %>");
		});
		
		$('#li3').click(function(){
			$(this).addClass('on');
			$('#li1, #li2').removeClass('on');
			$('#detail_s').load("detailcancel.jsp");
		});
		
		
		//출발일 출력
		$('.cal_gruop4 td').click(function(){
 			var mon = $('.cal_gruop4 .mon').text();
			var day = $(this).text();
			$('#st_day').text("20/"+mon+"/"+day);
		});
		
		$('.cal_gruop5 td').click(function(){
 			var mon = $('.cal_gruop5 .mon').text();
			var day = $(this).text();
			$('#st_day').text("20/"+mon+"/"+day);
		});
		
		//예약하기 버튼 클릭시 출발일 넘기기
		$('#st_btn').click(function(){
			var startDay = $('#st_day').text();
			//alert(startDay);
			location.href = "main.jsp?fno=pinformation.jsp?pno=<%=vo.getPno() %>&startday="+startDay;
		});
		
	});
</script>
</head>
<body>
	<div id="contents">
		<div id="title">
			<h3><%=vo.getPname() %></h3>
			<span><%=vo.getPcontents() %></span>
		</div>
		
		<div id="mainimg">
			<img src="<%=vo.getMainimg() %>" alt="" width="100%" height="100%"/>
		</div>
		<div id="info">
			<!-- 예약 테이블 -->
			<table id="infotable">
				<tr class="infotr">
					<th class="infoth">상품 가격</th>
					<td class="infotd"><%=vo.getPprice() %></td>
				</tr>
				<tr class="infotr">
					<th class="infoth">날짜 선택</th>
						<td class="infotd">
						<div class="cal_gruop4">
							<div class="cal_month">
								<sapn class="year">2020</sapn>
								.
								<span class="mon">04</span>
							</div>
							<table class="calender">
								<tr>
									<th>일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th>토</th>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td class="td_seat"><span class="">01</span></td>
									<td class="td_seat"><span class="">02</span></td>
									<td class="td_seat"><span class="">03</span></td>
									<td class="td_seat"><span class="">04</span></td>
								</tr>
								<tr>
									<td><span class="">05</span></td>
									<td><span class="">06</span></td>
									<td><span class="">07</span></td>
									<td><span class="">08</span></td>
									<td><span class="">09</span></td>
									<td><span class="">10</span></td>
									<td><span class="">11</span></td>
								</tr>
								<tr>
									<td><span class="">12</span></td>
									<td><span class="">13</span></td>
									<td><span class="">14</span></td>
									<td><span class="">15</span></td>
									<td><span class="">16</span></td>
									<td><span class="">17</span></td>
									<td><span class="">18</span></td>
								</tr>
								<tr>
									<td><span class="">19</span></td>
									<td><span class="">20</span></td>
									<td><span class="">21</span></td>
									<td><span class="">22</span></td>
									<td><span class="">23</span></td>
									<td><span class="">24</span></td>
									<td><span class="">25</span></td>
								</tr>
								<tr>
									<td><span class="">26</span></td>
									<td><span class="">27</span></td>
									<td><span class="">28</span></td>
									<td><span class="">28</span></td>
									<td><span class="">30</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
								</tr>
								
							</table>
						</div>
						<div class="cal_gruop5">
							<div class="cal_month">
								<sapn class="year">2020</sapn>
								.
								<span class="mon">05</span>
							</div>
							<table class="calender">
								<tr>
									<th>일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th>토</th>
								</tr>
								<tr>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">01</span></td>
									<td><span class="">02</span></td>
								</tr>
								<tr>
									<td><span class="">03</span></td>
									<td><span class="">04</span></td>
									<td><span class="">05</span></td>
									<td><span class="">06</span></td>
									<td><span class="">07</span></td>
									<td><span class="">08</span></td>
									<td><span class="">09</span></td>
								</tr>
								<tr>
									<td><span class="">10</span></td>
									<td><span class="">11</span></td>
									<td><span class="">12</span></td>
									<td><span class="">13</span></td>
									<td><span class="">14</span></td>
									<td><span class="">15</span></td>
									<td><span class="">16</span></td>
								</tr>
								<tr>
									<td><span class="">17</span></td>
									<td><span class="">18</span></td>
									<td><span class="">19</span></td>
									<td><span class="">20</span></td>
									<td><span class="">21</span></td>
									<td><span class="">22</span></td>
									<td><span class="">23</span></td>
								</tr>
								<tr>
									<td><span class="">24</span></td>
									<td><span class="">25</span></td>
									<td><span class="">26</span></td>
									<td><span class="">27</span></td>
									<td><span class="">28</span></td>
									<td><span class="">29</span></td>
									<td><span class="">30</span></td>
								</tr>
								<tr>
									<td><span class="">31</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
									<td><span class="">&nbsp;</span></td>
								</tr>
								
							</table>
						</div>
						</td>
					</tr>
				<tr class="infotr">
						<th class="infoth"><img src="../teamProimage/start.png" alt="" id="start_img"/><br />선택출발일</th>
						<td class="infotd"><span id="st_day">(날짜를 선택하시면 자동입력됩니다.)</span></td>
				</tr>	
				<tr class="infotr">
					<th class="infoth">예약 가능 인원</th>
					<td class="infotd"><%=vo.getQty() %></td>
				</tr>
				<tr class="infotr">
					<th class="infoth">여행 코스</th>
					<td class="infotd"><%=vo.getCourse() %></td>
				</tr>
			</table>
		
			<div id="st_btn">
				<img src="../teamProimage/btn_booking.gif" alt="예약하기" />
			</div>
				
						
		</div>
		<div id="detail_tab">
			<ul>
				<li id="li1" class="on">여행 상세 정보</li>
				<li id="li2">여행 후기</li>
				<li id="li3">취소 환불 규정</li>
			</ul>
		</div>
			<%
				String pageinfo2 = "";
				String info = request.getParameter("info");
				if(info==null){
					pageinfo2 = "detailimage.jsp";
				}else{
					pageinfo2 = info;
				}
			%>
					
		<div id="detail_s">
			<jsp:include page="<%=pageinfo2 %>"/>
		</div>
		

	</div>
</body>
</html>