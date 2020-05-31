<%@page import="team_vo.NoticeBoardVO"%>
<%@page import="team_dao.NoticeBoardDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
	NoticeBoardDAO dao = new NoticeBoardDAO();
	
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
	
	#noticelistTable {
		width : 820px;
		margin : 0 auto;
		border-collapse: separate;
		border-spacing: 2px;
		font-size: 13px;
   		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#noticelistTable, #noticelistTable tr, #noticelistTable th, #noticelistTable td{
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		border-collapse: collapse;
		font-size: 15px;
	}
	
	#noticelistTable th, #noticelistTable td{
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	
	.ncol1{
		width : 10%;
		text-align: center;
	}
	

	.ncol2{
		width : 50%;
	}
	
	.ncol3{
		width : 15%;
		text-align: center;
	}
	
	.ncol4 {
		width : 15%;
		text-align: center;
	}
	
	
	.ncol5{
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
<script type="text/javascript">
		$('.bt').click(function(){	
			var bno = this.value;
			$('#listdiv1').load('../teamproject/noticeboard/notice_detail.jsp?bno='+bno);
			//console.log("click");
		});
</script>
</head>
<body>
	<div>
		<div id="listdiv1">
			<table id="noticelistTable">
				<tr>
					<th class="ncol1">번호</th>
					<th class="ncol2">제목</th>
					<th class="ncol3">작성자</th>
					<th class="ncol4">작성일</th>
				</tr>
				<%
					ArrayList<NoticeBoardVO> list = dao.getAllData(startNo, endNo);
					for(NoticeBoardVO vo : list){
				
				%>
				<tr>
					<td class="ncol1"><%=vo.getBno() %></td>
					<td class="ncol2">
					<button class="bt" value="<%=vo.getBno()%>" id="listbutton"><%=vo.getBtitle() %></button>
					</td>
					<td class="ncol3"><%=vo.getMname() %></td>
					<td class="ncol4"><%=vo.getBregdate() %></td>
					
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
						<a href="../noticeboard/notice_list.jsp?cp=<%=i %>"><span id="page"> <%=i %></span></a>			
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
</html>