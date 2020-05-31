<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	
	#findOkTable{
		width : 100%;
	}
	
	#findOkTable th{
		padding-top:15px;
		width: 300px;
	}
	
	#allPwOk{
		margin-top : 50px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;		
		text-align: center;
	}
	
	#loginForm{
		margin: 0 auto;
		width : 500px;
		height : 250px;
		text-align: center;
	}
	
	#loginForm h2{
		width: 100%;
		line-height: 60px;
		border-bottom: 1px solid black;
	}
	
	#loginGo{
		margin-top : 20px;
		width : 400px;
		height : 50px;
		background-color: #BEEBE9;
		outline : none;
		box-shadow: none;
		border : 1px solid #BEEBE9;
		font-size: 20px;
		cursor: pointer;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;	
	}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#loginGo').click(function(){
			location.href = "../teamproject/main.jsp";
		});
	});
	
</script>

<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	P_Member_DAO dao = new P_Member_DAO();
	int memno = dao.findPw(id, email);
	P_Member_VO vo = dao.selectOne(String.valueOf(memno));

%>

</head>
<body>
<jsp:include page="../teamproject/header.jsp"/>
<jsp:include page="../teamproject/nav.jsp"/>
	<div id="allPwOk">
		<div id="loginForm">
			<h2>비밀번호 찾기</h2>
		
			<table id="findOkTable">
				<tr>
					<th>아이디  </th>
					<td><%=id %></td>
					<td></td>
				</tr>
				<tr>
					<th>이메일  </th>
					<td><%=email%></td>
					<td></td>
				</tr>
				<tr>
					<th>비밀번호 </th>
					<td><%=vo.getPw() %></td>
			
				</tr>
			
			</table>
	
	
	
			<a href="../teamproject/main.jsp?fno=../teamproject2/login.jsp"><input type="submit" value="확인" id="loginGo"/></a>
			</div>
		
		
			<div id = "info">
			
			</div>
	</div>
	
<jsp:include page="../teamproject/footer.jsp"/>
</html>

