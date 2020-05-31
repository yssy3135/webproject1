<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	QnABoardDAO dao = new QnABoardDAO();
	QnABoardVO vo = new QnABoardVO();

	String searchtext = request.getParameter("searchtext");
	
	
	ArrayList<QnABoardVO> list = dao.searchbtitle(searchtext);
	
	
	for(QnABoardVO blist : list){
		System.out.println(blist.getBno());
	}

	
	response.sendRedirect("list.jsp");

	
%>