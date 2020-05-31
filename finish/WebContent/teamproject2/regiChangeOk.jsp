<%@page import="team_dao.P_Member_DAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	//마이페이지 시작시 받아올 아이디.


	String pw = request.getParameter("pw");
	String mp0 = request.getParameter("mp0");
	String mp1 = request.getParameter("mp1");
	String mp2 = request.getParameter("mp2");
	String hp = mp0+mp1+mp2;
	String email = request.getParameter("email");
	
	P_Member_DAO dao = new P_Member_DAO();
	
	int result = dao.change(memno, pw, hp, email);
	if(result == 1){
		
	
%>
<script type="text/javascript">
	alert("회원정보 수정 완료.")
	location.href="../teamproject/main.jsp?fno=../teamproject2/myPage.jsp";
	<%
	}//if end
	%>
</script>


</head>
<body>
	
</body>
</html>