<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<c:choose>
	<c:when test="${sessionScope.sid eq null}">
		<script language ="javascript">
		alert("로그인이 필요한 접근 경로입니다.")
		location.href="adminLogin.do";
		</script>
		<%-- <jsp:forward page="adminIndex.do"> --%>
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>



<!-- String adminCheck = (String)session.getAttribute("saveId");
if(adminCheck==null||adminCheck.equals("")){

}
 -->