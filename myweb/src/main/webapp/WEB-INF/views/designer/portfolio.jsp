<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/180c933499.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.profile{
	float: center;
	text-align: center
}
.portfoilos{
	float: center;
	text-align: center;
}
.page{
	float: center;
}
table {
	float: center;
	text-align: center;
}
h5{
	text-align: center;
}
.photo{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
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

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<c:if test="${pdto == null}">
	<form name="designerInfo">
		<section class="profile">
				<img class="photo" src="profileimg/profile.PNG"><br>
				<h4>${udto.u_nick}</h4><br>
				우승 ${win}회
		</section>
	</form>
</c:if>
<c:if test="${pdto != null}">
<form name="designerInfo">
	<section class="profile">
		<fieldset>
			<img class="photo" src="profileimg/${pdto.p_img}"><br>
			<h4>${udto.u_nick}</h4><br>
			우승 ${win}회
		</fieldset>
	</section>
</form>
</c:if>
	<section>
		<hr>
		<h5><a href="portfolio2.do?u_idx=${u_idx}">포트폴리오</a> <a href="review.do?u_idx=${u_idx}">리뷰</a></h5>
		<hr>
	</section>
<form name="portfoilos">
	<section>
		<table>
			<c:if test="${empty lists}">
				<tfoot>
					<tr>
						<td colspan="3">참여한 콘테스트가 없습니다.</td>
					</tr>
				</tfoot>
			</c:if>
			<tbody>
				<tr>
					<c:forEach var="dto" items="${lists}">
						<td>
							<a class="btn-open-popup"><img src="img/${dto.d_img_1}"></a><br>
							<label><a class="btn-open-popup">${dto.d_name}</a></label>
							
							<!-- 모달 -->		    
							  <div class="modal">
						      <div class="modal_body">
						      	
						      	<div style="width: 30%; height:100%; background-color:#EFEFF6; float: right; border-radius: 5px;
						      	  position: sticky; top: 0;">
						      		<h2>${dto.d_name}</h2>
						      		<h4>${udto.u_nick}</h4>
						      		<label>
							      		<c:if test="${dto.c_cate == 'logo'}">로고</c:if>
							      		<c:if test="${dto.c_cate == 'character'}">캐릭터</c:if>
							      		<c:if test="${dto.c_cate == 'naming'}">네이밍</c:if>
							      		<c:if test="${dto.c_cate == 'print'}">인쇄</c:if>
						      		</label><br>
						      		<h6>
						      			<c:if test="${dto.d_win == 1}">우승</c:if>
						      		</h6>
						      		<br><hr>
						      		<p style="text-align: left; padding-left: 20px;">${dto.d_content}</p>
						      		<br><hr>
						      		<button class="button" style="width: 230px; height: 50px; border-radius: 3px; " >해당 콘테스트 보기<br></button>
						      	</div>
						      	<div style="float: left;">
						      		<img style="width: 70%; height: 100%; float: left;" src="img/${dto.d_img_2}">
						      	</div>
						      	
						      </div>
							</div>
						</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<div id="page">${pageStr}</div>
		<!-- modal 구동 버튼 (trigger) -->

	</section>
</form>

 <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

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
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>