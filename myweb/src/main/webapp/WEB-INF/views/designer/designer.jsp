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
.icons i {
  color: #b5b3b3;
  border: 1px solid #b5b3b3;
  padding: 6px;
  margin-left: 4px;
  border-radius: 5px;
  cursor: pointer;
}

.activity-done {
  font-weight: 600;
}

.list-group li {
  margin-bottom: 12px;
}

.list-group-item {
}

.list li {
  list-style: none;
  padding: 10px;
  border: 1px solid #e3dada;
  margin-top: 12px;
  border-radius: 5px;
  background: #fff;
}

.checkicon {
  color: green;
  font-size: 19px;
}

.date-time {
  font-size: 12px;
}

.profile-image img {
  margin-left: 1px;
}
.designer{
	float: center;
}
.designerName{
	float: right;
}
img {
 	max-width: 100%;
 	max-height: 100%;
}
.profileimg {
	height: 100px;
	 width: 100px;
	 float: left;
}
.desingerNick{
	float: right;
	padding-top: 35px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<form name="designers">
	<h2>&nbsp;&nbsp;&nbsp;디자이너</h2><br>
	<br>
	<div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center activity">
                    <div><span class="activity-done"></span></div>
                    <div class="icons"><input type="text" name="designerName"><input type="submit" value="검색" class="fa fa-search"></div>
                </div>
                <c:forEach var="dto" items="${lists}">
                <div class="mt-3">
                    <ul class="list list-inline">
                        <li class="d-flex justify-content-between">
                            <div class="d-flex flex-row align-items-center"><i class="fa fa-check-circle checkicon"></i>
                                <div class="ml-2">
                                	<div class="profileimg" style="padding:10px;"><img src="profileimg/${pdto.p_img}"></div>
                                	<div class="desingerNick" style="padding-left: 10px; font-weight: bold;">${dto.u_nick}</div>
                                    <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                    </div>
                                    <div>
                                    	<span class="ml-2" style="padding-left: 15px;">
	                                    	<input type="button" value="포트폴리오" onclick="#">&nbsp;&nbsp;
	                                    	<input type="button" value="이메일" onclick="#">
                                    	</span>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center" style="width:400px;">
                                <div class="d-flex flex-column mr-2" style="width:400px;">
                                    <c:forEach var="photo" items="${photos}">
		                                    <div class="profile-image">
		                                    	<img src="img/${photo.d_img_1}" width="100">&nbsp;&nbsp;&nbsp;&nbsp;
		                                    </div>
                                    </c:forEach>
                                </div>
                                <i class="fa fa-ellipsis-h"></i>
                            </div>
                        </li>
                    </ul>
                </div>
                </c:forEach>
                <div id="page">${pageStr}</div>
            </div>
        </div>
    </div>
</form>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>