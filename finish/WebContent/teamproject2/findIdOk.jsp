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
	
	#findIdOktable{
		width : 100%;
	}
	
	#allfindOk{
		margin-top : 50px;
		text-align: center;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#loginForm{
		margin: 0 auto;
		width : 500px;
		height : 250px;
		text-align: center;
	}
	
	#loginForm h2{
		border-bottom: 1px solid black;
		line-height: 60px;
	}
	
	#idLogin, #email, #key{
		margin-top : 20px;
		width : 300px;
		height : 50px;
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

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	P_Member_DAO dao = new P_Member_DAO();
	
	String print = "";
	
	if(dao.findId(name, email) == ""){
		print = "일치하는 정보가 없습니다.";
	}else{
		print = dao.findId(name, email);
	}
%>

</head>
<body>
<jsp:include page="../teamproject/header.jsp"/>
<jsp:include page="../teamproject/nav.jsp"/>

	<div id="allfindOk">
		<div id="loginForm">
			<h2>아이디 찾기</h2>
			
			<table id="findIdOktable">
				<tr>
					<th>이름  </th>
					<td><%=name %></td>
					<td></td>
				</tr>
				<tr>
					<th>이메일  </th>
					<td><%=email%></td>
					<td></td>
				</tr>
				<tr>
					<th>아이디 </th>
					<td><h3><%=print%></h3></td>
			
				</tr>
			</table>
	
			<a href="../teamproject/main.jsp?fno=../teamproject2/login.jsp"><input type="button" value="확인" id="loginGo"/></a>
		</div>
	
	</div>
	
<jsp:include page="../teamproject/footer.jsp"/>

</body>
</html>