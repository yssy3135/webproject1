<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav.jsp</title>
<style type="text/css">
	
	#navBar{
		width: 100%;
		height: 41px;
		background-color: #9be3de;	
		position: absolute;
		margin-bottom: 20px;
		z-index: 1;
	}
	
	#manuBar{width: 690px; margin: 0 auto;}
	
	#allmenu{
		text-decoration: none;
		list-style-type: none;
	}

	li.mainmenu{
		float: left;
		width: 130px;
		list-style-type: none;
		text-align: center;
		height: 41px;
	}
	
	li.mainmenu ul{
		margin: 0;
		list-style-type: none;
		padding: 0;
	}
	
	li.mainmenu a{
		display: block;
		background-color: #9be3de;
		color: white;
		text-decoration: none;
		padding: 10px;
		border-bottom: 1px solid #fff;
	}
	
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('li.mainmenu ul').hide();
		
		$('li.mainmenu').hover(function(){
			$('ul', this).stop().slideDown(500);
		}, function(){
			$('ul', this).stop().slideUp(500);
		});
		
		/* function fnMove(seq){
	        var offset = $("#content").offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
	    } */

	});

</script>
</head>
<body>
	<div id="navBar">
		<ul id="manuBar">
			<li id="allmenu">
				<!-- 전체보기가 들어가야함 -->
			</li>
			<li class="mainmenu">
				<a href="../main.jsp?fno=">나혼자간다</a>
				<ul>
					<li><a href="">나혼자간다란?</a></li>
				</ul>
			</li>
			<li class="mainmenu">
				<a href="productAllPage.jsp">여행테마</a>
				<ul>
					<li><a href="../productAllPage.jsp#contentsItem1">액티비티코스</a></li>
					<li><a href="../productAllPage.jsp#contentsItem2">힐링코스</a></li>
					<li><a href="../productAllPage.jsp#contentsItem3">도보코스</a></li>
					<li><a href="../productAllPage.jsp#contentsItem4">반려견코스</a></li>
					<li><a href="../productAllPage.jsp#contentsItem5">맛코스</a></li>
					<li><a href="../productAllPage.jsp#contentsItem6">캠핑코스</a></li>
				</ul>
			</li>
			<li class="mainmenu">
				<a href="../main.jsp">축제맛집</a>
				<ul>
					<li><a href="">축제정보</a></li>
					<li><a href="">맛집정보</a></li>
				</ul>
			</li>
			<li class="mainmenu">
				<a href="board.jsp">커뮤니티</a>
				<ul>
					<li><a href="board.jsp">후기</a></li>
					<li><a href="together.jsp">동행</a></li>
					<li><a href="freeboard.jsp">자유</a></li>
				</ul>
			</li>
			<li class="mainmenu">
				<a href="MainBoard.jsp">고객센터</a>
				<ul>
					<li><a href="../teamproject/main.jsp?fno=../teamproject/MainBoard/MainBoard.jsp">공지사항</a></li>
					<li><a href="../teamproject/main.jsp?fno=../teamproject/MainBoard/MainBoard.jsp">QnA</a></li>
					<li><a href="../teamproject/main.jsp?fno=../teamproject/MainBoard/MainBoard.jsp">자주묻는 질문</a></li>
				</ul>
			</li>
			
		</ul>
	</div>
</body>
</html>