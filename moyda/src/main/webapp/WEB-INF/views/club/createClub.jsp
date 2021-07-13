<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>클럽개설</title>
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/clean-blog.min.css" rel="stylesheet">

</head>
<style>
			img { display: block; margin: 0px auto; }
		</style>
<script>
$(function() {
$('#add_member_form').submit(function() {
		var captcha = 1;
		$.ajax({
            url: '/pro/VerifyRecaptcha',
            type: 'post',
            data: {
                recaptcha: $("#g-recaptcha-response").val()
            },
            success: function(data) {
                switch (data) {
                    case 0:
                        console.log("자동 가입 방지 봇 통과");
                        captcha = 0;
                		break;
                    case 1:
                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                        break;
                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		break;
                }
            }
        });
		if(captcha != 0) {
			return false;
		} 
});
});
function usernameCheck() {
	var clubname = $("#clubname").val();
	$("#clubname").val(clubname);
	var pattern = /^[가-힣]*$/;
	if(clubname==="") {
		$("#clubname_msg").text("필수입력입니다").attr("class","fail");
		return false;
	}
	if(pattern.test(clubname)==false) { 
		$("#clubname_msg").text("한글만 입력가능합니다").attr("class", "fail");
		return false;
	}
	return true;
}

function loadImage() {
	// $로 html요소를 선택하면 jQuery가 html요소에 이런 저런 메소드와 필드를 추가한 객체 생성 : jQuery객체에서 순수한 html 부분을 꺼내려면 [0]
	var file = $("#profile")[0].files[0];	
	var maxSize = 1024*1024; // 1MB

	// 파일 크기가 1MB가 넘어가면 오류 처리
	/* if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#profile").val("");
		return false;
	} */
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_profile").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}

$(function() {
	$("#profile").on("change", loadImage);
	
	// 패턴을 통과한 아이디라면 서버로 ajax 요청을 보내 사용가능한지 확인하다
	$("#username").on("blur", function() {
		var params = {
			clubname:  $("#clubname").val()
		}
		if(usernameCheck()===false)
			return false;
		$.ajax({
			url:"/www/club/nameCheck",
			data: params,
			success:function(result) {
				console.log(result);
				$("#clubname_msg").text("좋은 아이디네요").attr("class","success");
			}, error: function(response) {
				console.log(response.status);
				$("#clubname_msg").text("사용중인 아이디입니다").attr("class", "fail");
			}
		});
	});
	
	$("#join").on("click", function(){ 
		$("#joinForm").submit();
	});
}); 
</script>
<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="index.html">모이다 </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="index.html">ClubHome</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">클럽 게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="post.html">모임 게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">클럽 관리</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/www/resources/img/about-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>클럽 만들기</h1>
            <span class="subheading">나와 같은 관심사를 가진 클럽원을 모집하고 열심히 운영하여 클럽을 성장시켜보세요.</span>
          </div>
        </div>
      </div>
    </div>
  </header>
<div id="wrap">
<form id="joinForm" action="/www/club/clubcreate" method="post" enctype="multipart/form-data">
	<img id="show_profile" height="240px" style="display:block">
	<input type="hidden" name="_csrf" value="${_csrf.token }">
	<input type="hidden" name="authorities" value="ROLE_USER">
  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="post-preview">
        <div class="form-group">
        <label for="profile" class="post-title">프로필 사진</label>
 		<input id="profile" type="file" name="profile" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
         </div>
        </div>
        <hr>
        <div>
				<label for="clubname">클럽이름</label>
				<span id="clubname_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="clubname" name="name">
				</div>
		</div>
		<hr>
        <div>
				<label for="enabled">a가입 방식a</label>
				<span id="enabled_msg"></span>
				<div class="form-group">
					<input type="radio" id="barox" name="enabled" value="1"><label for="barox">승인후가입</label><br>
  					<input type="radio" id="baro" name="enabled" value="0"><label for="baro">바로가입</label><br>
				</div>
		</div>
        <hr>
        <div>
				<label for="clubentity">클럽 설명</label>
				<span id="clubentity_msg"></span>
				<div class="form-group">
					<input type="text" class="form-control" id="clubentity" name="content">
				</div>
		</div>
        <hr>
        <div>
				<label for="age">클럽연령대</label>
				<span id="age_msg"></span>
				<div class="form-group">
					<input type="radio" id="10" name="age" value="10"><label for="10">10대</label><br>
  					<input type="radio" id="20" name="age" value="20"><label for="20">20대</label><br>
  					<input type="radio" id="30" name="age" value="30"><label for="30">30대</label><br><br>

				</div>
		</div>
		<hr>
		<div>
				<div colspan="2">
					<div class="g-recaptcha" data-sitekey="6LeyK9oZAAAAADnWgPOQ3tUY1ctxrOvM_9FrDSYR"></div>
				</div>
		</div>
        <hr>
        <!-- Pager -->
        <div class="clearfix">
          <button type="button" id="join" class="btn btn-primary float-right" href="#">가입 &rarr;</button>
          <button type="button" id="home" class="btn btn-primary float-right" href="#">Home &rarr;</button>
        </div>
        </form>
        </div>
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; Your Website 2020</p>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value="/vendor/jquery/jquery.min.js" />">
  
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />">

  <!-- Custom scripts for this template -->
  <script src="<c:url value="/resources/js/clean-blog.min.js" />">

</body>

</html>