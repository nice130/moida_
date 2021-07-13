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
		z-index: -1;
     	opacity: 0.4;
     	position: absolute;
		top: 0;
    	left: 0;
    	text-align: center;
	}
   .title {
     width: 80%;
     height: 100%;
     float:left;
   }
   #userbtn1,#hostbtn1{ border-style:solid;border-width:0.1px;}

</style>
<script>
	$(document).ready(function(){
		$("#userbtn1").click(function(){
			var email = $("#email").val();
			var password = $("#password").val();
			if(email==""){
				alert("아이디를 입력하세요.");
				$("#email").focus();
				return;
			}
			if(password==""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			$("#form").submit();
		});	
	});
	
	$(document).ready(function(){
		$("#hostbtn1").click(function(){
			var email = $("#email").val();
			var password = $("#password").val();
			if(email==""){
				alert("아이디를 입력하세요.");
				$("#email").focus();
				return;
			}
			if(password==""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			var form = $('<form></form>');
			form.attr('action',"/hostloginCheck");
			form.attr('method','post');
			form.appendTo('body');
			var email=$("<input type='hidden' value="+email+"name='email'>");
			var password=$("<input type='hidden' value="+password+"name='password'>");
			form.append(email);
			form.append(password);
			$("#form").submit();
		});	
	});


</script>
</head>
<body>

  <div class="base">
		<div class="btn_group">
			<form  id="form" method = "post" action="/www/loginCheck" >
			<div class="form-group" style = "margin-top: 15%;">
			<label for="email">ID &nbsp;&nbsp; </label>
			<input id="email" type="text" name="email" class="form-control">
			<span class="helper-text" id="username_msg"></span>
			</div>
			<div class="form-group">
				<label for="password">Pass</label>
				<input id="password" type="password" name="password" class="form-control">
				<span class="helper-text" id="password_msg"></span>
			</div>
				<div>
				<button id="userbtn1"> &nbsp; &nbsp; &nbsp;일반회원 로그인 &nbsp; &nbsp;</button>
				<button id="hostbtn1" style="marign-bottom:2%"> &nbsp; &nbsp; &nbsp;호스트 로그인 &nbsp; &nbsp; &nbsp;&nbsp;</button><br>
				<button id="userbtn2" type="button" onclick="location='userfindid'">&nbsp;&nbsp;일반회원&nbsp;정보 찾기 &nbsp; &nbsp;</button>
				<button id="hostbtn2" type="button" onclick="location='hostfindid'"style="margin-bottom:20%">호스트 회원 &nbsp;정보 찾기</button>
			</div>
			</form>
		</div>
		</div>
		
		<% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %> 
	</div>

  </body>
</html>