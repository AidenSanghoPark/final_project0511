<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
* { margin:0; padding:0; }
.wrap { margin: 0px auto; width:90vh; height:100vh; text-align:center; padding-right:200px; padding-left:200px; padding-top:200px;}
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
<style>
.option{
	float:left;
	padding-left:80px;
	padding-top:100px;
}
a {
	text-decoration: none;
	color:grey;
}
ul{
	list-style:none;
}
</style>
</head>
<body>
<form name="pwdUpdate" action="pwdUpdate.do" id="pwdUpdate" method="post">
<%@include file="/WEB-INF/views/header.jsp" %>
<section class="option">
<h3>계정설정</h3>
	<ul>
		<li><a href="accountConfig.do">개인정보 수정</a></li>
		<li><a href="passwordConfig.do">비밀번호 변경</a></li>
	</ul>
</section>
<section class="wrap">
	<p>
       		<input type="password" name="lastpwd" autocomplete="off" required>
			<label><span>Password</span></label>
 	</p> 	
    <p>
       		<input type="password" name="checkpwd" id="userPw" autocomplete="off" required>
			<label><span>New Password</span></label>
 	</p> 	
       		<h5 id="re_pw"></h5>
    <p>
       		<input type="password" name="pwdconfirm" id="userPwChk" autocomplete="off" required>
			<label><span>Verify Password</span></label>	
 	</p> 	
 			<h5 id="re_ck"></h5>

    <div class="d-grid gap-2" style="padding-right: 50px; padding-left: 45px;'">
  			<input class="btn btn-dark" type="button" onclick="show()" style="width: 100%;" value="비밀번호 수정">
		</div>	
</section>
<div style="padding-top:800px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</form>
<script>
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
</script>
</body>
</html>