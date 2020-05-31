<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_vo.VO.FreecommentVO"%>
<%@page import="team_dao.dao.FreeReBoardDAO"%>
<%@page import="team_vo.VO.freeboardVO"%>
<%@page import="team_dao.dao.FreeboardDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>



<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프리보드 디테일</title>
<link rel="stylesheet" href="freeboarddetail.css">
	<%
	
	FreeboardDAO dao = new FreeboardDAO();
	String no = request.getParameter("bno");
	
	int bno = Integer.parseInt(no);
	freeboardVO vo = dao.getData(bno);
	boolean status = false;
	boolean statusco = false;
	
	if(no != null){
		
		
		// 조회수 증가메소드 추가
		dao.raiseHits(bno);
		
		 vo = dao.getData(bno);
	}else{
		response.sendRedirect("freeboard.jsp");
		
	}
	
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
	
	
	if((memvo.getId()).equals(vo.getWriter())){
		status = true;
	}
	
	
	
	
	%>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#delete").on('click',function(){
			//console.log("click");
			
			var flag = confirm("정말 삭제하겠습니까?");
			
			if(flag){
				//console.log("삭제수행");
				
				// 창 이동 시키기 -> deleteOk.jsp -> 삭제기능을 수행해보세요
				document.location = "togetherdeleteOk.jsp?bno=<%=no%>";
			}
		});
		
		
		

		
		$(".deletecomment").on('click',function(){
			//console.log("click");
			
			var flag = confirm("댓글을 삭제하겠습니까?");
			
			if(flag){
				//console.log("삭제수행");
				
				
				this.parentNode.parentNode.action = "freecommentdeleteok.jsp";
				this.parentNode.parentNode.method = "get";
				this.parentNode.parentNode.submit();


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
			this.parentNode.parentNode.action = "freecommentmodifyok.jsp?bno="+<%=no%>;
			this.parentNode.parentNode.method = "post";
			this.parentNode.parentNode.submit();


		});
		

		if(<%=status%>){ 
			//글수정 삭제 버튼 보이기 
			
			document.getElementById("delete").type = "button";
			document.getElementById("modify").type = "button";
		}
	
		
		
		
		var tmp = '<%=memvo.getId() %>';
		
		var writer = document.getElementsByClassName("writer");
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[3]);
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[1].childNodes[7].childNodes[1].childNodes[1].textContent); //아이디 경로
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode); 코멘트 바디
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[5]);
		console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes); //  form 새로
		console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[7]); //  form 새로
		
			//voc.getT_writer() 가 아이디랑 같으면 댓글 수정 삭제 버튼 보인다.
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
	
	<div class="detailmain">
		<div class="detailcontainer">
			<div class="titlewrap">
				<div class="title"><h1><%=vo.getTitle() %></h1></div>
				<div class="recommend">추천 : <%=vo.getRecommend() %></div>
				<div class="subtitle">
					<a href=""> 작성자 : <%=vo.getWriter() %></a>
					
					<span>조회수 : <%=vo.getHits() %>  </span>
					
					<span>등록일 : <%=vo.getRegdate() %>  </span>
					

					
				
				</div>
				<div class="clear"></div>
			</div>
			
		
			<div class="contents">
			<%=vo.getContents() %>
			
			</div>
			
			
			
			<hr />
			
			<div class="bottom">
				<div class="up">
					<a href="freeup.jsp?bno=<%=no%>"><input type="button" value="추천" /></a>
					<a href="freedown.jsp?bno=<%=no%>"><input type="button" value="비추천" /></a>
				</div>
				<div class="clear"></div>
			
				<div class="bottomnav">		
					<a href="freeboard.jsp"><input type="button" value="목록" /></a>
						<a href="freeboardmodify.jsp?bno=<%=vo.getBno() %>">
						<input type="hidden" value="수정"  id = "modify" /></a>
						
					<input type="hidden" value="삭제"  id = "delete"/>
				</div>
					<div class="clear"></div>
			</div>
			<br />
			
			
			
		 	<div class="commentarea">  <!--  댓글 전송 --> 
			<div class="hd"><span>댓글</span></div>
			
			<form action="freecommentOk.jsp">  <!-- 댓글 정보 전송   -->
				<input type="hidden" name="bno" value = "<%=vo.getBno()%>" />
				<div class="textspace">
					<textarea name="contents" id="contents" rows="2"></textarea>

				</div>
					<input type="hidden" name="writer" value="<%=vo.getWriter()%>" />	
				<div class="register">
					<input type="submit" value="댓글 작성" id = "comment"/>
					<div class="clear"></div>
				</div>
			</form>
			
				<!-- 여기 부분이 댓글 보여지는 부분 댓글 대댓글은 리스트로 구현 댓글 하나가 리스트 하나  -->
				<ul>
					<%
						
						FreeReBoardDAO dao2 = new FreeReBoardDAO();
						ArrayList<FreecommentVO> list = new ArrayList<FreecommentVO>();
						
						list = dao2.getAllReply(Integer.parseInt(no));
					
						
						for(FreecommentVO voc : list){

							
					%>
					<li>
					<div class="row">
						<div class="commentbody">
							<div class="commenthead">
								<div class="commentday">
									<span><%=voc.getRe_regdate()%></span>
								
								</div>
								<div class="clear"></div>
								<div class="pro">
								
								
								</div>
					
								<div class="writerarea">
									<a href="#"> <h4 class="writer"><%=voc.getRe_writer()%></h4></a>
								</div>
								
					
							</div>
							<form action="" class = "frm">
								<div class="recontents">
								 <!-- 내용  -->
								
								<textarea name="commentmodifycontents" id="modifyarea" disabled rows="1"><%=voc.getRe_contents()%></textarea>
								</div>
								<div class="commentre">
									<input type="button" value="답글달기" />
										<input type="hidden" value = "댓글삭제" class = "deletecomment"/>
										<input type="hidden" value = "댓글수정" class = "modifycomment"/>
										<input type="hidden" value= "수정 확인" class = "modifyconfirm" />
										<input type="hidden" id = "rno" name = "rno" value = "<%=voc.getRno()%>" />
										<input type="hidden" name = "bno" value="<%=no %>" />
									
									
									<div class="clear"></div>
								</div>
							</form>
							
						</div>
					
					</div> 
					
						<!-- 대댓글이 있을 경우 -->
	 
					<%-- 	<div class="rowre">
							<div class="commentbody">
								<div class="commenthead">
									<div class="commentday">
										<span>4월 07일</span>
									
									</div>
									<div class="up">┖ </div>
	
									<div class="pro">
										<img src="../images/car4.jpg" alt="" />
									
									</div>
						
									<div class="writer">
										<a href="#"> <h4>yssy3135</h4></a>
									</div>
									
						
								</div>
								<div class="contents">
									a 내용 
									<br />
									b
									<br />
									c
							
								</div>
								<div class="commentre">
									<input type="button" value="답글달기" />
									<div class="clear"></div>
								</div>
								
							</div>
						
						</div> 
					 </li>
					 
					 --%>
					<%
					}
					%>  


					
				</ul>
				<!-- 여기까지 댓글 하나 -->
				
			
			
			
			</div>
			
		
		
		
		
		
		</div>
	</div>
</body>
</html>