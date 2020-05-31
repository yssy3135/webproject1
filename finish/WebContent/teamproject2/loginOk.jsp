<%@page import="team_dao.P_Member_DAO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");


	P_Member_DAO dao = new P_Member_DAO();
	
	int memno = dao.login(id, pw);
	
	
	//memno == -1이면 로그인 실패.
	if(memno == -1){
		out.println("로그인 실패");
	}else{
		//out.println("회원 번호 : " + memno);
		
		
		//String userId = URLEncoder.encode(id,"UTF-8");
		
		Cookie c = new Cookie("projectLogin",String.valueOf(memno));
		//c.setMaxAge(60*60*24); 	//하루동안 저장
		c.setPath("/");
		
		response.addCookie(c);
		response.sendRedirect("../teamproject/main.jsp");
	}
%>
