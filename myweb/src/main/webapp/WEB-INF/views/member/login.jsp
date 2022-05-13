<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="autocomplete" content="off" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>로그인</title>
<style>
* { margin:0; padding:0; }
.wrap { margin: 0px auto; width:90vh; height:100vh; text-align:center; padding-right:300px;}
p { margin:50px auto 0; }
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
   : left;   margin: 0px auto;
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
<style>
li{
	list-style-type: none;
	
}
label {
	width: 80px;
	float: left;
}
div{
	text-align: right;
}
</style>
</head>
<body>
	<div id="l_img">
	   <img src="img/joinmain.gif" height="1000" width="700">
	</div>
	<div id="r_join">
		<section class="wrap">
			<form name="login" action="loginPage.do" method="post" id="memberJoin">
				<p>
                	<input type="text" name="u_id" id="userId" required>
                	<label for="user_id"><span>ID</span></label>
                </p>    
                <p>
                	<input type="password" name="u_pwd" id="userPw" required>
                	<label for="user_pw"><span>PASSWORD</span></label>
                </p>    
                	<h5 id="re_check"></h5>
				<input type="hidden" name="_autologin" value="on">
				<input type="checkbox" name="autologin" id="autologin">로그인유지
				<input type="submit" value="LOGIN" onclick="logincheck()" >
			</form>
		</section>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function logincheck(){
	var uid = $('input[name="u_id"]').val();
	var pwd = $('input[name="u_pwd"]').val();
	var loginData = {"u_id":uid,"pwd":pwd};
	
	$ajax({
		type = "POST",
		url= = "loginMsg.do",
		contentType : application/json",
		data : JSON.stringfy(loginData),
		success : function(result){
			if(result == 0){
				console.log(result == '0');
			}else if( result == 9 ){
				$('#re_check').html('<label style="color:#f82a2aa3;font-size:12px;"> 아이디 혹은 비밀번호가 일치하지 않습다.</label>');
			}else {
				
			}
		},
		error : function(jqXHR, status, error){
			alert("알 수 없는 에러 [ " + error + " ]")
		}
	
	})
}


$("#u_pwd").autocomplete({
	  focus: function(event, ui) {
	    return false;
	  }
	});

//아이디 정규식
function idCheck() {
   var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,20}$/);
      
   if(!userIdCheck.test($('#userId').val())){
       console.log(!userIdCheck.test($('#userId').val()));
        $('#re_id').html('<label style="color:#f82a2aa3;font-size:12px;">유형에 맞게 입력해주세요.</label>');
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
//비밀번호 정규식
function pwdCheck() {
   var passCheck = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
   
   if(!passCheck.test($('#userPw').val())){
      
        $('#re_pw').html('<label style="color:#f82a2aa3;font-size:12px;">유형에 맞게 입력해주세요.</label>');
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

//submit 버튼
function show() {
   
   var frm = document.memberJoin;

      if(idCheck() || $('#userId').val() == null || $('#userId').val() === ""){
        alert("아이디를 유형에 맞게 입력해주세요.");
        return false;  
    
      }else if(pwdCheck() || $('#userPw').val() == null || $('#userPw').val() === ""){
         alert("비밀번호를 유형에 맞게 입력해주세요.");
          return false;
      }
      frm.submit();
}
</script>
</body>
</html>