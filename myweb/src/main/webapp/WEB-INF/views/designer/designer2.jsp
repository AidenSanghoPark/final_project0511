<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/*==================================================
  Nearby People CSS
  ==================================================*/

.people-nearby .google-maps{
  background: #f8f8f8;
  border-radius: 4px;
  border: 1px solid #f1f2f2;
  padding: 20px;
  margin-bottom: 20px;
}

.people-nearby .google-maps .map{
  height: 300px;
  width: 100%;
  border: none;
}

.people-nearby .nearby-user{
  padding: 20px 0;
  border-top: 1px solid #f1f2f2;
  border-bottom: 1px solid #f1f2f2;
  margin-bottom: 20px;
}

img.profile-photo-lg{
  height: 80px;
  width: 80px;
  border-radius: 50%;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<form name="designers">
	<h2>&nbsp;&nbsp;&nbsp;디자이너</h2><br>
	<br>
<c:forEach var="dto" items="${lists}">               
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="people-nearby">
              <div class="nearby-user">
                <div class="row">
                  <div class="col-md-2 col-sm-2">
                    <img src="profileimg/${dto.p_img}" alt="user" class="profile-photo-lg">
                  </div>
                  <div class="col-md-7 col-sm-7">
                    <h5>${dto.u_nick}</h5>
                    <p>${dto.p_info}</p>
                    <p class="text-muted">${dto.u_email}</p>
                  </div>
                  <div class="col-md-3 col-sm-3">
                  <c:url var="contentUrl" value="portfolio2.do">
					<c:param name="u_idx">${dto.u_idx}</c:param>
					</c:url>
                    <a href="${contentUrl}"><input type="button" value="포트폴리오" class="btn btn-primary pull-right"></a></button>
                  </div>
                </div>
              </div>
             </div>
            </div>
           </div>
          </div>
          </c:forEach>
          <div id="page">${pageStr}</div>
          </form>
      <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>