<%@page import="team_dao.Porder_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ono = request.getParameter("ono");

	Porder_DAO dao = new Porder_DAO();
	
	System.out.println(ono);
	
	
	
	dao.pay(ono);
	
	
	
	
	response.sendRedirect("../teamproject/main.jsp?fno=../teamproject2/myPage.jsp");
	
%>