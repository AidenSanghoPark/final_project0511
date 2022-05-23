<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQUERY INCLUDE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style type="text/css">
	.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
.form-signin {
  width: 100%;
  max-width: 500px;
  margin: auto;
}

#content {
  width: 100%;
  max-width: 500px;
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
		<script language ="javascript">
		alert("로그인이 필요한 접근 경로입니다.")
		location.href="adminIndex.do";
		</script>
		<%-- <c:redirect url="adminIndex.do"></c:redirect> --%>
		<%-- <form name="adminLogin" action="adminLogin.do" method="POST">
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
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
	    <p class="mt-5 mb-3 text-muted">© ezen</p>
	  </form> --%>
	  </c:when>
	<c:otherwise>
		<h5>
			<a href="adminIndex.do"><img class="mb-4" src="img/logo.png" alt="" width="210" height="100"><br></a>
			${sessionScope.sid}로그인중 | <a href="adminlogout.do" class="link-danger">로그아웃</a>
		</h5>
		<br>	
		<!-- split button -->
		<div class="btn-group">
		  <button type="button" class="btn btn-primary">회원관리</button>
		  <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
		    <span class="visually-hidden">Toggle Dropdown</span>
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="memberManage.do">회원목록</a></li>
		    <li><a class="dropdown-item" href="askManage.do">문의관리</a></li>
		    <li><a class="dropdown-item" href="adminWithdraw.do">출금관리</a></li>
		    <!-- <li><a class="dropdown-item" href="#">Something else here</a></li>
		    <li><hr class="dropdown-divider"></li>
		    <li><a class="dropdown-item" href="#">Separated link</a></li> -->
		  </ul>
		</div>
		<div class="btn-group">
		  <button type="button" class="btn btn-info">게시물관리</button>
		  <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
		    <span class="visually-hidden">Toggle Dropdown</span>
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="bbsManage.do">공지관리</a></li>
		    <li><a class="dropdown-item" href="contManage.do">게시물관리</a></li>
		    <li><a class="dropdown-item" href="designManage.do">출품작관리</a></li>
		    <li><hr class="dropdown-divider"></li>
		<!--     <li><a class="dropdown-item" href="reportManage.do">신고관리</a></li> -->
		    <!-- <li><a class="dropdown-item" href="#">Something else here</a></li>
		    <li><hr class="dropdown-divider"></li>
		    <li><a class="dropdown-item" href="#">Separated link</a></li> -->
		  </ul>
		</div>
		
		<!-- <a href="memberManage.do" class="btn btn-primary btn-lg" tabindex="0" role="button" aria-disabled="true">회원관리</a>
		<a href="bbsManage.do" class="btn btn-primary btn-lg" tabindex="0" role="button" aria-disabled=true>게시물관리</a> -->
	</c:otherwise>
	</c:choose>
	</main>
</body>
</html>
