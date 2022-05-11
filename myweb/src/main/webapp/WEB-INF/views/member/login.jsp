<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form name="login" action="loginPage.do" method="post">
		<fieldset>
			<legend>로그인</legend>
				<ul>
					<li><label>ID</label>
					<input type="text" name="u_id" placeholder="아이디" required ></li>
					<li><label>PASSWORD</label>
					<input type="password" name="u_pwd" placeholder="비밀번호" id="pass" required ></li>
				</ul>
				<div>
				<input type="hidden" name="_autologin" value="on">
				<input type="checkbox" name="autologin" i="autologin">로그인유지
				<input type="submit" value="LOGIN"></div>
		</fieldset>
	</form>
</body>


</html>