<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productAllPage.jsp</title>
<style type="text/css">

	#productAll{
		width: 1100px;
		height: 5000px;
		margin: 0 auto;
	}
	
	.itemContests{
		height: 800px;
		margin-left: 100px;
		margin-top: 30px;
	}
	
	.title{
		width: 100%;
		height: 50px;
		border-bottom: 1px solid #d4d4d4;
	}
	
	.title h2{
	    display: inline-block;
	    font-family: '나눔스퀘어_ac Light';
	}
	
	#subtitle{
		display: inline-block;
		margin: -7px 0 0 0 3px;
		font-family: '나눔스퀘어_ac Light';
	}
	
	.list {
		width: 300px;
		height: 310px;
		border: 1px solid #d4d4d4;
		margin-top: 40px;
		margin-right: 20px;
		float: left;
	}
	
	.list ul{
		width: 100%;
		height: 110px;
		margin: 0;
		padding: 5px;
	}
	
	.list li{
		padding: 0;
		list-style-type: none;
		font-family: '나눔스퀘어_ac Light';
		margin-top: 5px;
	}
	
	.list li h5{
		font-weight: bold;
		font-size: 22px;
		padding: 0;
		margin: 0;
	}
	
	.list li h4{
		font-weight: bold;
		font-size: 18px;
		padding: 0;
		margin: 0;
	}
	
	.mainimg{
		width: 300px;
		height: 210px;
	}
	
	.iii{
		width: 300px;
		height: 210px;		
	}
	
	#upup{
		position: fixed;
		margin-left: 1500px;
		margin-top: 650px;
		width: 60px;
		height: 100px;
	}
	
	.up{
		background-image: url(../teamProimage/upbtn1.png);
		cursor: pointer;  
		border: 0;
		float: left;
		padding: 0;
		width: 60px;
		height: 60px;
		outline: 0;
	}
	
	#upup h2{
		display: block;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		text-align: center;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$('.up').on('click',function(e){
			$('html,body').animate({scrollTop:0},1000); });
	});
</script>
</head>
<body>
	<div id="headerr">
		<jsp:include page="header.jsp"/>	
	</div>
	
	<div id="navv">
		<jsp:include page="nav.jsp" />
	</div>
	

	<div id="productAll">
		<div id="upup">
			<input type="button" value="" class="up"/>
			<h2>위로</h2>
		</div>
		
		<a name="contentsItem1"></a>
		<div class="itemContests">
			<div class="title">
				<h2>액티비티 코스</h2>
				<span id="subtitle">놀자!</span>
			</div>
	<%
		String tn = "activity";
		
		Trip_DAO dao = new Trip_DAO();
	
		if(tn!=null){
		String tema = tn;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){	
	%>
			<div class="list">
				<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
				</div>
				<ul>
					<li><h5><%=vo.getPname() %></h5></li>
					<li><%=vo.getPcontents() %></li>
					<li><h4><%=vo.getPprice() %>원</h4></li>
				</ul>
			</div>
	<%
			}
		}
	%>
		</div>
		<a name="contentsItem2"></a>
		<div class="itemContests">
			<div class="title">
				<h2>힐링 코스</h2>
				<span id="subtitle">힐링하자!</span>
			</div>
	
	<%
		String tn2 = "healing";
	
		if(tn!=null){
		String tema = tn2;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){	
	%>
			<div class="list">
				<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
				</div>
				<ul>
					<li><h5><%=vo.getPname() %></h5></li>
					<li><%=vo.getPcontents() %></li>
					<li><%=vo.getPprice() %>원</li>
				</ul>
			</div>
	<%
			}
		}
	%>
		</div>
		
		<a name="contentsItem3"></a>
		<div class="itemContests">
			<div class="title">
				<h2>도보 코스</h2>
				<span id="subtitle">도보로 여행하자!</span>
			</div>
	<%
		String tn3 = "road";
	
		if(tn!=null){
		String tema = tn3;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){	
	%>
			<div class="list">
				<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
				</div>
				<ul>
					<li><h5><%=vo.getPname() %></h5></li>
					<li><%=vo.getPcontents() %></li>
					<li><%=vo.getPprice() %>원</li>
				</ul>
			</div>
	<%
			}
		}
	%>
		</div>
		
		<a name="contentsItem4"></a>
		<div class="itemContests">
			<div class="title">
				<h2>반려견 코스</h2>
				<span id="subtitle">반려견과 함께하자!</span>
			</div>
	<%
		String tn4 = "pet";
	
		if(tn!=null){
		String tema = tn4;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){	
	%>
			<div class="list">
				<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
				</div>
				<ul>
					<li><h5><%=vo.getPname() %></h5></li>
					<li><%=vo.getPcontents() %></li>
					<li><%=vo.getPprice() %>원</li>
				</ul>
			</div>
	<%
			}
		}
	%>
		</div>
		
		<a name="contentsItem5"></a>
		<div class="itemContests">
			<div class="title">
				<h2>맛 코스</h2>
				<span id="subtitle">먹자!</span>
			</div>
	<%
		String tn5 = "taste";
	
		if(tn!=null){
		String tema = tn5;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){	
	%>
			<div class="list">
				<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
				</div>
				<ul>
					<li><h5><%=vo.getPname() %></h5></li>
					<li><%=vo.getPcontents() %></li>
					<li><h5><%=vo.getPprice() %>원</h5></li>
				</ul>
			</div>
	<%
			}
		}
	%>
		</div>
		
		<a name="contentsItem6"></a>
		<div class="itemContests">
		<div id="contents6">
			<div class="title">
				<h2>캠핑 코스</h2>
				<span id="subtitle">즐기자!</span>
			</div>
	<%
		String tn6 = "camping";
	
		if(tn!=null){
		String tema = tn6;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){	
	%>
			<div class="list">
				<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
				</div>
				<ul>
					<li><h5><%=vo.getPname() %></h5></li>
					<li><%=vo.getPcontents() %></li>
					<li><%=vo.getPprice() %>원</li>
				</ul>
			</div>
	<%
			}
		}
	%>
		</div>

	</div>	
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
	
</body>
</html>