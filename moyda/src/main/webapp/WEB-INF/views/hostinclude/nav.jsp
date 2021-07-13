<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav	{
		width: 200px;
		background-color: #ccc;
	}
	#nav div	{
		width: 150px;
		background-color: #eee;
		border: 1px solid #ddd;
		height: 100px;
		line-height: 100px;
		text-align: center;
		margin: 0 auto;
	}
</style>
</head>
<body>
	host_nav.jsp입니더.
<div id="nav" class="navbar">
	<div class="container-fluid">
		<ul class="nav navbar-nav" id="menu_parent">
			<li>
				<a href="/www/host/myPage">내 정보 보기</a>
				<a href="/www/host/infoUpdate">내 정보 수정</a>
				<a href="/www/host/out">회원가입</a>
			</li>
		</ul>
	</div>
</div>
	
</body>
</html>