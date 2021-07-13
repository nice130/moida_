<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
//신청된 프로그램 승인
$(function() {
	$("button[id^='programGood']").on("click", function() {
		if(confirm("신청 프로그램을 승인, 등록하시겠습니까?")==true){
			alert("프로그램 등록 완료");
		var params = {
				proNo : $(this).attr("data-proNo")
		};
		$.ajax({
			url:"/www/admin/programGood",
			method:"post",
			data:params,
			success:function(result){
				console.log(result);
				location.reload();
			}, error:function(response) {
				console.log(response);
			}
		});
		} else {
			alert("승인 취소");		
		}
	});
	//신청된 프로그램 승인 거절
	$("button[id^='programBad']").on("click", function() {
		var params = {
				proNo : $(this).attr("data-proNo")
		};
		$.ajax({
			url:"/www/admin/programBad",
			method:"post",
			data:params,
			success:function(result){
				console.log(result);
				location.reload();
			}, error:function(response) {
				console.log(response);
			}
		});
	});
});
</script>
<style>
.container {
	width: 800px;
	margin :0 auto;
	margin-top : 30px;
}
th {
	background-color : #F6F6F6;
	text-align : center;
}
</style>
<body>
	<div id="page" class="container">
	<p>>신청한 프로그램 상세정보</p>
		<div id="list">
			<table class="table table-bordered">
			<colgroup>
				<col width="25%"><col width="25%"><col width="25%">
				<col width="25%">
			</colgroup>
			<c:forEach items="${proDetail}" var="proDetail">
				<tr>
					<th>ProNo.</th>
					<td>${proDetail.proNo }</td>
					<th>프로그램 명</th>
					<td>${proDetail.name }</td>
				</tr>
				<tr>
					<th>활동지역</th>
					<td>${proDetail.area }</td>
					<th>호스트 ID</th>
					<td>${proDetail.email}</td>
				</tr>
				<tr>
					<th>참가비</th>
					<td>${proDetail.fee }</td>
					<th>참가정원</th>
					<td>총 30명</td>
				</tr>
				<tr>
					<th>프로그램상태</th>
					<td><c:if test="${proDetail.enabled.equals(true) }">승인</c:if>
					<c:if test="${proDetail.enabled.equals(false) }">거절</c:if></td>
					<th>승인/거절</th>
					<td>
						<button class="btn btn-info btn-sm" type="button" id="programGood" data-proNo='${proDetail.proNo }'>승인</button>
						<button class="btn btn-info btn-sm" type="button" id="programBad" data-proNo='${proDetail.proNo }'>거절</button>
					</td>
				</tr>
				<tr>
					<th colspan="4">프로그램 신청정보</th>
				</tr>
				<tr>
					<td colspan="4">${proDetail.content }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>