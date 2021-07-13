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
<script>
$(function() {
	$("#request").on("click", function() {
		alert("hi");
		$.ajax({
			url:"/www/host/pay",
			method: "post"
		});
	});
});
</script>
</head>
<body>
	<table class="table table-hover" id="pro">
		<tr>
			<td class="first">프로그램 명</td><td colspan="2"><span id="name">${pro.programName }</span></td>
		</tr>		
		<tr>
			<td class="first">참가비</td><td colspan="2"><span id="fee">${pro.fee }</span></td>
		</tr>		
		<tr>
			<td class="first">참가현황</td><td colspan="2"><span id="nop">${pro.nop }명</span></td>
		</tr>
		<tr>
			<td class="first">이만큼줘 !!</td><td colspan="2"><span id="fee_nop">${pro.fee * pro.nop }원</span></td>
			<td>	<button type="button" class="btn btn-success" id="request">계좌로 송금하기</button></td>
		</tr>
	</table>
</body>
</html>