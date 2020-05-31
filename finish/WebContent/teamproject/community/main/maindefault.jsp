
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/jquery.bxslider.min.js"></script>
<link href="jquery.bxslider.css" rel="stylesheet" />
<script>
$(function(){
	var slider_03 =	$('.bxslider_03').bxSlider({
			auto: true,
			controls:false,
			pager:false,
			minSlides: 5,
			maxSlides: 5,
			moveSlides:1, 
			slideWidth: 800,
			slideMargin:0,
			speed: 500,
			captions: true,
	});		
	
	$('#lili1').click(function(){		
		$('#themelist').load('themeform.jsp','tno=activity');
		$(this).addClass('onon');
		$('#lili2, #lili3, #lili4, #lili5, #lili6,').removeClass('onon');
	});
	
	$('#lili2').click(function(){
		$('#themelist').load('themeform.jsp','tno=taste');
		$(this).addClass('onon');
		$('#lili1, #lili3, #lili4, #lili5, #lili6').removeClass('onon');
	});
	$('#lili3').click(function(){
		$('#themelist').load('themeform.jsp','tno=pet');
		$(this).addClass('onon');
		$('#lili2, #lili1, #lili4, #lili5, #lili6').removeClass('onon');
	});
	$('#lili4').click(function(){
		$('#themelist').load('themeform.jsp','tno=road');
		$(this).addClass('onon');
		$('#lili2, #lili3, #lili1, #lili5, #lili6').removeClass('onon');
	});
	$('#lili5').click(function(){
		$('#themelist').load('themeform.jsp','tno=camping');
		$(this).addClass('onon');
		$('#lili2, #lili3, #lili4, #lili1, #lili6').removeClass('onon');
	});
	$('#lili6').click(function(){
		$('#themelist').load('themeform.jsp','tno=healing');
		$(this).addClass('onon');
		$('#lili2, #lili3, #lili4, #lili5, #lili1').removeClass('onon');
	});
	
});
</script>
<title>maindefault.jsp</title>
<style type="text/css">
	/* 슬라이더 css */
	#s_banner_wrap{
		width: 100%;
		height: 500px;
	}
	
	
	.bxslider_03 li{
		width: 300px;
		height: 500px;
		overflow: hidden;
		list-style-type: none;
		margin-right: 10px;
	}
	
	.bxslider_03 li img{
		height: 100%;
	    width: auto;
		max-width: inherit;
		margin-left: -100px;
	}
	
	
	#bestproduct #p1 {
		width: 1200px;
		height: 45px;
		margin-left: 300px;
		margin-top: 100px;
		font-size: 45px;
		font-family: '나눔스퀘어_ac Light';
		display: block;
	}
	
	#bestproduct #p2{
		margin: 20px 0 40px 300px;
		font-size: 20px;
		font-family: '나눔스퀘어_ac Light';
		line-height: 1.5;
	}
	
	#bestproductimage{
		height: 500px;
	}
	
	
	/* 테마탭 css */
	.onon{
		background-color: #9BE3DE;
	}
	
	#themelist{
		margin: 0 auto;
		width: 1200px;
		height: 600px;
		border: 1px solid #777;
		display: block;
		margin-bottom: 30px;
	}
	
	#themeBar{
		width: 1202px;
		margin: 0 auto;
		margin-top: 30px;
		border-bottom: none;
		display: block;
	}
	
	#themeBar #ulul{
		padding: 0;
		margin: 0;
		height: 100px;		
	}
	
	#themeBar li{
		list-style-type: none;
		display: table-cell;
		width: 200px;
		font-size: 30px;
		text-align: center;
		height: 100px;
		border: 1px solid #777;
		border-bottom: 1px solid #fff;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 25px;
		cursor: pointer;
		line-height: 100px;
	}

	
	/* 후기 css */
	#community{
		width: 100%;
		height: 500px;
		background-color: #EAEAEA;
		margin: 0 auto;
	}
	
	#bestreview{
		width: 1200px;
		height: 500px;
		margin: 0 auto;
	}
	
	#guide{
		width: 300px;
		height: 500px;
		background-color: #9BE3DE;
		margin: 0;
		padding: 0;
		float: left;
	}
	
	#guide_ti{
		width: 245px;
		height: 80px;
		font-size: 35px;
		letter-spacing: -0.05em;
		font-family: '나눔스퀘어_ac Extrabold';
		margin: 0;
		margin-left: 40px;
		margin-bottom: 20px;
	}
	
	#guide_ti2{
		width: 245px;
		height: 120px;
		letter-spacing: -0.01em;
		font-size: 23px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		margin-left: 40px;
	}
	
	#guide input{
		width: 140px;
		height: 50px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 23px;	
		background-color: #9BE3DE;	
		border: 1px solid black;
		margin-left: 40px;	
		margin-top: 100px;	
	}
	
	#review{
		width: 900px;
		height: 500px;
		background-color: white;
		float: left;
	}
	
</style>
</head>
<body>
	<div id="bestproduct">
		<p id="p1">
			나혼자 간다 여행사의 <strong>추천 여행지</strong>
		</p>
		<p id="p2">
			패키지의 안정성, 편리함, 혜택은 그대로! <br />
			자유여행같은 다채로운 일정까지!
		</p>
	</div>
	
	<%-- <%
		Porder_DAO dao = new Porder_DAO();
		Porder_VO vo = new Porder_VO();
		
		Trip_DAO tdao = new Trip_DAO();
		Trip_VO tvo = new Trip_VO();

		ArrayList<String> orderList = new ArrayList<String>();
		
		orderList = dao.getAllorder2();
	%> --%>
	<div id="s_banner_wrap">
		<ul class="bxslider_03">
	<%-- <%	
		for(int i=0; i<orderList.size(); i++){
			tvo = tdao.getData2(orderList.get(i));
			
	%>
			<li><img src="<%=tvo.getMainimg()%>" alt="" title="<%=tvo.getPname() %>" class="bestimg" /></li>		
	<%
		}
	
	%> --%>
	    </ul>
	</div>
	
	

	<div id="themeBar">
		<ul id="ulul">
			<li id="lili1">액티비티코스</li>
			<li id="lili2">맛집코스</li>
			<li id="lili3">반려견코스</li>
			<li id="lili4">도보코스</li>
			<li id="lili5">캠핑코스</li>
			<li id="lili6">힐링코스</li>
		</ul>		
	</div>
	
	<div id="themelist">
		<!-- 상품목록이 들어올 공간 -->
	</div>
		
	<div id="community">
		<div id="bestreview">
			<div id="guide">
				<p id="guide_ti">
					<br /><br />
					나혼자 간다 <br />
					고객여행기
				</p>
				<p id="guide_ti2">
					<br /><br /><br />
					'혼자도 즐겁게' <br />
					나혼자 간다와 함께 한<br />
					여러분들의<br />
					즐거웠던 추억을<br />
					공유해보세요! <br />
				</p>
				
				<input type="button" value="더보기" />
			</div>
			
				<div id="review">
					<!-- 후기 제목이랑 사진 등 가져오기 -->
					
					
					
				</div>
			
		</div>
	</div>
	
</body>
</html>