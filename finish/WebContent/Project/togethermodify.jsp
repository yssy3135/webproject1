
<%@page import="team_vo.VO.TogetherVO"%>
<%@page import="team_dao.dao.TogetherDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>together.jsp</title>
<link rel="stylesheet" href="togethermodify.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delConfirm").on('click',function(){
			//console.log("click");
			
			var flag = confirm("정말 삭제하겠습니까?");
			
			if(flag){
				//console.log("삭제수행");
				
				// 창 이동 시키기 -> deleteOk.jsp -> 삭제기능을 수행해보세요
				document.location = "deleteok.jsp?bno=<%=request.getParameter("bno")%>";
			}
		});
		

		
		
		
		$("#comment").on('click',function(){
				
			
			
		});
	});


</script>
<script type="text/javascript" src="../se3/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	window.onload = function(){
		// 네이버 스마트 에디터 사용1 - skin적용
		nhn.husky.EZCreator.createInIFrame({
			 oAppRef: oEditors,
			 elPlaceHolder: "ct",
			 sSkinURI: "../se3/SmartEditor2Skin.html",
			 fCreator: "createSEditor2"
		});
	}
		function submitForm(obj){
			
			 // 에디터의 내용이 textarea에 적용된다.
			 oEditors.getById["ct"].exec("UPDATE_CONTENTS_FIELD", []);
	
			 // 에디터의 내용에 대한 값 검증은 이곳에서
			  console.log(document.getElementById("ct").value);
	
			 try {
			     obj.form.submit();
			 } catch(e) {}
		
	}
		
		
	
		

	
</script>

</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회결과를 각td에 출력해보세요 -->
	<%
	
	TogetherDAO dao = new TogetherDAO();
	String no = request.getParameter("bno");
	TogetherVO vo = null;
	
	if(no != null){
		
		int bno = Integer.parseInt(no);
		
		// 조회수 증가메소드 추가
			dao.raiseHits(bno);
		
		 vo = dao.getData(bno);
		 
	}else{
		response.sendRedirect("together.jsp");
		
	}
	
	
	%>
	<form action="togethermodifyOk.jsp">
	
		<div class="detailmain">
			<div class="detailcontainer">
				<div class="titlearea"><textarea name="title" id="title" rows="1"><%=vo.getTbtitle() %></textarea>
				
					<div class="status" name= "">
						<input type="hidden" name="tbstatus" value="<%=vo.getTbstatus() %>"/>
					
						<img src="../images/btn_status_0.png" alt="" />
	
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
							<td><textarea name="tbschedule" id="" cols="30" rows="10"><%=vo.getSchedule() %></textarea></td>
							<td><textarea name="tbspot" id="" cols="30" rows="10"><%=vo.getTbspot() %></textarea></td>
							<td><textarea name="tbthema" id="" cols="30" rows="10"><%=vo.getTbthema() %></textarea></td>
	
						</tr>
						<br />
						
						<tr>
							<th>관심 상품</th>
							<th>선호 나이</th>
							<th>성별</th>
	
						</tr>
						
						<tr>
							<td><textarea name="tbproduct" id="" cols="30" rows="10"><%=vo.getTbproduct() %></textarea></td>
							<td><textarea name="tbage" id="" cols="30" rows="10"><%=vo.getTbage() %></textarea></td>
							<td><textarea name="tbgender" id="" cols="30" rows="10"><%=vo.getTbage() %></textarea></td>
	
						</tr>
					
					
					
					</table>
					
					
					<div class="detailcontents">
						<div class="detailcontents_head"><h1>상세내용</h1></div>
						
						<div class="detailcontents_contents">
							<textarea name="contents" id="ct" ><%=vo.getContents() %></textarea>
						</div>
				
					
					</div>
	
				</div>
				<hr />
				<input type="hidden" name="bno" value ="<%=no %>" />
		</form>
			
			
			
			<div class="bottom">
				<div class="up">
					<a href="up.jsp?bno=<%=no%>"><input type="button" value="관심등록" /></a>

				</div>
				<div class="clear"></div>
				<div class="bottomnav">		
					<a href="together.jsp"><input type="button" value="목록" /></a>
						
						<input type="button" value="수정확인" onclick = "submitForm(this)" />
					<a href="together.jsp"><input type="button" value="취소" id = ""/></a>
				</div>
				<div class="clear"></div>
			</div>
			<br />
			
			
		<!-- 	댓글 영역
		 <div class="commentarea">   댓글 전송 
			<div class="hd"><span>댓글</span></div>
			
			<form action="commentok.jsp">  댓글 정보 전송  
				<input type="hidden" name="bno" value = "" />
				<div class="textspace">
					<input type="text" name = "contents"/>

				</div>
					<input type="hidden" name="writer" value="" />	
				<div class="register">
					<input type="submit" value="댓글 작성" id = "comment"/>
				</div>
				<div class="clear"></div>
			</form>
			
				여기 부분이 댓글 보여지는 부분 댓글 대댓글은 리스트로 구현 댓글 하나가 리스트 하나 
				<ul>
				
					<li>
					<div class="row">
						<div class="commentbody">
							<div class="commenthead">
								<div class="commentday">
									<span>댓글등록일</span>
								
								</div>
								<div class="clear"></div>
								<div class="pro">
									<img src="" alt="프로필사진" />
								
								</div>
					
								<div class="writer">
									<a href="#"> <h4>작성자</h4></a>
								</div>
								
					
							</div>
							<div class="contents">
							 내용 
							내용	
						
							</div>
							<div class="commentre">
								<input type="button" value="답글달기" />
								<div class="clear"></div>
							</div>
							
						</div>
					
					</div>
 -->


					
					
					
					
					
					
				</ul>
				<!-- 여기까지 댓글 하나 -->
				
			
			
			
			</div> 
			
		
		
		
		
		
		</div>
	</div>
	
</body>
</html>