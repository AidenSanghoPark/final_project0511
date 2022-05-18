<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<title>공지사항</title>

<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style type="text/css">
.pagination li{
	height: 20px;
}
a:link{
	color:gray;
	text-decoration: none;
}
a:hover {
  color : black;
}
.banner{
 	text-align:center;
}
.mk_page_benner{
	background: url(https://www.loud.kr/images_rn/cl_dgMarket/cover_bg_img.png) center center no-repeat;
	background-size: cover;
	height: 240px;
}

.mk_page_title {
    text-align: center;
    color: #fff;
    font-size: 18px;
    padding-top: 95px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="mk_section mk_page_benner">
	<div class="mk_sector">
		<div class="mk_page_title">
			<h1 style="font-weight:bold;">
				고객센터
				<small>
					-
					공지사항				</small>
			</h1>
      DSN의 최근 소식을 만나보세요.

		</div>
	</div>
</div>
<main style="width: 70%; margin: auto; text-align: center;">
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th style="width: 20%">번호</th>
				<th style="width: 60%">제목</th>
				<th style="width: 20%">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty lists}">
				<tr>
					<td colspan="3" align="center">
						등록된 공지사항이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.n_idx}</td>
 				<c:url var="contentUrl" value="noticeCont.do">
					<c:param name="n_idx">${dto.n_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open">${dto.n_subject}</a></td>
				<td>${dto.n_date}</td>		
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" align="center">
					${pageStr}
				</td>
			</tr>
		</tfoot>
	</table>
	</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</body>
</html>















