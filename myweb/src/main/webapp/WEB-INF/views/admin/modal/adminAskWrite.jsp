<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br>			
<blockquote class="blockquote text-center">1:1문의 작성</blockquote>
	
	<form name="askWrite" action="askWrite.do" method="post">	
	
		<label for="exampleFormControlInput" class="form-label">제목</label>
		<input type="text" class="form-control"  name="q_subject"	>
	
		<label for="exampleFormControlInput1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="q_content"></textarea>
		
		<br>
		
		<div align="center">
	
		<input type="submit" class="btn btn-secondary" style="font-size:90%;" value="글쓰기">
	
		</div>

	</form>
				
			
</body>
</html>