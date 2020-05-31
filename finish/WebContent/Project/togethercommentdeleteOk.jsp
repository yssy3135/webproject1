<%@page import="team_dao.dao.ToReBoardDAO"%>
<%@page import="team_vo.VO.TogetherCommentVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("euc-kr");

	int tcno = Integer.parseInt(request.getParameter("tcno"));

	String bno = request.getParameter("bno");
	
	out.println(tcno);

	
	
	TogetherCommentVO vo = new TogetherCommentVO();
	
	vo.setTcno(tcno);

	
	
	
	ToReBoardDAO dao = new ToReBoardDAO();
	
	dao.delete(vo);
	
	
	response.sendRedirect("togetherdetail.jsp?bno="+bno);


%>