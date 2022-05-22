<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
input[type=text]{
	width:30%;
	height: 30px;
	border:2px solid #aaa;
	border-radius:4px;
	margin: 8px 0;
	outline: none;
	padding:8px;
	box-sizing: border-box;
	transition:.3s;
}

input[type=text]:focus{
	border-color:dodgerBlue;
	box-shadow:0 0 8px 0 dodgetBlue;
}
</style>
</head>
<body>
<div class="tab_cont" >
      <section class="on">
            <input type="hidden" id="selectType">
            <div style="text-align: left;">
               <h2>STEP2</h2>
               <h6>작업 내용을 상세히 설명해 주세요.</h6>
               </div>
               <hr>
               <br>
               <div style="text-align: left;">
               		<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-file-lines"></i>&nbsp;<b>어떤 콘테스트를 개최 하시나요?</b></h5>          
               </div>
				<fieldset style="border: solid 0px #a4a4a4; width: 100%; height: 100%; padding: 10px;line-height: 30px;">
			      <table style="width: 100%; height: 100%; text-align: left;">
			         <tr>
			         	 <th style="width: 50px;"><i class="fa-solid fa-angle-right"></i>&nbsp;제목</th>
				         <td style="width: 100px; font-weight: bold;"><input type="text" name="c_subject" id="subject" required></td>				         
			         </tr>
			         <tr>
			         	 <th style="width: 50px;"><i class="fa-solid fa-angle-right"></i>&nbsp;회사명</th>
				         <td style="width: 100px; font-weight: bold;"><input type="text" name="c_company" id="company" required></td>				         
			         </tr>
			         <tr>
			         	 <th style="width: 50px;"><i class="fa-solid fa-angle-right"></i>&nbsp;서비스설명</th>
				         <td style="width: 100px; font-weight: bold;"><textarea cols="40" rows="4" name="c_deas" id="deas"></textarea></td>				        
			         </tr>
			      </table>
			   </fieldset>
			   <hr>
               <br>
			   <div style="text-align: left;">
               		<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-heart"></i>&nbsp;<b>어떤 종류의 로고를 원하시나요?</b></h5>          
               </div>
               <fieldset style="border: solid 0px #a4a4a4; width: 100%; height: 100%; padding: 10px;line-height: 30px;">
               	<div>
	              <b style="padding-right: 550px;"><i class="fa-solid fa-angle-right"></i>&nbsp;원하는 로고타입 3가지선택</b>
	              <br>
	              <br>
	              	<table style="margin: 10px;">
	              	<tr>
	                 <td style="padding-right: 50px;"><img src="img/logotype1.jpg" style="width: 100px; height: 100px;"></td>
	                 <td style="padding-right: 50px;"><img src="img/logotype2.jpg" style="width: 100px; height: 100px;"></td>
	                 <td style="padding-right: 50px;"><img src="img/logotype3.jpg" style="width: 100px; height: 100px;"></td>
	                </tr>
	                <tr style="text-align: center;">
	                 <td style="padding-right: 50px;"><input type="checkbox" name="logo" value="1" id="checkImg"></td>
	                 <td style="padding-right: 50px;"><input type="checkbox" name="logo" value="2" id="checkImg"></td>
	                 <td style="padding-right: 50px;"><input type="checkbox" name="logo" value="3" id="checkImg3"></td>
	                </tr>
	                <tr> 
	                 <td style="padding-right: 50px;"><img src="img/logotype4.jpg" style="width: 100px; height: 100px;"></td>
	                 <td style="padding-right: 50px;"><img src="img/logotype5.jpg" style="width: 100px; height: 100px;"></td>
	                 <td style="padding-right: 50px;"><img src="img/logotype6.jpg" style="width: 100px; height: 100px;"></td>
	                </tr> 
	                <tr style="text-align: center;">
	                 <td style="padding-right: 50px;"><input type="checkbox" name="logo" value="4" id="checkImg"></td>
	                 <td style="padding-right: 50px;"><input type="checkbox" name="logo" value="5" id="checkImg"></td>
	                 <td style="padding-right: 50px;"><input type="checkbox" name="logo" value="6" id="checkImg"></td>
	                </tr> 	
	                </table>
	               <br>  	             	              
               </div>
               </fieldset >
               <hr>
               <br>
               <div style="text-align: left;">
               		<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-solid fa-fill-drip"></i>&nbsp;<b>어떤 색상을 원하세요?</b></h5>          
               </div>
               <fieldset style="border: solid 0px #a4a4a4; width: 100%; height: 100%; padding: 10px;line-height: 30px;">
	               <div style="text-align: left;">
	                  <b><i class="fa-solid fa-angle-right"></i>&nbsp;원하는색상</b>&nbsp;&nbsp;<input type="text" name="c_color" id="color" required>
	               </div>
               </fieldset>
               <hr>
               <br>
               <div style="text-align: left;">
               		<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-circle-down"></i>&nbsp;<b>디자이너가 참고할 자료?</b></h5>          
               </div>
               <fieldset style="border: solid 0px #a4a4a4; width: 100%; height: 100%; padding: 10px;line-height: 30px;">
               		<div style="text-align: left;">
                  		<b><i class="fa-solid fa-angle-right"></i>&nbsp;참고자료</b>&nbsp;&nbsp;<input type="file" value="파일첨부" name="upload" id="fileUp">
               		</div>
               </fieldset>
			   <hr>
               <br>
			   		<div style="text-align: left;">
	               		<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-file-lines"></i>&nbsp;<b>로고에 사용될 상호명?</b></h5>          
	                </div>
				<fieldset style="border: solid 0px #a4a4a4; width: 100%; height: 100%; padding: 10px;line-height: 30px;">
					<div style="text-align: left;">
                  		<b><i class="fa-solid fa-angle-right"></i>&nbsp;상호명</b>&nbsp;&nbsp;<input type="text" name="c_name" id="rogoName" required>
              		</div>
				</fieldset>
				<hr>
                <br>
				<div style="text-align: left;">
	               <h5 style="font-size: 20px; line-height: 40px;"><i class="fa-solid fa-arrow-down-short-wide"></i>&nbsp;<b>디자인 상세내용?</b></h5>          
	            </div>
				<fieldset style="border: solid 0px #a4a4a4; width:100%; height: 100%; padding: 10px;line-height: 30px;">
				<div style="text-align: left;">
                  	<b><i class="fa-solid fa-angle-right" style="vertical-align: top;">&nbsp;상세내용</i></b>&nbsp;&nbsp;<textarea cols="40" rows="4" name="c_details" id="details"></textarea>
               	</div>
				</fieldset>
				<hr>
                <br>
               <div style="margin: 0px auto; text-align: right;">
                  <input style="width: 200px;" type="button" class="btn btn btn-dark" value="다음으로" onclick="nextNaming()">
               </div>
               <br>       
		      </section>
   </div>
</body>
</html>