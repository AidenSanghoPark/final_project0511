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
.profile{
	float: center;
	text-align: center
}
h5{
	text-align: center;
}
.photo{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<c:if test="${pdto == null}">
	<form name="designerInfo">
		<section class="profile">
				<img class="photo" src="profileimg/profile.PNG">
				<a class="btn btn-secondary" href="#">1:1의뢰하기</a><br>
				<h4>${udto.u_nick}</h4><br>
				우승 ${win}회
		</section>
	</form>
</c:if>
<c:if test="${pdto != null}">
<form name="designerInfo">
	<section class="profile">
		<fieldset>
			<img class="photo" src="profileimg/${pdto.p_img}">
			<a class="btn btn-secondary" href="#">1:1의뢰하기</a><br>
			<h4>${udto.u_nick}</h4><br>
			우승 ${win}회
		</fieldset>
	</section>
</form>
</c:if>
	<section>
		<hr>
		<h5><a href="portfolio.do">포트폴리오</a> <a href="review.do">리뷰</a></h5>
		<hr>
	</section>
<form name="portfoilos">
	<section>
		<table>
			<c:if test="${empty lists}">
				<tfoot>
					<tr>
						<td colspan="2">리뷰가 없습니다.</td>
					</tr>
				</tfoot>
			</c:if>
			<tbody>
				<tr>
					<c:forEach var="dto" items="${lists}">
							<td>
								<textarea rows="5" cols="30">${dto.rv_content}</textarea>
								<h5>${dto.rv_date}</h5>
							</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<div id="page">${pageStr}</div>
	</section>
</form>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>