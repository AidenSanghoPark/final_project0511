<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DSN ADMIN PAGE</title>
<style>
      .form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
body {
  height: 100%;
}

body {
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}
</style>

</head>
<script>
	var result = "${result}";
	
	if(result == 1){
		alert("존재하지 않는 아이디입니다.");
		 window.history.back();
	}else if(result == 2){
		alert("비밀번호가 올바르지 않습니다.");
		window.history.back();
	}else if(result == 3){
		alert("정상적으로 로그인이 되었습니다.");
	}
</script>
<body class="text-center">
<main class="form-signin">
<%-- <img class="mb-4" src="img/logo.png" alt="" width="210" height="100">
<h5>
	${sessionScope.sid}로그인중 | <a href="logout.do" class="link-danger">로그아웃</a>
</h5>
<br><br>

<a href="memberManage.do" class="btn btn-primary btn-lg" tabindex="0" role="button" aria-disabled="true">회원관리</a>
<a href="bbsManage.do" class="btn btn-primary btn-lg" tabindex="0" role="button" aria-disabled=true>게시물관리</a> --%>


<!-- <ul>
	<li><a href="memberManage.do">회원관리</a></li>
	<li><a href="bbsManage.do">게시물관리</a></li>
	<li><a href="#">배너관리</a></li>
</ul> -->
</main>
</body>
</html>