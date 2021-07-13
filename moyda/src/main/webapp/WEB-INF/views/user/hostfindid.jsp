<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
	 width: 100%;
     height: 100%;
     z-index: 1;
     text-align: center;
	}
	#wrap::after {
	    width: 100%;
    	height: 100%;
     	content: "";
		background: url("./img/gogo.jpg");
		background-size: 100%;
		z-index: -1;
     	opacity: 0.2;
     	position: absolute;
		top: 0;
    	left: 0;
    	text-align: center;
	}
</style>
<script>
$(function(){
	vas msg = "${msg}";
	if(msg!=""){
		$("#alert").text(msg);
		$("#msg").show();
	}
	$("#findid").on("click",function(){
		$("#joinForm").submit();
	});
});

</script>
</head>
<body id="wrap">
	
	<div class="alert alert-danger alert-dismissible" id="msg" style="display:none;">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
  	</div>
<form id="joinForm" action="/www/hostfindid" method="post">
  <font face="Yang Rounded">
      <table width="600px" align="center" border="0" style="color: black;font-size: 20px;">
       <tr>
        <td>
         <table width="750px" border=0; style="text-align: center; margin-top: 3%">
          <tr>
           <td style="text-align : center">호스트 회원</td>
          </tr>
         </table>
        </td>
       </tr>

       <tr>
        <td>
         <table width="800px" height="300px" align="center"nstyle="border: dotted 5px none; margin-top: 4%">

          <tr>
           <td>
            <table width="300px" height="30px" border="0" style="margin-top: 3%; color: black; font-size: 18px;">
             <tr>
              <td>&nbsp;아이디 찾기</td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="380px" height="70px" align="center" border="0" style="font-size: 16px;">
             <tr>
              <td>닉네임</td>
              <td><input type="text" name="nickname" id="nickname"></td>
             </tr>
             <tr>
              <td>휴대폰</td>
              <td><select name="phone" id="phone">
                <option value="010" selected="selected">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
              </select> - <input type="text" name="phone1" style="width: 70px">
               - <input type="text" name="phone2" style="width: 70px"></td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="140px" height="10px" border="0" style="margin-top: 2%;" align="center">
             <tr>
              <td><button id="findid" name="enter1" align="center" style="cursor: pointer; background: white; color: black; border-color: black;">찾기</button></td>
              <td><button id="cancle" name="cancle1" value="  취소  " align="center" style="cursor: pointer; background: white; color: black; border-color: black;" onClick="location='login'">취소</button></td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="300px" height="20px" border="0" style="margin-top: 3%; font-size: 18px;">
             <br><br>
             <tr>
              <td>비밀번호 찾기</td>
             </tr>
            </table>
           </td>
          </tr>
           <table width="380px" height="70px" align="center" border="0" style="font-size: 16px;">
            <tr>
             <td>이름</td>
             <td><input type="text" name="name2"></td>
            </tr>
            <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="email" style="width: 80px" onblur="checkid()"> @ <input type="text" name="e_domain" style="width: 80px"> 
             <select name="domain" onchange="domainCheck();">
               <option value="0" selected="selected">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="hanmail.net">hanmail.net</option>
               <option value="nate.com">nate.com</option>
               <option value="yahoo.com">yahoo.com</option>
             </select></td>
            </tr>
           </table>

          <tr>
           <td>
            <table width="140px" height="10px" border="0" style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" name="enter2" value="  찾기  " align="center" style="cursor: pointer; background: white; color: black; border-color: black;" onClick="id_search2()"></td>
              <td><input type="button" name="cancle2" value="  취소  " align="center" style="cursor: pointer; background: white; color: black; border-color: black"
               onClick="location='login'"></td>
             </tr>
            </table>
            <br>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
  </font>
 </form>
</body>
</html>