<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<style>
.mainimg{
	width:90px;
	height:50px;
	padding-left: 15px;
}
</style>
<header>
<nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
    
      <div style="float:left"><a><img src="img/main.jpg" class="mainimg"></a></div>
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
            <a class="nav-link" href="contestChoice.do">콘테스트 개최</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="designer.do">디자이너</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contestJoin.do">콘테스트 참여</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="messege.do">콘테스트 참여</a>
          </li>
        </ul>
       </div>
       </nav>
        <div id="loginJoin">
	       	<c:choose>
				<c:when test="${empty login}">
					<div><a href="login.do">로그인</a> | <a href="joinChoice.do">회원가입</a></div>
				</c:when>
				<c:otherwise>
					<div><a style="color:yellow;">${login.u_name}님 로그인중</a> | <a href="logout.do">로그아웃</a></div>
				</c:otherwise>
			</c:choose>
        </div>
        <div id="loginJoin" style="text-align: right;">
       	 	<a href="myPage.do"><label>임시 마이페이지</label></a>
        </div>
  </nav>
</header>
