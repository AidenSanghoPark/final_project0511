<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONTEST 개최</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
ul{
	list-style: none;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="container">
	<ul class="tab_title">
		<li class="on">브리핑 작성</li>
    	<li>상금결제</li>
	</ul>
	<div class="tab_cont">
	<section class="on">
			<form name="naming" action="namingHold.do" method="post" id="ftest">
				<input type="hidden" id="c_cate" name="c_cate" value="${c_cate}">
					<div>
						<b>콘테스트 제목</b>&nbsp;&nbsp;<input type="text" name="c_subject" id="subject">
					</div>
					<div>
						<b>회사명</b>&nbsp;&nbsp;<input type="text" name="c_company" id="company">
					</div>
					<div>
						<b>서비스설명</b>&nbsp;&nbsp;<textarea  cols="30" name="c_deas" id="deas"></textarea>
					</div>
					<hr style="width: 700px;">
					<table>
						<tr>
							<th>원하는 로고타입 3가지선택</th>
							<td><input type="checkbox" name="c_logo" value="1" id="checkImg"></td>
							<td><input type="checkbox" name="c_logo" value="2" id="checkImg"></td>
							<td><input type="checkbox" name="c_logo" value="3" id="checkImg"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="checkbox" name="c_logo" value="4" id="checkImg"></td>
							<td><input type="checkbox" name="c_logo" value="5" id="checkImg"></td>
							<td><input type="checkbox" name="c_logo" value="6" id="checkImg"></td>
						</tr>	
					</table>
					<div>
						<b>원하는색상</b>&nbsp;&nbsp;<input type="text" name="c_color" id="color">
					</div>
					<div>
						<b>디자이너가 참고할 자료</b>&nbsp;&nbsp;<input type="file" value="파일첨부" name="upload" id="fileUp">
					</div>
					<div>
						<b>로고에 사용될 상호명</b>&nbsp;&nbsp;<input type="text" name="c_name" id="rogoName">
					</div>
					<div>
						<b>상세설명</b>&nbsp;&nbsp;<textarea cols="30" name="c_details" id="details"></textarea>
					</div>
					<div>
						<input type="button" value="다음" onclick="namingAdd()">
					</div>
				</form>
		</section>
		<section>
			<div id="tab2">
				<h1>test</h1>
			</div>
		</section>
	</div>
</div>	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function namingAdd() { 
	//var ckArr = [];
	var cLogo = "";
		//each문이란
		//선택자에대한 모든것을 가져와서 그 수만큼 반복문을 돌린다.
		$("input[name='c_logo']:checked").each(function(index) {
			//배열넣을때만
			//push란 값을 넣어준다.
			//ckArr.push($(this).val());
			cLogo += $(this).val() + (","); 

		});
		console.log(cLogo);
		//ajax는 data주고받기를 json타입으로한다.
		//json key:value 되어있다.
		//java에선 map과 비슷함
				
	var ftest = document.getElementById('ftest');
	var fo = new FormData(ftest);
	$.ajax({
		url: '/myweb/namingHold_add.do', 
		type: 'post', 			     
		enctype: 'multipart/form-data',
		contentType: false,            
		processData: false, 
		data: fo,
			    
		success : function(result){
		console.log(result);
		    	
		}
	});
}

		    	/*if(!result == '0'){		    		
		   		<!--다음 탭 이벤트 발생-->	 			   	
		   		 $(".tab_title li").click(function() {
		   		    var idx = $(this).index();
		   		    $(".tab_title li").removeClass("on");
		   		    $(".tab_title li").eq(idx).addClass("on");
		   		    $(".tab_cont > div").hide();
		   		    $(".tab_cont > div").eq(idx).show();
		   		  })
		    	}
		   		
		    	}else{
		    		alert("저장 실패");
		    	}*/
/*$.ajax({
	url: '/myweb/namingHold_add.do', 
	type: 'post', 
	dataType: 'json', 
	enctype: 'multipart/form-data',
	contentType: false,            
	processData: false, 
	data: { 
		 c_subject : $('#subject').val(),
		 c_company : $('#company').val(),
		 c_deas : $('#deas').val(),
		 c_logo : cLogo,
		 c_color : $('#color').val(),
		 upload : $('#fileUp').val(),
		 c_name : $('#rogoName').val(),
		 c_details : $('#details').val(),
		 c_cate : $('#c_cate').val()
},	*/
</script>		
<%@include file="/WEB-INF/views/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>