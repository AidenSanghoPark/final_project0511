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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/180c933499.js" crossorigin="anonymous"></script>
<style>
.picture{
	float:left;
	padding-top:150px;
	padding-left:80px;
}
.infoConfig{
	width:1200px;
	padding-top:50px;
	padding-left:80px;
	float:left;
}
textarea{
	width:900px;
	height:170px;
}
.profile{
	float: center;
	text-align: center
}
h5{
	text-align: center;
}
.sujung{
	float: center;
	text-align: center;
}
.photo{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
}
.trright{
	float: right;

}
</style>
</head>
<body>

<%@include file="/WEB-INF/views/header.jsp" %>
<c:if test="${pdto == null}">
	<form name="profileInsert" action="profileInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="u_idx" value="${u_idx}"><br><br><br><br>
	<h2 style="font-weight: bold;"><br>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-regular fa-circle-user fa-lg"></i>&nbsp;&nbsp;프로필 입력하기</h2>
		<section class="picture">
			<h5 style="font-weight: bold;">프로필 사진</h5><hr>
			<img class="photo" src="/myweb/profileimg/profile.PNG" style="margin-left: 70px;"><br><br>
			<input type="file" name="upload" value="${pdto.p_img}" accept="image/png, image/jpeg" style="margin-left: 30px;">
		</section>
		<section class="infoConfig">
		<h4 style="font-weight: bold;">&nbsp;로그인 정보</h4><hr>
		<table>
			<tr>
				<th>소개글</th>
				<td><textarea name="p_info"></textarea></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>
				<select name="u_bank">
						<option>--선택--</option>
						<option>카카오</option>
						<option>KB국민</option>
						<option>우리</option>
						<option>신한</option>
						<option>BC</option>
						<option>하나</option>
						<option>SC제일</option>
						<option>한국TC</option>
						<option>농협</option>
						<option>삼성</option>
						<option>롯데</option>
						<option>케이</option>
						<option>현대</option>	
					</select>
				<input type="text"name="u_wallet"></td>
				</tr>
		</table>
		<br><br><br>
		<div style="padding-right: 100px;">
				<input type="submit" value="입력하기" class="btn btn-secondary" style="float: right; font-size: 20px; text-align: right;">
		</div>
		</section>
	</form>
</c:if>
<c:if test="${pdto != null}">
	<form name="profileUpdate" action="profileUpdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="u_idx" value="${u_idx}"><br><br><br><br>
	<h2 style="font-weight: bold;"><br>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-regular fa-circle-user fa-lg"></i>&nbsp;&nbsp;프로필 수정하기</h2>
		<section class="picture">
			<h5 style="font-weight: bold;">프로필 사진</h5><hr>
			<img class="photo" src="/myweb/profileimg/${pdto.p_img}" style="margin-left: 70px;"><br><br>
			<input type="file" name="upload" value="${pdto.p_img}" accept="image/png, image/jpeg" style="margin-left: 30px;">
		</section>
		<section class="infoConfig">
		<h4 style="font-weight: bold;">&nbsp;로그인 정보</h4><hr>
		<table>
			<tr>
				<th>소개글</th>
				<td><textarea name="p_info">${pdto.p_info}</textarea></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>
				<select name="u_bank">
						<option>${pdto.u_bank}</option>
						<option>카카오</option>
						<option>KB국민</option>
						<option>우리</option>
						<option>신한</option>
						<option>BC</option>
						<option>하나</option>
						<option>SC제일</option>
						<option>한국TC</option>
						<option>농협</option>
						<option>삼성</option>
						<option>롯데</option>
						<option>케이</option>
						<option>현대</option>	
					</select>
				<input type="text" value="${pdto.u_wallet}" name="u_wallet"></td>
				</tr>
		</table>
		<br><br><br>
		<div style="padding-right: 100px;">
				<input type="submit" value="수정하기" class="btn btn-secondary" style="float: right; font-size: 20px; text-align: right;">
		</div>
		</section>
	</form>
</c:if>
<div style="padding-top:600px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>
