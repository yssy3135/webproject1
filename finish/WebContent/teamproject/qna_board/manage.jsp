<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String a = request.getParameter("bno");

	if(a!=null){
		
		int bno = Integer.parseInt(a);
		QnABoardDAO dao = new QnABoardDAO();	
		
	}
	
%>  