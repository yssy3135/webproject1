


<%@page import="team_vo.P_Member_VO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_dao.dao.ToReBoardDAO"%>
<%@page import="team_vo.VO.TogetherCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	String contents = request.getParameter("contents");
	String writer = request.getParameter("commentid");
	
	
	

	System.out.println(contents);
	
	if(contents!=null){

		TogetherCommentVO vo = new TogetherCommentVO(bno,writer,contents);
		ToReBoardDAO dao = new ToReBoardDAO();
		
			
		dao.insertReply(vo, bno);

		
		
		response.sendRedirect("togetherdetail.jsp?bno="+bno);
	
	}else{
		response.sendRedirect("togetherdetail.jsp?bno="+bno);
		
	}
	
	
%>
