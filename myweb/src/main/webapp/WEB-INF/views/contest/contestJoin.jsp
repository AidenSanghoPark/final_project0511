<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>디자인 콘테스트 참여 | DSN</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
.circle-img {

    object-fit: cover;

    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/

    border-radius: 50%;/*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/

    width: 100px; 

    height: 100px;

}

body{margin-top:20px;
}

.member-entry {
  border: 1px solid #ebebeb;
  padding: 15px;
  margin-top: 15px;
  margin-bottom: 30px;
  -moz-box-shadow:  0 1.5rem 4rem rgba(22, 28, 45, 0.1);
  -webkit-box-shadow:  0 1.5rem 4rem rgba(22, 28, 45, 0.1);
  box-shadow: 1 0 1.5rem 4rem rgba(22, 28, 45, 0.1);
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
  -webkit-border-radius: 3px;
  -webkit-background-clip: padding-box;
  -moz-border-radius: 3px;
  -moz-background-clip: padding;
  border-radius: 3px;
  background-clip: padding-box;
  background:#fff;
    -webkit-box-shadow: 0 2px 2px 0 rgba(0,0,0,0.2),0 6px 10px 0 rgba(0,0,0,0.3);
    box-shadow: 0 2px 2px 0 rgba(0,0,0,0.2),0 6px 10px 0 rgba(0,0,0,0.3);
}
.member-entry:before,
.member-entry:after {
  content: " ";
  display: table;
}
.member-entry:after {
  clear: both;
}

.member-entry .member-img,
.member-entry .member-details {
  float: left;
}
.member-entry .member-img {
  position: relative;
  display: block;
  width: 10%;
}
.member-entry .member-img img {
  width: 100%;
  display: block;
  max-width: 100%;
  height: auto;
}
.member-entry .member-img i {
  position: absolute;
  display: block;
  left: 50%;
  top: 50%;
  margin-top: -12.5px;
  margin-left: -12.5px;
  color: #FFF;
  font-size: 25px;
  zoom: 1;
  -webkit-opacity: 0;
  -moz-opacity: 0;
  opacity: 0;
  filter: alpha(opacity=0);
  -moz-transform: scale(0.5);
  -webkit-transform: scale(0.5);
  -ms-transform: scale(0.5);
  -o-transform: scale(0.5);
  transform: scale(0.5);
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-img:hover i {
  -moz-transform: scale(1);
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);
  zoom: 1;
  -webkit-opacity: 1;
  -moz-opacity: 1;
  opacity: 1;
  filter: alpha(opacity=100);
}
.member-entry .member-details {
  width: 89.9%;
}
.member-entry .member-details h4 {
  font-size: 18px;
  margin-left: 20px;
}
.member-entry .member-details h4 a {
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-details .info-list {
  margin-left: 5px;
}
.member-entry .member-details .info-list > div {
  margin-top: 5px;
  font-size: 13px;
}
.member-entry .member-details .info-list > div a {
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-details .info-list > div i {
  -moz-transition: all 300ms ease-in-out;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.member-entry .member-details .info-list > div:hover i {
  color: #4f5259;
}
@media screen and (max-width: 768px) {
  .member-entry .member-img {
    width: 18%;
  }
  .member-entry .member-details {
    width: 81.9%;
  }
  .member-entry .member-details h4 {
    margin-top: 0;
  }
}
@media screen and (max-width: 480px) {
  .member-entry .member-img {
    width: 100%;
    float: none;
    text-align: center;
    position: relative;
    background: #f8f8f8;
    margin-bottom: 15px;
    -webkit-border-radius: 3px;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 3px;
    -moz-background-clip: padding;
    border-radius: 3px;
    background-clip: padding-box;
  }
  .member-entry .member-img img {
    width: auto;
    display: inline-block;
    -webkit-border-radius: 0;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 0;
    -moz-background-clip: padding;
    border-radius: 0;
    background-clip: padding-box;
  }
  .member-entry .member-details {
    width: 100%;
    float: none;
  }
  .member-entry .member-details h4,
  .member-entry .member-details .info-list {
    margin-left: 0;
  }
  .member-entry .member-details h4 > div,
  .member-entry .member-details .info-list > div {
    padding: 0;
  }
  .member-entry .member-details .info-list > div {
    margin-top: 10px;
  }
  
}
  header{
    border-bottom: 1px solid rgba(0,0,0,0.075);
    box-shadow: 0 0 5px rgba(0,0,0,0.75);
    background: #fff;

  }
  header .inner{
    max-width: 980px;
    height: 78px;
    margin: 0 auto;
  }
  body {
  min-height: 100vh;
  min-height: -webkit-fill-available;
}

html {
  height: -webkit-fill-available;
}

main {
  display: flex;
  flex-wrap: nowrap;
  height: 100vh;
  height: -webkit-fill-available;
  max-height: 100vh;
  overflow-x: auto;
  overflow-y: hidden;
}

.b-example-divider {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.bi {
  vertical-align: -.125em;
  pointer-events: none;
  fill: currentColor;
}

.dropdown-toggle { outline: 0; }

.nav-flush .nav-link {
  border-radius: 0;
}

.btn-toggle {
  display: inline-flex;
  align-items: center;
  padding: .25rem .5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, .65);
  background-color: transparent;
  border: 0;
}
.btn-toggle:hover,
.btn-toggle:focus {
  color: rgba(0, 0, 0, .85);
  background-color: #cfe2f3;
}

.btn-toggle::before {
  width: 1.25em;
  line-height: 0;
  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  transition: transform .35s ease;
  transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
  color: rgba(0, 0, 0, .85);
}
.btn-toggle[aria-expanded="true"]::before {
  transform: rotate(90deg);
}

.btn-toggle-nav a {
  display: inline-flex;
  padding: .1875rem .5rem;
  margin-top: .125rem;
  margin-left: 1.25rem;
  text-decoration: none;
}
.btn-toggle-nav a:hover,
.btn-toggle-nav a:focus {
  background-color: #cfe2f3;
}

.scrollarea {
  overflow-y: auto;
}

.fw-semibold { font-weight: 600; }
.lh-tight { line-height: 1.25; }
  
a{
	text-decoration: none;
}
.button {
	text-align:center;
  background-color: #000000;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.nbutton {
  background-color: #000000;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.button:hover {opacity: 1}
</style>

<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/180c933499.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/header.jsp" %>

<head>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
		<script src="//code.jquery.com/jquery.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
</head>
<hr>
<body style="background-color: #eeeeee;">	
			<div class="member-entry" style="width:900px; padding-left: 20px; margin: 0 auto;"> 
			    <a class="member-img"> 
			        <img src="menuimg/${cdto.c_cate }.png" class="circle-img" style="padding-top: 10px;"> 
			    </a> 
			    <div class="member-details" style="width:750px;"> 
			        <div class="col-sm-4" style="float:left;"> 
			        <c:url var="contentUrl" value="conListContent.do">
					<c:param name="idx">${cdto.c_idx }</c:param>
				</c:url>
							<!-- 콘테스트 제목 -->
			                <h4> <a href="${contentUrl}" style="text-decoration: none; color: #2E2E2E; font-weight: bold; font-size: 17px;">${cdto.c_subject }</a> </h4> 
			                <div style="padding: 10px; padding-left: 10px; width: 500px; height:70px; background-color:#EFEFFB; margin-left: 20px; color: #424242;">
			                	${cdto.c_deas }<br><br>
			                </div>
			            </div>
			        <div class="row info-list" style="float:right; text-align: left; width:200px; font-size: 10px; padding-top: 20px;"> 
			            <h3 style="font-size: 20px; font-weight: bold; color: #424242;">상금&nbsp;&nbsp;&nbsp;&nbsp;${cdto.c_pay } 만원</h3> 
			            <h4 style="padding-right: 45px; text-align: right; font-size: 15px; color: gray;"><label style="font-weight: bold;">참여인원</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${jsum}명</h4> 
			            <h4 style="padding-right: 45px; text-align: right; font-size: 15px; color: gray;"><label style="font-weight: bold;">남은기간</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D${cdto.c_datediff}</h4> 
			        </div>    
			    </div> 

			</div>
			<br>
		<div style="margin: 0 auto; padding-left: 315px; float: left;">
			<a href="conPart.do?c_idx=${cdto.c_idx }"><button class="button">참여작 보기</button>
			<a href="conContent.do?c_idx=${cdto.c_idx }"><button class="nbutton">브리핑 보기</button></a>
			<a href="#"><button class="button">콘테스트 참여</button></a>
			<input type="hidden" value="${dto.c_idx }" name="c_idx">
		</div>
		<br><br><br>
		
<div style="padding-left: 30px; padding-top: 10px; background-color: #ffffff; width: 60%; margin: 0 auto;">
	<div style="text-align: left;">
		<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-file-lines"></i>&nbsp;<b>&nbsp;&nbsp;콘테스트 참가 작성</b></h5>
	</div>	
	<form name="contestJoin" action="contestJoinSubmit.do" method="post" enctype ="multipart/form-data">
	<div>
		<input type="hidden" name="c_idx" value="${condto.c_idx }">
		<input type="hidden" name="c_cate" value="${condto.c_cate }">
		<input type="hidden" name="u_idx" value="${mdto.u_idx }">
		<fieldset style="border: solid 1px #a4a4a4; width:60%; height: 100%; padding: 10px;line-height: 30px;">
			<div>
				<b>작품 제목</b>&nbsp;&nbsp;&nbsp;<input type="text" name="d_name" required>
			</div>
		</fieldset>
		<br>
		<div style="text-align: left;">
			<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-file-lines"></i>&nbsp;<b>&nbsp;&nbsp;디자인 파일 추가</b></h5>
		</div>
		<fieldset style="border: solid 1px #a4a4a4; width:60%; height: 100%; padding: 10px; line-height: 30px; float: left; padding-left: 10px;">	
			<div style="margin: 0px auto;">
				<input type="file" name="uploadfile1" id="uploadfile1" accept="image/gif, image/jpeg, image/jpg, image/png" required>
			</div>
			<div class="img_wrap">
	           <img id="img1" />
	       </div>
			<div>
				<input type="file" name="uploadfile2" id="uploadfile2" accept="image/gif, image/jpeg, image/jpg, image/png" required>
			</div>
			<div class="img_wrap">
	           <img id="img2" />
	       </div>
	     	
	   </fieldset>	    
	   <br><br><br><br><br><br><br><br>
       <div style="text-align: left;">
			<h5 style="font-size: 20px; line-height: 40px;"><i class="fa-regular fa-file-lines"></i>&nbsp;<b>&nbsp;&nbsp;디자인 상세설명</b></h5>
		</div>
		<div>
			<textarea rows="8" cols="80" name="d_content" required></textarea>
		</div>
		<br>
		<div>
			<input style="width: 300px;" type="submit" class="btn btn btn-dark" value="콘테스트 참여">
			<br><br><br>
		</div>
	</div>
	</form>
</div>
<script type="text/javascript">
	
	
    var sel_file;
    var maxSize = 10 * 1024 * 1024; // 5MB

	var fileSize = $("#uploadfile1")[0].files[0].size;
	
 
    $(document).ready(function() {
        $("#uploadfile1").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("이미지 파일만 업로드 가능합니다.");
                $("#uploadfile1").val("");
                return;
            }else if(fileSize > maxSize){
        		alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
        		$("#uploadfile1").val("");
        		return false;
        	}
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img1").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    
    var sel_file2;
    var fileSize = $("#uploadfile2")[0].files[0].size;
    
    $(document).ready(function() {
        $("#uploadfile2").on("change", handleImgFileSelect2);
    });
 
    function handleImgFileSelect2(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("이미지 파일만 업로드 가능합니다.");
                return;
            }
 
            sel_file2 = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img2").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }  
</script>
    
<script>
//파일 업로드


/* function fn_submit(){
        
        var form = new FormData();
        form.append( "d_name", $("#d_name")[0].files[0] );
        form.append( "d_content", $("#d_content")[0].files[0] );
        form.append( "uploadfile1", $("#uploadfile1")[0].files[0] );
        form.append( "uploadfile2", $("#uploadfile2")[0].files[0] );
         jQuery.ajax({
             url : "/myweb/contestJoinSubmit.do"
           , enctype : "multipart/form-data"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("콘테스트 참여 완료");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
} */


</script>
</body>
</html>
