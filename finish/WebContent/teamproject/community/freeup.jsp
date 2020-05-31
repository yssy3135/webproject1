<%@page import="team_dao.dao.FreeboardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
String no = request.getParameter("bno");
int bno = Integer.parseInt(request.getParameter("bno"));

FreeboardDAO dao = new FreeboardDAO();
dao.up(bno);




response.sendRedirect("freeboarddetail.jsp?bno="+no);

%>

