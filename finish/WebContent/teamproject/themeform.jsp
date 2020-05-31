<%@page import="team_vo.Trip_VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team_dao.Trip_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	
	.themePrt {
		display: inline-block;
		width: 300px;
		height: 230px;
		border: 1px solid #d4d4d4;
		margin-top: 40px;
		margin-left: 70px;
		float: left;
	}
	
	.themePrt li{
		padding: 0;
		list-style-type: none;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		margin-bottom: 5px;
	}
	
	.themePrt li h5{
		font-size: 20px;
		padding: 0;
		margin: 0;
	}
	
	.mainimg{
		width: 300px;
		height: 160px;
	}
	
	.iii{
		width: 300px;
		height: 160px;		
	}
	
</style>
</head>
<body>
<div id="theme">
	<%
	String tn = request.getParameter("tno");
	
	Trip_DAO dao = new Trip_DAO();
	
	if(tn!=null){
		String tema = tn;
		ArrayList<Trip_VO> list = dao.getTheme(tema);
		for(Trip_VO vo : list){
%>
		<div class="themePrt">
			<div class="mainimg">
					<a href="main.jsp?fno=productDetail.jsp?pno=<%=vo.getPno()%>" class="product">
						<img src="<%=vo.getMainimg() %>" alt="" class="iii"/>
					</a>
			</div>
			<ul>
				<li><h5><%=vo.getPname() %></h5></li>
				<li><%=vo.getPprice() %>원</li>
			</ul>
		</div>
<%
		}
	}
%>
</div>