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
	<h1>1:1문의 수정</h1>
	<form name="askWrite" action="askUpdate.do" method="post">	
		<input type="hidden" name="q_idx" value="${dto.q_idx}" />
		<ul>
			<li><label>제목 : </label><input type="text" name="q_subject" value="${dto.q_subject}"></li>
			<li><label>내용 : </label><textarea rows="10" cols="10" name="q_content">${dto.q_content}</textarea>				
			</li>
		</ul>
		<div>
			<input type="submit" value="수정하기">
		</div>
	</form>
</body>
</html>