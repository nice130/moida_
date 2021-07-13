<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
<style>
#nav {
	background-color : lightgray;
	border : 1px solid lightgray;
}
</style>
</head>
<body>
<div id="nav" class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/www">모이다</a>
		</div>
			<ul class="nav navbar-nav" id="menu_parent">
          		<li><a href="">게시판</a></li>
          		<li><a href="/www/category">카테고리</a></li>
          	</ul>
          	<ul class="nav navbar-nav" id="menu_parent">
          		<li><a href="">검색공간</a></li>
          		<li><a href="/www/notice?pageNo=${pageNo }">고객센터</a></li>
          		<li><a href="">알림공간</a></li>
          		<li><a href="">프로필공간</a></li>
          		<li><a href="">닉네임</a></li>
          		<li><a href="">로그아웃</a></li>
			</ul>
	</div>
</div>
</body>
</html>