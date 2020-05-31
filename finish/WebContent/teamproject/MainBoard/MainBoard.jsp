<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#notice").on("click", function(){
			$("#loaddiv").load("../teamproject/noticeboard/notice_list.jsp");
		});
	
		$("#qna").on("click", function(){
			$("#loaddiv").load("../teamproject/qna_board/list.jsp");
		});
		
		$("#faq").on("click", function(){
			$("#loaddiv").load("../teamproject/faqboard/faq_list.jsp");
		});
	});
</script>
<style type="text/css">

	#allMain{
		width: 1200px;
		height: 700px;
		margin: 0 auto;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		margin-top: 50px
	}
	
	#listdiv{
		width :200px;
		float: left;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#loaddiv{
		width: 900px;
		height: 100%;
		float: left;
		margin-top: 10px;
	}
	
	#boarddiv{
		width : 830px;
		height: 700px;
		margin-left: 300px;
	}
	
	#cc_title{
		width: 155px;
 		height: 70px;
  		margin: 10px 0px 0px 0px;	
  		text-align : center;
    	background-color: #fff;
    	border-top: 3px solid #22409a;
    	border-bottom: 1px solid #e1e1e1;
    	border-collapse: collapse;
	}
	
	#strong{
		padding : 20px 0 5px 0px;
		display: block;
	}
	
	#customcenter {
		width : 155px;
		margin:0px;
		padding-left: 0px;
		font-size: 15px;
		text-align : center;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#notice, #qna, #faq {
		height: 20px;
		list-style-type: none;
		font-size: 18px;
		padding: 15px 21px 15px 21px;
		border-bottom: 1px solid #e1e1e1;
		border-collapse: collapse;
		cursor: pointer;
	}

</style>
</head>
<body>
	<div id="allMain">
		<div id="listdiv">
			<h2 id="cc_title"><strong id="strong">고객센터</strong></h2>
			<ul id="customcenter">
				<li id="notice">공지사항</li>
				<li id="qna">QnA</li>
				<li id="faq">자주묻는질문</li>
			</ul>
		</div>
		<div id="loaddiv">
		
		</div>
	</div>

</body>
</html>