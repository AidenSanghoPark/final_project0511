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

<ul>
<li>작성일:${dto.r_date}
<li>작성자:${dto.u_name}</li>
<li>제목:<input type="text" value="${dto.r_subject}" readonly="readonly"></li>
<li>내용:<br><textarea rows="10" cols="50" readonly="readonly">${dto.r_content}</textarea></li>
</ul>
<a href="#" rel="modal:close"><button>닫기</button></a>

</body>
</html>