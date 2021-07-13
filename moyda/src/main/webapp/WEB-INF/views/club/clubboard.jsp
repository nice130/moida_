<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!--
Template Name: Nekmit
Author: <a href="https://www.os-templates.com/">OS Templates</a>
Author URI: https://www.os-templates.com/
Copyright: OS-Templates.com
Licence: Free to use under our free template licence terms
Licence URI: https://www.os-templates.com/template-terms
-->
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Nekmit | Pages | Full Width</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <div class="content"> 
      <h1>클럽 게시판</h1>
      <div class="scrollable">
        <table>
          <thead>
            <tr>
              <th>번호</th>
              <th>글쓴이</th>
              <th>제목</th>
              <th>날짜?</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${page.list}" var="board">
				<tr>
					<td>${board.clubBoardNo }</td>
					<td>${board.writer }</td>
					<td>
						<a href="/rboard2/board/read?bno=${board.clubBoardNo }" >${board.title }</a>
					</td>
					<td>${board.writeTimeStr }</td>
					<td>${board.readCnt }</td>
				</tr>
			</c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <div>
		<ul id="pagination" class="pagination">
			<c:if test="${page.prev>0 }">
				<li><a href="/www/club/clublist?pageno=${page.prev}">이전으로</a></li>
			</c:if>
			<c:forEach begin="${page.start }" end="${page.end }" var="i">
				<c:choose>
					<c:when test="${i==page.pageno }">
						<li class="active"><a href="/www/club/clublist?pageno=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/www/club/clublist?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach> 
			<c:if test="${page.next>0 }">
				<li><a href="/www/club/clublist?pageno=${page.next}">다음으로</a></li>
			</c:if>
		</ul>
	</div>
</div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row5"> z
  <div id="copyright" class="hoc clear"> 
    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a target="_blank" href="https://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
  </div>
</div>
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="<c:url value="/resources/layout/scripts/jquery.min.js" />">
<script src="<c:url value="/resources/layout/scripts/jquery.backtotop.js" />">
<script src="<c:url value="/resources/layout/scripts/jquery.mobilemenu.js" />">
</body>
</html>