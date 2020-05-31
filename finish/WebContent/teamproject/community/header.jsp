<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style type="text/css">
	
	.login{
		width: 100%;
		margin: 0px;
		padding: 0px;
		height: 30px;
		background-color: #beebe9;
	}
	
	.login ul{
		margin: 0;
		width: 1000px;
		height: 100%;
		text-align: right;
	}

	.login ul li{
		display: block;
		list-style-type: none;
		float: left;
		margin: 4px;
	}
	
	.login ul li a{
		color: #717171;
		text-decoration: none;
		font-size: 13px;
	}
	
	.login ul li span{
		padding: 0px 10px;
	}
	
	
	#headerdetail{
		width: 1300px;
		margin: 0 auto;
		height: 160px;
		display: block;
	}
	
	#logo{
		width: 240px;
		height: 150px;
		float: left;
	}
	
	#logo a img{
		width: 350px;
		height: 120px;
		margin-top: 15px;
	}
	
	#search{
		width: 600px;
		margin-left: 180px;
		float: left;
		height: 150px;
	}
	
	#sname{
		border: 3px solid #9be3de;
		border-radius: 30px;
		padding: 8px;
		margin-top: 55px;
		height: 30px;
		width: 320px;
		outline: 0;
		float: left;
	}
	
	.sub_btn{
		background-image: url(../teamProimage/search1.png);
		cursor: pointer;  
		border: 0;
		float: left;
		padding: 0;
		margin-top: 51px;
		width: 60px;
		height: 60px;
		outline: 0;
	}
	
	#weather{
		left: 300px;
		float: left;
		width: 240px;
		height: 150px;
		background-color: #9be3de;
		display: block;
	}



</style>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function ajaxToServer(){
		//사용자가 입력한 내용 읽어오기
		var txt = document.getElementById("sname").value;
		
		//파라미터를 통해 사용자가 쓴 데이터를 보낸다. / 한글로 인코딩 URI : 도메인이 포함되지 않은 주소
		var params = "txt="+encodeURIComponent(txt);
		
		//수행
		sendRequest('searchlist.jsp', params, callback, 'GET');
		
	}
	//callback - 데이터 대기함수
	function callback(){
		if(xhr.readyState == 4){ // 4 : 완료되면
			//그리고 정상페이지이면
			if(xhr.status == 200){	//htp 코드가 200 : 웹페이지가 정상임
			//alert(xhr.responseText);  //넘어오는게 확인이됨~!
				var wrap = document.getElementById("wrap");
			
				wrap.innerHTML = xhr.responseText;
			}
		}
	}
</script>
</head>
<body>
<%
	//멤버정보관련
	
	P_Member_DAO dao = new P_Member_DAO();
	

	//쿠키 받아오기.
	   Cookie[] clist = request.getCookies();
 
 
	   
	   String memno = null;
	   
	   if(clist != null){
	      for(Cookie c : clist){
	         if(c.getName().equals("projectLogin")){
	            memno = URLDecoder.decode(c.getValue(), "UTF-8");

	            
	         }
	      }
	      
	   }
%>

<%if(memno != null){
	P_Member_VO vo = dao.selectOne(memno);
	
	%>
	     	<div class="login">
	     		<ul>
	     			<li><a href="../teamproject2/logOut.jsp"><%=vo.getName() %>님 로그아웃</a>
	     			<span></span>
	     			</li>
	     			<li><a href="../main.jsp?fno=../teamproject2/myPage.jsp">마이페이지</a>
	     			<span></span>
	     			</li>
	     			<li><a href="../main.jsp?fno=../teamproject/MainBoard/MainBoard.jsp">고객센터</a>
	     			<span></span>
	     			</li>
	     		</ul>
	     	</div>
	     <% 
}else if (memno ==null){
%>
	<div class="login">
		<ul>
			<li><a href="../main.jsp?fno=../teamproject2/login.jsp">로그인</a>
			<span></span>
			</li>
			<li><a href="../main.jsp?fno=../teamproject2/register.jsp">회원가입</a>
			<span></span>
			</li>
			<li><a href="../main.jsp?fno=../teamproject2/login.jsp">마이페이지</a>
			<span></span>
			</li>
			<li><a href="../main.jsp?fno=../teamproject/MainBoard/MainBoard.jsp">고객센터</a>
			<span></span>
			</li>
		</ul>
	</div>
<%
}

%>



	<div id="headerdetail">
		<div id="logo">
			<a href="../main.jsp"><img src="../teamProimage/logo1.png" alt=""/></a>
		</div>
		<div id="search">
			<form name="frm">
				<input type="text" name="search_keyWord" id="sname" placeholder="검색어를 입력해주세요."/>
	     		<input type="button" value="" onclick="ajaxToServer()" class="sub_btn">
	     	</form>
		</div>
		<!-- <div id="weather">
			<h1>날씨</h1>
		</div> -->
	</div>
	
	


</body>
</html>