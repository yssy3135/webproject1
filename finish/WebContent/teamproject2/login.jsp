<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


<style type="text/css">

	#loginall{
		font-family: '나눔스퀘어_ac Light';
		width: 100%;
		margin-top : 50px;
		text-align: center;
		margin-bottom: 50px;
	}
	
	#loginForm{
		margin: 0 auto;
		width : 800px;
		height : 250px;
		text-align: center;
	}
	
	#loginForm input{
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;	
	}
	
	#loginlogo{
		width : 400px;
	}
	
	#idLogin, #pwLogin{
		margin-top : 20px;
		width : 400px;
		height : 50px;
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
	}
	
	#logininfo a{
		text-decoration: none;
		color: black;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		cursor: pointer;	
	}

</style>
</head>
<body>
	<div id="loginall">
		<img src="../teamProimage/logo1.png" alt="로고" id="loginlogo"/>
		
		<form action="../teamproject2/loginOk.jsp">
			<div id="loginForm">
				<input type="text" name = "id" id="idLogin" placeholder="아이디"/>
				<input type="password" name = "pw" id="pwLogin" placeholder="비밀번호"/>
				<br />
				<input type="submit" value="로그인" id="loginGo"/>	
			</div>
		</form>
		
		<div id="logininfo">
			<a href="main.jsp?fno=../teamproject2/findId.jsp">아이디 찾기</a>&nbsp;|
			<a href="main.jsp?fno=../teamproject2/findPwGo.jsp">비밀번호 찾기</a>&nbsp;|
			<a href="main.jsp?fno=../teamproject2/register.jsp">회원 가입</a>
		</div>
	
	</div>
</body>
</html>
