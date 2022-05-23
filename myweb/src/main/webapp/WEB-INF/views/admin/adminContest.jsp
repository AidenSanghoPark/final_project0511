<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>


<script>
	function updateBlock(c_idx, c_block, u_name, c_subject){
		if(c_block == "Y"){
			if(confirm(u_name+"님의 "+c_subject+"을 블록해제하시겠습니까?")){
				location.href="contBlockUpdate.do?c_idx="+c_idx+"&c_block=N";
			}
		}else{
			if(confirm(u_name+"님의 "+c_subject+"을 블록처리하시겠습니까?")){
				location.href="contBlockUpdate.do?c_idx="+c_idx+"&c_block=Y";
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
<title>게시물 관리</title>
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
		<th>콘테스트 명</th>
		<th>업체 명</th>
		<th>아이디</th>
		<th>조치</th>
	</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="5" align="center">
					등록된 콘테스트 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.c_idx}</td>
 				<c:url var="contentUrl" value="conContent.do">
					<c:param name="c_idx">${dto.c_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}">${dto.c_subject}</a></td> 
				<td>${dto.c_company}</td>		
				<td>${dto.u_id}</td>		
				<td>
					<c:url var="contentUrl" value="contBlock.do">
						<c:param name="c_idx">${dto.c_idx}</c:param>
					</c:url>
					<c:choose>
						<c:when test="${dto.c_block eq 'Y'}">
							<button class="btn btn-dark" style="font-size:70%;" onclick="updateBlock('${dto.c_idx}', '${dto.c_block}', '${dto.u_name}', '${dto.c_subject}')">Block</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-light" style="font-size:70%;" onclick="updateBlock('${dto.c_idx}', '${dto.c_block}', '${dto.u_name}', '${dto.c_subject}')">Block</button>
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