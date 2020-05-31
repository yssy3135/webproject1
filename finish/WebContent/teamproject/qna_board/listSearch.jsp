<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
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
	
	QnABoardDAO dao = new QnABoardDAO();
	
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
		height: 1080px;
		margin-bottom: 200px;
		position : relative;
		float : left;
		
	}
	
	table {
		width : 820px;
		margin : 0 auto;
		border-collapse: separate;
		border-spacing: 2px;
		font-size: 13px;
   		font-family: "나눔고딕",Nanum Gothic,Malgun Gothic,"Spoqa Han Sans", "돋움",Dotum,"굴림",Gulim, AppleGothic, Sans-serif;
		
	}
	
	table, tr, th, td{
			
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		border-collapse: collapse;
	}
	
	th,td{
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
		
	}
	
	
	#list_col1{
		width : 10%;
		text-align: center;
	}
	

	#list_col2{
		width : 50%;
	}
	
	#list_col3{
		width : 15%;
		text-align: center;
	}
	
	#list_col4 {
		width : 15%;
		text-align: center;
	}
	
	
	#list_col5{
		width : 10%;
		text-align: center;
	}
	
	.btn{	
	
		padding-left : 770px;
		
		
	}
</style>
</head>
<body>
	<div>
		<div id="listdiv1">
			<table>
				<tr>
					<th id="list_col1">번호</th>
					<th id="list_col2">제목</th>
					<th id="list_col3">작성자</th>
					<th id="list_col4">작성일</th>
					<th id="list_col5">조회수</th>
				</tr>
				<%
					ArrayList<QnABoardVO> list = dao.getAllData(startNo, endNo);
					for(QnABoardVO vo : list){
				%>
				<tr>
					<td id="list_col1"><%=vo.getBno() %></td>
					<td id="list_col2">
					<% 
					
					String pw1 = vo.getBpassword();
					
					if(pw1==null){
						
					%>
					<a href="../qna_board/detail.jsp?bno=<%=vo.getBno() %>"><%=vo.getBtitle() %></a>
					<%
					
					}else if(pw1!=null){
						
					%>
					[비밀글]<a href="../qna_board/passwordcheck.jsp?bno=<%=vo.getBno() %>"><%=vo.getBtitle() %></a>
					<%
					}
					%>
					
					</td>
					<td id="list_col3"><%=vo.getMname() %></td>
					<td id="list_col4"><%=vo.getBregdate() %></td>
					<td id="list_col5"><%=vo.getBhits() %></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="5">
						<%
							for(int i = currentPage-4; i<=currentPage+5; i++){
								if(i<=0){
									continue;
								}else if(i>totalPage){
									break;
								}else{
						%>
						<a href="list.jsp?cp=<%=i %>"><span id="list_page"> <%=i %></span></a>			
						<%
								}//if end
						}//for end
						%>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="btn">
					<a href="write.jsp"><input type="button" value="글쓰기" width="20px"/></a>
					</td>
				</tr>
					
			</table>
		</div>
	</div>
</body>
</html>