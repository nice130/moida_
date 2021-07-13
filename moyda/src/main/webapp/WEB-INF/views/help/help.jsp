<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title></title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	h2{
	font-size: 30px;
	}
	#help{
	font-size: 20px;
	}
	#FAQ{
	font-size: 100px;
	}
</style>
</head>
<body>


<div class="container">
  <h2>고객센터</h2>
  
  <p><a href="/www/notice?pageNo=${pageNo }">공지사항</a>&emsp;&emsp;&emsp;<a href="help" id="help">HELP</a>&emsp;&emsp;&emsp;<a href="access">이용약관</a></p><br><br>
  <p><a id="FAQ">FAQ</a>&emsp;&emsp;&emsp;<a>1:1문의</a></p>

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