<%@page import="team_vo.P_Member_VO"%>
<%@page import="team_dao.P_Member_DAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#pw').keyup(function(){
			
			//console.log(this.value);
			for (var i = 0; i < this.value.length; i++) {
				
				var ch = this.value.charAt(i);
				//console.log(ch)
		
				if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')){
					
					//console.log("영어 대소문자, 숫자만")
					
					$('#pwCheck').text("영어 대소문자와 숫자만 입력 가능합니다.")
					break;
				}else{
					$('#pwCheck').text("")
					
				}
				//if end
			}//for end
		});//비밀번호 유효성 end
		
		
		
		$('#recheck,#pw').keyup(function(){
			var pw1 = document.getElementById('pw').value;
			var pw2 = document.getElementById('recheck').value;
			
			if( pw2 != pw1){
				$('#pwOk').text("비밀번호가 일치하지 않습니다.")
				
			}else{
				$('#pwOk').text("");
				
			}
			
		});//비밀번호 동일여부 유효성 end
	});//script end
	
	<%
	Cookie[] clist = request.getCookies();
	
	String memno = null;
	
	if(clist != null){
		for(Cookie c : clist){
			if(c.getName().equals("projectLogin")){
				memno = URLDecoder.decode(c.getValue(),"UTF-8");
			}
		}
		
	}
	
		P_Member_DAO dao = new P_Member_DAO();
		P_Member_VO vo = new P_Member_VO();
	
		vo = dao.selectOne(memno);
		//id 를 통해서 변경할 정보 가져오기.
		//test 부분 수정 필요
		
		
		
		String hp0 = vo.getHp().substring(0, 3);
		String hp1 = vo.getHp().substring(3, 7);
		String hp2 = vo.getHp().substring(7,11);
		
	
	%>

</script>


<style media="screen">
	#regDiv{
		width: 900px;
		margin: 0 auto;
	}
  
	#regTable table, #regTable tr, #regTable td{
		border-collapse: collapse;
		padding: 10px;
	}
  
	#regTable{
		width : 900px;
		order-top: 1px solid black;
		order-bottom: 1px solid #EAEAEA;
	}
	
	#regTable th{
		width: 330px;
		text-align: left;
		height: 60px;
		padding-left: 20px;
		background-color: #F6F6F6;
		border-bottom: 1px solid #EAEAEA;
	}
  
	#regTable th, #regTable td{
		border-bottom: 1px solid #EAEAEA;
	}
	
	.inputRegi{
		width :100%;
		height : 40px;
		margin-right: 20px;
	}
	
	input:focus{
		border : 1px solid blue;
	}
  
	#reg,#change{
		width : 100px;
		height : 40px;
	}
  
	#botTr{
		text-align: center;
		
	}
  
	#mp0,#mp1,#mp2{
		text-align: center;
		width : 100px;
		height : 40px;
	}

	#regDiv span{
		color : #F15F5F;
	}
  
  
</style>
</head>
<body>
  <div id="regDiv">
    <form action="../teamproject2/regiChangeOk.jsp" name="frm">
      <table id="regTable">
		<tr>
			<th>ID</th>
			<td><%=vo.getId() %></td>
		</tr>
        <tr>
          <th>변경할 비밀번호</th>
          <td>
          	<input type="password" name="pw" id="pw" placeholder="비밀번호" class="inputRegi" >
          	<br />
          	<span id="pwCheck"></span>
          </td>

          
        </tr>
        <tr>
          <th>비밀번호 확인</th>
          <td >
          	<input type="password" id="recheck" placeholder="비밀번호 확인" class="inputRegi">
          	<br />
          	<span id="pwOk"></span>
          </td>
        </tr>

      
        
        <tr>
          <th>휴대폰 번호</th>
          <td>
            <input type="text" name="mp0" id="mp0" size="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3" value="<%=hp0%>">
            <input type="text" name="mp1" id="mp1" size="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" value="<%=hp1%>">
            <input type="text" name="mp2" id="mp2" size="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" value="<%=hp2%>">
          </td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="email" name="email" id="email" placeholder="abc@abc.com" class="inputRegi" value="<%=vo.getEmail()%>"></td>
        </tr>
      </table>
        <div id="botTr">
            <input type="submit"  id="reg" value="변경">
            <input type="reset" name="change" id="change" value="취소" />
        </div>
    </form>
  </div>
</body>
</html>
