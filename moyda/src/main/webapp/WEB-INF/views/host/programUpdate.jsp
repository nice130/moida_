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
		
		if($("#programNameChange").val()!=""){
			var programName = $("#programNameChange").val();
		} else {
			var programName = $("#programName").val();
		}
		if($("#contentChange").val()!=""){
			var content = $("#contentChange").val();
		} else {
			var content = $("#content").val();
		}
		if($("#scheduleChange").val()!=""){
			var schedule = $("#scheduleChange").val();
		} else {
			var schedule = $("#schedule").val();
		}
		if($("#locationChange").val()!=""){
			var location = $("#locationChange").val();
		} else {
			var location = $("#location").val();
		}
		if($("#feeChange").val()!=""){
			var fee = $("#feeChange").val();
		} else {
			var fee = $("#fee").val();
		}
		if($("#noteChange").val()!=""){
			var note = $("#noteChange").val();
		} else {
			var note = $("#note").val();
		}
		var formData = new FormData();
		
		formData.append("profile", profile);
		formData.append("programName", programName);
		formData.append("content", content);
		formData.append("schedule", schedule);
		formData.append("location", location);
		formData.append("fee", fee);
		formData.append("note", note);
		
		$.ajax({
			url: "/www/host/programUpdate",
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
			<td colspan="2"><span id="profile"><img id="show_profile" height="200px;" src="${pro.profile }"></span></td>
			<td class="first">
				변경할 프로필 사진
			</td>
			<td colspan="2"><span id="profile"><img id="show_profile" height="200px;" src="${pro.profile }"></span>
				<input type="file" name="profile" id="profileChange" value="${pro.profile }">
			</td>
		</tr>	
		<tr>
			<td class="first">
				프로그램 명
			</td>
			<td>
				<input type="text" id="programName" value="${pro.programName}">
			</td>
			<td class="first">
				변경할 프로그램 명
			</td>
			<td>
				<input type="text" id="programNameChange" value="${pro.programName}" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				프로그램 소개
			</td>
			<td>
				<input type="text" id="content" value="${pro.content }">
			</td>
			<td class="first">
				변경할 프로그램 소개
			</td>
			<td>
				<input type="text" id="contentChange" value="${pro.content }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				일정
			</td>
			<td>
				<input type="text" id="schedule" value="${pro.schedule }">
			</td>
			<td class="first">
				변경할 일정
			</td>
			<td>
				<input type="text" id="scheduleChange" value="${pro.schedule }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				장소
			</td>
			<td>
				<input type="text" id="location" value="${pro.location }">
			</td>
			<td class="first">
				변경할 장소
			</td>
			<td>
				<input type="text" id="locationChange" value="${pro.location }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				참가비
			</td>
			<td>
				<input type="text" id="fee" value="${pro.fee }">
			</td>
			<td class="first">
				변경할 참가비
			</td>
			<td>
				<input type="text" id="feeChange" value="${pro.fee }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>
		<tr>
			<td class="first">
				유의사항
			</td>
			<td>
				<input type="text" id="note" value="${pro.note }">
			</td>
			<td class="first">
				변경할 유의사항
			</td>
			<td>
				<input type="text" id="noteChange" value="${pro.note }" onfocus="this.value='';this.style.color='black';">
			</td>
		</tr>	
	</table>
	<button type="button" class="btn btn-success" id="update">변경하기</button>
</body>
</html>