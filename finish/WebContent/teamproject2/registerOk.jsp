<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String mp0 = request.getParameter("mp0");
String mp1 = request.getParameter("mp1");
String mp2 = request.getParameter("mp2");
String hp = mp0+mp1+mp2;
String  gender = request.getParameter("radio");
String email = request.getParameter("email");


	P_Member_DAO pdao = new P_Member_DAO();
	P_Member_VO vo = new P_Member_VO();
	
	
	vo.setBirth(birth);
	vo.setEmail(email);
	vo.setGender(gender);
	vo.setHp(hp);
	vo.setId(id);
	vo.setName(name);
	vo.setPw(pw);
	
	int result = pdao.addData(vo);
	if(result == 1){
		
	
%>

<script type="text/javascript">
	
	alert("회원 가입 완료.");
	
	location.href = "../teamproject/main.jsp";
	<%
	}
	%>

</script>


</head>

<body>



</body>
</html>