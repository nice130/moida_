<!-- jsp directive -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/rboard2/css/read.css">
<style>
	/* 
	block요소 - 한 줄을 차지. margin: 0 auto;
	inline 요소 - 자신이 가진 내용의 너비만큼 차지
	inline-block - 너비가 적용
	*/
	#attachment a {
		width: 200px;
		display: inline-block;
	}
	.fa-trash-o {
		color: red;
		cursor: pointer;
	}
</style>
<sec:authorize access="isAnonymous()">
	<script>
		var isLogin = false;
		var loginId = undefined;
	</script>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<script>
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
	</script>
</sec:authorize>
<script src="/rboard2/ckeditor/ckeditor.js"></script>
<script>
$(function() {
	$("#signUp").on("click", function() {
		alert("hi");
		$.ajax({
			url:"/www/program/signUp",
			method: "post"
		});
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div>
		<div id="title_div">
			<div id="upper">
				<input type="text" id="programName" disabled="disabled" value="${pro.programName }">
				<span id="hostNo">${pro.hostNo }</span>
			</div>
			<div id="lower">
				<ul id="lower_left">
					<li>프로그램번호<span id="proNo">${pro.proNo }</span></li>
					<li>개강번호<span id="proNo">${pro.openNo }</span></li>
					<li><span id="license">${pro.license }</span></li>
				</ul>
				<ul id="lower_right">
					<li>
						<span id="caBNo">${pro.caBNo }</span>
					</li>
					<li>
						<span id="caSNo">${pro.caSNo }</span>
					</li>
				</ul>
			</div>
		</div>
		<div id="content_div">
			<div class="form-group">
				<div class="form-control" id="content">${pro.content }</div>
			</div>
		</div>
		<div id="content_div">
			<div class="form-group">
				<div class="form-control" id="fee">${pro.fee }</div>
			</div>
		</div>
		<div id="content_div">
			<div class="form-group">
				<div class="form-control" id="note">${pro.note }</div>
			</div>
		</div>
		<div id="content_div">
			<div class="form-group">
				<div class="form-control" id="schedule">${pro.schedule }</div>
			</div>
		</div>
		<div id="content_div">
			<div class="form-group">
				<div class="form-control" id="location">${pro.location }</div>
			</div>
		</div>
		<hr>
	</div>
</div>
<button type="button" class="btn btn-info" id="signUp">참가 신청</button>
</body>




</html>