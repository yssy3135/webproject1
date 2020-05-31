<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var key = "";
		
		$('#keyBt').click(function(){
			
			
			var email = $('#email').val().trim(); //이메일 가져오기.
			var id = $('#idLogin').val().trim(); //id 가져오기.
			var params = "email="+encodeURIComponent(email)+"&"+"id="+encodeURIComponent(id);
			
			sendRequest('../teamproject2/findPw.jsp',params,callback,"GET");
			alert("인증번호 발송완료.");

		});//인증번호 보내기.
		
		function callback(){
			if(xhr.readyState==4 & xhr.status==200){
				
				key = xhr.responseText.trim();
				//console.log(key);
			}
		}//key 값 받아오기.
		
		
		//인증번호 확인하기.
		
		$('#loginGo').click(function(){
			
			if($('#key').val().trim() == key){
				//console.log("인증완료")
				
				$('#frm').submit();
				
				
			}else{
				//console.log("인증 실패")
				alert("인증번호가 틀렸습니다");
			}
			
		});
		
		
	});
</script>

<style type="text/css">

	#findPwall{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;	
		width: 100%;
		height: 350px;
		margin-top : 50px;
		text-align: center;
		margin-bottom: 50px;
	}

	#findPwTable{
		width : 100%;
	}
	
	#findPwTable th{
		padding-top:15px;
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
		height : 40px;
	}

	#loginGo{
		margin-top : 20px;
		width : 400px;
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
	
	#keyBt{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;	
		margin-top : 20px;
		height : 50px;
		background-color: #BEEBE9;
		outline : none;
		box-shadow: none;
		border : 1px solid #BEEBE9;
		font-size: 15px;
		cursor: pointer;
	}
	
	

</style>

</head>
<body>
	
<form action="../teamproject2/findPwOk.jsp" id = "frm">
	<div id="findPwall">
		<div id="loginForm">
			<h2>비밀번호 찾기</h2>
			<table id="findPwTable">
				<tr>
					<th>아이디  </th>
					<td><input type="text" name = "id" id="idLogin" placeholder="아이디"/></td>
					<td></td>
				</tr>
				<tr>
					<th>이메일  </th>
					<td><input type="email" name = "email" id="email" placeholder="이메일"/></td>
					<td><button id="keyBt" type="button">인증번호 <br />보내기</button></td>
				</tr>
				<tr>
					<th>인증번호 </th>
					<td><input type="text" id="key" /></td>
			
				</tr>
			
			</table>

			<input type="button" value="확인" id="loginGo"/>
		</div>
	
	</div>
</form>


</body>
</html>