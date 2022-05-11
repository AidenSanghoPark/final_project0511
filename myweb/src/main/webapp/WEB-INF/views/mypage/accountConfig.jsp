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
.option{
	float:left;
	padding-left:80px;
	padding-top:100px;
}
.insert{
	float:left;
	padding-left:500px;
	padding-top:200px;
	align:center;
}
.insert td{
	padding-left:20px;
}
.insert table{
	border-collapse:separate;
	border-spacing:0 30px;
	
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
<form name="update" action="myPageUpdate.do">
<%@include file="/WEB-INF/views/header.jsp" %>
<section class="option">
<h3>계정설정</h3>
	<ul>
		<li><a href="accountConfig.do">개인정보 수정</a></li>
		<li><a href="passwordConfig.do">비밀번호 변경</a></li>
	</ul>
</section>
<section class="insert">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" placeholder="u_id" style="background-color:grey; border-radius:5px;" readonly></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="u_nick"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="u_birth" placeholder="u_birth" style="background-color:grey; border-radius:5px;" readonly></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="u_tel">
				<label style="color:grey">- 빼고 입력</label>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="u_email">
			</td>
		</tr>
	</table>
	<div style="text-align:center"><br>
		<input type="submit" value="수정하기" style="display:inline-block; background-color:grey; color:white; border-radius:5px; outline:none; border: 0px;width:100px;height:40px">
	</div>
</section>
<div style="padding-top:800px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</form>
</body>
</html>