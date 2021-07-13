<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(function() {
	$("#out").on("click", function() {
		var $input = $("<input>").attr("type", "hidden").attr("name", "_crsf").val('${_csrf.token}');
		$("<form>").attr("action", "/www/host/programDelete").attr("method", "post").append($input).appendTo("body").submit();
	});
});
</script>
</head>
<body>
	정말삭제하시겠슴까?
	<button type="button" class="btn btn-alert" id="out">프로그램 삭제하기</button>
</body>
</html>