
<%@page import="team_dao.dao.TogetherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
 <%
String no = request.getParameter("bno");
int bno = Integer.parseInt(request.getParameter("bno"));

TogetherDAO dao = new TogetherDAO();
dao.down(bno);




response.sendRedirect("togetherdetail.jsp?bno="+no);

%>
    