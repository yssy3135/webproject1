<%@page import="team_dao.dao.ProjectDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    		String no = request.getParameter("bno");
    		int bno = Integer.parseInt(request.getParameter("bno"));
    
    		ProjectDAO dao = new ProjectDAO();
    
    	
    		dao.down(bno);
    
    		
    		response.sendRedirect("detail.jsp?bno="+no);
    		
    %>