<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.grid {
	width: 80%;
	margin: 0 auto;
	background-color: #EAEAEA;
	text-align: center;
	font-size: 30px;
	line-height:65px;
}

.grid_item {
	width: 200px;
	height: 130px;
	display: inline-block;
	vertical-align: top;
}

.grid_item.first {
	background-color: #E4F7BA;
	margin-right : 50px;
}

.grid_item.two {
	background-color: #E4F7BA;
	margin-right : 50px;
}

.grid_item.third {
	background-color: #E4F7BA;
}
</style>
</head>
<body>
	<div class="grid">
		<div class="grid_item first">광고</div>
		<div class="grid_item two">광고</div>
		<div class="grid_item third">광고</div>
	</div>
</body>
</html>