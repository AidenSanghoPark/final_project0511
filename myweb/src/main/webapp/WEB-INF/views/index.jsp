<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
 <head>
 
 <!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
 
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
</style>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

<!-- <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"> -->
 </head>
 <body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<main>
  <!-- 중단영역 -->
  <section>
   <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
       <div class="carousel-item active">
          <img src="bimg/main.png" class="d-block w-100" alt="..." id="main">
        </div>
        <div class="carousel-item">
          <img src="bimg/main2.png" class="d-block w-100" alt="..." id="main">
        </div>
        <div class="carousel-item">
          <img src="bimg/main3.jpeg" class="d-block w-100" alt="..." id="main">
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
<section class="banner">
  <div style="align:center;">
    <p class="lead"><img src="img/banner.png" style="align:center;"></p>
    </div>
   <!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  리뷰작성
</button>

Modal
<form name="review" action="writeReview.do">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <textarea name="rv_content" style="width:450px;height:500px;"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">리뷰작성</button>
      </div>
    </div>
  </div>
</div>
</form> -->
  </section>
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">후기 샘플</p>
	            <div class="d-flex justify-content-between align-items-center">           
                <small class="text-muted">sysdate</small>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">후기 샘플</p>
              <div class="d-flex justify-content-between align-items-center">

                <small class="text-muted">sysdate</small>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text">후기 샘플</p>
              <div class="d-flex justify-content-between align-items-center">
                <small class="text-muted">sysdate</small>
              </div>
            </div>
          </div>
        </div>
        
        
        
      </div>
    </div>
  </div>
</main>

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
	        <div class="counter">
      <i class="fa fa-address-card fa-2x"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="5293" data-speed="1500"></h2><br>
      <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">등록된 디자이너</p>
     <!--   <p class="count-text ">등록된 디자이너</p> -->
    </div>
		</div>
              <div class="col">
               <div class="counter">
      <i class="fa fa-user-circle-o fa-2x"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="521" data-speed="1500"></h2><br>
	  <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">진행중인 콘테스트</p>
      <!-- <p class="count-text ">진행중인 콘테스트</p> -->
    </div>
    
              </div>
              <div class="col">
                  <div class="counter">
      <i class="fa fa-handshake-o fa-2x"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="10254" data-speed="1500"></h2><br>
      <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">완료된 콘테스트</p>
      <!-- <p class="count-text ">완료된 콘테스트</p> -->
    </div></div>
              <div class="col">
              <div class="counter">
      <i class="fa fa-krw fa-2x"></i>
      <h2 class="timer count-title count-number" style="font-weight: bold;" data-to="852181500" data-speed="1500"></h2><br>
      <p style="text-align: center; color: #808080; font-size: 20px; font-weight: bold;">누적 상금액</p>
      <!-- <p class="count-text ">누적 상금액</p> -->
    </div>
              </div>
         </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>  
 </body>
 </html>

