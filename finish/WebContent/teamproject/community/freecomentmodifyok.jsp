<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("euc-kr");

int rno = Integer.parseInt(request.getParameter("rno"));
String commentmodifycontents = request.getParameter("commentmodifycontents");
String bno = request.getParameter("bno");

out.println(rno);
out.println(commentmodifycontents);


/* TogetherCommentVO vo = new TogetherCommentVO();

vo.setTcno(tcno);
vo.setT_contents(commentmodifycontents);



ToReBoardDAO dao = new ToReBoardDAO();

dao.modify(vo);


response.sendRedirect("togetherdetail.jsp?bno="+bno);

 */
%>




