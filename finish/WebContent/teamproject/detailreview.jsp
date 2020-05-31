<%@page import="team_vo.Trip_VO"%>
<%@page import="team_dao.Trip_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("pno");
	Trip_DAO dao = new Trip_DAO();
	Trip_VO vo = new Trip_VO();
	
	if(no!=null){
		int pno = Integer.parseInt(no);
		vo = dao.getData(pno);
	}

%>
