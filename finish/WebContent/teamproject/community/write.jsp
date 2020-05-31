<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<link rel="stylesheet" href="write.css">
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

	<form action="writeok.jsp">
	
		<div class="wirtemain">
			<div class="top">
				<div class="selectproduct">
					<select name="select" id="">
						<option value="--------">여행선택</option>
						<option value="전주여행">전주여행</option>
						<option value="강릉여행">강릉여행</option>
						<option value="부산여행">부산여행</option>
						<option value="서울여행">서울여행</option>					
					
					</select>
				
				
				</div>
			
			
				<div class="title">
					<textarea name="title" rows="1" placeholder="제목을 입력하세요" ></textarea>
					
				</div>
			</div>
			<div class="body">
				<div class="write">
					<textarea name="contents" id="ct" cols="10" rows="5"  ></textarea>
				</div>
			<div class="productwrap">
					<div class="header">상품평가</div>
					<div class="productimg">
					<input type="image" src="../images/car4.jpg" alt="상품사진" />
					<!-- 상품 선택시 상품 이미지  -->	
				</div>
				<div class="productinfo">
					<div class="producttitle">
						<!-- 제목 선택시 제목 부분 -->
						상품이름
					</div>
					<div class="productdetail">
						<textarea name="proex" id="" >
							상품 설명	
						</textarea>
						
					</div>
				
				
				</div>
			
			
			</div>
			
			</div>
			
			<!-- 작성 버튼  -->
			<div class="bottom">
				<div class="writebtn">
					<input type="button" id = "ok" value="작성" onclick = "submitForm(this)" />
					<a href="board.jsp"><input type="button" id = "cancle"value="취소" /></a>
				</div>
				<div class="clear"></div>
			
			</div>
		</div>
	</form>

 <jsp:include page="main/footer.jsp"></jsp:include>

</body>
</html>