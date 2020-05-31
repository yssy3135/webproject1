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
		$('#logincancel').click(function(){
			history.go(-1)();
		});		
		
		var formObj = $("form[name='frm']"); 	//폼가져오기
		
		$("#loginGo").on("click",function(){
			formObj.attr("action","../teamproject2/findIdOk.jsp");
			formObj.submit();
		});
		
	});
</script>
<style type="text/css">

	#findidTablee{
		width : 100%;
	}
	
	#findidTable th{
		padding-top: 15px;
		width: 130px;
	}
	
	#allfind{
		font-family: '나눔스퀘어_ac Light';
		width: 100%;
		margin-top : 50px;
		text-align: center;
		margin-bottom: 50px;
	}
	
	#loginForm{
		margin: 0 auto;
		width : 500px;
		height : 250px;
		text-align: center;
	}
	
	#loginForm h2{
		border-bottom: 1px solid black;
		line-height: 60px;
	}
	
	#idLogin, #email, #key{
		margin-top : 20px;
		width : 300px;
		height : 50px;
	}
	
	#loginGo, #logincancel{
		margin-top : 20px;
		width : 200px;
		height : 50px;
		background-color: #BEEBE9;
		outline : none;
		box-shadow: none;
		border : 1px solid #BEEBE9;
		font-size: 20px;
		cursor: pointer;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	

</style>
</head>
<body>

<form name="frm" id="frm">
	<div id="allfind">
		<div id="loginForm">
			<h2>아이디 찾기</h2>
			<table id="findidTable">
				<tr>
					<th>이름  </th>
					<td><input type="text" name = "name" id="idLogin" placeholder="이름"/></td>
				</tr>
				<tr>
					<th>이메일  </th>
					<td><input type="email" name = "email" id="email" placeholder="이메일"/></td>
				</tr>
			</table>
			<input type="button" value="확인" id="loginGo"/>
			<input type="button" value="취소" id="logincancel"/>
		</div>
	</div>
	
</form>






</body>
</html>