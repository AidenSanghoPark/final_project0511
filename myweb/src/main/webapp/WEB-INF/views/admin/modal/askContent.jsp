<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<blockquote class="blockquote text-center">문의내용</blockquote>
	<div class="modal-dialog">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">게시번호</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.q_idx}">
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.q_subject}">
			<label for="exampleFormControlInput1" class="form-label">작성자</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_name}">
			<label for="exampleFormControlInput1" class="form-label">작성일</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.q_date}">
			<label for="exampleFormControlInput1" class="form-label">이메일</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_email}">
			<label for="exampleFormControlInput1" class="form-label">본문</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="5">${dto.q_content}</textarea>
			
	
	
	<%-- 	<li>게시번호:${dto.q_idx}</li>
		<li>제목:<input type="text" value="${dto.q_subject}"
			readonly="readonly"></li>
		<li>작성일:${dto.q_date}
		<li>작성자:${dto.u_name}</li>
		<li>이메일:${dto.u_email}</li>
		<li>내용:<br>
		<textarea rows="10" cols="50" readonly="readonly">${dto.q_content}</textarea></li> --%>
		
		</div>
	</div>


	<div align="center">
	
	<a href="#" rel="modal:close"><button class="btn btn-secondary" style="font-size:70%;">닫기</button></a>
	
	</div>
</body>
</html>