<%@page import="java.util.ArrayList"%>
<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>searchlist.jsp</title>
<style type="text/css">
	#searchform{
		width: 1200px;
		height: 100%;
		margin: 0 auto;
		padding-bottom: 50px;
		margin-top: 50px;
	}
	
	#listname{
		width: 100%;
		height: 31px;
		margin-bottom: 9px;
		font-size: 20px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#key{
		color: #2187cf;
	}
	
	#list_prt{
		width: 100%;
		height: 700px;
		border-top: 2px solid #586986;
	}
	
	#item_list{
		width: 1170px;
		height: 255px;
		padding: 15px;
		
	    border-left: 1px solid #e2e2e2;
	    border-right: 1px solid #e2e2e2;
		border-bottom: 1px solid #e2e2e2;
		float: left;
	}
	
	#list_prt img{
		width: 370px;
		height: 255px;
		float: left;
	}
	
	#item_contents{
		width: 550px;
		height: 30px;
	    font-weight: 600;
	    color: #444;
	    font-size: 20px;
		float: left;	
		margin-left: 30px;
		margin-top: 40px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#price{
		width: 550px;
		height: 30px;
		margin-left: 30px;
		margin-top: 17px;
		padding-bottom: 10px;
	    border-bottom: 1px solid #e0e0e0;
		float: left;	
	}
	
	#price img{
		width: 30px;
		height: 30px;
	}
	
	#price_title{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 23px;
	    color: #1b7296;
	    margin-left: 10px;
	    margin-bottom: 10px;
	}
	
	#item_detail{
	    margin-left: 30px;
		margin-top: 12px;
		float: left;
	}
	
	#item_detail span{
		width: 550px;
		height: 30px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 20px;
		margin-top: 10px;
		float: left;
	}
	
	#detail_page{
		float: left;
		margin-top: -80px;
		margin-left: 50px;
	}
	
	#detail_page img{
		margin-top: 30px;
		margin-left: 20px;
		width: 90px;
		height: 100px;
	}
	
	#detail_page span{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 20px;
	}

</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String keyWord = request.getParameter("txt");
	
	Trip_DAO dao = new Trip_DAO();
	
	if(keyWord!=null){
		ArrayList<Trip_VO> list = dao.getPname(keyWord);
		
%>

	<div id="searchform">
		<div id="listname">
			<img src="../teamProimage/arrow.gif" alt="" />
			<span id="key"><%=keyWord %></span>
			검색결과
		</div>
		<div id="list_prt">
	<%

	for(Trip_VO vo : list){
	
	%>
	<div id="item_list">
		<img src="<%=vo.getMainimg() %>" alt="" />
		<div id="item_contents">
			<%=vo.getPcontents() %>
		</div>
		<div id="price">
			<img src="../teamProimage/price.png" alt="" />
			<span id="price_title"><%=vo.getPprice() %>원</span>
		</div>
		<div id="item_detail">
			<span>여행지 : <%=vo.getPname() %></span><br />
			<span>여행 코스 : <%=vo.getCourse() %></span>
		</div>
		<div id="detail_page">
			<span>&nbsp;&nbsp;상품 상세보기</span><br />
			<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>"><img src="../teamProimage/detail.jpg" alt="" /></a>
		</div>
	</div>
	
	<%
	
		}
		
	}
	%>
		</div>
	</div>

</body>
</html>