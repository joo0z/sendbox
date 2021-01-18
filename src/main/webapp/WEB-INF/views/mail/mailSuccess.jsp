<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#content {
	background-color: white;
}
</style>
</head>
<body>

	<div style="top:0px; height: 100%">
    <table align="center">
     <tr height="100%">
      <td height="100%" width="100%" valign="middle" align="center">
        <img src="/images/mail2.png" style="margin-top :15%; height: 70%; ">
        <div class="alert alert-light"  style="font-size: 20px; margin-top: 3%;">
		    <strong>메일을 성공적으로 보냈습니다.</strong><br>
		    <input type="button" class="btn btn-link" value="보낸메일함 가기" onclick="location.href='/mail/sendList'"> ｜   
		    <input type="button" class="btn btn-link" value="메일쓰기"onclick="location.href='/mail/write'">  
		</div>
      </td>
     </tr>
    </table>
  </div>

</body>
</html>