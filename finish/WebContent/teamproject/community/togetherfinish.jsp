
<%@page import="team_dao.dao.TogetherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String bno = request.getParameter("bno");

	int no = Integer.parseInt(bno);
	
	TogetherDAO dao = new TogetherDAO();
	
	
	dao.finish(no);
	
	
	response.sendRedirect("togetherdetail.jsp?bno="+bno);
	
	
%>