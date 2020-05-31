<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp</title>
<style type="text/css">
	#footer{
		width: 1050px;
		height: 180px;
		margin: 0 auto;
		margin-top: 12px;
	}
	
	#ft_logo{
		width: 240px;
		float: left;
		padding-top: 10px;
	}
	
	#ft_logo img{
		margin-top: 10px;
		width: 240px;
		height: 80px;
	}
	
	#address{
		padding-top: 20px;
		width: 715px;
		float: left;
		font-size: 13px;
		line-height: 160%;
	}
	
	.line{
		padding: 0 6px;
		color: #b0b0b0;
	}
	
	#copy{
		padding-top: 8px;
		font-size: 12px;
		color: #7c7c7c;
	}
	
	#kisia{
		padding-top: 25px;
	}
	
</style>
</head>
<body>
	<div id="footer">
		<div id="ft_logo">
			<img src="../teamProimage/logo1.png" alt=""/>
		</div>
		<div id="address">
			<span id="blue">나혼자간다</span>
			<span class="line">|</span>		
			대표 : 구트
			<span class="line">|</span>
			사업자번호 : 203-87-00672
			<span class="line">|</span>
			통신판매업신고번호 : 제 2016-서울구로-1560
			<br />
			관광사업자 등록번호 : 제2016-0001007호
			<span class="line">|</span>
			개인정보책임자 : 홍길동
			<br />
			주소 : 서울시 구로구 시흥대로 163길 33 주호타워 3층 구트 평생교육원
			<span class="line">|</span>
			대표전화 : 02-837-9922
			<div id="copy">
			Copyright ⓒ 2020 Travel alone Co.,Ltd. All Right Reserved.
			</div>
			<a href="../abc/login.jsp">관리자페이지 가기</a>
		</div>
		<div id="kisia">
			<img src="../teamProimage/kisia.gif" alt=""/>
		</div>
	</div>

</body>
</html>