<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#inquire{
font-size : 50px;
}
</style>

</head>
<body>

<div class="container">
  <h2>고객센터</h2>
  
  <p><a href="/www/notice?pageNo=${pageNo }">공지사항</a>&emsp;&emsp;&emsp;<a href="help" id="help">HELP</a>&emsp;&emsp;&emsp;<a href="access">이용약관</a></p><br><br>
  <p><a id="FAQ">FAQ</a>&emsp;&emsp;&emsp;<a id="inquire">1:1문의</a></p>

  <table class="table">
    <thead>
      <tr>
        <th>공지</th>
        <th>제목</th>
        <th>게시일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>