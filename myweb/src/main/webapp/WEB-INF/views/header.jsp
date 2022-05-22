<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mainimg{
   width: 200px;
   height: 200px;
   padding-left: 15px;
}
.mainimg{
   width: 100px;
   height: 50px;
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
</style>
<body>
<nav class="navbar navbar-expand navbar-dark fixed-top" aria-label="Second navbar example" style="background-color: black; height: 80px;"> 
   <div style="margin: 0 auto;">
         <nav style="float:left;">        
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                     <a class="nav-link" href="index.do" style="font-size: 20px; text-decoration: none;">Home</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link" href="conList.do" style="font-size: 20px; text-decoration: none;">콘테스트 리스트</a>
                </li>
                  &nbsp;&nbsp;&nbsp;&nbsp;
               <li class="nav-item">
                    <a class="nav-link" href="categoryChoice.do" style="font-size: 20px; text-decoration: none;">콘테스트 개최</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="designer.do" style="font-size: 20px; text-decoration: none;">디자이너</a>
                </li>
                <c:if test="${!empty login}">
                  <li class="nav-item" style="text-align: right;" id="headerli">                
                      <span class="nav-link active" aria-current="page" style="width: 100%; float: right; padding-right: 50px;">
                      <b><a href="myPage.do" style="text-decoration: none;">${login.u_name}</a></b>&nbsp;&nbsp;
                      <a href="logout.do" style="text-decoration: none;">로그아웃</a></span>
                  </li>
           		</c:if>
             </ul>  
       </nav>
    </div>
 </nav>
</body>
</html>