<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자인 개최</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
ul{
	list-style: none;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
	<div style="width: 50%; float: left; text-align: center;">브리핑 작성</div><div style="width: 50%; float: right; text-align: center;">상금 결제</div>
	<div>
	<section>
		<form name="design" action="">
			<div>
				<b>콘테스트 제목</b>&nbsp;&nbsp;<input type="text">
			</div>
			<div>
				<b>회사명</b>&nbsp;&nbsp;<input type="text">
			</div>
			<div>
				<b>서비스설명</b>&nbsp;&nbsp;<textarea  cols="30"></textarea>
			</div>
			<hr style="width: 700px;">
			<table>
				<tr>
					<th>원하는 로고타입 3가지 선택</th>
					<td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>
					<td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>	
				</tr>
			</table>
			<div>
				<b>원하는색상</b>&nbsp;&nbsp;<input type="text">
			</div>
			<div>
				<b>디자이너가 참고할 자료</b>&nbsp;&nbsp;<input type="file" value="파일첨부">
			</div>
			<div>
				<b>로고에 사용될 상호명</b>&nbsp;&nbsp;<input type="text">
			</div>
			<div>
				<b>서비스설명</b>&nbsp;&nbsp;<textarea  cols="30"></textarea>
			</div>
		</form>	
	</section>
	</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>