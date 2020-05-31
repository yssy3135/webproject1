<%@page import="team_dao.dao.ProjectDAO"%>

<%@page import="dao.BoardV3_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));

	ProjectDAO dao = new ProjectDAO();
	
	dao.deleteData(bno);
	
	
	response.sendRedirect("board.jsp");



%>