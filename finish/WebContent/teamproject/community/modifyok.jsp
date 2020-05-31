
<%@page import="team_vo.VO.BoardVO"%>
<%@page import="team_dao.dao.ProjectDAO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modifyOk.jsp -->
<!-- DB에접근해서 사용자가 수정한 내용을저장 -->


<%

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String no = request.getParameter("bno");
	String spot = request.getParameter("spot");
	
	

	out.println("title :" + title);
	out.println("contents: "+ contents);
	out.println("bno:"+no); 
	
	
	
	if(no!=null){
		int bno = Integer.parseInt(no);
		
		ProjectDAO dao = new ProjectDAO();
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setBno(bno);
		vo.setSpot(spot);
		dao.modifyData(vo); 
		
		response.sendRedirect("detail.jsp?bno="+no);
	
	}else{
		response.sendRedirect("detail.jsp?bno="+no);
		
	} 
	
	
%>