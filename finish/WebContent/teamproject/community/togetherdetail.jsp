<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_vo.VO.TogetherCommentVO"%>
<%@page import="team_dao.dao.ToReBoardDAO"%>
<%@page import="team_vo.VO.TogetherVO"%>
<%@page import="team_dao.dao.TogetherDAO"%>
<%@page import="com.sun.xml.internal.fastinfoset.vocab.Vocabulary"%>
<%@page import="java.net.URLDecoder"%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>

<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
	<%

	TogetherDAO dao = new TogetherDAO();
	String no = request.getParameter("bno");
	TogetherVO vo = null;
	boolean status = false;
	boolean statusco = false;
	
	if(no != null){
		
		int bno = Integer.parseInt(no);
		
		// 조회수 증가메소드 추가
			dao.raiseHits(bno);
		
		 vo = dao.getData(bno);
		 
	}else{
		response.sendRedirect("together.jsp");
		
	}
	
	
	
	
	//String id = "아이디";
	
	P_Member_DAO memdao = new P_Member_DAO();
	
	Cookie[] clist = request.getCookies();

	String memno = null;
	
	if(clist != null){
		   for(Cookie c : clist){
		      if(c.getName().equals("projectLogin")){
		         memno = URLDecoder.decode(c.getValue(), "UTF-8");
			            
	       }
	    }
	      
	 }
	P_Member_VO memvo = memdao.selectOne(memno);
	
	
	
	
/* 	for(Cookie c : clist){
		String tmp = URLDecoder.decode(c.getName(), "UTF-8");
		String value = URLDecoder.decode(c.getValue(), "UTF-8");
		
		
		if(tmp.equals("id")){
			id = value;
		}
	
		
		
		
	}	 */
	
	
	if((memvo.getId()).equals(vo.getTbid())){
		status = true;
	}
	
	// 댓글 작성자 작업
	ToReBoardDAO dao2 = new ToReBoardDAO(); 
	ArrayList<TogetherCommentVO> list = new ArrayList<TogetherCommentVO>();
	list = dao2.getAllReply(Integer.parseInt(no));
	


	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>together.jsp</title>
<link rel="stylesheet" href="togetherdetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#delete").on('click',function(){
			//console.log("click");
			
			var flag = confirm("정말 삭제하겠습니까?");
			
			if(flag){
				//console.log("삭제수행");
				
				// 창 이동 시키기 -> deleteOk.jsp -> 삭제기능을 수행해보세요
				document.location = "togetherdeleteOk.jsp?bno=<%=request.getParameter("bno")%>";
			}
		});
		
		
		$(".modifycomment").on('click',function(){ // 댓글 수정 
			console.dir(this.parentNode.childNodes[7]); //수정확인
			this.parentNode.childNodes[7].type = "button" // form새로운 경로
			console.dir(this.parentNode.parentNode.childNodes[1].childNodes[3]); 
			//console.dir(this.parentNode.parentNode.childNodes[3].childNodes[3].disabled); 
			//this.parentNode.parentNode.childNodes[3].childNodes[3].disabled = false; 
			this.parentNode.parentNode.childNodes[1].childNodes[3].disabled = false; //form 새로
			
			
			//document.getElementById("modifyarea").disabled = false;
			//document.getElementById("modifyconfirm").type = "button";

		});
		
		
		$(".modifyconfirm").on('click',function(){ // 댓글 수정 확인
		
			//var cno = this.parentNode.parentNode.childNodes[5].childNodes[9].value;
			
			//var modicontents = this.parentNode.parentNode.childNodes[3].childNodes[3].value;	//수정된 데이터 가져오기
			
			//console.log(this.parentNode.parentNode.childNodes[5].childNodes[9].value);
			//document.frm.acion= "tomodifyok.jsp";
			//console.log( writer);
			// document.location = "tomodifyok.jsp?cno="+cno+"&contents="+modicontents; 
			var modicontents = console.log(this.parentNode.parentNode.childNodes[1].childNodes[3].value); //form 새로운 값
			
			<%request.setCharacterEncoding("euc-kr");%>
			
			console.dir(this.parentNode.parentNode); //form 경로
			this.parentNode.parentNode.action = "tomodifyok.jsp?bno="+<%=no%>;
			this.parentNode.parentNode.method = "post";
			this.parentNode.parentNode.submit();


		});
		
		$(".deletecomment").on('click',function(){  //댓글삭제
			var flag = confirm("정말 삭제하겠습니까?");
			
			if(flag){
				this.parentNode.parentNode.action = "togethercommentdeleteOk.jsp?bno="+<%=no%>;
				this.parentNode.parentNode.method = "post";
				this.parentNode.parentNode.submit();
				
			}
			
			
		});
		
		
		
		
		
		var finish = <%=vo.getTbstatus()%>;
		console.log(finish);
		if(finish == 1){

			document.getElementById("finish").type = "hidden";
			
		}

		$("#finish").on('click',function(){
		

		});
		
		if(<%=status%>){
			//수정 삭제 버튼 보이기 
			document.getElementById("finish").type = "button";
			document.getElementById("delete").type = "button";
			document.getElementById("modify").type = "button";
		}
	
		
		
		
		var tmp = '<%=memvo.getId() %>';
		
		var writer = document.getElementsByClassName("writer");
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[3]);
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[1].childNodes[7].childNodes[1].childNodes[1].textContent); //아이디 경로
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode); 코멘트 바디
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[5]);
		
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[3]); //  form 새로
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[5]); //  form 새로
		
			//voc.getT_writer() 가 아이디랑 같으면 수정 삭제 버튼 보인다.
			for(var i = 0 ; i< writer.length; i++){

				 if (tmp == writer[i].textContent){
					 //writer[i].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[3].type = "button";
					 
					 writer[i].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[3].type =  "button";
					 writer[i].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[5].type =  "button";
					// writer[i].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[5].type = "button";
		
					
				} 
				
				
			}
			
			
			
		
		
	});


