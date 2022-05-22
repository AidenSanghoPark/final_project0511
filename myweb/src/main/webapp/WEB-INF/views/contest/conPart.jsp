<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>참여작 페이지 | DSN</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
.circle-img {

    object-fit: cover;

    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/

    border-radius: 50%;/*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/

    width: 100px; 

    height: 100px;

}

body{margin-top:20px;
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
    border-radius: 0;
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
  header{
    border-bottom: 1px solid rgba(0,0,0,0.075);
    box-shadow: 0 0 5px rgba(0,0,0,0.75);
    background: #fff;

  }
  header .inner{
    max-width: 980px;
    height: 78px;
    margin: 0 auto;
  }
  body {
  min-height: 100vh;
  min-height: -webkit-fill-available;
}

html {
  height: -webkit-fill-available;
}

main {
  display: flex;
  flex-wrap: nowrap;
  height: 100vh;
  height: -webkit-fill-available;
  max-height: 100vh;
  overflow-x: auto;
  overflow-y: hidden;
}

.b-example-divider {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.bi {
  vertical-align: -.125em;
  pointer-events: none;
  fill: currentColor;
}

.dropdown-toggle { outline: 0; }

.nav-flush .nav-link {
  border-radius: 0;
}

.btn-toggle {
  display: inline-flex;
  align-items: center;
  padding: .25rem .5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, .65);
  background-color: transparent;
  border: 0;
}
.btn-toggle:hover,
.btn-toggle:focus {
  color: rgba(0, 0, 0, .85);
  background-color: #cfe2f3;
}

.btn-toggle::before {
  width: 1.25em;
  line-height: 0;
  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  transition: transform .35s ease;
  transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
  color: rgba(0, 0, 0, .85);
}
.btn-toggle[aria-expanded="true"]::before {
  transform: rotate(90deg);
}

.btn-toggle-nav a {
  display: inline-flex;
  padding: .1875rem .5rem;
  margin-top: .125rem;
  margin-left: 1.25rem;
  text-decoration: none;
}
.btn-toggle-nav a:hover,
.btn-toggle-nav a:focus {
  background-color: #cfe2f3;
}

.scrollarea {
  overflow-y: auto;
}

.fw-semibold { font-weight: 600; }
.lh-tight { line-height: 1.25; }
  
a{
	text-decoration: none;
}
.button {
  background-color: #000000;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.button:hover {opacity: 1}

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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/180c933499.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<%@ include file="/WEB-INF/views/header.jsp" %>

<head>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
		<script src="//code.jquery.com/jquery.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
</head>
<hr>
<body style="background-color: #eeeeee;">	

			<div class="member-entry" style="width:900px; padding-left: 20px; margin: 0 auto;"> 
			    <a class="member-img"> 
			         <img src="menuimg/${dto.c_cate }.png" class="circle-img" style="padding-top: 10px;">
			    </a> 
			    <div class="member-details" style="width:750px;"> 
			        <div class="col-sm-4" style="float:left;"> 
			        <c:url var="contentUrl" value="conListContent.do">
					<c:param name="idx"></c:param>
				</c:url>
							<!-- 콘테스트 제목 -->
			                <h4> <a href="" style="text-decoration: none; color: #2E2E2E; font-weight: bold; font-size: 17px;"></a>${dto.c_subject }</h4> 
			                <div style="padding: 10px; padding-left: 10px; width: 500px; height:70px; background-color:#EFEFFB; margin-left: 20px; color: #424242;">
			                	${dto.c_deas } <br><br>
			                </div>
			            </div>
			        <div class="row info-list" style="float:right; text-align: left; width:200px; font-size: 10px; padding-top: 20px;"> 
			            <h3 style="font-size: 20px; font-weight: bold; color: #424242;">상금&nbsp;&nbsp;&nbsp;&nbsp; ${dto.c_pay } 만원</h3> 
			            <h4 style="padding-right: 45px; text-align: right; font-size: 15px; color: gray;"><label style="font-weight: bold;">참여인원</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.u_idx }명</h4> 
			            <h4 style="padding-right: 45px; text-align: right; font-size: 15px; color: gray;"><label style="font-weight: bold;">남은기간</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D${dto.c_datediff }</h4> 
			        </div>    
			    </div> 
			</div>

			<br>
		<div style="margin: 0 auto; padding-left: 315px; float: left;">
			<button class="button">참여작 보기</button>
			<a href="conContent.do?c_idx=${c_idx }"><button class="button">브리핑 보기</button></a>
			<a href="contestJoin.do?c_idx=${c_idx }"><button class="button">콘테스트 참여</button></a>
		</div>
		<br><br><br>
		
<div style="padding-left: 30px; padding-top: 10px; background-color: #ffffff; width: 60%; margin: 0 auto;">
	<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-file-lines"></i>&nbsp;<b>콘테스트 참여작 보기</b></h5>
	<section>
		<table>
			<c:if test="${empty dlists}">
				<tfoot>
					<tr>
						<td colspan="3">참여자가 없습니다 ㄱ-</td>
					</tr>
				</tfoot>
			</c:if>
			<tbody>
				<tr>
					<c:forEach var="dto" items="${dlists}" varStatus="vs">
					
					<td><a class="btn-open-popup"><img style="width: 300px;" src="img/${dto.d_img_1}">
					<p>${dto.d_name }</p></a></td>
					<!-- 모달 -->		    
					<div class="modal">
						<form id="choiceForm" enctype="multipart/form-data" method="post">
					      <div class="modal_body">
					      	
					      	<div style="width: 30%; height:100%; background-color:#EFEFF6; float: right; border-radius: 5px;
					      	  position: sticky; top: 0;">
					      		<h4>${dto.d_name }</h4>
					      		<h4>디자이너 이름</h4>
					      		<input type="hidden" name="c_idx" value="${c_idx}">
					      		<input type="hidden" name="d_idx" value="${dto.d_idx }">
					      		<br>
					      		<p style="text-align: left; padding-left: 20px;">참여작 내용</p>
					      		<br>
					      		<button class="button" style="width: 230px; height: 50px; border-radius: 3px;" id="choice">당선하기<br></button>
					      	</div>
					      	
					      	<div style="float: left;">
					      		<img style="width: 70%; height: 100%; float: left;" src="img/${dto.d_img_2}">
					      		<img style="width: 70%; height: 100%; float: left;" src="img/${dto.d_img_2}">
					      	</div>
					      </div>
					     </form>
					</div>
					</c:forEach>
				</tr>
			</tbody>
			<div>&nbsp;</div>
		</table>
	</section>
</div>
</body>
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
  <script>
        
    $("#choice").click(function(){
    		
            // json 형식으로 데이터 set
            var form = $('#choiceForm')[0];

			// Create an FormData object 
			var data = new FormData(form);
                
            // ajax 통신
            $.ajax({
            	type: "POST",
    			enctype: 'multipart/form-data',
    			url: 'contestEndChoice.do',	// form을 전송할 실제 파일경로
    			data: data,
    			processData: false,
    			contentType: false,
    			cache: false,
    			timeout: 600000,
    			beforeSend : function() {
    				// 전송 전 실행 코드
    			},
    			success: function (data) {
    				// 전송 후 성공 시 실행 코드
    				console.log(data);
    			},
    			error: function (e) {
    				// 전송 후 에러 발생 시 실행 코드
    				console.log("ERROR : ", e);
    			}
            });
        });
            
</script>
</html>