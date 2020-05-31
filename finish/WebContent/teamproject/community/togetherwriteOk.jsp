
<%@page import="team_vo.P_Member_VO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_dao.dao.TogetherDAO"%>
<%@page import="team_vo.VO.TogetherVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String tbschedule = request.getParameter("tbspot");
	String tbspot = request.getParameter("tbspot");
	String tbthema = request.getParameter("tbthema");
	
	String tbproduct = request.getParameter("tbproduct");
	String tbage = request.getParameter("tbage");
	String tbgender = request.getParameter("tbgender");
	
	String tbcontents = request.getParameter("contents");
	
	String tbtitle = request.getParameter("title");
	
	
	TogetherVO vo = new TogetherVO();
	TogetherDAO dao = new TogetherDAO();
	
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
	
	
	vo.setTbtitle(tbtitle);
	vo.setSchedule(tbschedule);
	vo.setTbspot(tbspot);
	vo.setTbthema(tbthema);
	
	vo.setTbid(memvo.getId());
	
	vo.setTbproduct(tbproduct);
	vo.setTbage(tbage);
	vo.setTbgender(tbgender);
	vo.setContents(tbcontents);

	dao.addData(vo);
	
	
	response.sendRedirect("together.jsp");

%>