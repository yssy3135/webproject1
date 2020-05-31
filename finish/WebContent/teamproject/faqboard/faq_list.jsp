<%@page import="team_vo.FAQBoard_VO"%>
<%@page import="team_dao.FAQBoard_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cp = request.getParameter("cp");

	int currentPage = 0;
	
	if(cp!=null){
		currentPage = Integer.parseInt(cp);
	}else{
		currentPage = 1;
	}
	
	FAQBoard_DAO dao = new FAQBoard_DAO();
	
	int totalCount = dao.getTotalCount();
	
	int recordByPage = 10;
	
	int totalPage = (totalCount/recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;
	
	int startNo = (currentPage-1)*recordByPage+1;
	int endNo = currentPage*recordByPage;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#listdiv1{
		width : 830px;
		height: 100%;
		float : left;
		margin-bottom: 50px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#faqTabel {
		width : 820px;
		margin : 0 auto;
		border-collapse: separate;
		border-spacing: 2px;
		font-size: 13px;
   		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#faqTabel, #faqTabel tr, #faqTabel th, #faqTabel td{
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		border-collapse: collapse;
		font-size: 15px;
	}
	
	#faqTabel th, #faqTabel td{
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	.faqcol1{
		width : 10%;
		text-align: center;
	}

	.faqcol2{
		width : 50%;
	}
	
	.faqcol3{
		width : 15%;
		text-align: center;
	}
	
	.faqcol4 {
		width : 15%;
		text-align: center;
	}
	
	.faqcol5 {
		width : 10%;
		text-align: center;
	}
	
	#listbutton{
		background: white;
		border : 0px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 15px;
		cursor: pointer;
	}
	
</style>
</head>
<body>
	
	<div>
		<div id="listdiv1">
			<table id="faqTabel">
				<tr>
					<th class="faqcol1">번호</th>
					<th class="faqcol2">제목</th>
					<th class="faqcol3">작성자</th>
					<th class="faqcol4">작성일</th>
				</tr>
				<%
					ArrayList<FAQBoard_VO> list = dao.getAllData(startNo, endNo);
					for(FAQBoard_VO vo : list){
				%>
				<tr>
					<td class="faqcol1"><%=vo.getBno() %></td>
					<td class="faqcol2">
					<button class="bt" value="<%=vo.getBno()%>" id="listbutton"><%=vo.getBtitle() %></button>
					</td>
					<td class="faqcol3"><%=vo.getMname() %></td>
					<td class="faqcol4"><%=vo.getBregdate() %></td>
					
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="4">
						<%
							for(int i = currentPage-4; i<=currentPage+5; i++){
								if(i<=0){
									continue;
								}else if(i>totalPage){
									break;
								}else{
						%>
						<a href="../faqboard/faq_list.jsp?cp=<%=i %>"><span id="page"> <%=i %></span></a>			
						<%
								}//if end
						}//for end
						%>
					</td>
				</tr>
				
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
		$('.bt').click(function(){	
			var bno = this.value;
			$('#listdiv1').load('../teamproject/faqboard/faq_detail.jsp?bno='+bno);
		});
</script>
</html>