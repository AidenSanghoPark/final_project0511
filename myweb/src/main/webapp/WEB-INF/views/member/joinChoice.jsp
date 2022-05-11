<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
#designer{
	float: left;
	width: 820px;
}	
#client{
	float: right;
	width: 820px;
}
#btn{
	margin:0 auto; 
	width:295px; 
	height:65px; 
	line-height:65px; 
	background: dark; 
	color:#fff; font-size:18px; 
	font-weight:bold; 
	text-align:center; 
	transition:0.5s all; 
	overflow:hidden;
	#btn:hover{transform:scale(1.1);}
	#btn:after{content:''; position: absolute; top: calc(50% - 50px); left: -50px; width: 20px; height: 100px; background: white; -webkit-transform: rotate(30deg); transform:rotate(30deg); -webkit-transition: all 1000ms cubic-bezier(0.23, 1, 0.32, 1); transition: all 1000ms cubic-bezier(0.23, 1, 0.32, 1); opacity: 0;}
	#btn:hover:after {left: calc(100% + 50px); opacity: 1;}
}
#btn:hover{
	transform:scale(1.1);
}
#btn:after{
	content:''; 
	position: absolute; 
	top: calc(50% - 50px); 
	left: -50px; 
	width: 20px; 
	height: 100px; 
	background: white; 
	-webkit-transform: rotate(30deg); 
	transform:rotate(30deg); 
	-webkit-transition: all 1000ms cubic-bezier(0.23, 1, 0.32, 1); 
	transition: all 1000ms cubic-bezier(0.23, 1, 0.32, 1); 
	opacity: 0;
}
#btn:hover:after{
	left: calc(100% + 50px); opacity: 1;
}
</style>
</head>
<body>
	<section id="designer">
		<div class="d-grid gap-2">
			<img src="img/designer.png" style="width: 800px; height: 700px;"> 
		</div>
		<div style="padding-left: 230px;">
  			<button class="btn btn-dark" type="button" style="width: 300px;" id="btn" onclick="window.open('memberJoin.do?u_type=2')">디자이너 가입</button>
  		</div>	  
	</section>
	<section id="client">
		<div class="d-grid gap-2">
			<img src="img/designer.png" style="width: 800px; height: 700px;"> 
		</div>
		<div style="padding-left: 230px;">
  			<button class="btn btn-dark" type="button" style="width: 300px;"  id="btn" onclick="window.open('memberJoin.do?u_type=1')">의뢰인 가입</button>  
  		</div>	
	</section>
</body>
</html>