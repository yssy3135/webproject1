<%@page import="team_dao.dao.ToReBoardDAO"%>
<%@page import="team_dao.dao.TogetherDAO"%>
<%@page import="team_vo.VO.TogetherVO"%>

<%@page import="java.util.ArrayList"%>
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
   	
	TogetherDAO dao = new TogetherDAO();
   	
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
<title>여행 친구 찾기</title>
<link rel="stylesheet" href="together.css" />
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
		
		
		$("#select").change(function(){
			var state = $("#select option:selected").val();
			console.log($("select"));
			if(state == '찾는중'){
				document.location = "togetherstatus.jsp?status=0"; //찾는중
				
				
				
			}else if(state == '완료') {
				document.location = "togetherstatus.jsp?status=1"; //완료
			}else if(state == '전체보기'){
				
				document.location = "together.jsp"; //전체보기
				
			}
			
			
		});
		
		
		$(".search").on('click',function(){
			
			var word = this.parentNode.childNodes[3].value;
			console.log(word);
			
			
		 	 if(word == ""){
				
				alert("검색어를 입력하세요");	
			}else{
				document.location = "togethersearch.jsp?word="+word;
				
			} 
			
			
			
			
			
		

			
		});
		
		
		
		
		
		
	});


</script>
</head>
<body>

	<div class="togethercontainer">
	
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
	
	
		<div class="togethermain">
			<div class="head"> 
				<select name="select" id="select">
					<option value="----">진행상황별</option>
					<option value="찾는중">찾는중</option>
					<option value="완료">완료</option>
				</select>
			
			
			</div>	
			<table class="tab">
				<tr>	
					<th class="tbnum">글번호</th>
					<th class = "writer">글쓴이</th>
					<th class = "title">제목</th>
					<th class = "spot">장소</th>
					<th class = "tnum">진행상황</th>
					<th class = "tday">작성일</th>
					<th class = "tclick">조회수</th>
				</tr>
				
				<tr> 
				<!--공지 스크립틀릿 공간 -->
				<% 
				
				ArrayList<TogetherVO> list2 = dao.notice(3);
				
				
				for(TogetherVO vo : list2){  //개씩 출력
				
				
				%>
					<td style="background-color: #b1b1b136;">
						<strong>
							<span style="background-color: #353535;border-radius: 3px;color:#fff;padding: 2px;">공지</span>
						</strong>		
					</td>
					<td style="background-color: #b1b1b136;">관리자</td>
					<td style="background-color: #b1b1b136;"><a href="togetherdetail.jsp?bno=<%=vo.getTbnum()%>"><%=vo.getTbtitle() %></a></td> 
					<td style="background-color: #b1b1b136;"><%=vo.getTbspot() %></td>
					<td style="background-color: #b1b1b136;"></td>
					<td style="background-color: #b1b1b136;"><%=vo.getTbdate() %></td>
					<td style="background-color: #b1b1b136;"><%=vo.getTbhits() %></td>
				</tr>
				<%
				}
				%>
				
				
				
				<tr>
				<!-- 스크립틀릿 공간 -->
				<% 
				
				ArrayList<TogetherVO> list = dao.getAllData(startNo, endNo);
				ToReBoardDAO dao2 = new ToReBoardDAO();
				
				for(TogetherVO vo : list){  //개씩 출력
				
				
				%>
					<td><%=vo.getTbnum()%></td>
					<td><%=vo.getTbid() %></td>
					<td><a href="togetherdetail.jsp?bno=<%=vo.getTbnum()%>" id = "dis"><%=vo.getTbtitle() %></a>  
							<p id = "commentnum"><%=dao2.commentcount(vo.getTbnum())%> </p> 
							</td> 
					<td><%=vo.getTbspot() %></td>
					<td><img src="../images/btn_status_<%=vo.getTbstatus()%>.png" alt="" /></td>
					<td><%=vo.getTbdate() %></td>
					<td><%=vo.getTbhits() %></td>
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
				<a class = "pagedetail" id = <%=i %> href="together.jsp?cp=<%=i %>"><span><%=i %></span></a>
				<%
						} // if end
				
					}
				
				%>
			</td>
		</tr>

		</table>
		<div class="bot">
			<a href="togetherwrite.jsp"><input type="button" value="작성" /></a>

			<input type="text" name="" id="txt" class = "searchtext" placeholder = "제목이나 내용을 입력하세요"/>
				<input type="button" value="검색"  class = "search"/>
			
		</div>
		
		
		
		</div> <!-- togethermain -->
	
	
	
	
	</div>



</body>
</html>