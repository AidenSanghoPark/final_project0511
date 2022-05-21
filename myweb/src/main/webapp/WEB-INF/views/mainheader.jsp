<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
 <!-- SimpleLightbox plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
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
.mainimg{
	width: 100px;
	height: 50px;
}
#mainNavigation a {
  font-family: 'Cabin', sans-serif;
  font-size:14px;
  text-transform:uppercase;
  letter-spacing:2px;
  text-shadow:1px 1px 2px rgba(0,0,0,0.4)
}

.dropdown-menu {
  background:#03727d
}
a.dropdown-toggle {
  color:#dfdfdf !important
}
a.dropdown-item:hover {
  color:#03727d !important
}
.nav-item a{
  color:#dfdfdf;
}
.nav-item a:hover {
  color:#fff
}
.nav-item{
  min-width:12vw;
}
#mainNavigation {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  z-index:123;
  padding-bottom:120px;
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#000000+0,000000+100&0.65+0,0+100;Neutral+Density */
background: -moz-linear-gradient(top,  rgba(0,0,0,0.65) 0%, rgba(0,0,0,0) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  rgba(0,0,0,0.65) 0%,rgba(0,0,0,0) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  rgba(0,0,0,0.65) 0%,rgba(0,0,0,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */
}
#navbarNavDropdown.collapsing .navbar-nav,
#navbarNavDropdown.show .navbar-nav{
  padding-left: 50px;
  padding:12px;
}
#haderli{
  float: left;
}
</style>
<header>
<div id="mainNavigation">
  <nav role="navigation">
    <div class="py-3 text-center border-bottom">
 	 <img src="bimg/maintitle.png" style="width: 100px; height: 50px;">
    	<div>
    	<c:choose>
    		<c:when test="${empty login}">  
			      <ul class="navbar-nav mx-auto">
			      	<li class="nav-item" style="text-align: right;" id="headerli">	          	
			          	<span class="nav-link active" aria-current="page" style="width: 20%; float: right; padding-right: 50px;">
			          	<a href="login.do" style="text-decoration: none;">로그인</a>&nbsp;&nbsp; 
			          	<a href="joinChoice.do" style="text-decoration: none;">회원가입</a></span>
			        </li>
			      </ul>
			</c:when>
			<c:otherwise>
					<ul class="navbar-nav mx-auto">
			      	<li class="nav-item" style="text-align: right;" id="headerli">	          	
			          	<span class="nav-link active" aria-current="page" style="width: 20%; float: right; padding-right: 50px;">
			          	<b><a href="myPage.do" style="text-decoration: none;">${login.u_name}</a></b>&nbsp;&nbsp;
			          	<a href="logout.do" style="text-decoration: none;">로그아웃</a></span>
			        </li>
			      </ul>
			</c:otherwise>      
		</c:choose>      
	    </div>	  	       
    </div>
  </nav>  
<div>
</div>   
  <div class="navbar-expand-md">
    <div class="navbar-dark text-center my-2">
      <button class="navbar-toggler w-75" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span> <span class="align-middle">Menu</span>
      </button>
    </div>
    <div class="text-center mt-3 collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav mx-auto ">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.do" style="font-size: 20px;">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="conList.do" style="font-size: 20px;">콘테스트 리스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="categoryChoice.do" style="font-size: 20px;">콘테스트 개최</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="designer.do" style="font-size: 20px;">디자이너</a>
        </li>
      </ul>
    </div>
  </div>
</div>
<!-- Navigation-->
</header>
