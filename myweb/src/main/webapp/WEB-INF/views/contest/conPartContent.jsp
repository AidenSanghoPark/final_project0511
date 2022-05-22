<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<style>
	.modal {
		max-width: 70%;
	}
</style>
</head>
<body>
<form id="choiceForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="d_idx" value="${ddto.d_idx}" />
<input type="hidden" name="c_idx" value="${c_idx}">
<blockquote class="blockquote text-center">내용</blockquote>
		<!-- 모달 -->		    
		<div class="modal-dialog">
			<div class="mb-3">
		      	<div style="width: 80%; height:100%; background-color:#EFEFF6; float: right; border-radius: 5px;
		      	  position: sticky; top: 0;" id="${c_idx}" class="w3-modal">
		      		<h4>작품명 : ${ddto.d_name }</h4>
		      		<h4>디자이너 이름</h4>
		      		<br>
		      		<p style="text-align: left; padding-left: 20px;">참여작 내용</p>
		      		<br>
		      		
		      	</div>
		      	<div style="float: left;">
		      		<img style="width: 70%; height: 100%; float: left;" src="img/${ddto.d_img_1}">
		      		<img style="width: 70%; height: 100%; float: left;" src="img/${ddto.d_img_2}">
		      	</div>
		      </div>
		</div>
		<div>
			<c:if test="${cdto.u_idx == login.u_idx}">
				<button class="button" style="width: 230px; height: 50px; border-radius: 3px;" id="choice">당선하기<br></button>
			</c:if>
		</div>
		<div align="center">
			<a href="#" rel="modal:close"><button class="btn btn-secondary" style="font-size:70%;">닫기</button></a>
		</div>
      	
</form>
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
</body>
</html>
