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
.insert table{
	border-collapse:separate;
	border-spacing:0 30px;
}
.insert td{
	padding-left:20px;
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
<form name="pwdUpdate" action="pwdUpdate.do">
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
			<th>기존비밀번호</th>
			<td><input type="text" name="lastpwd"></td>
		</tr>
		<tr>
			<th>변경할 비밀번호</th>
			<td><input type="text" name="checkpwd"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="text" name="pwdconfirm"></td>
		</tr>
	</table>
	<div style="text-align:center"><br>
		<input type="submit" value="확인" style="display:inline-block; background-color:grey; color:white; border-radius:5px; outline:none; border: 0px;width:100px;height:40px">
	</div>
</section>
<div style="padding-top:800px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</form>
</body>
</html>