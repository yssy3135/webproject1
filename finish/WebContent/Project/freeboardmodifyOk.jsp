<%@page import="team_vo.VO.freeboardVO"%>
<%@page import="team_dao.dao.FreeboardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


String title = request.getParameter("title");
String contents = request.getParameter("contents");
String no = request.getParameter("bno");


out.println("title :" + title);
out.println("contents: "+ contents);
out.println("bno:"+no); 



if(no!=null){
	int bno = Integer.parseInt(no);
	
	FreeboardDAO dao = new FreeboardDAO();
	
	freeboardVO vo = new freeboardVO();
	vo.setTitle(title);
	vo.setContents(contents);
	vo.setBno(bno);
	
	dao.modifyData(vo);
	
	response.sendRedirect("freeboarddetail.jsp?bno="+no);

}else{
	response.sendRedirect("freeboarddetaildetail.jsp?bno="+no);
	
}



	


%>