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
	#list {
		margin-top : 20px;	
	}
	#list ul li {
		list-style-type : none;
		display : inline;
		margin-left : 50px;
		font-size : 20px;
	}
</style>
</head>
<body>
	<div id="list">
		<ul>
			<li><a href="myPage">내 정보</a></li>
			<li><a href="myProgram">내 프로그램</a></li>
			<li><a href="pay">내 캐쉬</a></li>
		</ul>
	</div>
	<hr>
	<div id="page">
		<main>
			<jsp:include page="${my}"/>
		</main>
	</div>
</body>
</html>