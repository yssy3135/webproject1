
<%@page import="team_dao.dao.ToReBoardDAO"%>
<%@page import="team_vo.VO.TogetherCommentVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("euc-kr");

	int tcno = Integer.parseInt(request.getParameter("tcno"));
	String commentmodifycontents = request.getParameter("commentmodifycontents");
	String bno = request.getParameter("bno");
	
	out.println(tcno);
	out.println(commentmodifycontents);
	
	
	TogetherCommentVO vo = new TogetherCommentVO();
	
	vo.setTcno(tcno);
	vo.setT_contents(commentmodifycontents);
	
	
	
	ToReBoardDAO dao = new ToReBoardDAO();
	
	dao.modify(vo);
	
	
	response.sendRedirect("togetherdetail.jsp?bno="+bno);


%>
