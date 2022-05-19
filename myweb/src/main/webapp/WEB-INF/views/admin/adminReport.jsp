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
	function updateCheck(r_idx, r_check, u_name, r_subject){
		if(r_check == "Y"){
			if(confirm(u_name+"님의 "+r_subject+" 신고내역을 미처리 상태로 변경 하시겠습니까?")){
				location.href="reportCheckUpdate.do?r_idx="+r_idx+"&r_check=N";
			}
		}else{
			if(confirm(u_name+"님의 "+r_subject+" 신고를 처리하셨습니까?")){
				location.href="reportCheckUpdate.do?r_idx="+r_idx+"&r_check=Y";
			}
		}
	}
</script>
<meta charset="UTF-8">
<title>신고관리</title>
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
	<li><a href="bbsManage.do">공지관리</a></li>
	<li><a href="contManage.do">게시물관리</a></li>
	<li><a href="designManage.do">출품작관리</a></li>
	<li><a href="reportManage.do">신고관리</a></li>
</ul> -->


<table class="table table-striped">
	<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>조치</th>
	</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="4" align="center">
					등록된 신고내역이 없습니다.
				</td>
			</tr>
		</c:if>	
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.r_idx}</td>
 				<c:url var="contentUrl" value="reportContent.do">
					<c:param name="r_idx">${dto.r_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open">${dto.r_subject}</a></td> <!-- 이쪽을 모달로 변경해보기 -->
				<td>${dto.u_name}</td>			
				<td>
					<c:url var="contentUrl" value="reportCheck.do">
						<c:param name="r_idx">${dto.r_idx}</c:param>
					</c:url>
					<c:choose>
						<c:when test="${dto.r_check eq 'Y'}">
							<button class="btn btn-dark" style="font-size:70%;" onclick="updateCheck('${dto.r_idx}', '${dto.r_check}', '${dto.u_name}', '${dto.r_subject}')">처리완료</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-danger" style="font-size:70%;" onclick="updateCheck('${dto.r_idx}', '${dto.r_check}', '${dto.u_name}', '${dto.r_subject}')">미처리</button>
						</c:otherwise>
					</c:choose>
				</td>		
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