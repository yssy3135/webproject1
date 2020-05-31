
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<link rel="stylesheet" href="togetherwrite.css">
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
	<jsp:include page="main/header.jsp"></jsp:include>
	<jsp:include page="main/nav.jsp"></jsp:include>

	<form action="togetherwriteOk.jsp">
	
		<div class="writemain">
			<div class="top">
				<div class="title">
					<textarea name="title" rows="1" placeholder="제목을 입력하세요" ></textarea>
					
				</div>
			</div>
			
			<div class="togethercontents">
				<table>
						<tr>
							<th>여행일정</th>
							<th>여행지역</th>
							<th>여행테마</th>
	
						</tr>
						
						<tr>
							<td><textarea name="tbschedule" id="" cols="30" rows="5" class="common"></textarea></td>
							<td><textarea name="tbspot" id="" cols="30" rows="5" class="common"></textarea></td>
							<td><textarea name="tbthema" id="" cols="30" rows="5" class="common"></textarea></td>
	
						</tr>
						<br />
						
						<tr>
							<th>관심 상품</th>
							<th>선호 나이</th>
							<th>성별</th>
	
						</tr>
						
						<tr>
							<td><textarea name="tbproduct" id="" cols="30" rows="5" class="common"></textarea></td>
							<td><textarea name="tbage" id="" cols="30" rows="5" class="common"></textarea></td>
							<td><textarea name="tbgender" id="" cols="30" rows="5" class="common"></textarea></td>
	
						</tr>
					
					
					
					</table>
			
			</div>
			
			
			
			
			
			
			
			
			<div class="body">
				<div class="writetop"><h1>상세내용을 입력하세요</h1></div>
				<div class="write">
					<textarea name="contents" id="ct" cols="10" rows="5"  ></textarea>
				</div>
			
			</div>
			
			<!-- 작성 버튼  -->
			<div class="bottom">
				<div class="writebtn">
					<input type="button" id = "ok" value="작성" onclick = "submitForm(this)"/>
					<a href="together.jsp"><input type="button" id = "cancle"value="취소" /></a>
				</div>
				<div class="clear"></div>
			
			</div>
		</div>
	</form>



 <jsp:include page="main/footer.jsp"></jsp:include>





</body>
</html>