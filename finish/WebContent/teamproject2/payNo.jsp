
<%@page import="team_dao.Porder_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String ono = request.getParameter("ono").trim();
	String status = request.getParameter("status").trim();
	
	Porder_DAO dao = new Porder_DAO();
	
	System.out.println(ono);
	System.out.println(status);
	
	
	if(status.equals("입금전")){
		
		dao.payNo(ono, "입금전취소");
		
		
	}else if(status.equals("입금완료")){
		//dao. (ono,입금후취소)
		dao.payNo(ono, "입금후취소");
		System.out.println("else if 문");
		
	}
	
 	response.sendRedirect("../teamproject/main.jsp?fno=../teamproject2/myPage.jsp");	
	


%>
