<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	#host td {
		height: 60px;
		line-height: 60px;
	}
	
	#host td input {
		height: 25px;
	}
	
	#tel1, #tel2, #tel3 {
		width: 125px;
	}
	
	.first {
		background-color: #f3f3f3;
		text-align: center;
	}
	#profile_sajin {
		line-height: 25px;
	}
	.key {
		width: 35%;
		display: inline-block;
	}
</style>
<script>
//하드디스크에 있는 사진을 읽어와 출력하는 함수
function loadImage() {
	// $로 html요소를 선택하면 jQuery가 html요소에 이런 저런 메소드와 필드를 추가한 객체 생성 : jQuery객체에서 순수한 html 부분을 꺼내려면 [0]
	var file = $("#profile")[0].files[0];	
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

$(function() {
	$("#update").on("click", function() {
		
		var profile = $("#profileChange").val();
		
		if($("#nicknameChange").val()!=""){
			var nickname = $("#nicknameChange").val();
		} else {
			var nickname = $("#nickname").val();
		}
		if($("#phoneChange").val()!=""){
			var phone = $("#phoneChange").val();
		} else {
			var phone = $("#phone").val();
		}
		if($("#areaChange").val()!=""){
			var area = $("#areaChange").val();
		} else {
			var area = $("#area").val();
		}
		if($("#accountChange").val()!=""){
			var account = $("#accountChange").val();
		} else {
			var account = $("#account").val();
		}
		if($("#passwordChange").val()!=""){
			var password = $("#passwordChange").val();
		} else {
			var password = $("#password").val();
		}
		if($("#licenseChange").val()!=""){
			var license = $("#licenseChange").val();
		} else {
			var password = $("#license").val();
		}
		var formData = new FormData();
		
		formData.append("profile", profile);
		formData.append("nickname", nickname);
		formData.append("phone", phone);
		formData.append("area", area);
		formData.append("account", account);
		formData.append("password", password);
		formData.append("license", license);
		
		$.ajax({
			url: "/www/host/update",
			data: formData,
			method: "post",
			processData: false,
			contentType: false,
			success: function() {
				location.reload();
			}, error: function(xhr) {
				console.log(xhr.response)
				toastr.info("변경실패", "서버메시지");
			}
		});
	});
});
</script>
</head>
<body>
	
	<table class="table table-hover" id="host">
		<tr>
			<td class="first">
				프로필 사진
			</td>
			<td colspan="2"><span id="profile"><img id="show_profile" height="200px;" src="${host.profile }"></span></td>
			<td class="first">
				변경할 프로필 사진
			</td>
			<td colspan="2"><span id="profile"><img id="show_profile" height="200px;" src="${host.profile }"></span>
				<input type="file" name="profile" id="profileChange" value="${host.profile }">
			</td>
		</tr>	
		<tr>
			<td class="first">
				닉네임
			</td>
			<td>
				<input type="text" id="nickname" value="${host.nickname}">
			</td>
			<td class="first">
				변경할 닉네임
			</td>
			<td>
				<input type="text" id="nicknameChange" value="${host.nickname}" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				전화번호
			</td>
			<td>
				<input type="text" id="phone" value="${host.phone }">
			</td>
			<td class="first">
				변경할 전화번호
			</td>
			<td>
				<input type="text" id="phoneChange" value="${host.phone }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				활동지역
			</td>
			<td>
				<input type="text" id="area" value="${host.area }">
			</td>
			<td class="first">
				변경할 활동지역
			</td>
			<td>
				<input type="text" id="areaChange" value="${host.area }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				계좌번호
			</td>
			<td>
				<input type="text" id="account" value="${host.account }">
			</td>
			<td class="first">
				변경할 계좌번호
			</td>
			<td>
				<input type="text" id="accountChange" value="${host.account }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				비밀번호
			</td>
			<td>
				<input type="text" id="password" value="${host.password }">
			</td>
			<td class="first">
				변경할 비밀번호
			</td>
			<td>
				<input type="text" id="passwordChange" value="${host.password }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				자격증
			</td>
			<td>
				<input type="text" id="license" value="${host.license }">
			</td>
			<td class="first">
				변경할 자격증
			</td>
			<td>
				<input type="text" id="licenseChange" value="${host.license }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
	</table>
	<button type="button" class="btn btn-success" id="update">변경하기</button>
</body>
</html>