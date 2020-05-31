
<%@page import="team_dao.dao.TogetherDAO"%>
<%@page import="team_vo.VO.TogetherVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int bno = Integer.parseInt(request.getParameter("bno"));
	String tbschedule = request.getParameter("tbspot");
	String tbspot = request.getParameter("tbspot");
	String tbthema = request.getParameter("tbthema");
	int tbstatus = Integer.parseInt(request.getParameter("tbstatus"));
	
	String tbproduct = request.getParameter("tbproduct");
	String tbage = request.getParameter("tbage");
	String tbgender = request.getParameter("tbgender");
	
	String tbcontents = request.getParameter("contents");
	
	String tbtitle = request.getParameter("title");
	
	
	TogetherVO vo = new TogetherVO();
	TogetherDAO dao = new TogetherDAO();
	
	
	
	
	vo.setTbtitle(tbtitle);
	vo.setSchedule(tbschedule);
	vo.setTbspot(tbspot);
	vo.setTbthema(tbthema);
	
	vo.setTbid("아이디");
	vo.setTbstatus(tbstatus);
	vo.setTbproduct(tbproduct);
	vo.setTbage(tbage);
	vo.setTbgender(tbgender);
	vo.setContents(tbcontents);
	vo.setTbnum(bno);
	
	dao.modifyData(vo);
	
	
	response.sendRedirect("togetherdetail.jsp?bno="+bno);






%>