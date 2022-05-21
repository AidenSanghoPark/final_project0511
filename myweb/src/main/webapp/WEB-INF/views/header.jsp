<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<style>
.mainimg{
	width:150px;
	height:100px;
	padding-left: 15px;
}
#mypagept{
   	width: 20px;
    height: 20px; 
    border-radius: 70%;
}
</style>
<header>
<nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example" style="height: 100px;">   
      <div style="float:left"><a><img src="img/main.jpg" class="mainimg"></a></div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <nav style="float:left; padding-left:10px;">
      <div class="collapse navbar-collapse" id="navbarsExample02">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="conList.do">콘테스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="categoryChoice.do">콘테스트 개최</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="designer.do">디자이너</a>
          </li>
          <li>
            <a class="nav-link" href="messege.do">콘테스트 참여</a>
          </li> 
          <li class="nav-item">
            <a class="nav-link" href="allReview.do">리뷰</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="contestEndChoice.do">콘테스트 끝</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contestContent.do?c_idx=58&d_idx=36">참여작 상세보기</a>
          </li>
              
            <c:choose>
				<c:when test="${empty login}">          			
					<li class="nav-item" style="padding-left: 700px;"><a class="nav-link" href="login.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="joinChoice.do">회원가입</a></li>
				</c:when>
			<c:otherwise>
					<a class="nav-link">${login.u_name}님 로그인중</a> | <a class="nav-link" href="logout.do">로그아웃</a>
				</c:otherwise>
			</c:choose>	
			 <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <img id="mypagept" src="img/mypage.jpg">
		          </a>
          		<div class="dropdown-menu" aria-labelledby="navbarDropdown" border="1">
	          		<img src="img/mypage.jpg" style="width: 70px; height: 70px; border-radius: 70%; padding-left: 50px;">	          		
          		</div>
       		 </li>
        </ul>
       </div>
       </nav>
        <!--<div id="loginJoin" style="padding-left: 750px;">
	       	<c:choose>
				<c:when test="${empty login}">
				<nav>
					 <div class="collapse navbar-collapse" id="navbarsExample02">
						<ul class="navbar-nav me-auto">
							<li class="nav-item">          			
								<a class="nav-link active" aria-current="page" href="login.do">로그인</a> | <a href="joinChoice.do">회원가입</a>
			         		</li>
						</ul>
					</div>	
				</nav>	
				</c:when>
				<c:otherwise>
					<div><a style="color:yellow;">${login.u_name}님 로그인중</a> | <a href="logout.do">로그아웃</a></div>
				</c:otherwise>
			</c:choose>
        </div>  -->
  </nav>
</header>
