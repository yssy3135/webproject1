<%@page import="team_vo.NoticeBoardVO"%>
<%@page import="team_dao.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	#noticeDetail{
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
	
	#tdcol1, #tdcol2{
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

	
	#list{
    	color: #555;
   		font-size: 13px;
    	padding: 0 10px 0 10px;
    	min-width: 50px;
    	height: 28px;
    	line-height: 26px;
    	text-align: center;
    	font-weight: 600;
    	text-decoration: none;
    	background: #fff;
    	border: 1px solid #ddd;
	
	}
	
	#contentsnotice{
		width: 100%;
		height: 300px;
		border-top: 1px solid black;
	}
	
	#listb{
		float: right;
		width: 80px;
		height: 35px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}
	
	#noticeCon{
		width: 900px;
		height: 500px;
	}

</style>
</head>
<body>

	<!-- 게시글 번호에 따른 데이터 조회 결과를 각 td에 출력해보세요 -->
	<%
		String no = request.getParameter("bno");
			
		NoticeBoardDAO dao = new NoticeBoardDAO();
		NoticeBoardVO vo = new NoticeBoardVO();
		
		if(no!=null){
			int bno = Integer.parseInt(no);
			vo = dao.getData(bno);
		}else {
			response.sendRedirect("notice_list.jsp");
		}
	%>

	<table id="noticeDetail">
		<tr>
			<th id="title">제목</th>
			<td id="tdcol1" colspan="4"><%=vo.getBtitle() %></td>
		</tr>
		
		<tr>
			<th id="writer">작성자</th>
			<td id="tdcol2"><%=vo.getMname() %></td>
			<th id="time">작성일시</th>
			<td id="tdcol2"><%=vo.getBregdate() %></td>
		</tr>
		
		<tr id="contentsnotice">
			<td colspan="4">
				<div id="noticeCon">
					<%=vo.getBcontents() %>				
				</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<input type="button" value="목록" id="listb"/>
			</td>
		</tr>
		
	</table>
	

</body>
<script type="text/javascript">

	$('#listb').on('click', function(){
	    $('#listdiv1').load("../teamproject/noticeboard/notice_list.jsp");
	});
	
</script>
</html>