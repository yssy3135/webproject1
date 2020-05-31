
<%@page import="team_vo.P_Member_VO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_vo.VO.freeboardVO"%>
<%@page import="team_dao.dao.FreeboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	String title= request.getParameter("title");
	String contents = request.getParameter("contents");
	String product = request.getParameter("select");
	//String id = request.getParameter("id"); 
	
	out.println(title);
	
	out.println(contents);
	
	
	FreeboardDAO dao = new FreeboardDAO();
	freeboardVO vo = new freeboardVO();
	vo.setTitle(title);
	vo.setContents(contents);
	
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
	
	vo.setWriter(memvo.getId());
	
	
	// 아이디 정보 가져와야함
	dao.addData(vo);
	
	
	
	
	response.sendRedirect("freeboard.jsp");




%>
