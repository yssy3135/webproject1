<%@page import="team_dao.dao.TogetherDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int bno = Integer.parseInt(request.getParameter("bno"));


	TogetherDAO dao = new TogetherDAO();
	dao.deleteData(bno);



	response.sendRedirect("together.jsp");
%>