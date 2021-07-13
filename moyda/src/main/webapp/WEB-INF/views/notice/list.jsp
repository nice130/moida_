<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
tr {
	font-size: 15px;
}

h2 {
	font-size: 30px;
}

#no {
	font-size: 20px;
}
 #gg{
	margin : 0 auto;
	text-align: center;
}
</style>
</head>
<body>
${bpage }
	<div class="container">
		<h2>고객센터</h2>
		<p>
			<a href="/www/notice?pageNo=123" id="no">공지사항</a>&emsp;&emsp;&emsp;<a href="help">HELP</a>&emsp;&emsp;&emsp;<a
				href="access">이용약관</a>
		</p>

		<table class="table">
			<thead>
				<tr>
					<th>공지</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
				<c:forEach items="${bpage.list}" var="board">
					<tr>
						<td>${board.title }</td>
						<td>${board.content }</td>
						<td>${board.writer }</td>
					</tr>
				</c:forEach>
		</table>
	</div>
		<div id="gg">
		<ul id="pagination" class="pagination">
			<c:if test="${bpage.prev>0 }">
				<li><a href="/www/notice?pageNo=${bpage.prev}">이전으로</a></li>
			</c:if>
			<c:forEach begin="${bpage.start }" end="${bpage.end }" var="i">
				<c:choose>
					<c:when test="${i==bpage.pageno }">
						<li class="active"><a href="/www/notice?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/www/notice?pageNo=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${bpage.next>0 }">
				<li><a href="/www/notice?pageNo=${bpage.next}">다음으로</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>