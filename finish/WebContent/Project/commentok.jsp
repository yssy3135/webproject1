<%@page import="team_vo.P_Member_VO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_dao.dao.ProjectDAO"%>
<%@page import="team_vo.VO.CommentVO"%>
<%@page import="dao.BoardV3_DAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	String contents = request.getParameter("contents");
	
P_Member_DAO memdao = new P_Member_DAO();
	
	Cookie[] clist = request.getCookies();

	String memno = null;
	
	if(clist != null){
		   for(Cookie c : clist){
		      if(c.getName().equals("projectLogin")){
		         memno = URLDecoder.decode(c.getValue(), "UTF-8");
			            
	       }
	    }
	      
	 }
	P_Member_VO memvo = memdao.selectOne(memno);
	
	
	

	
	if(contents!=null){

		CommentVO vo = new CommentVO(bno,memvo.getId(),contents);
		ProjectDAO dao = new ProjectDAO();
		
		
		
		dao.comment(vo);
		
		
		response.sendRedirect("detail.jsp?bno="+bno);
	
	}else{
		response.sendRedirect("detail.jsp?bno="+bno);
		
	}
	
	
%>
