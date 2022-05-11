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
.picture{
	float:left;
	padding-top:150px;
	padding-left:80px;
}
.infoConfig{
	width:1200px;
	padding-top:209px;
	padding-left:80px;
	float:left;
}
textarea{
	width:1070px;
	height:300px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<form name="profileUpdate">
<section class="picture">
<h3>프로필 수정하기</h3><br>
<h5>프로필 사진</h5><hr>

<input type="submit" value="파일선택">
</section>
<section class="infoConfig">
<h4>로그인 정보</h4><hr>
<table>
	<tr>
		<th>소개글</th>
		<td><textarea></textarea></td>
	</tr>
	<tr>
		<th>계좌번호 수정</th>
		<td><input type=""></td>
	</tr>
</table>
</section>
</form>
<div style="padding-top:1200px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>