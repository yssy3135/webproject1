<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="team_vo.VO.BoardVO"%>
<%@page import="team_dao.dao.ProjectDAO"%>
<%@page import="team_vo.VO.CommentVO"%>
<%@page import="java.net.URLDecoder"%>



<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail.jsp</title>
<link rel="stylesheet" href="style.css">

	<%
	
	ProjectDAO dao = new ProjectDAO();
	String no = request.getParameter("bno");
	BoardVO vo = null;
	boolean status = false;
	boolean statusco = false;
	
	if(no != null){
		int bno = Integer.parseInt(no);
		
		// 조회수 증가메소드 추가
		dao.raiseHits(bno);
		
		 vo = dao.getData(bno);
	}else{
		response.sendRedirect("board.jsp");
		
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
	
		if(memvo.getId().equals(vo.getWriter())){
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
			
				
				document.location = "deleteok.jsp?bno="+<%=no%>;
				
			}
		});
		
		
		$(".modifycomment").on('click',function(){ // 댓글 수정 
			console.dir(this.parentNode.childNodes[7]); //수정확인
			this.parentNode.childNodes[7].type = "button" // form새로운 경로
			
			
			console.dir(this.parentNode.parentNode.childNodes[1].childNodes); 
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
			this.parentNode.parentNode.action = "boardcommentmodiOk.jsp?bno="+<%=no%>;
			this.parentNode.parentNode.method = "post";
			this.parentNode.parentNode.submit();


		});
		
		
		$(".deletecomment").on('click',function(){
			var flag = confirm("정말 삭제하겠습니까?");
			
			if(flag){
				this.parentNode.parentNode.action = "boardcommentdeleteOk.jsp?bno="+<%=no%>;
				this.parentNode.parentNode.method = "post";
				this.parentNode.parentNode.submit();
				
			}
			
			
		});
			
		
		
	
		
		if(<%=status%>){
			//수정 삭제 버튼 보이기 
			
			document.getElementById("delete").type = "button";
			document.getElementById("modify").type = "button";
		}
	
		
		
		
		var tmp = '<%=memvo.getId() %>';
		
		var writer = document.getElementsByClassName("writer");
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[3]);
		console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[1].childNodes[7].childNodes[1].childNodes[1].textContent); //보드아이디 경로
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode); 코멘트 바디
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[5]);
		
		
		console.dir(writer); //  form 새로
		//console.dir(writer[0].parentNode.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[7]); //  form 새로
		
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
	
	
	<div class="detailmain">
			<div class="side">
			<div class="sideheader">
				<h1>카테고리</h1>
			</div>
			<ul>
				<li>후기</li>
				<li>동행</li>
				<li>자유</li>
			</ul>	
		
		
		</div>
		<div class="clear"></div>
	
	
		<div class="detailcontainer">
			<div class="title"><h1><%=vo.getTitle() %></h1></div>
			<div class="recommend">추천 : <%=vo.getRecommend() %></div>
			<div class="clear"></div>
			<div class="subtitle">
				<a href=""> 작성자 : <%=vo.getWriter() %></a>
				
				<span>조회수 : <%=vo.getHits() %>  </span>
				
				<span>등록일 : <%=vo.getRegdate() %>  </span>
			
			</div>
			
			<hr />
			<div class="contents">
			<%=vo.getContents() %>
			
			</div>
			
			
			<div class="productwrap">
				<div class="header">상품평가</div>
				<div class="productimg">
				<input type="image" src="../images/car4.jpg" alt="상품사진" />
				</div>
				<div class="productinfo">
					<div class="producttitle">
						<%=vo.getSpot() %>
					</div>
					<div class="productdetail">
						<%=vo.getProex() %>
					</div>
				
				
				</div>
			
			
			</div>
			
			
			<hr />
			
			<div class="bottom">
				<div class="up">
					<a href="up.jsp?bno=<%=no%>"><input type="button" value="추천" id = "upbtn" /></a>
					<a href="down.jsp?bno=<%=no%>"><input type="button" value="비추천" id = "downbtn" /></a>
				</div>
				<div class="clear"></div>
			
				<div class="bottomnav">		
					<a href="board.jsp"><input type="button" value="목록" /></a>
						<a href="modify.jsp?bno=<%=vo.getBno() %>">
							<input type="hidden" value="수정" id = "modify"/></a>
					<input type="hidden" value="삭제" id = "delete"/>
				</div>
					<div class="clear"></div>
			</div>
			<br />
			<div class="commentarea">  <!--  댓글 전송 --> 
			<div class="hd"><span>댓글</span></div>
			
			<form action="commentok.jsp">  <!-- 댓글 정보 전송   -->
				<input type="hidden" name="bno" value = "<%=vo.getBno()%>" />
				<div class="textspace">
					<input type="text" name = "contents"/>

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
				
				
						
						ArrayList<CommentVO> list = new ArrayList<CommentVO>();
						list = dao.getallcomment(Integer.parseInt(no));
						
						for(CommentVO voc : list){

							
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
					
								<div class="writearea">
									<a href="#"> <h4 class = writer><%=voc.getRe_writer()%></h4></a>
								</div>
								
					
							</div>
							<form action="bomodifyok.jsp" class = "frm">
								<div class="contents">
								 <!-- 내용  -->
								 
									<textarea name="commentmodifycontents" id="modifyarea" disabled rows="1"><%=voc.getRe_contents()%></textarea>	
							
								</div>
								<div class="commentre">
								
								<input type="button" value= " 답글달기" id = "rerecomment" />
										<input type="hidden" value = "댓글삭제" name = "boardcommentdelete" class ="deletecomment" />
										<input type="hidden" value = "댓글수정" class = "modifycomment"/>
										<input type="hidden" value= "수정 확인"  class = "modifyconfirm" />
										<input type="hidden" id = "cno" name = "cno" value = "<%=voc.getCno() %>" />
									<div class="clear"></div>
								</div>
							</form>
							
						</div>
					
					</div>
						<!-- 대댓글이 있을 경우 -->
	<!-- 
						<div class="rowre">
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
						
						</div> -->
					</li>
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