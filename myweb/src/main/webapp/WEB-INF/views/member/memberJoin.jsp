<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>DSN 회원가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>DSN 회원가입</title>
<style>
* { margin:0; padding:0; }
.wrap { margin: 0px auto; width:90vh; height:100vh; text-align:center; padding-right:300px;}
p { margin:50px auto 0; }
/* form과 fieldset은 선택자로 사용하지 않는다. */

/* 스타일 */
p { position:relative; width:80%; height:40px; } /* 기본세팅 */
p input { box-sizing:border-box; padding:10px 0 0; width:100%; height:100%; border:0 none; color:#595f63; outline:none; }
p label { position:absolute; left:0%; bottom:0; width:100%; height:100%; border-bottom:1px solid #000; text-align:left; pointer-events:none; }
p label:after { content:""; position:absolute; left:0; bottom:-1px; width:0; height:100%; border-bottom:3px solid #5fa8d3; transition:all .3s ease; } /* 파란색 가로줄 */
p label span { position:absolute; left:0; bottom:5px; transition:all .3s ease; }
p input:focus + label span, 
p input:valid + label span { transform:translateY(-150%); font-size:14px; color:#5fa8d3; }  /* input에 글을 입력하고 포커스가 지나간 상태에서 제어하려면 valid 선택자를 써야한다. */
/* 포커스 될 때 label span(name)이 위로 올라감 */
p input:focus + label::after,
p input:valid + label::after { width:100%; transform:translateX(0); } 
/* 포커스 될 때 파란색 가로줄이 생김 */ 
h1{
	text-align: center;
}
table{	
	: left;	margin: 0px auto;
}
input{
	text-align: left;
}
div{
	text-align: center;
}
th{
	text-align: left;
}
img{
	text-align: left;

}
#l_img{
	float: left;
}
#r_join{
	float: right;
}
#login_bt{
	width: 75px;
	height: 35px;
	border-radius: 10px;
}
header{
	text-align: right;
} 
ul {
	list-style: none;
}
</style>
</head>
<body>
<div id="l_img">
	<img src="img/joinmain.gif" height="1000" width="700">
</div>
	<div id="r_join">
	<section class="wrap">
	<form name="memberJoin" action="memberJoin.do" method="post" id="memberJoin">	
			<input type="hidden" name="u_type" value="${u_type}">
			<p>
       			<input type="text" name="u_id" id="userId" autocomplete="off" required>
       			<label for="user_id"><span>ID</span></label>
       		</p> 	
       			<h5 id="re_id"></h5>
       			
			<p>
       			<input type="password" name="u_pwd" id="userPw" autocomplete="off" required>
				<label><span>Password</span></label>
       		</p> 	
       			<h5 id="re_pw"></h5>
       			
			<p>
       			<input type="password" name="u_pwd" id="userPwChk" autocomplete="off" required>
       			<label><span>Password Check</span></label>
       		</p> 	      		
       			<h5 id="re_ck"></h5>
       			
			<p>
       			<input type="text" name="u_name" id="userName" autocomplete="off" required>
       			<label><span>Name</span></label>
       		</p> 	
       			<h5 id="re_name"></h5>
       			
			<p>
       			<input type="text" name="u_nick" id="userNick" autocomplete="off" required>
       			<label><span>Nick Name</span></label>
       		</p> 	
       			<h5 id="re_nick"></h5>
       			
			<p>
       			<input type="text" name="u_birth" id="userBirth" autocomplete="off" required>
       			<label><span>Birth</span></label>
       		</p> 	
       			<h5 id="re_birth"></h5>
       			
			<p>
       			<input type="text" name="u_tel" id="userTel" autocomplete="off" required>
       			<label><span>Phone</span></label>
       		</p> 	
       			<h5 id="re_tel"></h5>
       			
			<p>
       			<input type="text" name="u_email" id="userEmail" autocomplete="off" required>
       			<label><span>E-mail</span></label>
       		</p> 	
       			<h5 id="re_email"></h5>       			
			<br>	
		<div class="d-grid gap-2" style="padding-right: 50px; padding-left: 45px;'">
  			<button class="btn btn-dark" type="button" onclick="show()" style="width: 100%;">Sign up</button>
		</div>
			<br>
		<div style="text-align: right;">
			<h6 style="font-size: 13px; color: gray;">이미등록된 계정이 있으십니까?&nbsp;&nbsp;<a href="#">click</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6>	
		</div>		
	</form>
</section>
</div>	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
//아이디 정규식
function idCheck() {
   var userIdCheck = RegExp(/^[A-Za-z0-9]{4,20}$/);
      
	if(!userIdCheck.test($('#userId').val())){
	 	console.log(!userIdCheck.test($('#userId').val()));
	  	$('#re_id').html('<label style="color:#f82a2aa3;font-size:12px;">영어 대.소문자 숫자만 사용가능합니다(4-20자)</label>');
		$("#userId").focus(); 
	 	return true;
	}else{
		return false;
	}
}
//아이디 유효성
$('#userId').keyup(function () {
      
	if(idCheck()){
		return;
	}else{
   	 $('#re_id').html('');
    }
	  //ajax
      if ($('#userId').val() != '') {
      
        $.ajax({
                  
            type: 'GET',
            url: '/myweb/idCheck.do',
            data: 'u_id=' + $('#userId').val(),
            dataType: 'json',
            success: function(result) {
                if (result == '0') {
                	console.log(result == '0');
                    $('#re_id').html('<label style="color:#199894b3;font-size:12px;"> 멋진아이디네요!</label>');
                } else {
                    $('#re_id').html('<label style="color:#f82a2aa3;font-size:12px;"> 누군가 사용중이에요!</label>');
                }
            },
            error: function(a, b, c) {
                console.log(a, b, c);
            }
                  
        });
               
    }
      
});
//닉네임 정규식
function nickCheck() {
	
	var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	
	if(!nickNameCheck.test($('#userNick').val())){
			
	   $('#re_nick').html('<label style="color:#f82a2aa3;font-size:12px;">영어 대.소문자 숫자만 사용가능합니다(2-10자)</label>');
	   $("#userNick").focus(); 
	   return true;
	}else{
		return false;
	}
}
$('#userNick').keyup(function () {
	
	if(nickCheck()){
		return;
	}else{
		$('#re_nick').html('');
	}	
	
	//ajax
	if ($('#userNick').val() != '') {

    	$.ajax({
					
        	type: 'GET',
        	url: '/myweb/nickCheck.do',
        	data: 'u_nick=' + $('#userNick').val(),
        	dataType: 'json',
        	success: function(result2) {
           	 if (result2 == '0') {
                	$('#re_nick').html('<label style="color:#199894b3;font-size:12px;"> 멋진 닉네임이네요!</label>');
           	 } else {
               	 $('#re_nick').html('<label style="color:#f82a2aa3;font-size:12px;"> 누군가 사용중이에요!</label>');
           	 }
        	},
        	error: function(a, b, c) {
            	console.log(a, b, c);
       	 	}
					
    	});
				
	}	
			
});
//이름 정규식	
function nameCheck(){
	var nameCheck = RegExp(/^[가-힣]{2,6}$/);
		   
	if(!nameCheck.test($('#userName').val())){
		      
		$('#re_name').html('<label style="color:#f82a2aa3;font-size:12px;">한글만 사용가능합니다(2-6자)</label>');
		$("#userName").focus();	
		return true;	
		
	}else{
		
		return false;	
	}
}
$("#userName").keyup(function(){
   	
	if(nameCheck()){			
		return;			
     }else{
    	 $('#re_name').html('');
     }
	
})
//이메일 유효성
function emailCheck() {
	
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
  	//이메일 정규식
	if(!emailCheck.test($('#userEmail').val())){
	   			
	$('#re_email').html('<label style="color:#f82a2aa3;font-size:12px;">영어 대.소문자 숫자만 @ 만 사용가능합니다</label>');
	$("#userEmail").focus(); 	
	return true;	 
	
	}else{
		
	return false;
	}	
}
$('#userEmail').keyup(function () {
	
	if(emailCheck()){
		return;
	}else{
		$('#re_email').html('');
	}
	//ajax
   	if ($('#userEmail').val() != '') {
	  		
        $.ajax({
   					
            type: 'GET',
            url: '/myweb/emailCheck.do',
            data: 'u_email=' + $('#userEmail').val(),
            dataType: 'json',
            success: function(result3) {
                if (result3 == '0') {
                    $('#re_email').html('<label style="color:#199894b3;font-size:12px;">사용 가능한 이메일 입니다</label>');
                } else {
                    $('#re_email').html('<label style="color:#f82a2aa3;font-size:12px;">이메일은 중복될수 없습니다</label>');
                }
            },
            error: function(a, b, c) {
                console.log(a, b, c);
            }
   					
        });
   				
    }	
   			
});
//비밀번호 정규식
function pwdCheck() {
	var passCheck = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
	
	if(!passCheck.test($('#userPw').val())){
		
	  	$('#re_pw').html('<label style="color:#f82a2aa3;font-size:12px;">영어 대.소문자 숫자 특수문자 1개이상 입력 해주셔야합니다(8-15자)</label>');
	  	$("#userPw").focus(); 
		return true;
	  	
	}else{
		return false;
	}	
}
$(function(){
			
	$('#userPw').keyup(function(){
		
	if(pwdCheck()){
		return;
	}else{
		$('#re_pw').html('');
	}
		
	$('#re_pw').html('');});
		
	$('#userPwChk').keyup(function(){
			
        if($('#userPw').val() != $('#userPwChk').val()){
        	
          $('#re_ck').html('<label style="color:#f82a2aa3;font-size:12px;">비민번호 불일치!</label>');
          
        } else{
        	
          $('#re_ck').html('<label style="color:#199894b3;font-size:12px;">비밀번호 일치!</label>');
          
        }

    });
});
//생년월일 유효성
function birthCheck() {
	var birthCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
	 
	if(!birthCheck.test($('#userBirth').val())){
        $('#re_birth').html('<label style="color:#f82a2aa3;font-size:12px;">숫자만 사용가능합니다 ex)19930425</label>');       
        $('#userBirth').focus();
        return true;
	}else{
		return false;
	}   
}
$('#userBirth').keyup(function(){
	
	if(birthCheck()){
		return;
    }else{    	 
    	$('#re_birth').html('');
    }
	
})
//핸드폰번호 유효성
function telCheck() {
	
	var phoneCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	
	if(!phoneCheck.test($('#userTel').val())){
        $('#re_tel').html('<label style="color:#f82a2aa3;font-size:12px;">숫자만 사용가능합니다 ex)01011112222</label>');
        $("#userTel").focus(); 
        return true;
	}else{
		return false;
	}	
}
$("#userTel").keyup(function(){
	 
	if(telCheck()){
		return;
    }else{    	 
    	$('#re_tel').html('');
    }
	
})
//회원타입 선택
function inputEmail3() {
	var email4=document.memberJoin.u_email_3.value;
	if(email4=='user'){
		document.memberJoin.u_email_2.value='';
	}else{
		document.memberJoin.u_email_2.value = email4;
	}	
}
//submit 버튼
function show() {
   
   var frm = document.memberJoin;

      if(idCheck() || $('#userId').val() == null || $('#userId').val() === ""){
     	alert("아이디를 유형에 맞게 입력해주세요.");
        return false;  
    
      }else if(nameCheck() || $('#userName').val() == null || $('#userName').val() === ""){
        alert("이름을 유형에 맞게 입력해주세요.");
        return false;
   
      }else if(telCheck() || $('#userTel').val() == null || $('#userTel').val() === ""){
       	alert("휴대폰번호를 유형에 맞게 입력해주세요.");
       	return false;
       	
   	  }else if(nickCheck() || $('#userNick').val() == null || $('#userNick').val() === ""){
   		alert("닉네임을 유형에 맞게 입력해주세요.");
       	return false;  
       	
   	  }else if(emailCheck() || $('#userEmail').val() == null || $('#userEmail').val() === ""){
   		alert("이메일을 유형에 맞게 입력해주세요.");
       	return false;
       	
   	  }else if(pwdCheck() || $('#userPw').val() == null || $('#userPw').val() === ""){
   		alert("비밀번호를 유형에 맞게 입력해주세요.");
       	return false;
       	
   	  }else if(birthCheck() || $('#userBirth').val() == null || $('#userBirth').val() === ""){
   		alert("생년월일을 유형에 맞게 입력해주세요.");
       	return false; 
   	  }
      frm.submit();
}
</script>
</body>
</html>