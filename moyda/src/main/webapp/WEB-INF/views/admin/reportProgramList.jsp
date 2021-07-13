<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script>
	//신고된 프로그램 삭제
	$(function() {
		$("button[id^='reportProgramOut']").on("click", function() {
			if(confirm("정말 프로그램을 삭제하겠습니까?")==true){
				alert("프로그램 삭제 및 계정 정지 완료");
				var params = {
					proNo : $(this).attr("data-proNo"),
					hostNo : $(this).attr("data-hostNo")
				};
				$.ajax({
					url:"/www/admin/reportProgramAndHostOut",
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
				alert("취소되었습니다.")
			};
		});
	});
</script>
<style>
	#btn {
		text-align : center;
	}
	.container {
		width : 85%;
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
	<p>>신고된 프로그램 관리</p>
		<div id="list">
			<table class="table table-bordered">
			<colgroup>
				<col width="10%"><col width="20%"><col width="20%">
				<col width="20%"><col width="15%"><col width="15%">
			</colgroup>
				<tr>
					<th>ProNo.</th>
					<th>프로그램 명</th>
					<th>호스트 ID</th>
					<th>신고회원 ID</th>
					<th>호스트신고횟수</th>
					<th>관리</th>
				</tr>
				<c:forEach items="${page.proList}" var="reportPro">
				<tr>
					<td>${reportPro.proNo }</td>
					<td><a href="">${reportPro.name }</a></td>
					<td><a href="hostDetail?hostNo=${reportPro.hostNo }">${reportPro.hostEmail }</a></td>
					<td><a href="reportUserDetail?userNo=${reportPro.userNo}">${reportPro.userEmail }</a></td>
					<td>${reportPro.reportCnt }</td>
					<td>
						<button class="btn btn-info btn-sm" type="button" id="reportProgramOut" data-proNo='${reportPro.proNo }' data-hostNo='${reportPro.hostNo}'>
						삭제/정지</button>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<ul id="pagination" class="pagination">
				<c:if test="${page.prev>0 }">
					<li><a href="/www/admin/reportProgramList?pageno=${page.prev }">이전으로</a></li>
				</c:if>
				<c:forEach begin="${page.start }" end="${page.end }" var="i">
					<c:choose>
						<c:when test="${i==page.pageno }">
							<li class="active"><a href="/www/admin/reportProgramList?pageno=${i}">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/www/admin/reportProgramList?pageno=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.next>0 }">
					<li><a href="/www/admin/reportProgramList?pageno=${page.next }">다음으로</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>