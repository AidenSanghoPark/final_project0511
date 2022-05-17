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
.portfoilos{
	float: center;
	text-align: center;
}
.page{
	float: center;
}
table {
	float: center;
	text-align: center;
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
						<td colspan="3">참여한 콘테스트가 없습니다.</td>
					</tr>
				</tfoot>
			</c:if>
			<tbody>
				<tr>
					<c:forEach var="dto" items="${lists}">
						<td>
							<a href="#"><img src="designimg/${dto.d_img_1}.PNG"></a><br>
							<label><a href="#">${dto.d_name}</a></label>
						</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<div id="page">${pageStr}</div>
	</section>
</form>
<!— Button trigger modal —>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!— Modal —>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <textarea></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">리뷰작성</button>
      </div>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>