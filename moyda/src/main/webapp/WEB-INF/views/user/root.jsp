<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모이다에 오신걸 환영합니다</title>
<style>
	.base{
	 width: 100%;
     height: 100%;
     z-index: 1;
     text-align: center;
	}
	.base::after {
	    width: 100%;
    	height: 100%;
     	content: "";
		background: url("./img/gogo.jpg");
		background-size: 100%;
		background-repeat: no-repeat;
		background-attachment : fixed;
		z-index: -1;
     	opacity: 0.4;
     	position: absolute;
		top: 0;
    	left: 0;
    	text-align: center;
	}
   .title {
     width: 100%;
     height: 100%;
     float:left;
   }
   
   .btn1{ border-top-left-radius: 5px; border-bottom-left-radius: 5px; 
   margin-right:auto; margin-left:auto;}
   .btn2{ border-top-right-radius: 5px; border-bottom-right-radius: 5px; 
   margin-right:auto; margin-left:auto; }

   
	
    </style>
  </head>
  <body>
  <div class="base">
		<div class="container">
			<div class="title" style="margin: 80px 1px 50px 10px">
				
		      	<p>호롤롤<br>
		      	핵웃겨<br>
		      	이야얍<br>
		      	이거맞나?<br>
		      	질문할거뭐가있니<br>
		      	안녕하세요 이제 혼자놀지마세여<br>
		      	이제 같이놀아용<br>
		      	잘 적응할 수 있다면 말이죠ㅋㅋㅋㅋ</p>
	      	</div>
		</div>
		<div class="btn_group">
			<div class="but">
				<button id="btn1" onclick="location='login'">로그인</button>
				<button id="btb2" onclick="location='join'" style="margin-bottom:20%">회원가입</button>
			</div>
		</div>
	</div>
  </body>
</html>