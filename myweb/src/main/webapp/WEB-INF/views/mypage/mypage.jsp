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
 padding-left:180px;
 padding-top:170px;
}
.profile h3{
	text-decoration: none;
	color:gray;
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
	color:gray;
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
<c:forEach var="userinfo" items="${userinfo }">
	<c:choose>
		<c:when test="${userinfo.u_type!='1' }">
			<section class="profile">
				<c:if test="${empty pdto.p_img}">
					<img class="photo" src="profileimg/profile.PNG"><br><br>
				</c:if>
				<c:if test="${not empty pdto.p_img}">
		      	<img class="photo" src="profileimg/${pdto.p_img}"><br><br>
		      	</c:if>
		        <h5><a href="profile.do" style="font-weight: bold;">${userinfo.u_name } 님</a></h5>
		        		<fieldset style="border-radius:3px;  background-color:skyblue; width:50px;height:13px; margin: auto">
		        		<h6 style="color:#ffffff;align:center;font-size: 11px;">디자이너</h6>
		        		</fieldset>
		        <p>${userinfo.u_email }</p>
		        <c:url var="contentUrl" value="portfolio2.do">
					<c:param name="u_idx">${userinfo.u_idx}</c:param>
				</c:url>
		        <p><a class="btn btn-secondary" href="${contentUrl}">포트폴리오 관리</a></p><br>
		        <h3><a href="profile.do">프로필 관리</a></h3><br>		
   			 	<h3><a href="wallet.do">가상계좌</a></h3><br>
		        <h3><a href="accountConfig.do">계정설정</a></h3><br>
		    </section>
		    <section class="coninfo">
 			  <h3 style="color:gray; padding-top: 40px;">참여한 콘테스트</h3><br>
		      <c:choose>
	    		<c:when test="${empty dlists }">
   					<h3 style="color:gray;padding-left:300px;padding-top:200px;">아직 콘테스트에 참여하지 않으셨습니다.</h3>
	    		</c:when>
		    	<c:otherwise>
			    	<c:forEach var="ddto" items="${dlists }">
				    	<fieldset>
				    		<img src="mypageimg/cateimg.jpg">
				    		<label style="color:blue;">참여일:${ddto.d_date }</label>|<label>${ddto.d_name }</label>
				    	</fieldset><br>
			    	</c:forEach>
		    		<div id="page">${dpageStr }</div>
		    	</c:otherwise>
	    	  </c:choose>
	    	  <!-- client -->
	    	</section>
    	</c:when>
    	<c:otherwise>
	    	<section class="profile">
		      	<img class="photo" src="profileimg/profile.PNG">
		        <h5><a href="profileConfig.do">${userinfo.u_name } 님</a></h5>
		       		<fieldset style="border-radius:3px;  background-color:skyblue; width:50px;height:13px; margin: auto">
		        	<h6 style="color:#ffffff;align:center;font-size: 11px;">의뢰자</h6>
		        	</fieldset>
		        <p>${userinfo.u_email }</p>		
		   			 	<h3><a href="showPayInfo.do">거래내역</a></h3><br>
		        <h3><a href="accountConfig.do">계정설정</a></h3><br>
		    </section>
	    	<section class="coninfo">
   			 	<h3 style="color:gray">개최한 콘테스트</h3><br>
	    		<c:choose>
		    		<c:when test="${empty lists }">
		    					<h3 style="color:gray;padding-left:300px;padding-top:200px;">아직 콘테스트를 등록하지 않으셨습니다.</h3>
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
    	</c:otherwise>
   	</c:choose>
</c:forEach>
<div style="padding-top:1200px;">
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>
