<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script>
</script>
<style>
	.container {
		width : 1000px;
		margin :0 auto;
	}
	th {
		background-color : #F6F6F6;
		text-align : center;
	}
	img {
		height : 200px;
		text-align : center;
	}
</style>
<body>
	<div id="page" class="container">
	<p>>신고된 회원 상세정보</p>
		<div id="list">
			<table class="table table-bordered">
				<tr><th colspan="4">프로필사진</th></tr>
				<tr><td colspan="4"><img src="/profile/${userDetail.profile }"/></td></tr>
				<tr>
					<th>UserNo.</th>
					<td>${userDetail.userNo}</td>
					<th>아이디(이메일)</th>
					<td>${userDetail.email}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userDetail.irum}</td>
					<th>닉네임</th>
					<td>${userDetail.nickname}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${userDetail.age}</td>
					<th>성별</th>
					<td>${userDetail.sex}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${userDetail.phone}</td>
					<th>활동지역</th>
					<td>${userDetail.area}</td>
				</tr>
				<tr>
					<th>신고 횟수</th>
					<td>${userDetail.reportCnt}</td>
					<th>계정상태</th>
					<td><c:if test="${userDetail.enabled.equals(true)}">정지</c:if>
					<c:if test="${userDetail.enabled.equals(false)}">활성화</c:if></td>
				</tr>
				<tr>
					<th>계정잔액</th>
					<td>${userDetail.cash}</td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
</body>
</html>