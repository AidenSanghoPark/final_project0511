<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘테스트 개최</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
#img{
	width: 200px;
	height: 300px;
}
section{
	padding-left: 550px;
	padding-top: 100px;
}
#tb1{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
	<section>
		<table id="td1">
			<tr>
				<td>
					<a href="namingHold.do?c_cate=naming"><img src="img/type1.PNG" id="img"></a>
				</td>
				<td>
					<a href="logoHold.do?c_cate=logo"><img src="img/type2.PNG" id="img"></a>
				</td>
			</tr>
		</table>
		<table id="td2">
			<tr>
				<td>
					<a href="characterHold.do?c_cate=character"><img src="img/type3.PNG" id="img"></a>
				</td>
				<td>
					<a href="productHold.do?c_cate=product"><img src="img/type4.PNG" id="img"></a>
				</td>
				<td>
					<a href="printHold.do?c_cate=print"><img src="img/type5.PNG" id="img"></a>
				</td>
			</tr>
		</table>	
	</section>
	<br>
	<br>
	<br>
<%@include file="/WEB-INF/views/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>