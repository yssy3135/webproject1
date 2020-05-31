<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%
		String no = request.getParameter("bno");
		QnABoardDAO dao = new QnABoardDAO();
		QnABoardVO vo = new QnABoardVO();
		
		if(no!=null){
			
			int bno = Integer.parseInt(no);
			
			vo = dao.getData(bno);
		}
	
	%>
<title>Insert title here</title>
<style type="text/css">
	
	#modifyTable{
		width : 900px;
		border-spacing: 2px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}


	#title, #writer, #time{
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
	
	#mcol1, #mcol2{
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
	
	#confirm, #list{
    	width: 80px;
		height: 35px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}
	
	#list{
		margin-left: 730px;
	}
	
	#bcontents{
		width: 100%;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$("#confirm").click(function(){
			var bno = <%=vo.getBno() %>;
			var btitle = $("#btitle").val();
			var bcontents = $("#bcontents").val();
			
			location.href = "../teamproject/MainBoard/modifyOk.jsp?bno="+bno+"&btitle="+btitle+"&bcontents="+bcontents;
		});
		
		$('#list').on('click', function(){
			$('#listdiv1').load("../teamproject/qna_board/list.jsp");
		});
		
	});
</script>
</head>
<body>

	<form id="">
		<input type="hidden" name="bno" value="<%=vo.getBno() %>" />
		<table id="modifyTable">
			<tr>
				<th id="title">제목</th>
				<td id="mcol1" colspan="4"><input type="text" name="btitle" id="btitle" value="<%=vo.getBtitle() %>"/></td>
			</tr>
			
			<tr>
				<th id="writer">작성자</th>
				<td id="mcol2"><%=vo.getMname() %></td>
				<th id="time">작성일시</th>
				<td id="mcol2"><%=vo.getBregdate() %></td>
			</tr>
			
			<tr id="contentsmain">
				<td colspan="4">
					<textarea name="bcontents" id="bcontents" cols="200" rows="10" ><%=vo.getBcontents() %></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="6">
					<input type="button" value="수정" id="confirm">
					<input type="button" value="목록" id="list"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>