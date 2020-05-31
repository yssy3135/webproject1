<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보.</title>

<style type="text/css">

	#myPageTable{
		width : 900px;
		margin : 0 auto;
	}
	
	#myPageTable th{
		text-align: left;
		height: 60px;
		padding-left: 20px;
		background-color: #F6F6F6;
		border-bottom: 1px solid #EAEAEA;
	}

	#myPageTable td{
		padding-left : 20px;
		border-bottom: 1px solid #EAEAEA;
	}

</style>
</head>

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

	P_Member_DAO dao = new P_Member_DAO();
	P_Member_VO vo = new P_Member_VO();
	
	vo = dao.selectOne(memno);
	
	//id 를 통해서 정보 가져오기.
	//test 부분 수정 필요
	

%>



<body>
	<table id="myPageTable">
		<tr>
			<th>회원 번호 </th>
			<td><%=vo.getMemno() %></td>
		</tr>
		<tr>
			<th>ID </th>
			<td><%=vo.getId()%></td>
		</tr>
	
		<tr>
			<th>이름 </th>
			<td><%=vo.getName() %></td>
		</tr>
		<tr>
			<th>생년월일 </th>
			<td><%=vo.getBirth() %></td>
		</tr>
		<tr>
			<th>성별 </th>
			<td><%=vo.getGender() %></td>
		</tr>
		<tr>
			<th>핸드폰 번호 </th>
			<td><%=vo.getHp() %></td>
		</tr>
		<tr>
			<th>이메일 </th>
			<td><%=vo.getEmail() %></td>
		</tr>
	
	
	
	</table>


</body>
</html>