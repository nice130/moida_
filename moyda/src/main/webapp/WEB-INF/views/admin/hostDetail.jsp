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
//프로그램 신고되어 계정 정지된 호스트 계정 활성화
$(function() {
	$("button[id^='reportHostCom']").on("click", function() {
		if(confirm("계정정지를 해제하겠습니까?")==true){
			var params = {
				hostNo : $(this).attr("data-hostNo")
			};
			$.ajax({
				url:"/www/admin/reportHostCom",
				method:"post",
				data: params,
				success:function(result){
					console.log(result);
					location.reload();
				},error:function(response){
					console.log(response);
				}
			});
		} else {
			alert("계정 정지상태 유지")
		};
	});
});
</script>
<style>
	.container {
		width : 1000px;
		margin :0 auto;
	}
	th {
		background-color : #F6F6F6;
		text-align : center;
	}
</style>
<body>
	<div id="page" class="container">
	<p>>호스트 상세정보</p>
		<div id="list">
			<table class="table table-bordered">
			<colgroup>
				<col width="25%"><col width="25%"><col width="25%">
				<col width="25%">
			</colgroup>
			<c:forEach items="${hostDetail}" var="hostDetail">
				<tr><th colspan="4">프로필사진</th></tr>
				<tr><td colspan="4"><img src="/profile/${hostDetail.profile}"/></td></tr>
				<tr>
					<th>HostNo.</th>
					<td>${hostDetail.hostNo}</td>
					<th>호스트 ID</th>
					<td>${hostDetail.email}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${hostDetail.phone}</td>
					<th>활동지역</th>
					<td>${hostDetail.area}</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td>${hostDetail.account}</td>
					<th>신청/신고된 프로그램</th>
					<td><a href="programDetail?proNo=${hostDetail.proNo}">${hostDetail.name }</a></td>
				</tr>
				<tr>
					<th>계정정지해제</th>
					<td><c:if test="${hostDetail.enabled.equals(true) }">
							<button class="btn btn-info btn-sm" type="button" id="reportHostCom" data-hostNo='${hostDetail.hostNo}'>
							정지해제</button>
						</c:if>
						<c:if test="${hostDetail.enabled.equals(false) }">
							활성된 계정
						</c:if>
					</td>
					<th>계정상태</th>
					<td><c:if test="${hostDetail.enabled.equals(true) }">정지</c:if>
						<c:if test="${hostDetail.enabled.equals(false) }">활성화</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>