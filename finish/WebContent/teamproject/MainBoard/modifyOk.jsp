<%@page import="team_dao.QnABoardDAO"%>
<%@page import="team_vo.QnABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String no = request.getParameter("bno");
	String btitle = request.getParameter("btitle");
	String bcontents = request.getParameter("bcontents");
	
	System.out.println(no);
	System.out.println(btitle);
	System.out.println(bcontents);

	int bno = Integer.parseInt(no);
	
	
	
	QnABoardVO vo = new QnABoardVO();
	QnABoardDAO dao = new QnABoardDAO();
	vo.setBno(bno);
	vo.setBtitle(btitle);
	vo.setBcontents(bcontents);
		
	dao.modifyData(vo);

	response.sendRedirect("../main.jsp?fno=../teamproject/MainBoard/MainBoard.jsp");
	
	
%>
