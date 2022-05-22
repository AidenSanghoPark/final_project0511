<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.gallery-block{
	padding-bottom: 60px;
	padding-top: 60px;
}

.gallery-block .heading{
    margin-bottom: 50px;
    text-align: center;
}

.gallery-block .heading h2{
    font-weight: bold;
    font-size: 1.4rem;
    text-transform: uppercase;
}

.gallery-block.cards-gallery h6 {
  font-size: 17px;
  font-weight: bold; 
}

.gallery-block.cards-gallery .card{
  transition: 0.4s ease; 
}

.gallery-block.cards-gallery .card img {
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15); 
}

.gallery-block.cards-gallery .card-body {
  text-align: center; 
}

.gallery-block.cards-gallery .card-body p {
  font-size: 15px; 
}

.gallery-block.cards-gallery a {
  color: #212529; 
}

.gallery-block.cards-gallery a:hover {
  text-decoration: none; 
}

.gallery-block.cards-gallery .card {
  margin-bottom: 30px; 
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
}

@media (min-width: 576px) {

	.gallery-block .transform-on-hover:hover {
	    transform: translateY(-10px) scale(1.02);
	    box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.15) !important; 
	}
}

.img-rounded {
    width: auto;
    display: inline-block;
    -webkit-border-radius: 0;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 0;
    -moz-background-clip: padding;
    border-radius: 50%;
    background-clip: padding-box;
    width: 130px;
    height: 130px;

</style>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${udto.u_nick}님의 포트폴리오</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
    <link rel="stylesheet" href="cards-gallery.css">
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">


   <section class="gallery-block cards-gallery"><br>
	    <div class="container"><br>
	        <div class="heading"><br>
	        <img src="profileimg/${pdto.p_img}" class="img-rounded"><br><br>
	          <h2>${udto.u_nick}님의 포트폴리오</h2>
    
	        </div>
	        <div class="row">
	        <c:forEach var="dto" items="${lists}">
	            <div class="col-md-6 col-lg-4">
	                <div class="card border-0 transform-on-hover">
	                	<a class="lightbox">
	                		<img src="img/${dto.d_img_1}" alt="portfolioPhoto" class="card-img-top">
	                	</a>
	                    <div class="card-body">
	                        <h6>${dto.d_name}</h6>
	                    </div>
	                </div>
	            </div>
	           </c:forEach>
	        </div>
	        
	        <!-- 모달 -->		    
							  <div class="modal" id="${dto.c_idx}">
						      <div class="modal_body" id="${dto.c_idx}">
						      	
						      	<div style="width: 30%; height:100%; background-color:#EFEFF6; float: right; border-radius: 5px;
						      	  position: sticky; top: 0;">
						      	  	<h6>
						      			<c:if test="${dto.d_win == 1}">우승</c:if>
						      		</h6>
						      		<h2>${dto.d_name}</h2>
						      		<label>
							      		<c:if test="${dto.c_cate == 'logo'}">로고</c:if>
							      		<c:if test="${dto.c_cate == 'character'}">캐릭터</c:if>
							      		<c:if test="${dto.c_cate == 'naming'}">네이밍</c:if>
							      		<c:if test="${dto.c_cate == 'print'}">인쇄</c:if>
						      		</label><hr>
						      		<p style="text-align: left; padding-left: 20px;">${dto.d_content}</p>
						      		<br><hr>
						      		<button class="button" style="width: 230px; height: 50px; border-radius: 3px; " >해당 콘테스트 보기<br></button>
						      	</div>
						      	<div style="float: left;">
						      		<img style="width: 70%; height: 100%; float: left;" src="img/${dto.d_img_2}">
						      	</div>
						      	
						      </div>
							</div>
	        
	    </div>
    </section>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script>
        baguetteBox.run('.cards-gallery', { animation: 'slideIn'});
    </script>
   <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>