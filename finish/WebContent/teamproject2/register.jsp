<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	//도큐 먼트가 준비되면.
	$(document).ready(function(){
	
		
		$('#id').keyup(function(){
			
			//console.log(this.value);
			for (var i = 0; i < this.value.length; i++) {
				
				var ch = this.value.charAt(i);
				//console.log(ch)
		
				if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')){
					
					//console.log("영어 대소문자, 숫자만")
					
					$('#idCheck').text("영어 대소문자와 숫자만 입력 가능합니다.");
					$('#reg').attr("disabled","disabled").css('color','red');
					break;
				}else{
					$('#idCheck').text("")
					$('#reg').attr("disabled",false).css('color','black');
					
				}
				//if end
			}//for end
		});//아이디 유효성 end
		
		$('#pw').keyup(function(){
			
			//console.log(this.value);
			for (var i = 0; i < this.value.length; i++) {
				
				var ch = this.value.charAt(i);
				//console.log(ch)
		
				if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')){
					
					//console.log("영어 대소문자, 숫자만")
					
					$('#pwCheck').text("영어 대소문자와 숫자만 입력 가능합니다.")
					$('#reg').attr("disabled","disabled").css('color','red');
					break;
				}else{
					$('#pwCheck').text("")
					$('#reg').attr("disabled",false).css('color','black');
					
					/*					
		 			$('.test .syntax').css({'background-color' : 'red',
											'font-size' : '20px',
											'border' : '10px'}); */
					//여러개의 css적용 예시.
				
				}
				//if end
			}//for end
		});//비밀번호 유효성 end
		
		
		
		$('#recheck,#pw').keyup(function(){
			var pw1 = document.getElementById('pw').value;
			var pw2 = document.getElementById('recheck').value;
			
			if( pw2 != pw1){
				$('#pwOk').text("비밀번호가 일치하지 않습니다.")
				$('#reg').attr("disabled","disabled").css('color','red');;
				
			}else{
				$('#pwOk').text("");
				$('#reg').attr("disabled",false).css('color','black');
			}
			
		});//비밀번호 동일여부 유효성 end
	

	$('#check').click(function(){
		var id = document.getElementById('id').value;
		var params = "id=" + encodeURIComponent(id);
		
		sendRequest('../teamproject2/idCheck.jsp',params,callback,'GET')
		
	});//아이디 중복 여부 end
	
	function callback(){
		
		if(xhr.readyState==4 & xhr.status==200){

				//$('#idCheck2').html(xhr.responseText);
				
				var ok = xhr.responseText.trim()
				
				if(ok == "true"){
					alert("아이디가 존재합니다.")
					$('#reg').attr("disabled","disabled").css('color','red');
				}else{
					alert("사용 가능한 아이디 입니다.")
					$('#reg').attr("disabled",false).css('color','black');
				}
				
				//div1.innerHTML = '<h1>'+xhr.responseText+'</h1>';
		}
			
	}//callback end
	
	
	$('#reg').click(function(){
		
		if($('input:radio[name=radio]').is(':checked')==false){
			alert("성별을 선택하세요");
		}else if($('#name').val() == "" ){
			alert("이름을 확인하세요.")
		}else if($('#birth').val==""){
			alert("생년월일을 확인하세요.")
		}else if($('#email').val()==""){
			alert("메일을 입력하세요.")
		}else if($('#mp0').val() == "" || $('#mp1').val() == "" || $('#mp2').val() == ""){
			alert("휴대폰 번호 확인하세요.")
		}else{
			$('#frm').submit();
		}
		
		
		
	});//회원가입 버튼 end
	
	$('#change').click(function(){
		location.href= "../teamproject/main.jsp";
	});
		
	
	});//script end


</script>



<style media="screen">
	#regDiv{
		width: 900px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}	

	#regTable, #regTable tr, #regTable th, #regTable td{
		border-collapse: collapse;
		padding: 10px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
  
	#regTable{
		width : 100%;
		border-top: 1px solid black;
		border-bottom: 1px solid #EAEAEA;
	}
 
	#regTable th{
		background-color: #F6F6F6;
	}
  
	#regTable th, #regTable td{
		border-bottom: 1px solid #EAEAEA;
	}
  
  	input{
	  	width :70%;
	  	height : 40px;
	}
  
  	input:focus{
  		border : 1px solid blue;
  	}
  
	#reg, #change, #check{
		width : 100px;
		height : 40px;
	}
  	
  	#reg{
		margin-left: 300px;  	
  	}
  	
	#reg, #change{
		height: 50px;
		background-color: #BEEBE9;
		outline : none;
		box-shadow: none;
		border : 1px solid #BEEBE9;
		font-size: 15px;
		cursor: pointer;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		margin-top: 30px;
	}
  
	#check{
		color : #6799FF;
		border: 2px solid #B2CCFF;
		background-color: white;
		box-shadow: none;
		margin-left: 20px;
	}

	#check:hover{
		background-color:#B2CCFF;
		color : gray;
	}
  
	#botTr{
		text-align: center;
	}

	#mp0,#mp1,#mp2{
		text-align: center;
		width : 100px;
		height : 40px;
	}
  
	.radio>input{
		width : 20px;
		height: 20px;
		margin-left : 10px;
	}
  
</style>
</head>
<body>
  <div id="regDiv">
  
    <form action="../teamproject2/registerOk.jsp" name="frm" id="frm" method="get">
      <table id="regTable">
        <tr>
          <th>아이디</th>
          <td>
          	<input type="text" name="id" id="id" placeholder="아이디">
          	<input type="button" value="중복여부확인" id="check" />
          	<br />
          	<span id="idCheck"></span>
          </td>
          
        </tr>
        <tr>
          <th>비밀번호</th>
          <td>
          	<input type="password" name="pw" id="pw" placeholder="비밀번호">
          	<br />
          	<span id="pwCheck"></span>
          </td>
          
        </tr>
        <tr>
          <th>비밀번호 확인</th>
          <td >
          	<input type="password" id="recheck" placeholder="비밀번호 확인">
          	<br />
          	<span id="pwOk"></span>
          </td>
        </tr>
        
        <tr>
          <th>이름</th>
          <td><input type="text" name="name" id="name" placeholder="이름"></td>
        </tr>
        
        <tr>
          <th>생년월일</th>
          <td>
          	<input type="text" name="birth" id="birth" placeholder="생년월일 8자리 입력  ex)19880818" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="8">
          </td>
        </tr>
        
        <tr >
        	<th>성별</th>
        	<td class = "radio">
				남자<input type="radio" name="radio" id="rman" class = "radio" value="남" />
				여자<input type="radio" name="radio" id="rwoman" class = "radio" value="여"/>
			</td>
        </tr>
        
        <tr>
          <th>휴대폰 번호</th>
          <td>
            <input type="text" name="mp0" id="mp0" size="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3">
            <input type="text" name="mp1" id="mp1" size="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
            <input type="text" name="mp2" id="mp2" size="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
          </td>
        </tr>
        
        <tr>
          <th>이메일</th>
          <td><input type="email" name="email" id="email" placeholder="abc@abc.com"></td>
        </tr>        
      </table>
      
      <input type="button" id="reg" value="회원가입">
      <input type="reset" name="change" id="change" value="취소" />
   
    </form>
  </div>
</body>
</html>
