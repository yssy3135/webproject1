<%@page import="team_dao.dao.ProjectDAO"%>
<%@page import="team_vo.VO.CommentVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("euc-kr");

	int cno = Integer.parseInt(request.getParameter("cno"));
	String commentmodifycontents = request.getParameter("commentmodifycontents");
	String bno = request.getParameter("bno");
	out.println(cno);
	out.println(commentmodifycontents);
	
	
	CommentVO vo = new CommentVO();
	vo.setCno(cno);
	vo.setRe_contents(commentmodifycontents);

	
	
	
	ProjectDAO dao = new ProjectDAO();
	
	dao.boardcomodify(vo);
	
	
	response.sendRedirect("detail.jsp?bno="+bno);


%>




