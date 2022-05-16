<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONTEST 개최</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
ul{
   list-style: none;
}
section.pricing {
  background: #007bff;
  background: linear-gradient(to right, white, white);
}

.pricing .card {
  border: none;
  border-radius: 1rem;
  transition: all 0.2s;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.pricing hr {
  margin: 1.5rem 0;
}

.pricing .card-title {
  margin: 0.5rem 0;
  font-size: 0.9rem;
  letter-spacing: .1rem;
  font-weight: bold;
}

.pricing .card-price {
  font-size: 3rem;
  margin: 0;
}

.pricing .card-price .period {
  font-size: 0.8rem;
}

.pricing ul li {
  margin-bottom: 1rem;
}

.pricing .text-muted {
  opacity: 0.7;
}

.pricing .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  opacity: 0.7;
  transition: all 0.2s;
  background-color: black;
}

/* Hover Effects on Card */

@media (min-width: 992px) {
  .pricing .card:hover {
    margin-top: -.25rem;
    margin-bottom: .25rem;
    box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.3);
  }

  .pricing .card:hover .btn {
    opacity: 1;
  }
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="container" style="text-align: center;">
   <ul class="tab_title" style="list-style-type: none;">
       <li class="on" style="float: left;">브리핑 작성</li>
       <li>상금결제</li>
   </ul>
   <br>
   <br>
   <div class="tab_cont" style="background-color: #EFEFEF;">
      <section class="on">
         <form name="naming" action="namingHold.do" method="post" id="ftest">
            <input type="hidden" id="c_cate" name="c_cate" value="${c_cate}">          
               <div style="text-align: left;">
               		<h2>STEP2</h2>
               		<h6>작업 내용을 상세히 설명해 주세요.</h6>
               </div>
               <hr>
               <div>
               		<h5><b>1. 의뢰하실 내용을 설명해주세요.</b></h5>              
               </div>
               <br>              
               <div>
                  <b>콘테스트 제목</b>&nbsp;&nbsp;<input type="text" name="c_subject" id="subject" required>
               </div>
               <div>
                  <b>회사명</b>&nbsp;&nbsp;<input type="text" name="c_company" id="company" required>
               </div>
               <div>
                  <b>서비스설명</b>&nbsp;&nbsp;<textarea  cols="30" name="c_deas" id="deas"></textarea>
               </div>
               <hr>
               <div class="text-lg-end">
               <div style="text-align: center;">
               		<h5><b>2. 어떤 아이디어가 필요하세요?</b></h5>              
               </div>
               <div style="text-align: center;">
	              <br>
	                 <div>
                 		<textarea  cols="30" name="c_idea" id="idea"></textarea>
               		</div>
	               <br>  	             	              
               </div>
               <hr>
               </div>
               <div>
               		<h5><b>3. 디자이너가 참고할 자료?</b></h5>              
               </div>
               <div>
                  <b>디자이너가 참고할 자료</b>&nbsp;&nbsp;<input type="file" value="파일첨부" name="upload" id="fileUp">
               </div>
               <hr>    
                <div>
               		<h5><b>4. 콘테스트 브리핑 상세내용</b></h5>              
               </div>
               <div>
                  <b>상세설명</b>&nbsp;&nbsp;<textarea cols="30" name="c_details" id="details"></textarea>
               </div>
               <hr>
               <br>
               <div>
                  <input style="width: 300px;" type="button" class="btn btn btn-dark" value="다음으로" onclick="nextNaming()">
               </div>
               <br>
               <br>
            </form>
      </section>
      <section style="display: none;">
         <section class="pricing py-5">
  <div class="container">
    <div class="row">
      <!-- 30만원 -->
      <div class="col-lg-4" style="width: 25%;">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">저가형</h5>
            <input type="hidden" value="300000" name="c_pay"/>
            <h6 class="card-price text-center" style="font-size: 25px; color: #383838;">300,000원</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Single User</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>5GB Storage</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
              <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Unlimited
                Private Projects</li>
              <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Dedicated
                Phone Support</li>
              <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Free Subdomain
              </li>
              <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Monthly Status
                Reports</li>
            </ul>
            <div class="d-grid">
             	<input type="button" value="선택" class="btn btn-primary text-uppercase selectPrice">
            </div>
          </div>
        </div>
      </div>
      <!-- 50만원 -->
      <div class="col-lg-4" style="width: 25%;">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
             <input type="hidden" value="500000" name="c_pay"/>
            <h5 class="card-title text-muted text-uppercase text-center">일반형</h5>
            <h6 class="card-price text-center" style="font-size: 25px; color: #383838;">500,000원</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>5 Users</strong></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>50GB Storage</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Private Projects</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Dedicated Phone Support</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Free Subdomain</li>
              <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Monthly Status
                Reports</li>
            </ul>
            <div class="d-grid">
              <input type="button" value="선택" class="btn btn-primary text-uppercase selectPrice" name="c_pay">
            </div>
          </div>
        </div>
      </div>
      <!-- 100만원 고급 -->
      <div class="col-lg-4" style="width: 25%;">
        <div class="card">
          <div class="card-body">
             <input type="hidden" value="1000000" name="c_pay"/>
            <h5 class="card-title text-muted text-uppercase text-center">고급형</h5>
            <h6 class="card-price text-center" style="font-size: 25px; color: #383838;">1,000,000원</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>Unlimited Users</strong>
              </li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>150GB Storage</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public </li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Private</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Dedicated Phone</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>Unlimited</strong> Free Subdomains</li>
            </ul>
            <div class="d-grid">
             	<input type="button" value="선택" class="btn btn-primary text-uppercase selectPrice">
            </div>
          </div>
        </div>
      </div>
       <!-- 150만원 프리미엄 -->
      <div class="col-lg-4" style="width: 25%;">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
             <input type="hidden" value="1500000" name="c_pay"/>
            <h5 class="card-title text-muted text-uppercase text-center">프리미엄형</h5>
            <h6 class="card-price text-center" style="font-size: 25px; color: #383838;">1,500,000원</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>5 Users</strong></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>50GB Storage</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Private Projects</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Dedicated Phone Support</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Free Subdomain</li>
              <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Monthly Status
                Reports</li>
            </ul>
            <div class="d-grid">
              <input type="button" value="선택" class="btn btn-primary text-uppercase selectPrice" name="c_pay">
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div>
      <br>
      <br>
      <br>            
      </div>
         <!-- 총 상금 -->
         <div style="text-align: center;" id="price">   
            <p><span>총상금</span> : <input type="text" id="totalPrice" name="c_pay" style="text-align: right; width: 100px; border:none;"/>원</p>
            <p><span>수수료</span> : <input type="text" id="comm" name="comm" style="text-align: right; width: 100px; border:none;"/>원</p>  
            <p><span>부가세</span> : <input type="text" id="vat" name="vat" style="text-align: right; width: 100px; border:none;"/>원 </p>            
            <p><b>합계</b> : <input type="text" id="t_pay" name="t_pay" style="text-align: right; width: 100px; border:none;"/><b>원</b></p>
         </div>
         <div>
      <br>
      <br>
      <br>            
         </div>
         <div class="d-grid gap-2 col-6 mx-auto">
           <button class="btn btn-primary" type="button" onclick="pay();">KAKAO PAY</button>
      </div>
    </div>
  </div>
