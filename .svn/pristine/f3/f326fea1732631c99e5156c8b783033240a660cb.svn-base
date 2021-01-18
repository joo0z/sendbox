<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.business.schedule.vo.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%List<ScheduleVO> list = (ArrayList<ScheduleVO>)request.getAttribute("showSchedule"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>풀캘린더</title>
<style type="text/css">




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
		var url = "/schedulePopup";
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
				<% 
					for (int i = 0; i < list.size(); i++) {
 					ScheduleVO vo = (ScheduleVO)list.get(i); %> 
					{
						title : '<%= vo.getContent() %>',
						start : '<%= vo.getStartDt()%>',
						end : '<%= vo.getEndDt() %>',
						id : '<%= vo.getSchedId() %>',
						<% if(vo.getDeptId().equals("0001")){%>
						color : "#6799FF"
						<%}else if(vo.getDeptId().equals("0002")){%>
							color : "#FF7012"
						<%}else if(vo.getDeptId().equals("0003")){%>
							color : "#47C83E"
						<%}else if(vo.getDeptId().equals("0004")){%>
							color : "#00D8FF"
						<%}else if(vo.getDeptId().equals("0005")){%>
							color : "#B5B2FF"
						<%}else if(vo.getDeptId().equals("0006")){%>
							color : "#FFBB00"
						<%}else if(vo.getDeptId().equals("0007")){%>
							color : "#FFE400"	
						<%}else{%>
							color : "#000000"
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
//                     alert(info.event.id +"\n"+info.event.title + "\n" + info.event.start +"\n" +info.event.end );
                    var id = info.event.id 
                    var url = "/selectSchedule?id="+id;
            		var name = "select";
            		var option = "width = 600, height = 400 left = 100, top=50,location=no";
            		window.open(url, name, option)
                    
                    
                }

			});

	calendar.render(); 
}); 

</script>

<body>
	<div id='calendar' style="width: 70%;height: 30%; margin-left: 10%; margin-top:3%;">
			<button class="add-button" type="button" onclick="click_add();" style="margin-top: 6.3%; margin-right: 18%;">일정 추가</button>
	</div>
</body>
</html>

