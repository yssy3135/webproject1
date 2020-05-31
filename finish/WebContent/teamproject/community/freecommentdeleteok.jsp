

<%@page import="team_dao.dao.FreeReBoardDAO"%>
<%@page import="team_vo.VO.FreecommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


int rno = Integer.parseInt(request.getParameter("rno"));

String bno = request.getParameter("bno");
out.println(rno);
out.println(bno);



FreecommentVO vo = new FreecommentVO();

vo.setRno(rno);





FreeReBoardDAO dao = new FreeReBoardDAO();

dao.delete(vo);


response.sendRedirect("freeboarddetail.jsp?bno="+bno);


%>