<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DSN ADMIN LOGIN</title>
<meta name="theme-color" content="#7952b3">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
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

<body class="text-center">
	<main class="form-signin">
	<c:choose>
	<c:when test="${sessionScope.sid eq null or empty sessionScope.sid}">
		<form name="adminLogin" action="adminLogin.do" method="POST">
	    <img class="mb-4" src="img/logo.png" alt="" width="210" height="100">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" name="adminId" class="form-control" id="floatingInput" placeholder="ID" value="${cookie.saveid.value}">
	      <label for="floatingInput">ID</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" name="adminPwd" class="form-control" id="floatingPassword" placeholder="Password">
	      <label for="floatingPassword">Password</label>
	    </div>
	
	   <!--  <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div> -->
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
	    <p class="mt-5 mb-3 text-muted">© ezen</p>
	  </form>
	  </c:when>
	<c:otherwise>
		<jsp:forward page="/adminLogin.do"/>
	</c:otherwise>
	</c:choose>
	</main> 
</body>


<%-- 
<body>
<a><img src="img/logo.png"></a>
<c:choose>
	<c:when test="${sessionScope.sid eq null or empty sessionScope.sid}">
		<form name="adminLogin" action="adminLogin.do" method="POST">
			<fieldset>
				<legend>로그인</legend>
				<ul>
					<li><label>아이디</label>
						<input type="text" name="adminId" placeholder="아이디" value="${cookie.saveid.value}"></li>
						<li><label>password</label>
						<input type="password" name="adminPwd" placeholder="비밀번호"></li>
				</ul>
				<div>
				<input type="submit" value="로그인">
				</div>
			</fieldset>
		</form>
	</c:when>
	<c:otherwise>
		<jsp:forward page="/adminLogin.do" />
	</c:otherwise>
</c:choose>
</body> --%>
</html>