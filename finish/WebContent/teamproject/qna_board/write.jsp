<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>

<style type="text/css">

	#contents1{
		margin : 0 auto;
		width : 800px;
	}
	
	#qnawrite{
		width : 900px;
		border-spacing: 2px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	.qcol1, .qtd1d{
		border-collapse: collapse;
		font-size: 16px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		text-align: center;
		border-top: 1px solid black;
		border-right: 1px solid #ddd;
		width: 30%;
		color: black;
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	#btitle, #mname, #bpassword{
		border-collapse: collapse;
		font-size: 15px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border-top: 1px solid black;
		border-right: 1px solid #ddd;
		width: 100%;
		color: black;
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	
	#bcontents{
		width: 100%;
		height: 300px;
		border-top: 1px solid black;
	}
	
	#btnsss{
		width: 200px;
		height: 40px;
		margin-left: 720px;
	}
	
	#gowrite{
		width: 80px;
		height: 35px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}
	
	#golist{
		width: 80px;
		height: 35px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border: none;
		background-color: #666666;	
		color: white;
	}


</style>
<script type="text/javascript">
$(function(){	
	
	$('#gowrite').on('click', function(){
		var btitle = $("#btitle").val();
		var mname = $("#mname").val();
		var bcontents = $("#bcontents").val();
		var bpassword = $("#bpassword").val();
		
		if(bpassword==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}else{
			location.href = "../teamproject/MainBoard/writeOk.jsp?btitle="+btitle+"&mname="+mname+"&bcontents="+bcontents+"&bpassword="+bpassword;
		}
		
	});
	
	$('#golist').on('click', function(){
		$('#listdiv1').load("../teamproject/qna_board/list.jsp");
	});
	
});	
</script>
</head>
<body> 
	<form action="" name="frm">
		<div id="contents1">
			
			<table id="qnawrite">
				<tr class="line">
					<th class="qcol1">제목</th>
					<td class="qtd1"><input type="text" name="btitle" id="btitle" width="400"/></td>
				</tr>
				<tr class="line">
					<th class="qcol1">작성자</th>
					<td class="qtd1"><input type="text" name="mname" id="mname" width="200"/></td>
				</tr>
				<tr>
					<td colspan="2" id="td1">
					<textarea name="bcontents" id="bcontents" cols="30" rows="20"></textarea>
					</td>
				</tr>
				<tr class="line">
					<th class="qcol1">비밀번호 </th>
					<td class="qtd1"><input type="password" name="bpassword" id="bpassword"/></td>
				</tr>
			</table>
			<div id="btnsss">
				<input type="button" value="글쓰기" id="gowrite"/>
				
				<input type="button" value="목록" id="golist"/>
			</div>
		</div>
	</form>
	

</body>
</html>	