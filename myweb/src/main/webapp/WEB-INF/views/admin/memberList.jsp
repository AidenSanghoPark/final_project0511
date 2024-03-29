<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원목록</title>

<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style type="text/css">
	.pagination li{
		height: 20px;
	}
a:link{
	color:gray;
	text-decoration: none;
}
a:hover {
  color : black;
}
</style>

</head>
<body>
<%-- <%@include file="/WEB-INF/views/admin/adminHeader.jsp"%> --%>
<!-- <ul>
<li>
<a href="memberManage.do">회원목록</a>
</li>
<li>
<a href="askManage.do">문의관리</a>
</li>
</ul>
 -->
 <br>
<table class="table table-striped">
	<thead>
		<tr>			
			<th>이름</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>회원구분</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="4" align="center">
					등록된 회원이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.u_name}</td>
 				<c:url var="contentUrl" value="memberContent.do">
					<c:param name="u_id">${dto.u_id}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open">${dto.u_id}</a></td> <!-- 이쪽을 모달로 변경해보기 -->
				<td>${dto.u_nick}</td>
				<td>${dto.u_type}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="4" align="center">
				${pageStr}
			</td>
		</tr>
	</tfoot>
</table>

</body>
</html>