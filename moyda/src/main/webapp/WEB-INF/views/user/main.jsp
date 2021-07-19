<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script>
</script>
<style>
	.container {
		width: 85%;
		margin :0 auto;
	}
	th {
		background-color : #F6F6F6;
		text-align : center;
	}
	table {
		text-align : center;
	}
	.pagination {
		display : block;
		text-align : center;
	}
	.pagination > li > a {
		float : none;
		margin-left:-5px;
	}
</style>
<body>
	<div id="page" class="container">
		<p>나의 클럽 리스트</p>
		<div id="list">
			<table class="table table-bordered">
			<colgroup>
				<col width="10%"><col width="25%"><col width="25%">
				<col width="10%"><col width="15%"><col width="15%">
			</colgroup>
				<tr>
					<th>ProNo.</th>
					<th>프로그램 명</th>
					<th>호스트 ID</th>
					<th>장소</th>
					<th>참가비</th>
					<th>상세보기</th>
				</tr>
				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>					
				
			</table>
		</div>
		<p>나의 관심 프로그램</p>
		<div>
			
		</div>
	</div>
</body>
</html>