</script>

</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회결과를 각td에 출력해보세요 -->
		<jsp:include page="main/header.jsp"></jsp:include>
	<jsp:include page="main/nav.jsp"></jsp:include>
	
	
	<div class="detailmain">
		<div class="detailcontainer">
			<div class="title"><h1><%=vo.getTbtitle() %></h1>
			
				<div class="status"><img src="../images/btn_status_<%=vo.getTbstatus()%>.png" alt="" /></div>
				<div class="finisharea" >
				 <a href="togetherfinish.jsp?bno=<%=no %>">
					<input type="hidden" id ="finish" value="모집완료" />
				</a> 
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="recommend">관심 : <%=vo.getTbheart() %></div>
			<div class="clear"></div>
			<div class="subtitle">
				<a href=""> 작성자 : <%=vo.getTbid() %></a>
				
				<span>조회수 : <%=vo.getTbhits() %>  </span>
				
				<span>등록일 : <%=vo.getTbdate() %>  </span>
			
			</div>
			
			<hr />
			<div class="contents">
				<div class="schedule">  <!-- 여행 일정  -->
				
				</div>
				<div class="where">   <!-- 여행 지역  -->
				
				</div>
				
				<div class="status"> <!--  모집 현황  -->
				
				</div>
				
				<table>
					<tr>
						<th>여행일정</th>
						<th>여행지역</th>
						<th>여행테마</th>

					</tr>
					
					<tr>
						<td><%=vo.getSchedule() %></td>
						<td><%=vo.getTbspot() %></td>
						<td><%=vo.getTbthema() %></td>

					</tr>
					<br />
					
					<tr>
						<th>관심 상품</th>
						<th>선호 나이</th>
						<th>성별</th>

					</tr>
					
					<tr>
						<td><%=vo.getTbproduct() %></td>
						<td><%=vo.getTbage() %></td>
						<td><%=vo.getTbage() %></td>

					</tr>
				
				
				
				</table>
				
				
				<div class="detailcontents">
					<div class="detailcontents_head"><h1>상세내용</h1></div>
					
					<div class="detailcontents_contents">
						<%=vo.getContents() %>
					</div>
			
				
				</div>

			</div>
			<hr />
			
			
			
			<div class="bottom">
				<div class="up">
					<a href="togetherup.jsp?bno=<%=no%>"><input type="button" value="관심" /></a>
					<a href="togetherdown.jsp?bno=<%=no%>"><input type="button" value="관심 없음" /></a>
				</div>
				<div class="clear"></div>
			
				<div class="bottomnav">		
					<a href="together.jsp"><input type="button" value="목록" /></a>
						<a href="togethermodify.jsp?bno=<%=vo.getTbnum() %>">
						<input type="hidden" id = "modify" value="수정" /></a>
					<input type="hidden" value="삭제" id = "delete"/>
				</div>
				<div class="clear"></div>
			</div>
			<br />
			
			
		 	<!-- 댓글 영역 -->
		 <div class="commentarea">  <!--  댓글 전송 --> 
			<div class="hd"><span>댓글</span></div>
			
			<form action="togethercommentOk.jsp">  <!-- 댓글 정보 전송   -->
				<input type="hidden" name="bno" value = "<%=no %>" />
				<div class="textspace">
					<input type="text" name = "contents"/>

				</div>
					<input type="hidden" class="writerinfo" name ="commentid" value="<%=memvo.getId() %>" />	
				<div class="register">
					<input type="submit" value="댓글 작성" id = "comment"/>
					<div class="clear"></div>
				</div>
			</form>
			
				<!-- 여기 부분이 댓글 보여지는 부분 댓글 대댓글은 리스트로 구현 댓글 하나가 리스트 하나  -->
				<ul>
						<%
				
				
				/* 		ToReBoardDAO dao2 = new ToReBoardDAO(); 
						ArrayList<TogetherCommentVO> list = new ArrayList<TogetherCommentVO>();
						list = dao2.getAllReply(Integer.parseInt(no));
						
						//voc.getT_writer() 가 아이디랑 같으면 수정 삭제 버튼 보인다. */
						
						for(TogetherCommentVO voc : list){

								
					%>
				
				
					
					<li>
					<div class="row">
						<div class="commentbody">
							<div class="commenthead">
								<div class="commentday">
									<span><%=voc.getT_regdate() %></span>
								
								</div>
								<div class="clear"></div>
								<div class="pro">
									
								
								</div>
					
								<div class="writerarea">
									<a href="#"> <h4 class = writer><%=voc.getT_writer() %></h4></a>
								</div>
								
					
							</div>
							<form action="tomodifyok.jsp" class = "frm">
								<div class="contents">
								 <!-- 내용  -->
								
									<textarea name="commentmodifycontents" id="modifyarea" disabled rows="1"><%=voc.getT_contents() %></textarea>
							
								</div>
								<div class="commentre">
								
									<input type="button" value= " 답글달기" id = "rerecomment" />
									<input type="hidden" value = "댓글삭제" class = "deletecomment"/>
									<input type="hidden" value = "댓글수정" class = "modifycomment"/>
									<input type="hidden" value= "수정 확인" class = "modifyconfirm" />
									<input type="hidden" id = "tcno" name = "tcno" value = "<%=voc.getTcno() %>" />
								<div class="clear"></div>
								</div>
							</form>
						</div>
					
					</div>
			
					</li>
					<%
					}
					%>
					
					
				</ul>
		
		
		
		
		</div>
	</div>
	 <jsp:include page="main/footer.jsp"></jsp:include>
</body>
</html>