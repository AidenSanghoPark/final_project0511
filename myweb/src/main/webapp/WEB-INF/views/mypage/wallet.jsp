<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
function payout(){
	window.open('payout.do?u_idx=${u_idx}','windowPop','width=600, height=400')
}
</script>
<style>
.request{
	text-align:center;
	height: 50px;
}
.request tr th{
	background-color:#d3d3d3;
	width:400px;
}
.request tr td{
	background-color:black;
	color:white;
	width:100px;
}
.list{
	border-collapse:collapse;
	margin-left: auto;
	margin-right: auto;
	width:1400px;
	height:50px;

}
.list tr td, th{
	width:200px;
	height:60px;
	text-align: center;
}
a {
	text-decoration: none;
	color:grey;
}
#page{
	text-align:center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<c:choose>
	<c:when test="${!empty blc }">
<div style="padding-left: 80px;padding-top: 100px;">
<h3>가상계좌</h3><br>
<c:choose>
	<c:when test="${empty lists }">
	<fieldset>
		<table>
			<tr>
				<th>계좌 등록</th>
			</tr>
		</table>
		</fieldset>
	</c:when>
</c:choose>
<table class="request" style="border-top-left-radius: 15px;">
	<tr>
		<c:choose>
			<c:when test="${empty blc}">
		<th>잔액이 없습니다.</th>
			</c:when>
			<c:otherwise>
			<th>${blc }&nbsp;원</th>
			</c:otherwise>
		</c:choose>
		<td><a onclick="payout()">출금신청</a></td>
	</tr>
</table>
</div>
<div style="padding-top:100px;">
<table class="list">
	<thead>
		 <tr>
			<th>항목</th>
			<th>날짜</th>
			<th style="width:600px;">콘테스트 명</th>
			<th>내용</th>
			<th>거래액</th>
			<th>거래 후 잔액</th>
		</tr>
	</thead>
	<c:if test="${empty lists }">
    	<h3 style="color:grey;padding-left:300px;padding-top:200px;">계좌 내역이 없습니다.</h3>
    </c:if>
    <c:forEach var="dto" items="${lists }">
    <tr style="border:1px solid;">
		<td>${dto.a_type }</td>
		<td>${dto.a_date }</td>
		<td style="width:600px;">${dto.c_subject} </td>
		<td>${dto.a_content }</td>
		<td style="color:blue">${dto.a_amount}</td>
		<td>${dto.a_balance }</td>
	</tr>
	</c:forEach>
</table><br>
<div style="text-align:center">
 ${pageStr }
</div>
</div>
	</c:when>
</c:choose>
<div style="padding-top:200px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>