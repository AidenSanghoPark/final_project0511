<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<style>
header{
	position: relative;
}
.htitle{
	background-color:grey;
	width:100%;
	height:80px;
	
}
.hul li{
	list-style: none;
	float:left;
	margin-left: 30px;
	padding-top: 30px;
}
.sright{
	padding-top: 30px;
	padding-right: 30px;
	margin-left: 30px;
/* }
.mpmodal{
	width:300px;
	height:300px; 
	background-color:green;
	position: absolute;
	z-index: 999;
	right:0;
} */
</style>
<header>
<%-- <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
    
      <div style="float:left"><a href="index.do"><img src="img/main.jpg" class="mainimg"></a></div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <nav style="float:left; padding-left:10px;">
      <div class="collapse navbar-collapse" id="navbarsExample02">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">콘테스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">콘테스트 개최</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">디자이너</a>
          </li>
          <li>
          	<a href="writeReview.do">임시 후기작성</a>
          </li>
        </ul>
       </div>
       </nav>
  </nav>
  <section style="float:right">
        <div id="loginJoin">
	       	<c:choose>
				<c:when test="${empty login}">
					<div><a href="loginPage.do">로그인</a> | <a href="joinChoice.do">회원가입</a></div>
				</c:when>
				<c:otherwise>
					<div>님 로그인중 | <a href="logout.do">로그아웃</a></div>
				</c:otherwise>
			</c:choose>
        </div>
        <div id="loginJoin" style="text-align: right;">
       	 	<a href="myPage.do"><label>임시 마이페이지</label></a>
        </div>
        </section> --%>
     <div class="htitle">
        	<div style="float:left;">
        	
        <ul class="hul">
        	<li>
        	<img src="img/main.jpg" class="mainimg" style="width:80px; height:50px;">
        	</li>
          <li>
            <a aria-current="page" href="#">콘테스트</a>
          </li>
          <li class="nav-item">
            <a href="#">콘테스트 개최</a>
          </li>
          <li class="nav-item">
            <a href="#">디자이너</a>
          </li>
          <li>
          	<a href="writeReview.do">임시 후기작성</a>
          </li>
        </ul>
     </div>
        	<div style="float:right;">
        		<div class="sright">
        		<c:choose>
				<c:when test="${empty login}">
					<div><a href="loginPage.do">로그인</a> | <a href="joinChoice.do">회원가입</a></div>
				</c:when>
				<c:otherwise>
					<div>님 로그인중 | <a href="logout.do">로그아웃</a>
					<a href="myPage.do"><label>임시 마이페이지</label></a></div>
				</c:otherwise>
			</c:choose>
			</div>
        	</div>
        </div>
<!--         <div class="mpmodal">
        	
        </div> -->
</header>
