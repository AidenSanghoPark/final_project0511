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
	<h1>공지사항 수정</h1>
	<form name="noticeWrite" action="noticeUpdate.do" method="post">	
		<input type="hidden" name="n_idx" value="${dto.n_idx}" />
		<ul>
			<li><label>제목 : </label><input type="text" name="n_subject" value="${dto.n_subject}"></li>
			<li><label>내용 : </label><textarea rows="10" cols="10" name="n_content">${dto.n_content}</textarea>				
			</li>
		</ul>
		<div>
			<input type="submit" value="수정하기">
		</div>
	</form>
</body>
</html>