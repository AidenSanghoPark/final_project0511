<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

   
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>


<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script>
	function updateCheck(q_idx, q_check, u_name, q_subject){
		if(q_check == "Y"){
			if(confirm(u_name+"님의 "+q_subject+"을 미처리 상태로 변경 하시겠습니까?")){
				location.href="askCheckUpdate.do?q_idx="+q_idx+"&q_check=N";
			}
		}else{
			if(confirm(u_name+"님의 "+q_subject+"을 처리 하셨습니까?")){
				location.href="askCheckUpdate.do?q_idx="+q_idx+"&q_check=Y";
			}
		}
	}
</script>

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

<meta charset="UTF-8">
<title>문의관리</title>
</head>
<body class="text-center">
<%-- <%@include file="/WEB-INF/views/admin/adminHeader.jsp"%> --%>



<table class="table table-striped">
	<thead>
	<tr>
		<th>번호</th>			
		<th>제목</th>
		<th>이름</th>
		<th>날짜</th>
		<th>상태</th>
	</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="5" align="center">
					등록된 문의내역이 없습니다.
				</td>
			</tr>
		</c:if>	
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.q_idx}</td>
 				<c:url var="contentUrl" value="askContent.do">
					<c:param name="q_idx">${dto.q_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open">${dto.q_subject}</a></td>
				<td>${dto.u_name}</td>			
				<td>${dto.q_date}</td>			
				<td>
					<c:url var="contentUrl" value="askCheck.do">
						<c:param name="q_idx">${dto.q_idx}</c:param>
					</c:url>
					<c:choose>
						<c:when test="${dto.q_check eq 'Y'}">
							<button class="btn btn-primary btn-sm" style="font-size:70%;" onclick="updateCheck('${dto.q_idx}', '${dto.q_check}', '${dto.u_name}', '${dto.q_subject}')">처리완료</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-danger btn-sm" style="font-size:70%;" onclick="updateCheck('${dto.q_idx}', '${dto.q_check}', '${dto.u_name}', '${dto.q_subject}')">미처리</button>
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