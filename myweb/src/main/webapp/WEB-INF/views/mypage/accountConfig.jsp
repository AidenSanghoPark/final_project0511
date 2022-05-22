<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
* { margin:0; padding:0; }
.wrap { margin: 0px auto; width:90vh; height:100vh; text-align:center; padding-right:200px; padding-left:200px;}
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
.option{
	padding-left: 80px;
	padding-top:100px;
}
ul {
	list-style: none;
}
a{
	text-decoration: none;
	color:grey;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<section class="option">
<h3>계정설정</h3>
	<ul>
		<li><a href="accountConfig.do">개인정보 수정</a></li>
		<li><a href="passwordConfig.do">비밀번호 변경</a></li>
	</ul>
</section>
<section class="wrap">
<form name="update" action="myPageUpdate.do">
<c:forEach var="userinfo" items="${userinfo }">
<input type="hidden" name="u_idx" value="${userinfo.u_idx }">
			<p>
       			<input type="text" id="userId" autocomplete="off" readonly value="ID:${userinfo.u_id }" style="color:lightgrey">
       			<label for="user_id"></label>
       		</p> 	
       			<h5 id="re_id"></h5>
       		<p>
       			<input type="text" id="userBirth" autocomplete="off" readonly value="Birth:${userinfo.u_birth }" style="color:lightgrey">
       			<label><span></span></label>
       		</p> 
			<p>
       			<input type="text" name="u_nick" id="userNick" autocomplete="off" required value="${userinfo.u_nick }">
       			<label><span>Nick Name</span></label>
       		</p> 	
       			<h5 id="re_nick"></h5>
       		
			<p>
       			<input type="text" name="u_tel" id="userTel" autocomplete="off" required value="${userinfo.u_tel }">
       			<label><span>Phone</span></label>
       		</p> 	
       			<h5 id="re_tel"></h5>
       			
			<p>
       			<input type="text" name="u_email" id="userEmail" autocomplete="off" required value="${userinfo.u_email }">
       			<label><span>E-mail</span></label>
       		</p> 	
       			<h5 id="re_email"></h5>       			
			<br>	
		<div class="d-grid gap-2" style="padding-right: 50px; padding-left: 45px;'">
  			<input class="btn btn-dark" type="submit" style="width: 100%;" value="정보 수정">
		</div>	
</c:forEach>
</form>
</section>
<div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
<script>
function nickCheck() {
	
	var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	
	if(!nickNameCheck.test($('#userNick').val())){
		
	   	alert('영어 대.소문자 숫자만 사용가능합니다(2-10자)');
	   
	   return true;
	}else{
		return false;
	}
}
$('#userNick').click(function () {
	
	if(nickCheck()){
		return;
	}
	//ajax
	if ($('#userNick').val() != '') {

    	$.ajax({
					
        	type: 'GET',
        	url: '/myweb/member/nickCheck.do',
        	data: 'u_nick=' + $('#userNick').val(),
        	dataType: 'json',
        	success: function(result2) {
           	 if (!result2 == '0') {
           			alert('누군가 사용중인 닉네임 입니다.');
           	 }
        	},
        	error: function(a, b, c) {
            	console.log(a, b, c);
       	 	}
					
    	});
				
	}	
			
});
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

</script>
</body>
</html>