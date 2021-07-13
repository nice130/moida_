<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	var msg = "${msg}";
	if(msg!="") {
		$("#alert").text(msg);
		$("#msg").show();
	}
});
</script>
</head>
<body>
<div class="alert alert-danger alert-dismissible" id="msg" style="display:none;">
   	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>서버 메시지 </strong><span id="alert"></span>
</div>
<div id="page">
	<div id="list">
		<table class="table table-hover" style="width:800px;">
			<colgroup>
				<col width="10%"><col width="10%"><col width="60%">
				<col width="10%"><col width="10%">
			</colgroup>
			<tr>
				<th>프번</th><th>호번</th><th>프명</th><th>큰카</th><th>작카</th>
			</tr>
			<c:forEach items="${page.list}" var="pro">
				<tr>
					<td>${pro.proNo }</td>
					<td>${pro.hostNo }</td>
					<td>
						<a href="/www/program/read?proNo=${pro.proNo }" >${pro.programName }</a>
					</td>
					<td>${pro.caBNo }</td>
					<td>${pro.caSNo }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<ul id="pagination" class="pagination">
			<c:if test="${page.prev>0 }">
				<li><a href="/www/program/list?pageno=${page.prev}">이전으로</a></li>
			</c:if>
			<c:forEach begin="${page.start }" end="${page.end }" var="i">
				<c:choose>
					<c:when test="${i==page.pageNo }">
						<li class="active"><a href="/www/program/list?pageno=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/www/program/list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.next>0 }">
				<li><a href="/www/program/list?pageno=${page.next}">다음으로</a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>