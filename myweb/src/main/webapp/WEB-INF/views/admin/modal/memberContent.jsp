<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<blockquote class="blockquote text-center">회원정보</blockquote>
<div class="modal-dialog">
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">아이디</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_id}">
		<label for="exampleFormControlInput1" class="form-label">닉네임</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_nick}">
		<label for="exampleFormControlInput1" class="form-label">이메일</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_email}">
		<label for="exampleFormControlInput1" class="form-label">전화번호</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_tel}">
		<label for="exampleFormControlInput1" class="form-label">가입일자</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_date}">
		<label for="exampleFormControlInput1" class="form-label">계좌번호</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_wallet}">
		<label for="exampleFormControlInput1" class="form-label">유저타입</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.u_type}">	
	</div>
</div>

	<div align="center">
	
	<a href="#" rel="modal:close"><button class="btn btn-secondary" style="font-size:70%;">닫기</button></a>
	
	</div>

<%-- <ul>
<li>아이디:${dto.u_id}</li>
<li>닉네임:${dto.u_nick}</li>
<li>이메일:${dto.u_email}</li>
<li>전화번호:${dto.u_tel}</li>
<li>가입일자:${dto.u_date}</li>
<li>계좌번호:${dto.u_wallet}</li>
<li>유저타입:${dto.u_type}</li>
</ul> --%>
<!-- <a href="#" rel="modal:close"><button>닫기</button></a><button>이용제한</button> -->
</body>
</html>