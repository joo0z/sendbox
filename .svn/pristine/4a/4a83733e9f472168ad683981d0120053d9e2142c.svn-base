<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회의실예약 상세조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
font-family: 'InfinitySans-RegularA1';
background-color: #EBF7FF;
	}
</style>
<script type="text/javascript">

function click_ok() {
	if (confirm("정말로 예약을 삭제하시겠습니까??")) {
		var a = $('#reservSeq').val();
		$.ajax({
			data : {"reservSeq" : a},
			url : "/deleteMeeting",
			type : "POST",
			dataType : "json",
			success : function(data) {
				opener.parent.location.reload();
				window.close();
			}
		});
	} else {
		window.close();
	}

};


</script>
</head>

<body>
<div class="container" style="margin: 5%;">
  <h2>회의실예약 정보</h2><br><br>
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td>회의실 방</td>
        <td id="meetroomId">${selectMeeting.meetroomId}</td>
      </tr>
      <tr>
        <td>부서</td>
        <td id="deptId">
        ${selectMeeting.deptId }
<%--         <c:if test="${selectMeeting.deptId==0000 }">사장님</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0001 }">개발부</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0002 }">인사부</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0003 }">SI 1팀</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0004 }">SI 2팀</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0005 }">SM 1팀</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0006 }">인사 1팀</c:if> --%>
<%--         <c:if test="${selectMeeting.deptId==0007 }">인사 2팀</c:if> --%>
        </td>
      </tr>
      <tr>
        <td>시작일시</td>
        <td id="reservStartDt">${selectMeeting.reservStartDt } ${selectMeeting.startTime }</td>
      </tr>
      <tr>
        <td>종료일시</td>
        <td id="reservEndDt">${selectMeeting.reservEndDt } ${selectMeeting.endTime }</td>
      </tr>
    </tbody>
  </table>
  <input id="reservSeq" type="hidden" value="${selectMeeting.reservSeq }">
  <c:if test="${selectMeeting.deptId==EMP.deptId}">
	  <input id="deletebtn" type="button" class="btn btn-outline-danger" value="삭제" style="float: right;" onclick="click_ok();">
  	<input type="button" class="btn btn-outline-primary" value="수정" style="float: right; margin-right: 10px;"onclick="location.href='/updateMeetingView?reservSeq=${selectMeeting.reservSeq }'">
  </c:if>
</div>
</body>
</html>

