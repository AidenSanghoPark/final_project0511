 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.icons i {
  color: #b5b3b3;
  border: 1px solid #b5b3b3;
  padding: 6px;
  margin-left: 4px;
  border-radius: 5px;
  cursor: pointer;
}

.activity-done {
  font-weight: 600;
}

.list-group li {
  margin-bottom: 12px;
}

.list-group-item {
}

.list li {
  list-style: none;
  padding: 10px;
  border: 1px solid #e3dada;
  margin-top: 12px;
  border-radius: 5px;
  background: #fff;
}

.checkicon {
  color: green;
  font-size: 19px;
}

.date-time {
  font-size: 12px;
}

.profile-image img {
  margin-left: 1px;
}
.designer{
	float: center;
}
.designerName{
	float: right;
}
img {
 	max-width: 20%;
 	max-height: 20%;
}
.profileimg {
	height: 100px;
	 width: 100px;
	 float: left;
}
.desingerNick{
	float: right;
	padding-top: 35px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<form name="designers">
	<h2>&nbsp;&nbsp;&nbsp;디자이너</h2><br>
	<br>
	<div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center activity">
                    <div><span class="activity-done"></span></div>
                    <div class="icons"><input type="text" name="designerName"><input type="submit" value="검색" class="fa fa-search"></div>
                </div>
                
                
                
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade active show" id="home" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">프로필</th>
                                        <th scope="col">소개</th>
                                        <th class="text-center" scope="col">ㅤ</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                <c:forEach var="dto" items="${lists}">
                                    <tr class="inner-box">
                                        <td>
                                            <div class="event-img">
                                                <img src="img/${dto.p_img}" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">${dto.u_nick}</a></h3>
                                                <div class="meta">
                                                    <div class="categories">${dto.u_email}
                                                    </div>
                                                    <div class="time">
                                                        <span>${dto.p_info}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <input type="button" value="포트폴리오" onclick="porfolio.do?u_idx=${dto.u_idx}" >
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                   </tbody>
                                   
                                  </table>
                                 </div>
                                </div>
                               </div>
                            
                
                <div id="page">${pageStr}</div>
            </div>
        </div>
    </div>
</form>
<%@include file="/WEB-INF/views/footer.jsp" %>
<script>
console.log(dto.u_nick)
</script>
</body>
</html>