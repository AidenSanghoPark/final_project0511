<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</style>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
      <script src="//code.jquery.com/jquery.js"></script>
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
<script src="https://kit.fontawesome.com/180c933499.js" crossorigin="anonymous"></script>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
   <section class="gallery-block cards-gallery">
       <div class="container">
           <div class="heading" style="background-color: #dcdcdc; border-radius:10px; padding-top: 10px; padding-bottom: 15px;">
              <img class="profile-photo-lg" src="profileimg/${pdto.p_img}"><br>
             <h2 style="font-weight: bold; font-size: 22px;">${udto.u_nick}님 포트폴리오</h2>
             <label style="color: #696969;">${pdto.p_info}</label>
           </div>
           <div class="row" style="font-size: 20px; text-align: center; font-weight: bold; padding-left: 30px;">
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
                                <h6 style="padding-top: 10px;">
                                 <c:if test="${dto.d_win == 1}"><i class="fa-solid fa-crown"></i>&nbsp;우승</c:if>
                              </h6>
                              <h3 style="font-weight: bold;">${dto.d_name}</h3>
                              <label style="border-radius:3px;  background-color: #a9a9a9; width:50px; height:19px; margin: auto; color:#ffffff; font-size: 13px;">
                                 <c:if test="${dto.c_cate == 'logo'}">로고</c:if>
                                 <c:if test="${dto.c_cate == 'character'}">캐릭터</c:if>
                                 <c:if test="${dto.c_cate == 'naming'}">네이밍</c:if>
                                 <c:if test="${dto.c_cate == 'print'}">인쇄</c:if>
                              </label><hr>
                              <label style="text-align: left; padding-left: 10px;">${dto.d_content}</label><hr>
                              <br><hr>
                           </div>
                           <div>
                              <img style="width: 70%; height: 100%; float: left; padding-right: 40px;" src="img/${dto.d_img_2}">
                           </div>
                           
                        </div>
                     </div>
               </div>
              </c:forEach>
           </div>
       </div>
    </section>
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