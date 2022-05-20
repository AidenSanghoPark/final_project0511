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
.ratings i {
	 color: green;
}

.install span {
	 font-size: 12px;
}

.col-md-4 {
	 margin-top: 27px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<h1>리뷰 게시판</h1>

<!--  
<c:if test="${empty lists}">
	<tr>
		<td colspan="5" align="center">
			등록된 게시글이 없습니다.
		</td>
	</tr>
</c:if>
-->

<c:forEach var="dto" items="${lists}">
	<div class="container mt-5">
	        <div class="row">
	            <div class="col-md-4">
	                <div class="card p-3">
	                    <div class="d-flex flex-row mb-3"><img src="img/${dto.d_img_1}" width="70">
	                        <div class="d-flex flex-column ml-2"><span>${dto.c_cate}</span><span class="text-black-50">{dto.u_idx}</span><span class="ratings"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
	                    </div>
	                    <h6>{dto.rv_content}</h6>
	                    <div class="d-flex justify-content-between install mt-3"><span>${dto.rv_date}</span></div>
	            	 </div>
	         	</div>
	    	</div>
	</div>
</c:forEach>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>