<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모이다에 오신걸 환영합니다</title>
<style>
	#wrap{
	 width: 100%;
     height: 100%;
     z-index: 1;
     text-align: center;
     position: relative;
	}
	#wrap::after {
	    width: 100%;
    	height: 100%;
     	content: "";
		background: url("./img/loginroot.jpg");
		background-attachment : fixed;
		z-index: -1;
     	opacity: 0.2;
     	position: absolute;
		top: 0;				
    	left: 0;
	}
	#btn1,#btn2{
		 font-size:1em;
		 font-weight: bold ;
		 font-family: 돋움
	}

</style>
</head>
<body id="wrap">
	<div class="btn_group">
		<div class="but">
			<button id="btn1" onclick="location='userjoin'" style="margin-top: 15%;maigin-bottom: 5%">일반회원으로 회원가입</button><br>
			<button id="btn2" onclick="location='hostjoin'" style="margin-bottom: 30%;" >호스트로 회원가입</button>
		</div>
	</div>
</body>
</html>