<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>

<style type="text/css">	
	body{
		margin: 0;
		padding: 0;
	}

	#wrap{
		height: 100%;
		padding-top: 50px;
	}

	#footer{
		width: 100%;
		height: 180px;
		margin: 0 auto;
	}
		
</style>


</head>
<body >
<%
	String pageinfo = "";
	//스크립틀릿을 먼저읽으니 fno라는 파라미터가 없음.
	String fno = request.getParameter("fno");
	
	if(fno==null){	//a태그를 통해서 아무것도 선택하지 않았으면
		pageinfo = "maindefault.jsp";		//최초로 보여주는것이 저 파일이다.
	}else {			//nav에서 a태그를 눌렀을 경우. = fno 값이 들어왔다는 의미
		pageinfo = fno;
	}
%>
	<div id="headerr">
		<jsp:include page="header.jsp"/>	
	</div>
	
	<div id="navv">
		<jsp:include page="nav.jsp" />
	</div>
	
	<div id="wrap">
		<jsp:include page="<%=pageinfo %>"/>
		
	</div>

	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
	

</body>
</html>