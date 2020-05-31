<%@page import="team_dao.dao.ProjectDAO"%>
<%@page import="team_vo.VO.CommentVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


int cno = Integer.parseInt(request.getParameter("cno"));

String bno = request.getParameter("bno");
out.println(cno);



CommentVO vo = new CommentVO();
vo.setCno(cno);





ProjectDAO dao = new ProjectDAO();

dao.boardcodelete(vo);


response.sendRedirect("detail.jsp?bno="+bno);


%>


