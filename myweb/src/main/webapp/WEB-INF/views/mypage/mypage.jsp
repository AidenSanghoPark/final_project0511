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
<style>
.profile{
 text-align:center;
 float:left;
 padding-left:100px;
 padding-top:60px;
}
.profile h3{
	text-decoration: none;
	color:grey;
}
.coninfo{
	float:left;
	padding-left:120px;
 	padding-top:90px;
}
.coninfo fieldset{
	border:1px groove;
	width:900px;
	height:100px;
	padding-left:8px;
}
.coninfo fieldset label{
	padding-top:35px;
}
#page{
	text-align:center;
}
a {
	text-decoration: none;
	color:grey;
}
ul{
	list-style:none;
}
.photo{
   width: 150px;
    height: 150px; 
    border-radius: 70%;
}
</style>
</head>
<%@include file="/WEB-INF/views/header.jsp" %>
<body>
	<section class="profile">
	<c:forEach var="userinfo" items="${userinfo }">
      	<img class="photo" src="profileimg/pi.jpg">
        <h5><a href="profileConfig.do">${userinfo.u_name } 님</a></h5>
        <p>${userinfo.u_email }</p>
        <p><a class="btn btn-secondary" href="#">포트폴리오 관리</a></p><br>
        <h3>참여한 콘테스트</h3><br>
        <h3>1:1 의뢰 관리</h3><br>
        <h3><a href="wallet.do">가상계좌</a></h3><br>
        <h3><a href="accountConfig.do">계정설정</a></h3><br>
     </c:forEach>
    </section>
    <section class="coninfo">
    	<h3 style="color:grey">참여한 콘테스트</h3><br>
    	<c:choose>
    		<c:when test="${empty lists }">
    		<h3 style="color:grey;padding-left:300px;padding-top:200px;">아직 콘테스트에 참여하지 않으셨습니다.</h3>
    		</c:when>
    	<c:otherwise>
    	<c:forEach var="dto" items="${lists }">
    	<fieldset>
    		<img src="mypageimg/cateimg.jpg">
    		<label style="color:blue;">${dto.c_cate }</label>|<label>${dto.c_subject }</label>
    	</fieldset><br>
    	</c:forEach>
    	<div id="page">${pageStr }</div>
    	</c:otherwise>
    	</c:choose>
    
    </section>
<div style="padding-top:1200px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>

</html>