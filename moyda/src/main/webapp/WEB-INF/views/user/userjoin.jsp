<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 회원가입</title>
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
		background: url("./img/gogo.jpg");
		background-attachment : fixed;
		z-index: -1;
     	opacity: 0.4;
     	position: absolute;
		top: 0;				
    	left: 0;
	}
	
.success {
	color: green;
	font-size: 0.75em;
}

.fail {
	color: red;
	font-size: 0.75em;
}
</style>
<script>
	// 하드디스크에 있는 사진을 읽어와 출력하는 함수
	function loadImage() {
		// $로 html요소를 선택하면 jQuery가 html요소에 이런 저런 메소드와 필드를 추가한 객체 생성 : jQuery객체에서 순수한 html 부분을 꺼내려면 [0]
		var file = $("#sajin")[0].files[0];	
		var maxSize = 1024*1024; // 1MB

		// 파일 크기가 1MB가 넘어가면 오류 처리
		if(file.size>maxSize) {
			Swal.fire({
				icon: 'error',
			  	title: '크기 오류',
				text: '파일크기는 1MB를 넘을 수 없습니다'
			});
			$("#sajin").val("");
			return false;
		}
		
		// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#show_profile").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
		return true;
	}

	// 이메일을 입력하지 않거나 형식이 잘못된 경우 false를 리턴한다
	function emailCheck() {
		var email = $("#email").val();
		// \의 역할 : 원래 의미를 빠져나온다(escape)
		// .은 정규식에서 임의의 글자. 점의 의미로 사용하려면 \.
		var pattern =  /^[A-Za-z][A-Za-z0-9]+@[A-Za-z\.]+$/;
		if(email==="") {
			$("#email_msg").text("필수입력입니다").attr("class", "fail");
			return false;
		} 
		if(pattern.test(email)==false) { 
			$("#email_msg").text("잘못된 이메일형식입니다").attr("class", "fail");
			return false;
		}
		return true;	
	}

	// 비밀번호를 입력하지 않았거나 형식이 잘못된 경우 false를 리턴하는 함수
	function passwordCheck() {
		$("#password_msg").text("");
		var password = $("#password").val();
		// 영숫자, 특수문자 !, @, 8~10자
		var pattern = /^[A-Za-z0-9!@#$%^&*()_+]{8,10}$/;
		if(password==="") {
			$("#password_msg").text("필수입력입니다").attr("class", "fail");
			return false;
		}
		if(pattern.test(password)===false) {
			$("#password_msg").text("8~10자 영문 대 소문자, 숫자, 특수문자를 사용하세요").attr("class", "fail");
			return false;
		}
		return true;
	}

	// 비밀번호 확인을 입력하지 않았거나 비밀번호가 일치하지 않으면 false를 리턴하는 함수
	function password2Check() {
		$("#password2_msg").text("");
		var password = $("#password").val();
		var password2 = $("#password2").val();
		if(password2==="") {
			$("#password2_msg").text("필수 입력입니다").attr("class", "fail");
			return false;
		}
		if(password!==password2) {
			$("#password2_msg").text("비밀번호가 일치하지 않습니다").attr("class", "fail");
			return false;
		}
		return true;
	}

	$(function() {
		$("#sajin").on("change", loadImage);
		
		// 패턴을 통과한 아이디라면 서버로 ajax 요청을 보내 사용가능한지 확인하다
		$("#email").on("blur", function() {
			var params = {
				email:  $("#email").val()
			}
			if(emailCheck()===false)
				return true;
			$.ajax({
				url: "/www/user/emailCheck",
				method: "get",
				data: params,
				success: function() {
					$("#email_msg").text("사용가능한 이메일이에요").attr("class", "success");
				}, error: function(response) {
					console.log(response.status);
					$("#email_msg").text("사용중인 이메일입니다").attr("class", "fail");
				}
			});
		})

		// passwordCheck 호출
		$("#password").on("blur", function() {
			return passwordCheck();
		});

		$("#password2").on("blur", function() {
			return password2Check();
		});

		$("#join").on("click", function(){ 
			// 11=="11"		true 	자료형은 무시. 값을 같다고 볼 수 있는가?
			// 11==="11"	false	자료형까지 비교
			// 회원가입 click -> 아이디, 비밀번호가 패턴을 통과하는 지 확인 -> 통과못하면 작업 중단
/* 	        if(emailCheck()===false)
	        	return false;
			if(passwordCheck()===false)
				return false;
			if(password2Check()===false)
				return false; */
        	
        	// serialize : 폼을 urlencoded 형식(?id=spring&password=1234)으로 변환한다
			$("#joinForm").submit();
		});
	});
</script>
</head>
<body  id="wrap">
	<div>
		<form id="joinForm" action="/www/userjoin" method="post" enctype="multipart/form-data">
			<img id="show_profile" height="240px">
			<input type="hidden" name="_csrf" value="${_csrf.token }">
			<input type="hidden" name="authorities" value="ROLE_USER">
			<div><br><br><br></div>
			<div class="form-group">
				<label for="sajin">프로필 사진</label>
				<input id="sajin" type="file" name="sajin" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
			</div>
			<div>
				<label for="email">아이디</label>
				<span id="email_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="email" name="email"value='아이디는 이메일형식입니다'  onfocus="this.value='';this.style.color='black';">
				</div>
			</div>
			<div>
				<label for="password">비밀번호</label>
				<span id="password_msg"></span>
				<div class="form-group">
					<input id="password" type="password" class="form-control" name="password">
				</div>
			</div>
			<div>
				<label for="password2">비밀번호 확인</label>
				<span id="password2_msg"></span>
				<div class="form-group">
					<input id="password2" type="password" class="form-control">
				</div>	
			</div>
			<div>
				<label for="irum">이름</label>
				<span id="irum_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="irum" name="irum"value='필수입력 사항입니다'  onfocus="this.value='';this.style.color='black';">
				</div>
			</div>
			<div>
				<label for="nickname">닉네임</label>
				<span id="nickname_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="nickname" name="nickname"value='필수입력 사항입니다'  onfocus="this.value='';this.style.color='black';">
				</div>
			</div>
			<div>
				<label for="phone">젼화번호</label>
				<span id="phone_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="phone" name="phone"value='필수입력 사항입니다'  onfocus="this.value='';this.style.color='black';">
				</div>
			</div>
			<div>
				<label for="age">나이</label>
				<span id="age_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="age" name="age" value='필수입력 사항입니다'  onfocus="this.value='';this.style.color='black';">
				</div>
			</div>
			<div>
				<label for="sex">성별</label>
				<span id="sex_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="sex" name="sex"value='필수입력 사항입니다'  onfocus="this.value='';this.style.color='black';">
				</div>
			</div>
			<div>
				<label for="area">활동지역</label>
				<span id="area_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="area" name="area">
				</div>
			</div>

			<div class="form-group" style="text-align: center;">
				<button type="button" id="join" class="btn btn-info">가입</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</form>
	</div>
</body>
</html>