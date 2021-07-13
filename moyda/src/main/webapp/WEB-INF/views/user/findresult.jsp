<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
	 width: 100%;
     height: 100%;
     z-index: 1;
     text-align: center;
	}
	#wrap::after {
	    width: 100%;
    	height: 100%;
     	content: "";
		background: url("./img/gogo.jpg");
		background-size: 100%;
		z-index: -1;
     	opacity: 0.2;
     	position: absolute;
		top: 0;
    	left: 0;
    	text-align: center;
	}
	#a{
		width: 100%;
		height: 100%;
		text-align: center;
		font-size: 20px;
	}
</style>
</head>

<body id = "wrap">
<div style="margin-bottom : 20%;margin-top : 20%;">
	<button id = "a" onClick="location='login'">회원님의 아이디는 ${msg} 입니다</button>
	클릭시 로그인화면으로 이동합니다
</div>
</body>
</html>