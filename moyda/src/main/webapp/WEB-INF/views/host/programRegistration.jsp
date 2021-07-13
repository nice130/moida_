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
$(function() {
	$("#regi").on("click", function() {
		var profile = $("#profileRegi").val();
		var programName = $("#programNameRegi").val();
		var content = $("#contentRegi").val();
		var hostProfile = $("#hostProfileRegi").val();
		var schedule = $("#scheduleRegi").val();
		var location = $("#locationRegi").val();
		var fee = $("#feeRegi").val();
		var note = $("#noteRegi").val();
		var caBNo = $("#caBNoRegi").val();
		var caSNo = $("#caSNoRegi").val();
		
		var formData = new FormData();
		
		formData.append("profile", profile);
		formData.append("programName", programName);
		formData.append("content", content);
		formData.append("hostProfile", hostProfile);
		formData.append("schedule", schedule);
		formData.append("location", location);
		formData.append("fee", fee);
		formData.append("note", note);
		formData.append("caBNo", caBNo);
		formData.append("caSNo", caSNo);
		
		$.ajax({
			url: "/www/host/programRegistration",
			data: formData,
			method: "post",
			processData: false,
			contentType: false,
			
		});
	});
});
</script>
</head>
<body>
		<div>
		너도사진이필요하니?
		<img id="show_profile" height="200px;" src="${host.profile }">
	</div>
	<div>
		<input type="file" name="profile" id="profile">
	</div>
	<table class="table table-hover" id="pro">
		<tr>
			<td class="first">
					프로그램 명
			</td>
			<td>
				<input type="text" id="programNameRegi" value="">
			</td>
		</tr>
		<tr>
			<td class="first">
				프로그램 소개
			</td>
			<td>
				<input type="text" id="contentRegi" value="">
			</td>
		</tr>
		<tr>
			<td class="first">
				호스트 프로필
			</td>
			<td>
				<input type="text" id="hostProfileRegi" value="">
			</td>
		</tr>
		<tr>
			<td class="first">
				일정
			</td>
			<td>
				<input type="text" id="scheduleRegi" value="">
			</td>
		</tr>
		<tr>
			<td class="first">
				장소
			</td>
			<td>
				<input type="text" id="locationRegi" value="">
			</td>
		</tr>
		<tr>
			<td class="first">
				참가비
			</td>
			<td>
				<input type="text" id="feeRegi" value="">
			</td>
		</tr>
		<tr>
			<td class="first">
				유의사항
			</td>
			<td>
				<input type="text" id="noteRegi" value="">
			</td>
		</tr>	
		<tr>
			<td class="first">
				크으으으은카테고리
			</td>
			<td>
				<input type="text" id="caBNoRegi" value="">
			</td>
		</tr>	
		<tr>
			<td class="first">
				작으으으은카테고리
			</td>
			<td>
				<input type="text" id="caSNoRegi" value="">
			</td>
		</tr>	
	</table>
	<button type="button" class="btn btn-success" id="regi">등록하기</button>
	
</body>
</html>