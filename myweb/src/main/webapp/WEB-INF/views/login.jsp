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
			<form name="login" action="loginPost.do" method="post" id="memberJoin">
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
				<input type="checkbox" name="useCookie" id="autologin">로그인유지
				<input type="submit" value="LOGIN" onclick="logincheck()" >
			</form>
		</section>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>

</script>
</body>
</html>