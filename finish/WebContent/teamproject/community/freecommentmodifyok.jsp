<%@page import="team_dao.dao.FreeReBoardDAO"%>
<%@page import="team_vo.VO.FreecommentVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("euc-kr");

	int rno = Integer.parseInt(request.getParameter("rno"));
	String commentmodifycontents = request.getParameter("commentmodifycontents");
	String bno = request.getParameter("bno");
	
	out.println(rno);
	out.println(commentmodifycontents);
	
	
	FreecommentVO vo = new FreecommentVO();
	
	vo.setRno(rno);
	vo.setRe_contents(commentmodifycontents);
	
	
	
	FreeReBoardDAO dao = new FreeReBoardDAO();
	
	dao.modify(vo);
	
	
	response.sendRedirect("freeboarddetail.jsp?bno="+bno);


%>