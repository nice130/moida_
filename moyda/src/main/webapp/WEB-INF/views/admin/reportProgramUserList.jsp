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
	//신고된 유저 계정 정지
	$(function() {
		$("button[id^='reportUserOut']").on("click", function() {
				var params = {
					userNo : $(this).attr("data-userNo")
				};
				$.ajax({
					url:"/www/admin/reportUserOut",
					method:"post",
					data: params,
					success:function(user){
						console.log(user);
						location.reload();
					},error:function(response){
						console.log(response);
					}
				});
		});
		//신고된 유저 계정 활성화
		$("button[id^='reportUserCom']").on("click", function() {
			var params = {
					userNo : $(this).attr("data-userNo")
			};
			$.ajax({
				url:"/www/admin/reportUserCom",
				method:"post",
				data: params,
				success:function(data){
					console.log(data);
					location.reload();
				},error:function(response){
					console.log(response);
				}
			});
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
	<p>>프로그램에서 신고된 회원 관리</p>
		<div id="list">
			<table class="table table-bordered">
			<colgroup>
				<col width="8%"><col width="30%"><col width="30%">
				<col width="7%"><col width="10%"><col width="15%">
			</colgroup>
				<tr>
					<th>UserNo.</th>
					<th>프로그램</th>
					<th>회원 아이디</th>
					<th>신고 횟수</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
				<c:forEach items="${page.userList}" var="reportUser">
				<tr>
					<td>${reportUser.userNo }</td>
					<td><a href="${reportUser.proNo }">${reportUser.name }</a></td>
					<td><a href="reportUserDetail?userNo=${reportUser.userNo }">${reportUser.email }</a></td>
					<td>${reportUser.reportCnt }</td>
					<td><c:if test="${reportUser.enabled == 1 }">정지</c:if>
					<c:if test="${reportUser.enabled == 0}">활성화</c:if></td>
					<td>
						<button class="btn btn-info btn-sm" type="button" id="reportUserOut" data-userNo='${reportUser.userNo }'>정지</button>
						<button class="btn btn-info btn-sm" type="button" id="reportUserCom" data-userNo='${reportUser.userNo }'>취소</button>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<ul id="pagination" class="pagination">
				<c:if test="${page.prev>0 }">
					<li><a href="/www/admin/reportProgramUserList?pageno=${page.prev }">이전으로</a></li>
				</c:if>
				<c:forEach begin="${page.start }" end="${page.end }" var="i">
					<c:choose>
						<c:when test="${i==page.pageno }">
							<li class="active"><a href="/www/admin/reportProgramUserList?pageno=${i}">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/www/admin/reportProgramUserList?pageno=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.next>0 }">
					<li><a href="/www/admin/reportProgramUserList?pageno=${page.next }">다음으로</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>