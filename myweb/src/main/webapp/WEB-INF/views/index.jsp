<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>DSN</title>
<style>
.banner{
    text-align:center;
}

.counter {
    background-color:#f5f5f5;
    padding: 20px 0;
    border-radius: 5px;
}

.count-title {
    font-size: 40px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.count-text {
    font-size: 13px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.fa-2x {
    margin: 0 auto;
    float: none;
    display: table;
    color: #4ad1e5;
}
.carousel-inner > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 700px;
} 
#main{
	height: 600px;
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/180c933499.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
 </head>
 <body>
<%@ include file="/WEB-INF/views/mainheader.jsp" %>
<main>
 <!-- 캐러샐 -->
 <header class="masthead">
 <section>
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="bimg/main1.jpg" class="d-block w-100" id="main">
				  </div>
				    <div class="carousel-item">
				        <img src="bimg/main2.jpg" class="d-block w-100" id="main">
				    </div>
				    <div class="carousel-item">
				       <img src="bimg/main3.jpg" class="d-block w-100" id="main">
				    </div>
				 </div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
				 <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
		</button>
	</div>
</section> 
</header>
   <br>
   <br>
<!-- 현황보기 -->  

<div class="container">
   <div class="row">
       <br/>
      <div class="col text-center">
      <!-- <h2>Bootstrap 4 counter</h2>
      <p>counter to count up to a target number</p> -->
      </div>
   </div>
   
   <div class="row text-center">
           <div class="col">
           <div class="counter" style="background-color: white;">
      <i class="fa fa-address-card fa-2x" style="color: #205375;"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="${des}" data-speed="1500"></h2><br>
      <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">등록된 디자이너</p>
     <!--   <p class="count-text ">등록된 디자이너</p> -->
    </div>
      </div>
              <div class="col">
               <div class="counter" style="background-color: white;">
      <i class="fa fa-user-circle-o fa-2x" style="color: #205375;"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="${coning}" data-speed="1500"></h2><br>
     <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">진행중인 콘테스트</p>
      <!-- <p class="count-text ">진행중인 콘테스트</p> -->
    </div>
    
              </div>
              <div class="col">
              <div class="counter" style="background-color: white;">
      <i class="fa fa-handshake-o fa-2x" style="color: #205375;"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="${conend}" data-speed="1500"></h2><br>
      <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">완료된 콘테스트</p>
      <!-- <p class="count-text ">완료된 콘테스트</p> -->
    </div></div>
              <div class="col">
              <div class="counter" style="background-color: white;">
      <i class="fa fa-krw fa-2x" style="color: #205375;"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="${consum}" data-speed="1500"></h2><br>
      <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">누적 상금액</p>
      <!-- <p class="count-text ">누적 상금액</p> -->
    </div>
              </div>
         </div>
</div>
<br>
<br>
<hr>
<br>
<!-- 베스트작품 -->
<div style="float: left;">
	<b style="color: gray; font-size: 20px; font-family: Georgia; padding-left: 140px;">
	<i class="fa-solid fa-crown"></i>&nbsp;주간 베스트 작품</b>&nbsp;&nbsp;<small style="color: #035397;">NEW</small>
</div>	  
<div style="float: right;">
	<b style="color: gray; font-size: 20px; font-family: Georgia; padding-left: 140px;">
	<a href="conList.do" style="padding-right: 120px; font-size: 15px; color: gray; text-decoration-line: none;">더보기</a></b>&nbsp;&nbsp;
</div>
 <section class="gallery-block cards-gallery">
       <div class="container">         
               <div class="col-md-6 col-lg-4">
               		<div style="height: 200px;">
	                   <div class="card border-0 transform-on-hover" style="width: 400px; height: 300px; float: left;
	                   position: absolute; left: 140px;">
	                      <a class="btn-open-popup">
	                         <img src="img/main_best1.jfif"class="card-img-top" style="width: 400px; height: 250px;">
	                      </a>             
							<div class="card-body">
	                       </div>                      
	                   </div>
	                   <div class="card border-0 transform-on-hover" style="width: 400px; height: 300px; float: right;
	                   position: absolute; left: 590px;">
	                      <a class="btn-open-popup">
	                         <img src="img/main_best2.jpg"class="card-img-top" style="width: 400px; height: 250px;">
	                      </a>             
							<div class="card-body">
	                       </div>                      
	                   </div>
	                   <div class="card border-0 transform-on-hover" style="width: 400px; height: 300px; float: right;
	                   position: absolute; right: 140px;">
	                      <a class="btn-open-popup">
	                         <img src="img/main_best3.png"class="card-img-top" style="width: 400px; height: 250px;">
	                      </a>             
							<div class="card-body">
	                       </div>                      
	                   </div>    
	                 </div>                   
                   <!-- 모달 -->          
           </div>
       </div>
    </section>
<br><br><br><br>
<div style="float: left;">
	<b style="color: gray; font-size: 20px; font-family: Georgia; padding-left: 140px;">
	<i class="fa-solid fa-crown"></i>&nbsp;월간 베스트 작품</b>&nbsp;&nbsp;<small style="color: #035397;">NEW</small>
</div>	  
<div style="float: right;">
	<b style="color: gray; font-size: 20px; font-family: Georgia; padding-left: 140px;">
	<a href="conList.do" style="padding-right: 120px; font-size: 15px; color: gray; text-decoration-line: none;">더보기</a></b>&nbsp;&nbsp;
</div> 
<section class="gallery-block cards-gallery">
       <div class="container">         
               <div class="col-md-6 col-lg-4">
               		<div style="height: 200px;">
	                   <div class="card border-0 transform-on-hover" style="width: 400px; height: 300px; float: left;
	                   position: absolute; left: 140px;">
	                      <a class="btn-open-popup">
	                         <img src="img/main_best4.jpg"class="card-img-top" style="width: 400px; height: 250px;">
	                      </a>             
							<div class="card-body">
	                       </div>                      
	                   </div>
	                   <div class="card border-0 transform-on-hover" style="width: 400px; height: 300px; float: right;
	                   position: absolute; left: 590px;">
	                      <a class="btn-open-popup">
	                         <img src="img/main_best5.jpg"class="card-img-top" style="width: 400px; height: 250px;">
	                      </a>             
							<div class="card-body">
	                       </div>                      
	                   </div>
	                   <div class="card border-0 transform-on-hover" style="width: 400px; height: 300px; float: right;
	                   position: absolute; right: 140px;">
	                      <a class="btn-open-popup">
	                         <img src="img/main_best6.jpg"class="card-img-top" style="width: 400px; height: 250px;">
	                      </a>             
							<div class="card-body">
	                       </div>                      
	                   </div>    
	                 </div>                   
                   <!-- 모달 -->          
           </div>
       </div>
    </section>	    
<br><br><br><br>	
<!-- 배너 -->  
<section class="banner">
	<div style="align:center;">
		<p class="lead"><img src="img/banner.png" style="align:center; width: 85%;"></p>
	</div>
</section>
<br>
<!-- 후기 샘플 -->
 <div class="album py-5"  style="background-color: white; margin: 0 auto;">
 <div style="padding-left: 150px;">
 	<b style="margin: 0 auto; width: 60%;  color: gray; font-size: 20px; font-family: Georgia;">
 	<i class="fa-solid fa-file-pen"></i>&nbsp;콘테스트 이용 후기</b>
 </div>
 	<br>
 	<br>
    <div class="container">
    	<table>
    		<tr>
    			<td>
          			&nbsp;
          		</td>
    			<td>
          			<img src="img/main_re1.jpg" style="width: 300px; height: 300px;">
          			<br><br>
          			<b>로고 디자인</b>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<small style="color: #2155CD;">★★★★★5점</small>
          			<small style="color: gray;">너무 친절하고 디자인 너무 맘에 들어요~~ 강추 합니다!!</small>
          		</td>          		
          		<td>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		</td>
          		<td>
          			<img src="img/main_re2.jpg" style="width: 300px; height: 300px;">
          			<br><br>
          			<b>로고 디자인</b>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<small style="color: #2155CD;">★★★★★5점</small>
          			<small style="color: gray;">결과물 완전 만족하구요. 친절하시고 피드백도 빠르십니다. 감사합니다!</small>
          		</td>
          		<td>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		</td>
          		<td>
          			<img src="img/main_re3.jpg" style="width: 300px; height: 300px;">
          			<br><br>
          			<b>캐릭터 디자인</b>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			&nbsp;&nbsp;&nbsp;&nbsp;
          			<small style="color: #2155CD;">★★★★★5점</small>
          			<small style="color: gray;">너무 친절하고 디자인 너무 맘에 들어요~~ 강추 합니다!!</small>
          		</td>
          		<td>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		</td>
          		<td>
          			<img src="img/main_re4.jpg" style="width: 300px; height: 300px;">
          			<br><br>
          			<b>캐릭터 디자인</b>
          			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			&nbsp;&nbsp;&nbsp;&nbsp;
          			<small style="color: #2155CD;">★★★★★5점</small>
          			<small style="color: gray;">요청 사항이 많았는데 친절하게 수정해주셔서 너무 감사했습니다...</small>
          		</td>
          	</tr>
    	</table>
    </div>
  </div>  
  <br>
<hr>

<!-- gif 이미지 -->	
	<br>    
	<section style="height: 500px; width: 100%; margin: 0 auto; font-family: bold;">
		 <div style="width: 50%; float: left; padding-left: 200px; padding-top: 150px;">	
		 	<h3 style="color: gray;"><b>No.1 크리에이티브 플랫폼</b></h3><br>
		 	<h1><b>디자인부터 네이밍, 아이디어까지</b></h1><br>
			<h1><b>10만 명의 전문가에게 의뢰하세요.</b></h1>	
		</div>
		<div style="padding-right: 120px; padding-top: 70px;">	    
		    <img src="img/maingif.gif" style="width: 40%; height: 90%; float: right;">	    
		 </div>
	</section>
	 <br>
	 <br>
	 <br>
<!-- 배너 -->	 
	 <section class="banner">
		<div style="align:center;">
			<p class="lead"><img src="img/banner2.png" style="align:center; width: 85%;"></p>
		</div>
	</section>
	<br>
	<br>
</main>
<%@ include file="/WEB-INF/views/footer.jsp" %>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>  
 </body>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
 <script>
(function ($) {
   $.fn.countTo = function (options) {
      options = options || {};
      
      return $(this).each(function () {
         // set options for current element
         var settings = $.extend({}, $.fn.countTo.defaults, {
            from:            $(this).data('from'),
            to:              $(this).data('to'),
            speed:           $(this).data('speed'),
            refreshInterval: $(this).data('refresh-interval'),
            decimals:        $(this).data('decimals')
         }, options);
         
         // how many times to update the value, and how much to increment the value on each update
         var loops = Math.ceil(settings.speed / settings.refreshInterval),
            increment = (settings.to - settings.from) / loops;
         
         // references & variables that will change with each update
         var self = this,
            $self = $(this),
            loopCount = 0,
            value = settings.from,
            data = $self.data('countTo') || {};
         
         $self.data('countTo', data);
         
         // if an existing interval can be found, clear it first
         if (data.interval) {
            clearInterval(data.interval);
         }
         data.interval = setInterval(updateTimer, settings.refreshInterval);
         
         // initialize the element with the starting value
         render(value);
         
         function updateTimer() {
            value += increment;
            loopCount++;
            
            render(value);
            
            if (typeof(settings.onUpdate) == 'function') {
               settings.onUpdate.call(self, value);
            }
            
            if (loopCount >= loops) {
               // remove the interval
               $self.removeData('countTo');
               clearInterval(data.interval);
               value = settings.to;
               
               if (typeof(settings.onComplete) == 'function') {
                  settings.onComplete.call(self, value);
               }
            }
         }
         
         function render(value) {
            var formattedValue = settings.formatter.call(self, value, settings);
            $self.html(formattedValue);
         }
      });
   };
   
   $.fn.countTo.defaults = {
      from: 0,               // the number the element should start at
      to: 0,                 // the number the element should end at
      speed: 1000,           // how long it should take to count between the target numbers
      refreshInterval: 100,  // how often the element should be updated
      decimals: 0,           // the number of decimal places to show
      formatter: formatter,  // handler for formatting the value before rendering
      onUpdate: null,        // callback method for every time the element is updated
      onComplete: null       // callback method for when the element finishes updating
   };
   
   function formatter(value, settings) {
      return value.toFixed(settings.decimals);
   }
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
   formatter: function (value, options) {
     return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
   }
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
   var $this = $(this);
   options = $.extend({}, options || {}, $this.data('countToOptions') || {});
   $this.countTo(options);
  }
});
</script>
 </html>
