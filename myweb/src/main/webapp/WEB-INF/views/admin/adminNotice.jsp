<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Access Check -->
<%-- <%@ include file="/WEB-INF/views/admin/adminAccessModule.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지관리</title>
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
		<th>등록일</th>
		<th>삭제</th>
		<th>편집</th>
	</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="5" align="center">
					등록된 공지사항이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${lists}">
			<tr>
				<td>${dto.n_idx}</td>
 				<c:url var="contentUrl" value="noticeContent.do">
					<c:param name="n_idx">${dto.n_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open">${dto.n_subject}</a></td> <!-- 이쪽을 모달로 변경해보기 -->
				<td>${dto.n_date}</td>		
				<c:url var="contentUrl" value="noticeDelete.do">
					<c:param name="n_idx">${dto.n_idx}</c:param>
				</c:url>	
				<td><a href="${contentUrl}" rel="modal:open"> <button id="delBt" class="btn btn-danger btn-sm" style="font-size:70%;"> <!-- style="width:100%;" -->삭제</button></a></td>
				<c:url var="contentUrl" value="noticeUpdateForm.do">
					<c:param name="n_idx">${dto.n_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl}" rel="modal:open"><button id="updateBt" class="btn btn-primary btn-sm" style="font-size:70%;">수정</button></a></td>
				
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" align="center">
				${pageStr}
			</td>
			<td>
				<a href="noticeWriteForm.do" rel="modal:open"> <button id="writeBt" class="btn btn-primary " >작성</button></a>
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>