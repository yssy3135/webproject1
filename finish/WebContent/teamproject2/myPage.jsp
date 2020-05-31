<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">



		$(document).ready(function(){
			
			
 			
			$('#regi').click(function(){
				
				$('#mymain').load("../teamproject2/regiChange.jsp")
				
			})
			
			$('#myReserve').click(function(){
				
				$('#mymain').load("../teamproject2/myReserve.jsp")
				
			})
 			
			$('#myWrite').click(function(){
				
				$('#mymain').load("myWrite.jsp")
				
			})
			
			$('#myProfile').click(function(){
				
				$('#mymain').load("../teamproject2/myProfile.jsp")
				
			})
		});

</script>

<%
//쿠키 받아오기.
	Cookie[] clist = request.getCookies();
	
	String memno = null;
	
	if(clist != null){
		for(Cookie c : clist){
			if(c.getName().equals("projectLogin")){
				memno = URLDecoder.decode(c.getValue(),"UTF-8");
			}
		}
		
	}
%>


<style type="text/css">

	#mycontainer{
		width: 900px;
		height: 1000px;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	#mycontainer h1{
		width: 1100px;
		border-bottom: 1px solid black;
		line-height: 50px;
		font-family: '나눔스퀘어_ac ExtraBold';
	}
	
	#mymenu{
		width : 200px;
		height : auto;
		text-align: center;
		display: block;
		margin-left: 290px;
		margin-top : 100px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		float: left;
	}

	#mymain{
		width : 110%;
		height : 800px;
		padding-top : 50px;
		display: block;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		margin-left: 30px;
	}

	.myBt{
		line-height: 3;
		width : 100%;
		background-color: #BEEBE9;
		outline : none;
		box-shadow: none;
		border : 1px solid #BEEBE9;
		border-bottom: 1px solid white;
		cursor: pointer;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 18px;
	}
	
	#myicon{
		width: 50px;
		height: 50px;
		float: left;
	}

</style>



</head>
<body>

<div id="mymenu">
	<button id="myProfile" class="myBt">회원정보</button>
	<button id="regi" class="myBt">회원정보 변경</button>
	<button id="myReserve" class="myBt">예약 현황</button>
	<button id="myWrite" class="myBt">내가 쓴 글(후기)</button>
</div>

<div id="mycontainer">	

	<img src="../teamProimage/mypage.png" alt="" id="myicon"/><h1>마이페이지</h1>
	<div id="mymain">
	
	</div>
	
</div>
	
</body>
</html>