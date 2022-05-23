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

<div style="padding-left: 80px;padding-top: 100px;">
<h3>결제내역</h3><br>
</div>
<table class="list">
	<thead>
		 <tr>
			<th>결제일</th>
			<th style="width:600px;">결제금액</th>
			<th>결제정보</th>
		</tr>
	</thead>
</table>
<c:if test="${empty lists }">
	<div style="text-align:center">
    	<h3 style="color:grey;padding-top:200px;">결제내역이 없습니다.</h3>
    </div>
</c:if>
    <c:forEach var="lists" items="${lists }">
<table class="list">
    <tr style="border:1px solid;">
		<td >${lists.t_date }</td>
		<td style="width:600px;color:blue">${lists.t_pay}&nbsp;원</td>
		<c:choose>
			<c:when test="${lists.t_type=='0'}">
				<td>카드결제</td>
			</c:when>
			<c:when test="${lists.t_type=='1'}">
				<td>카카오페이</td>
			</c:when>
		</c:choose>
	</tr>
</table><br>
</c:forEach>
<c:if test="${!empty lists }">
<div style="text-align:center">
 ${pageStr }
</div>
</c:if>
<div style="padding-top:200px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>