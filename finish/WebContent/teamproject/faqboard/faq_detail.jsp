<%@page import="team_vo.FAQBoard_VO"%>
<%@page import="team_dao.FAQBoard_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#faqtable{
		width : 900px;
		border-spacing: 2px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}


	#ftitle, #fwriter, #ftime{
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
	
	#facol1, #facol2{
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

	
	#detail_list{
    	float: right;
		width: 80px;
		height: 35px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}
	
	
	#contentsfaq{
		width: 100%;
		height: 300px;
		border-top: 1px solid black;
	}
	
	#faqCon{
		width: 900px;
		height: 500px;
	}

</style>
</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회 결과를 각 td에 출력해보세요 -->
	<%
		String no = request.getParameter("bno");
			
		FAQBoard_DAO fdao = new FAQBoard_DAO();
		FAQBoard_VO fvo = new FAQBoard_VO();
		
		if(no!=null){
			int bno = Integer.parseInt(no);
			fvo = fdao.getData(bno);
		}else {
			response.sendRedirect("faq_list.jsp");
		}
	%>

	<table id="faqtable">
		<tr>
			<th id="ftitle">제목</th>
			<td id="facol1" colspan="4"><%=fvo.getBtitle() %></td>
		</tr>
		
		<tr>
			<th id="fwriter">작성자</th>
			<td id="facol2"><%=fvo.getMname() %></td>
			<th id="ftime">작성일시</th>
			<td id="facol2"><%=fvo.getBregdate() %></td>
		</tr>
		
		<tr id="contentsfaq">
			<td colspan="4">
				<div id="faqCon">
					<%=fvo.getBcontents() %>
				</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<input type="button" value="목록" id="detail_list"/>
			</td>
		</tr>
		
	</table>
</body>
<script type="text/javascript">

	$('#detail_list').on('click', function(){
	    $('#listdiv1').load("../teamproject/faqboard/faq_list.jsp");
	});
	
</script>
</html>