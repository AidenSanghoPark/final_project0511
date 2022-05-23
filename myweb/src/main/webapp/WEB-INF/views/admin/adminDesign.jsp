<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>


<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!DOCTYPE html>
<html>
<head>
<script>
	function updateBlock(d_idx, d_block, u_nick, d_name){
		if(d_block == "Y"){
			if(confirm(u_nick+"님의 "+d_name+"을 블록해제하시겠습니까?")){
				location.href="designBlockUpdate.do?d_idx="+d_idx+"&d_block=N";
			}
		}else{
			if(confirm(u_nick+"님의 "+d_name+"을 블록처리하시겠습니까?")){
				location.href="designBlockUpdate.do?d_idx="+d_idx+"&d_block=Y";
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
<title>출품작 관리</title>
</head>
<body>
<%-- <%@include file="/WEB-INF/views/admin/adminHeader.jsp"%> --%>
<!-- <ul>
	<li><a href="bbsManage.do">공지관리</a></li>
	<li><a href="contManage.do">게시물관리</a></li>
	<li><a href="designManage.do">출품작관리</a></li>
	<li><a href="reportManage.do">신고관리</a></li>
</ul>
 -->

<table class="table table-striped">
	<thead>
	<tr>
		<th>번호</th>
		<th>출품작 명</th>
		<th>닉네임</th>
		<th>조치</th>
	</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="4" align="center">
					등록된 출품작이 없습니다.
				</td>
			</tr>
		</c:if>	
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.d_idx}</td>
 				<c:url var="contentUrl" value="conPartContent.do">
					<c:param name="d_idx">${dto.d_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open">${dto.d_name}</a></td> 
				<td>${dto.u_nick}</td>			
				<td>
					<c:url var="contentUrl" value="designBlock.do">
						<c:param name="d_idx">${dto.d_idx}</c:param>
					</c:url>
					<c:choose>
						<c:when test="${dto.d_block eq 'Y'}">
							<button class="btn btn-dark" style="font-size:70%;" onclick="updateBlock('${dto.d_idx}', '${dto.d_block}', '${dto.u_nick}', '${dto.d_name}')">Block</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-light" style="font-size:70%;"onclick="updateBlock('${dto.d_idx}', '${dto.d_block}', '${dto.u_nick}', '${dto.d_name}')">Block</button>
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