</section>
      </section>
   </div>
</div>   
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp03237553"); // 예: imp00000000

//결제번호 생성
function randomNum(){
   var ranNum = Math.floor(Math.random() * 999999);
}

function namingAdd() { 
   //var ckArr = [];
   var cLogo = "";
   var totalCnt = $("input[name='logo']:checked").length;
      //each문이란
      //선택자에대한 모든것을 가져와서 그 수만큼 반복문을 돌린다.
      $("input[name='logo']:checked").each(function(index) {
         //배열넣을때만
         //push란 값을 넣어준다.
         //ckArr.push($(this).val());
         var chkVal = $(this).val(); // 현재 체크 된 값의 value
         var logoCnt = index+1; // index는 0부터 시작하므로 시작점을 1로 맞춰주기 위해 +1함.
         
         cLogo += chkVal;
         
         if(totalCnt != logoCnt){ // 체크된 총 개수와 for문의 마지막 index가 같지않을 경우에만 ',' append
            cLogo += ",";
         }
         
      });
      
      $("#c_logo").val(cLogo);
      
      //ajax는 data주고받기를 json타입으로한다.
      //json key:value 되어있다.
      //java에선 map과 비슷함
            
      var ftest = document.getElementById('ftest');
      var fo = new FormData(ftest);
      $.ajax({
         url: '/myweb/namingHold_add.do', 
         type: 'post',               
         dataType: 'json',
         enctype: 'multipart/form-data',
         contentType: false,            
         processData: false, 
         data: fo,
         success : function(result){
            
         if(!result == '0'){
            alert("저장이 완료되었습니다.");
            
            //$(".tab_title li").eq(1).trigger('click'); // 하단에 $(document).ready에 선언 되어있는
            // .click부분에서 다음단계는 무조건 2번째 즉 section0, section1중 section1이여야 하기 때문에
            // section1을 trigger로 click해줘서 제이쿼리 click이 돌게함.
         }
      }
   });
}

function nextNaming(){
   $(".tab_title li").eq(1).trigger('click'); // 하단에 $(document).ready에 선언 되어있는
    // .click부분에서 다음단계는 무조건 2번째 즉 section0, section1중 section1이여야 하기 때문에
    // section1을 trigger로 click해줘서 제이쿼리 click이 돌게함.
}

function pay(){
//     var totalPrice = $("#totalPrice").val();
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakaopay",
        pay_method: "kakaopay",
        merchant_uid: randomNum(),
        name: "노르웨이 회전 의자",
        amount: $("#t_pay").val(),
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242"
/*         buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181" */
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("결제성공");
            namingAdd();
        } else {
            alert("결제취소");
            // 결제 실패 시 로직,
        }
    });
}

   $(document).ready(function(){
      $(".tab_title li").click(function() {
          var idx = $(this).index();
          $(".tab_title li").removeClass("on");
          $(".tab_title li").eq(idx).addClass("on");
          $(".tab_cont > section").hide();
          $(".tab_cont > section").removeClass("on");
          $(".tab_cont > section").eq(idx).addClass("on");
          $(".tab_cont > section").eq(idx).show();
       });
      
      $(".selectPrice").click(function(){
        var selectPrice = $(this).parent().parent().find("input:eq(0)").val(); 
        var selectPriceNum = parseInt(selectPrice);
        var comm = selectPriceNum*0.1;
        var vat = (selectPriceNum+comm)*0.1;
        $("#totalPrice").val(selectPrice);
        $("#comm").val(comm);
        $("#vat").val(vat); // 어차피 다 바꿔야함 테스트중임 허걱 ㅇㅋ
        $("#t_pay").val(selectPriceNum+comm+vat);
      });
   });
</script>      
<%@include file="/WEB-INF/views/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
</body>
</html>