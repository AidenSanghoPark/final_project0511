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
/*---------------*/
/***** Layla *****/
/*---------------*/

figure.effect-layla {
   background: #000000;
}


figure.effect-layla figcaption {
   padding: 30px;
}

figure.effect-layla figcaption::before,
figure.effect-layla figcaption::after {
   content: '';
   opacity: 0;
}

figure.effect-layla figcaption::before {
   top: 50px;
   right: 30px;
   bottom: 50px;
   left: 30px;
   border-top: 1px solid #fff;
   border-bottom: 1px solid #fff;
   -webkit-transform: scale(0,1);
   transform: scale(0,1);
   -webkit-transform-origin: 0 0;
   transform-origin: 0 0;
}

figure.effect-layla figcaption::after {
   border-right: 1px solid #fff;
   border-left: 1px solid #fff;
   -webkit-transform: scale(1,0);
   transform: scale(1,0);
   -webkit-transform-origin: 100% 0;
   transform-origin: 100% 0;
}

figure.effect-layla h2 {
   padding-top: 26%;
   -webkit-transition: -webkit-transform 0.35s;
   transition: transform 0.35s;
}

figure.effect-layla p {
   padding: 0.5em 2em;
   text-transform: none;
   opacity: 0;
   -webkit-transform: translate3d(0,-10px,0);
   transform: translate3d(0,-10px,0);
}

figure.effect-layla img,
figure.effect-layla h2 {
   -webkit-transform: translate3d(0,-30px,0);
   transform: translate3d(0,-30px,0);
}

figure.effect-layla img,
figure.effect-layla figcaption::before,
figure.effect-layla figcaption::after,
figure.effect-layla p {
   -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
   transition: opacity 0.35s, transform 0.35s;
}

figure.effect-layla:hover img {
   opacity: 0.7;
   -webkit-transform: translate3d(0,0,0);
   transform: translate3d(0,0,0);
}

figure.effect-layla:hover figcaption::before,
figure.effect-layla:hover figcaption::after {
   opacity: 1;
   -webkit-transform: scale(1);
   transform: scale(1);
}

figure.effect-layla:hover h2,
figure.effect-layla:hover p {
   opacity: 1;
   -webkit-transform: translate3d(0,0,0);
   transform: translate3d(0,0,0);
}

figure.effect-layla:hover figcaption::after,
figure.effect-layla:hover h2,
figure.effect-layla:hover p,
figure.effect-layla:hover img {
   -webkit-transition-delay: 0.15s;
   transition-delay: 0.15s;
}

</style>
</head>
<body style="background-color: black;">
	<div class="grid" style="sheight: 30%; padding-top: 100px;">
		<figure class="effect-layla" style="float: left; padding-left: 200px;">
			<a href="memberJoin.do?u_type=2"><img src="img/designer1.png"/></a>       
		</figure>
		<figure class="effect-layla" style="float: right; padding-right: 200px;">
			<a href="memberJoin.do?u_type=1"><img src="img/client.png"/></a>       
		</figure>
	</div>
</body>
</html>