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
</head>
<body>
	<table class="table table-hover" id="host">
		<tr>
			<td class="first">프로필 사진</td><td colspan="2"><span id="profile"><img id="show_profile" height="200px;" src="${host.profile }"></span></td>
		</tr>	
		<tr>
			<td class="first">닉네임</td><td colspan="2"><span id="nickname">${host.nickname }</span></td>
		</tr>	
		<tr>
			<td class="first">전화번호</td><td colspan="2"><span id="phone">${host.phone }</span></td>
		</tr>
		<tr>
			<td class="first">활동지역</td><td colspan="2"><span id="area">${host.area }</span></td>
		</tr>
		<tr>
			<td class="first">계좌번호</td><td colspan="2"><span id="account">${host.account }</span></td>
		</tr>
		<tr>
			<td class="first">자격증</td><td colspan="2"><span id="hostProfile">${host.license }</span></td>
		</tr>
	</table>
</body>
</html>