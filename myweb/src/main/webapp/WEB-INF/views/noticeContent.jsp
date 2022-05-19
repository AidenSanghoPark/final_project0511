<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



</head>
<body>
<form name="noticeWrite" action="bbsManage.do" method="post">	
<input type="hidden" name="n_idx" value="${dto.n_idx}" />
<blockquote class="blockquote text-center">공지사항 내용</blockquote>

	<div class="modal-dialog">

	<div class="mb-3">
		
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.n_subject}">
	
			<label for="exampleFormControlInput1" class="form-label">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${dto.n_content}</textarea>
			
			

	</div>
	
			<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">Close</button>
			</div>	
		
	</div>
	

</form>


</body>


</html>
