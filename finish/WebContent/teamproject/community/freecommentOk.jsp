ntVO"%>
<%@page import="team_dao.dao.FreeReBoardDAO"%>
<%@page import="team_vo.VO.FreecommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int bno = Integer.parseInt(request.getParameter("bno"));
String contents = request.getParameter("contents");
String writer = request.getParameter("writer");



if(contents!=null){

	FreecommentVO vo = new FreecommentVO(bno,writer,contents);
	FreeReBoardDAO dao = new FreeReBoardDAO();
	
	
	dao.insertReply(vo, bno);
	
	
	
	response.sendRedirect("freeboarddetail.jsp?bno="+bno);

}else{
	response.sendRedirect("freeboarddetail.jsp?bno="+bno);
	
}




%>