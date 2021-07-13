<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<script src="/moyda_/ckeditor/ckeditor.js"></script>
<script>

</script>
</head>
<body>
	<div id="content_div">
		<div class="form-group">
			<div class="form-control" id="content">${board.content }</div>
		</div>
		<div id="btn_area">
			<button id="update" class="btn btn-info">변경</button>
			<button id="delete" class="btn btn-success">삭제</button>
		</div>
	</div>
</body>
</html>