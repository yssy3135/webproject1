
<%@page import="team_vo.VO.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify.jsp</title>
<link rel="stylesheet" href="modify.css">


<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	window.onload = function(){
		// 네이버 스마트 에디터 사용1 - skin적용
		nhn.husky.EZCreator.createInIFrame({
			 oAppRef: oEditors,
			 elPlaceHolder: "ct",
			 sSkinURI: "../se2/SmartEditor2Skin.html",
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
	
	BoardDAO dao = new BoardDAO();
	String no = request.getParameter("bno");
	BoardVO vo = null;
	
	if(no != null){
		int bno = Integer.parseInt(no);
		
		 vo = dao.getData(bno);
	}else{
		response.sendRedirect("list.jsp");
		
	}
	
	
	
	
	
	%>
	
	

	<form action="modifyok.jsp" id = "modifygo">
		<input type="hidden" name="spot" value="<%=vo.getSpot() %>" />
		<input type="hidden" name="bno" value="<%=no %>" />
		<div class="modifymain">
			<div class="top">
				<div class="title">
					<textarea name="title" rows="1" id="" ><%=vo.getTitle() %></textarea>
					
				</div>
			</div>
			<div class="body">
				<div class="edit">
					<textarea name="contents" id="ct" ><%=vo.getContents() %></textarea>
				</div>
			
			</div>
		
			
	</form>
			<!-- 수정 버튼  -->
			<div class="bottom">
				<div class="modibtn">
					<input type="button" id = "ok" value="수정확인"  onclick = "submitForm(this)"/>
					<a href="detail.jsp?bno=<%=Integer.parseInt(no) %>"><input type="button" id = "cancle"value="취소" /></a>
				</div>
				<div class="clear"></div>
			
			</div>

		</div>
</body>
</html>