<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키를 통한 로그아웃.
	Cookie c = new Cookie("projectLogin",null);
	c.setPath("/");
	c.setMaxAge(0);
	response.addCookie(c);
	
	
	response.sendRedirect("../teamproject/main.jsp");
	
	
	out.println("asdfasdf")	;
%>
