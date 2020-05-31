<%@page import="team_dao.P_Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	P_Member_DAO dao = new P_Member_DAO();

	String id = request.getParameter("id");

	boolean ok = dao.isExist(id);

	
%>
<%=ok %>
