 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Access Check -->
<%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출금처리</title>
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
<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
<table class="table table-striped">
	<thead>
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>계좌번호</th>
		<th>은행</th>
		<th>요청금액</th>
		<th>날짜</th>
		<th>처리상태</th>
	</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="5" align="center">
					출금요청 사항이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.w_idx}</td>
				<td>${dto.u_id}</td>
				<td>${dto.w_number}</td>
				<td>${dto.w_bank}</td>
 				<td>${dto.w_balance}</td>
 				<td>${dto.w_date}</td>
 				<td>
				<c:choose>
					<c:when test="${dto.w_status ne 0}">
						출금완료		
					</c:when>
					<c:otherwise>
						<c:url var="contentUrl" value="adminWithdrawStatusUpdate.do">
							<c:param name="w_idx">${dto.w_idx}</c:param>
							<c:param name="w_balance">${dto.w_balance}</c:param>
							<c:param name="u_idx">${dto.u_idx}</c:param>
						</c:url>	
						<a href="${contentUrl}" rel="modal:open"> <button id="delBt" class="btn btn-danger btn-sm" style="font-size:70%;"> <!-- style="width:100%;" -->출금요청</button></a>
					</c:otherwise>
				</c:choose>				
				</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" align="center">
				${pageStr}
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>