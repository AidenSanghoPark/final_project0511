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
</head>
<body>
	<h1>공지사항 작성</h1>
	<form id="choiceForm" enctype="multipart/form-data" method="post">
	<input type="hidden" name="c_idx" value="${c_idx}">
	<input type="hidden" name="d_idx" value="${ddto.d_idx }">
		<div class="row">
			<div class="modal" id="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-headr"v">
							<div style="width: 30%; height:100%; background-color:#EFEFF6; float: right; border-radius: 5px;
								position: sticky; top: 0;">
								<h4></h4>
								<h4>디자이너 이름</h4>
								<h4></h4>
								<br>
								<p style="text-align: left; padding-left: 20px;">참여작 내용</p>
								<br>
								<c:if test="${cdto.u_idx == login.u_idx && dto.c_datediff<0}">
					      		<button class="button" style="width: 230px; height: 50px; border-radius: 3px;" id="choice">당선하기<br></button>
					      		</c:if>
								</div>
								<div style="float: left;">ß
								<img style="width: 70%; height: 100%; float: left;" src="img/">
								<img style="width: 70%; height: 100%; float: left;" src="img/">
							</div>
						</div>
					</div>
				</div>
			</div>
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