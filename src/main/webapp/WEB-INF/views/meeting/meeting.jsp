<%@page import="kr.or.ddit.business.meeting.vo.MeetingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%List<MeetingVO> list = (ArrayList<MeetingVO>)request.getAttribute("showSchedule"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>풀캘린더</title>
<style type="text/css">
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
  font-family: 'InfinitySans-RegularA1';
}



.add-button {
	position: absolute;
	top: 1px;
	right: 230px;
	background: #2C3E50;
	border: 0;
	color: white;
	height: 35px;
	border-radius: 3px;
	width: 157px;
	
}


.add-button {
	position: absolute;
	top: 1px;
	right: 230px;
	background: #2C3E50;
	border: 0;
	color: white;
	height: 35px;
	border-radius: 3px;
	width: 157px;
}

.fc-day-number{
	color : black;
	
}
</style>
<link href='/packages/core/main.css' rel='stylesheet' />
<link href='/packages/daygrid/main.css' rel='stylesheet' />
<link href='/packages/timegrid/main.min.css' rel='stylesheet' />
<script src='/packages/core/main.js'></script>
<script src='/packages/daygrid/main.js'></script>
<script src="/packages/interaction/main.min.js"></script>
<script src="/packages/timegrid/main.min.js"></script>
<script>

	function click_add() {
		var url = "/meeting/meetSchedulePopup";
		var name = "schedulePopup";
		var option = "width = 500, height = 500 left = 100, top=50,location=no";
		window.open(url, name, option)
	};

</script>
<script>
document.addEventListener('DOMContentLoaded', function() { 
	var calendarEl = document.getElementById('calendar'); 
	var calendar = new FullCalendar.Calendar(calendarEl, 
			{plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		header: {left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'},
			locale : "ko",
			navLinks: true, // can click day/week names to navigate views
			businessHours: true, // display business hours
			editable: false,
			events: [ 
				<% for (int i = 0; i < list.size(); i++) {
					MeetingVO vo = (MeetingVO)list.get(i); %> 
					{	
						title : '<%= vo.getDeptId() %>',
						start : '<%= vo.getReservStartDt()%>',
						end : '<%= vo.getReservEndDt()%>',
						id : '<%= vo.getReservSeq() %>',
						<% if(vo.getMeetroomId().equals("m001")){%>
							color : "#ff7473"
						<%}else if(vo.getMeetroomId().equals("m002")){%>
							color : "#f9a11b"
						<%}else if(vo.getMeetroomId().equals("m003")){%>
							color : "#47b8e0"
						<%}%>
						}, 
						<%} %>
						{
							title : 'default',
							start : "2019-01-01",
							end : "2019-01-01"
							}
						]
			, eventClick:function(info) {
             var id = info.event.id 
             var url = "/selectMeeting?id="+id;
     		var name = "select";
     		var option = "width = 600, height =500 left = 100, top=50,location=no";
     		window.open(url, name, option)
             
             
         }
			});

	calendar.render(); 
}); 
</script>
<style type="text/css">
	#tt1{
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
	
	}
	#add{
		background-color: #2c3e50;
		color: white;
	}
	.container-fluid{
		vertical-align: top;
	}

</style>
<body>

<div style="float: left;">
<div style="float: left; background-color: white; border-radius: 20px / 20px; margin-top: 30px; width: 250px; margin-left: 20px;">
<br>
<h5 style="margin-left: 30px;">📌 회의실 현황</h5>
<table style="margin-left: 50px;">
		<hr>
<!-- 	<tr> -->
<!-- 		<td>M001</td> -->
<!-- 	</tr> -->

	<c:forEach items="${using }" var="using">
		<tr>
			<c:if test="${using.meetroomId =='m001' }">
				<td style="color : #ff7473; font-size: 1.2em;">${using.meetroomId }</td>
			</c:if>
			<c:if test="${using.meetroomId =='m002' }">
				<td style="color : #f9a11b; font-size: 1.2em;">${using.meetroomId }</td>
			</c:if>
			<c:if test="${using.meetroomId =='m003' }">
				<td style="color : #47b8e0; font-size: 1.2em;">${using.meetroomId }</td>
			</c:if>
			<c:if test="${using.using == '사용중' }">
				<td style="color : red;">
					${using.using }
				</td>
			</c:if>
			<c:if test="${using.using == '사용가능' }">
				<td style="color : blue;">
					${using.using }
				</td>
			</c:if>
		</tr>
	</c:forEach>
</table>
<hr>
<!-- <h5 style="margin-left: 20px;" >📌 예약현황</h5> -->
<!-- <hr> -->

<!-- <table style="text-align: center; padding: 5px; margin-left: 10px; margin-right: 10px; width: 280px;"> -->
<!-- 	<tr id="tt1"> -->
<!-- 		<td>방번호</td> -->
<!-- 		<td>예약날짜</td> -->
<!-- 		<td>시작</td> -->
<!-- 		<td>종료</td> -->
<!-- 	</tr> -->
<%-- 	<c:forEach items="${show}" var="list"> --%>
<!-- 		<tr> -->
<%-- 			<td>${list.meetroomId }</td> --%>
<%-- 			<td>${list.reservStartDt }</td> --%>
<%-- 			<td>${list.startTime }</td> --%>
<%-- 			<td>${list.endTime }</td> --%>
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- </table> -->
<button class="btn" id="add" type="button" onclick="click_add();" style="float: left; margin-left: 20%; width: 130px; margin-bottom: 20px;">회의실 예약</button><br><br>
</div>
</div>
	<div id='calendar' style="width: 56%;height: 70%; margin-left: 20%; vertical-align: top;">
			
	</div>
</body>
</html>

