<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	#detail_table{
		width : 900px;
		border-spacing: 2px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}

	#detail_title, #detail_writer, #detail_time{
		border-collapse: collapse;
		font-size: 15px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		text-align: center;
		border-top: 1px solid black;
		border-right: 1px solid #ddd;
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	#detail_col1, #detail_col2{
		padding : 10px;
		margin-left : 10px;
		border-collapse: collapse;
		font-size: 13px;
   		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border-top: 1px solid black;
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	#detail_modifybutton, #detail_deletebutton, #detail_list{
		width: 80px;
		height: 35px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}
	
	#detail_list{
		margin-left: 650px;
	}
	
	#Bcon{
		width: 900px;
		height: 500px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회 결과를 각 td에 출력해보세요 -->
	<%
		String no = request.getParameter("bno");
		String pw = request.getParameter("pw");
	
		QnABoardDAO dao = new QnABoardDAO();
		QnABoardVO vo = new QnABoardVO();
		
		if(no!=null){
			int bno = Integer.parseInt(no);
			//조회수 증가 메소드 추가
			dao.raiseHits(bno);
			
			vo = dao.getData(bno);
		}else {
			response.sendRedirect("list.jsp");
		}
			
	%>
	<div id="listdiv1">
	<table id="detail_table">
		<tr>
			<th id="detail_title">제목</th>
			<td id="detail_col1" colspan="4"><%=vo.getBtitle() %></td>
		</tr>
		
		<tr>
			<th id="detail_writer">작성자</th>
			<td id="detail_col2"><%=vo.getMname() %></td>
			<th id="detail_time">작성일시</th>
			<td id="detail_col2"><%=vo.getBregdate() %></td>
		</tr>
		
		<tr id="detail_contents">
			<td colspan="4">
				<div id="Bcon">
					<%=vo.getBcontents() %>
				</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<button value="<%=vo.getBno()%>" class="bt" id="detail_modifybutton">수정</button>
				<button value="<%=vo.getBno()%>" id="detail_deletebutton">삭제</button>
				<input type="button" value="목록" id="detail_list"/>
			</td>
		</tr>
		
	</table>
	</div>
	
	<!-- 답글달기 -->
	<div>
	
	
	</div>
	
	
	
<script type="text/javascript">
	
	$('#detail_list').click(function(){
		$('#listdiv1').load("../teamproject/qna_board/list.jsp");
	});
	
	$('.bt').click(function(){
		var bno = this.value;
		$('#listdiv1').load("../teamproject/qna_board/modify.jsp?bno="+bno);	
	});
	
	$('#detail_deletebutton').click(function(){
		var bno = this.value;
		$('#listdiv1').load("../teamproject/qna_board/deleteOk.jsp?bno="+bno);
	});
	

</script>


</body>
</html>