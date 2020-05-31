<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#pwtitle{
		border: 1px solid #ddd;
		width : 200px;
		height : 60px;
		margin : 0px auto;
		margin-top: 70px;
		text-align: center;
		border-bottom: none;
	}
	
	#pwtitle h3{
		margin-top: 30px;
	}
	
	#pwinput{
		border: 1px solid #ddd;
		width : 200px;
		height : 60px;
		margin : 0px auto;
		border-top: none;
	}
	
	#pwok{
		width: 50px;
		height: 30px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}
	
	#pw{
		margin-left: 25px;
		width: 100px;
		height: 25px;
	}

</style>
</head>
<body>

	<%
	String no = request.getParameter("bno");
	QnABoardDAO dao = new QnABoardDAO();
	QnABoardVO vo = new QnABoardVO();
	
	if(no!=null){
		int bno = Integer.parseInt(no);
		vo = dao.getData(bno);
	}else {
		response.sendRedirect("../qna_board/list.jsp");
	}
	
	%>
	<form name="frm">
		<input type="hidden" id="bno1" name="bno" value="<%=vo.getBno() %>"/>
		<div id="pwtitle">
			<h3>비밀번호 입력</h3>
		</div>	
		<div id="pwinput">
			<input type="password" name="pw" id="pw" />
			<input type="button" value="확인" id="pwok"/>
		</div>
	</form>
		
</body>
<script type="text/javascript">
	$(function(){
		$('#pwok').click(function(){
			var bno = $('#bno1').val();
			var pass = $('#pw').val();
			$('#listdiv1').load('../teamproject/qna_board/passwordcheckOk.jsp?bno='+bno+"&pw="+pass);
		});
	});
</script>
</html>