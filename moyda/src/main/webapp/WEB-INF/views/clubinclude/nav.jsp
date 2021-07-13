<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.clubNo }클럽</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
<div class="bgded overlay padtop"
		style="background-image: url('${club.profile}')">

		<header id="header" class="hoc clear">
			<div id="logo" class="fl_left">

				<h1>
					<a href="index.html">모이다</a>
				</h1>

			</div>
			<nav id="mainav" class="fl_right">

				<ul class="clear">
					<li class="active"><a
						href="/www/club/clubgo?clubNo=${sessionScope.clubNo }">ClubHome</a></li>
					<li><a class="drop" href="#">게시판</a>
						<ul>
							<li><a href="/www/club/clublist?clubNo=${sessionScope.clubNo }">클럽 게시판</a></li>
							<li><a href="pages/full-width.html">모임 게시판</a></li>
						</ul></li>
					<li><a class="drop" href="#">슈퍼클럽 결제</a>
					<li><a class="drop" href="#">클럽 관리</a>
						<ul>
							<li><a href="#">클럽 운영</a></li>
							<li><a class="drop" href="#">클럽 관리 홈</a>
								<ul>
									<li><a href="#">가입 승인 대기자 확인</a></li>
								</ul></li>
							<li><a href="#">클럽 원 및 스텝 관리</a></li>
						</ul></li>
				</ul>
			</nav>
		</header>
		
		<div id="pageintro" class="hoc clear">
			<article>
				<h3 class="heading">${club.name }</h3>
				<p>${club.content }</p>
				<footer>
					<ul class="nospace inline pushright">
						<li><a class="btn" href="#">게시글 작성하러 가기</a></li>
						<li><a class="btn inverse" href="#">모임 만들러 가기</a></li>
					</ul>
				</footer>
			</article>
		</div>
	</div>
	<!-- End Top Background Image Wrapper -->
	<div class="wrapper row1">
		<section id="ctdetails" class="hoc clear">
			<ul class="nospace clear">
				<li class="one_quarter first">
					<div class="block clear">
						<a href="#"><i class="fas fa-phone"></i></a> <span><strong>개설일
								:</strong> 2020.10.10</span>
					</div>
				</li>
				<li class="one_quarter">
					<div class="block clear">
						<a href="#"><i class="fas fa-envelope"></i></a> <span><strong>슈퍼클럽</strong>슈퍼클럽
							가입여부 X</span>
					</div>
				</li>
				<li class="one_quarter">
					<div class="block clear">
						<a href="#"><i class="fas fa-clock"></i></a> <span><strong>회원
								등급:</strong> 클럽장</span>
					</div>
				</li>
				<li class="one_quarter">
					<div class="block clear">
						<a href="#"><i class="fas fa-map-marker-alt"></i></a> <span><strong>회원별명
								및 아이디 정보 및 작성한 게시글</strong> 클럽장 OR 회원별명 <a href="#">12</a></span>
					</div>
				</li>
			</ul>
		</section>
	</div>
</body>
</html>