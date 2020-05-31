<%@page import="team_vo.VO.BoardVO"%>
<%@page import="team_dao.dao.ProjectDAO"%>



<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 /* 페이징 처리 */
 	//현재 페이지(currentPage)얻어오기
 	String cp = request.getParameter("cp");
	
	int currentPage = 0;
	
	if(cp!=null){
		currentPage = Integer.parseInt(cp);
		
	}else {
		currentPage = 1;
	}
   	
	ProjectDAO dao = new ProjectDAO();
   	
	//총게시글 수
	int totalCount = dao.getTotalCount();
	
	//한 페이지당 레코드 수 : 10
	int recordBypage = 10;
	
	// 총 페이지 수 
	int totalPage = 
		(totalCount%recordBypage==0)?totalCount/recordBypage:totalCount/recordBypage;
	
	/* 현재 페이지 번호
		1  2  3 4 .....
		각 페이지별 레코드 번호
		1  11  21  31
		10 20  30  40

	*/
	
	// 현재 페이지 - 레코드 시작번호
	int startNo = (currentPage-1)*recordBypage+1; 
	
	// 현재 페이지 - 레코드 끝번호
	int endNo = currentPage*recordBypage;	
/* 	out.println("총 게시물수 : " +totalCount);
	out.println("한 페이지당 게시물 수 : " + recordBypage);
	out.println("총 페이지수 : " + totalPage);
	out.println("현재 페이지 번호 : " +currentPage);
	out.println("<h2>현재 페이지 시작번호 : "+ startNo+"</h2>");
	out.println("현재 페이지 끝번호 : 	" + endNo+ "</h2>"); */
	
   
%>    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 </title>
<link rel="stylesheet" href="boardmain.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var no = <%=request.getParameter("cp")%>
		if(no == null){
			no = 1;
		}
		
		console.log(document.getElementById(no));
		
		
		document.getElementById(no).style = "background-color : black;color:white; border-radius:10px";
		
		$(".pagedetail").hover(function(){ 
		
			this.style = "background-color : black;color:white; border-radius:10px";
			console.log(this.id);
			
		},function(){
			if(this.id != no){
				
				this.style = "background-color : white;color:black; border-radius:10px";
				
			}
			
			
		});
		
		
		$(".search").on('click',function(){
			
			var word = this.parentNode.childNodes[5].value;
			console.log(word);
			
			
			 if(word == ""){
					
					alert("검색어를 입력하세요");	
			}else{
					document.location = "boardsearch.jsp?word="+word;
			}

			
		});
		
		
		
		
	});


</script>


</head>
<body>

	<div class="main">
	<jsp:include page="main/header.jsp"></jsp:include>
	<jsp:include page="main/nav.jsp"></jsp:include>
	
		<div class="side">
			<div class="sideheader">
				<h1>게시판</h1>
			</div>
			<ul>
				<li><a href="board.jsp">후기</a></li>
				<li><a href="together.jsp">동행</a></li>
				<li><a href="freeboard.jsp">자유</a></li>

			</ul>	
		
		
		</div>
		<div class="clear"></div>
	
		<div class="container">
			<br />

			<br />
			
			<table class="tab">
				<tr>
					<th class = "tnum">번호</th>
					<th class = "spot">상품명</th>
					<a href=""><th class = "title">제목</th></a>	
					<th class = "writer">글쓴이</th>
					<th class = "tday">날짜</th>
					<th class = "recommend">추천</th>
					<th class = "tclick">조회수</th>
				</tr>
				<%
				ArrayList<BoardVO> list2 = dao.notice(3);
				
				
				for(BoardVO vo : list2){
				%>
				
					
					<td style="background-color: #b1b1b136;" >
						<strong>
							<span style="background-color: #353535;border-radius: 3px;color:#fff;padding: 2px;">공지</span>
						</strong>		
					</td>
					<td style="background-color: #b1b1b136;"><%=vo.getSpot() %></td>
					<td style="background-color: #b1b1b136;"><a href="detail.jsp?bno=<%=vo.getBno()%>" id = "dis"><%=vo.getTitle() %></a></td>
					<td style="background-color: #b1b1b136;"><%=vo.getWriter() %></td>
					<td style="background-color: #b1b1b136;"><%=vo.getRegdate() %></td>
					<td style="background-color: #b1b1b136;"><%=vo.getRecommend() %></td>
					<td style="background-color: #b1b1b136;"><%=vo.getHits() %></td>
				</tr>
				<%
					
				}
				%>
				
				
				
				<tr>
				<!-- 스크립틀릿 공간 -->
				<% 
				
				dao = new ProjectDAO();
				ArrayList<BoardVO> list = dao.getAllData(startNo, endNo);
				

				
				for(BoardVO vo : list){
				%>
				
					<td><%=vo.getBno() %></td>
					<td><%=vo.getSpot() %></td>
					<td><a href="detail.jsp?bno=<%=vo.getBno()%>" id = "dis"><%=vo.getTitle() %></a>
						<p id="commentnum"><%=dao.commentcount(vo.getBno()) %></p>
					</td>
					<td><%=vo.getWriter() %></td>
					<td><%=vo.getRegdate() %></td>
					<td><%=vo.getRecommend() %></td>
					<td><%=vo.getHits() %></td>
				</tr>
				<%
					
				}
				%>
				
		<tr>
			<td colspan="7" id = "page">
				<%
					for(int i = currentPage-3 ; i <= totalPage+3;i++){
						if(i<=0){
							continue;
						}else if(i>totalPage){
							break;
						}else {
							
						

				%>
				<a class = "pagedetail" id = <%=i %> href="board.jsp?cp=<%=i %>"><span><%=i %></span></a>
				<%
						} // if end
				
					}
				
				%>
			</td>
		</tr>

			</table>
			
			<br />
			
			<div class="bot">
				<a href="write.jsp"><input type="button" value="작성" /></a>
				<input type="button" value="검색"  class = "search"/>
				<input type="text" name="" id="txt" class = "searcharea" placeholder = "제목이나 내용을 입력하세요"/>
			
			</div>
		
		
		</div>
	</div>
	<jsp:include page="main/footer.jsp"></jsp:include>



</body>
</html>