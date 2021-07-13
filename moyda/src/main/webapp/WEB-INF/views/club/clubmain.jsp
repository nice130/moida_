<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>${club.name }클럽</title>
<style>
	.bgded overlay padtop {
        background-image: url("/resources/img/abc.gif");
      }
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- Top Background Image Wrapper -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <section id="services">
      <div class="sectiontitle">
        <h6 class="heading">클럽 공지 사항 ${sessionScope.clubNo }</h6>
      </div>
      <ul class="nospace group grid-3">
        <li class="one_third">
          <article><a href="#"><i class="fas fa-spray-can"></i></a>
            <h6 class="heading">Vehicula</h6>
            <p>Nulla cursus metus non tortor erat turpis sed semper risus nisi id nunc ut congue cursus tortor aliquam.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-user-secret"></i></a>
            <h6 class="heading">Porttitor</h6>
            <p>Vehicula nisl ac porta blandit velit risus lobortis turpis sit amet lobortis sapien dui id neque suspendisse.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-couch"></i></a>
            <h6 class="heading">Pulvinar</h6>
            <p>Vel justo mattis magna vestibulum molestie quisque sagittis in a enim in metus ultrices tristique nam semper.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-crow"></i></a>
            <h6 class="heading">Ultricies</h6>
            <p><img src="${club.profile}"></p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-dolly-flatbed"></i></a>
            <h6 class="heading">Vestibulum</h6>
            <p>Pellentesque malesuada sed et nulla sit amet nisi scelerisque consectetuer vivamus odio donec metus libero semper.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-road"></i></a>
            <h6 class="heading">Lobortis</h6>
            <p>Quis suscipit ut aliquam a metus ut interdum risus id luctus consectetuer velit neque ornare quam at ornare.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
      </ul>
    </section>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');">
  <section class="hoc container clear"> 
    <div class="sectiontitle">
      <p class="nospace font-xs">최신 모임글</p>
      <h6 class="heading">Quam nunc ut elit nunc molestie</h6>
    </div>
    <article id="points" class="group">
      <div class="two_third first">
        <h6 class="heading">Sapien tempor placerat</h6>
        <p>Luctus mauris lectus elementum nulla ac consectetuer sapien leo et arcu sed tempus tempor orci vestibulum volutpat eleifend arcu nunc vitae lacus sit amet sem consequat ullamcorper vivamus quis risus ut turpis sagittis venenatis.</p>
        <p>Volutpat et aliquam sed magna duis nibh dui porttitor eu rhoncus ut convallis eu eros in condimentum placerat.</p>
        <ul class="nospace group">
          <li><span>1</span> Nulla bibendum in erat</li>
          <li><span>2</span> Enim interdum a aliquam</li>
          <li><span>3</span> Sed commodo bibendum justo</li>
          <li><span>4</span> Sed pretium elit sed</li>
          <li><span>5</span> Nisi aliquam dolor urna</li>
          <li><span>6</span> Interdum ut dignissim eget</li>
          <li><span>7</span> Sagittis eget eros integer</li>
          <li><span>8</span> Velit mi facilisis eget</li>
        </ul>
      </div>
      <div class="one_third last"><a class="imgover" href="#"><img src="images/demo/348x394.png" alt=""></a></div>
    </article>
  </section>
</div>

<div class="wrapper row2">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <p class="nospace font-xs">클럽 게시판</p>
      <h6 class="heading">인기 게시글</h6>
    </div>
    <ul id="latest" class="nospace group sd-third">
      <li class="one_third first">
        <article>
          <figure><a class="imgover" href="#"><img src="images/demo/348x261.png" alt=""></a>
            <figcaption>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-06T08:15+00:00">06 Apr 2045</time>
                </li>
              </ul>
              <h6 class="heading"><a href="#">Elit pellentesque dapibus</a></h6>
            </figcaption>
          </figure>
          <p>Justo massa adipiscing a convallis ultricies luctus et dolor aliquam nulla aenean facilisis ullamcorper diam nunc pede nulla iaculis quis lacinia ac adipiscing.</p>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><a class="imgover" href="#"><img src="images/demo/348x261.png" alt=""></a>
            <figcaption>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-05T08:15+00:00">05 Apr 2045</time>
                </li>
              </ul>
              <h6 class="heading"><a href="#">Quis ligula morbi quam</a></h6>
            </figcaption>
          </figure>
          <p>Semper mattis nulla cursus lorem ut gravida tempor massa massa porta libero at scelerisque et arcu nulla facilisi aenean fringilla imperdiet felis mauris.</p>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><a class="imgover" href="#"><img src="images/demo/348x261.png" alt=""></a>
            <figcaption>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-04T08:15+00:00">04 Apr 2045</time>
                </li>
              </ul>
              <h6 class="heading"><a href="#">Hendrerit ligula eu diam</a></h6>
            </figcaption>
          </figure>
          <p>Ac lectus sed ultricies augue congue nibh donec convallis elementum leo nullam dignissim varius ante fusce pharetra sodales arcu sed rutrum ipsum a ipsum.</p>
        </article>
      </li>
    </ul>
  </section>
</div>

<div class="wrapper row5">
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