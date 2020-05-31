<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String no = request.getParameter("bno");
 	String pw = request.getParameter("pw");

 	int bno = Integer.parseInt(no);
 	QnABoardDAO dao = new QnABoardDAO();
	
 	boolean login = false;
 	login = dao.passwordOk(bno, pw);
 	
 		
 	if(login){%>
 	<script type="text/javascript">
	$('#listdiv1').load('../teamproject/qna_board/detail.jsp?bno='+<%=bno %>);
 	</script>
 	<%}else{	%>
 	
 	<script language = "javaScript">
 		alert("비밀번호를 확인하세요");
 		/* history.go(-1); */
 	</script>
 	
 	<% 
 	} 
 	%>
