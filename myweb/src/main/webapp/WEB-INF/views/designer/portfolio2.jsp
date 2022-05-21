<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${udto.u_nick}님의 포트폴리오</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
    <link rel="stylesheet" href="cards-gallery.css">
    
    
<style>
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
.profile-photo-lg{
  height: 100px;
  width: 100px;
  border-radius: 50%;
}


.modal {
		position: fixed;
        top: 30%;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;
		height: 100%;
		margin: 10px;
        width: 1000px;
		overflow-y: auto;
        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      .modal-dialog{
    overflow-y: initial !important
	}
	
	
	.member-entry {
  border: 1px solid #ebebeb;
  padding: 15px;
  margin-top: 15px;
  margin-bottom: 30px;
  -moz-box-shadow:  0 1.5rem 4rem rgba(22, 28, 45, 0.1);
  -webkit-box-shadow:  0 1.5rem 4rem rgba(22, 28, 45, 0.1);
  box-shadow: 1 0 1.5rem 4rem rgba(22, 28, 45, 0.1);
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
  -webkit-border-radius: 3px;
  -webkit-background-clip: padding-box;
  -moz-border-radius: 3px;
  -moz-background-clip: padding;
  border-radius: 3px;
  background-clip: padding-box;
  background:#fff;
    -webkit-box-shadow: 0 2px 2px 0 rgba(0,0,0,0.2),0 6px 10px 0 rgba(0,0,0,0.3);
    box-shadow: 0 2px 2px 0 rgba(0,0,0,0.2),0 6px 10px 0 rgba(0,0,0,0.3);
}
.member-entry:before,
.member-entry:after {
  content: " ";
  display: table;
}
.member-entry:after {
  clear: both;
}
.member-entry .member-img,
.member-entry .member-details {
  float: left;
}
.member-entry .member-img {
  position: relative;
  display: block;
  width: 10%;
}
.member-entry .member-img img {
  width: 100%;
  display: block;
  max-width: 100%;
  height: auto;
  border-radius: 50%;
}
.member-entry .member-img i {
  position: absolute;
  display: block;
  left: 50%;
  top: 50%;
  margin-top: -12.5px;
  margin-left: -12.5px;
  color: #FFF;
  font-size: 25px;
  zoom: 1;
  -webkit-opacity: 0;
  -moz-opacity: 0;
  opacity: 0;
  filter: alpha(opacity=0);
  -moz-transform: scale(0.5);
  -webkit-transform: scale(0.5);
  -ms-transform: scale(0.5);
  -o-transform: scale(0.5);
  transform: scale(0.5);
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-img:hover i {
  -moz-transform: scale(1);
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);
  zoom: 1;
  -webkit-opacity: 1;
  -moz-opacity: 1;
  opacity: 1;
  filter: alpha(opacity=100);
}
.member-entry .member-details {
  width: 89.9%;
}
.member-entry .member-details h4 {
  font-size: 18px;
  margin-left: 20px;
}
.member-entry .member-details h4 a {
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-details .info-list {
  margin-left: 5px;
}
.member-entry .member-details .info-list > div {
  margin-top: 5px;
  font-size: 13px;
}
.member-entry .member-details .info-list > div a {
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-details .info-list > div i {
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-details .info-list > div:hover i {
  color: #4f5259;
}
@media screen and (max-width: 768px) {
  .member-entry .member-img {
    width: 18%;
  }
  .member-entry .member-details {
    width: 81.9%;
  }
  .member-entry .member-details h4 {
    margin-top: 0;
  }
}
@media screen and (max-width: 480px) {
  .member-entry .member-img {
    width: 100%;
    float: none;
    text-align: center;
    position: relative;
    background: #f8f8f8;
    margin-bottom: 15px;
    -webkit-border-radius: 3px;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 3px;
    -moz-background-clip: padding;
    border-radius: 3px;
    background-clip: padding-box;
  }
  .member-entry .member-img img {
    width: auto;
    display: inline-block;
    -webkit-border-radius: 0;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 0;
    -moz-background-clip: padding;
    border-radius: 50%;
    background-clip: padding-box;
  }
  .member-entry .member-details {
    width: 100%;
    float: none;
  }
  .member-entry .member-details h4,
  .member-entry .member-details .info-list {
    margin-left: 0;
  }
  .member-entry .member-details h4 > div,
  .member-entry .member-details .info-list > div {
    padding: 0;
  }
  .member-entry .member-details .info-list > div {
    margin-top: 10px;
  }
}
</style>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
		<script src="//code.jquery.com/jquery.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>


</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
<div class="member-entry"> 
    <a class="member-img"> 
        <img src="profileimg/${pdto.p_img}" class="img-rounded">
    </a> 
    <div class="member-details"> 
        <h4>${udto.u_nick}님의 포트폴리오</h4> 
        <div class="row info-list"> 
            <div class="col-sm-4"> 
                ${pdto.p_info}
            </div> 
            <div class="col-sm-4">
            	<i class="fa fa-envelope"></i>
                ${udto.u_email}
            </div> 
            <div class="clear">
            	우승 ${win}회
            </div> 
            <div class="col-sm-4">
            </div> 
            <div class="col-sm-4">	
            </div> 
            <div class="col-sm-4"> 
            </div> 
        </div> 
    </div> 
</div>
	        <div class="row">
	        <c:if test="${empty lists}">
				<div>참여한 콘테스트가 없습니다.</div>
			</c:if>
	        	<c:forEach var="dto" items="${lists}">
	            <div class="col-md-6 col-lg-4">
	                <div class="card border-0 transform-on-hover">
	                	<a class="btn-open-popup">
	                		<img src="img/${dto.d_img_1}" alt="portfolioPhoto" class="card-img-top">
	                	</a>
	                    <div class="card-body">
	                        <h6>${dto.d_name}</h6>
	                    </div>
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
	           </c:forEach>
	        </div>
	    </div>
    <%@include file="/WEB-INF/views/footer.jsp" %>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script>
        baguetteBox.run('.cards-gallery', { animation: 'slideIn'});
    </script>
    
    <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');
      var funcs = [];

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      
      $(document).ready(function () {
    	    $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
    	});
      
    </script>
    
   
</body>
</html>