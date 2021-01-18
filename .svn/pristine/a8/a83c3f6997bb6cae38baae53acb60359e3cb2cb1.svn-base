<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	
	
	function timeChange(){
		startDt = $('#startTime').val()
		endDt = $('#endTime').val()
		
		console.log(startDt)
		console.log(endDt)

		if(startDt > endDt){
			alert('종료 시간이 시작 시간보다 빠름')
		}
		
	}

	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			var name = $.trim(this.name), value = $.trim(this.value);
			if (o[name]) {
				if (!o[name].push) {
					o[name] = [ o[name] ];
				}
				o[name].push(value || '');
			} else {
				o[name] = value || '';
			}
		});
		return o;
	};

// 	function click_ok() {
// 		var scheduleData = JSON.stringify($('#scheduleData').serializeObject());
		
// 		alert(scheduleData);
// 		$.ajax({
// 			data : {"scheduleData" : scheduleData},
// 			url : "/addMeeting",
// 			type : "POST",
// 			dataType : "json",
// 			success : function(data) {
// 				opener.parent.location.reload();
// 				window.close();
// 			}
// 		});
// 	};

// 	function click_ok() {
// // 		alert($('#scheduleData').serializeObject());
// 		var scheduleData = JSON.stringify($('#scheduleData').serializeObject());
// 		alert(scheduleData);
// 		$.ajax({
// 			data : scheduleData,
// 			url : "/addMeeting",
// 			type : "POST",
// // 			dataType : "json",
// 			contentType: 'application/json',
// 			success : function(data) {
// 				opener.parent.location.reload();
// 				window.close();
// 			}
// 		});
// 	};

	function click_ok() {
		var scheduleData = $('#scheduleData').serializeObject();
		$.ajax({
			data : scheduleData,
			url : "/addMeeting",
			type : "POST",
			success : function(data) {
				if(data.msg == "중복"){
					alert("중복된 예약시간입니다. 다시 입력해주세요");					
				}else{
					opener.parent.location.reload();
					window.close();
				}
			}
		});
	};
</script>
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
margin: 10%;
	}
.domain{
}

</style>
</head>
<body>
	<div class="group" id="popupGroup" style="margin: 30px;">
		<div class="group-head">
			<h3 class="zTree-h2">회의실 예약</h3>
		</div>
		<hr>
		<div class="group-body">
			<form id="scheduleData">
				<div class="domain">
					<h5 class="zTree-h5">회의실번호</h5>
				</div>
				<div class="domain">
				<select class="content" id="content" name="meetroomId">
					<option value="m001">m001</option>
					<option value="m002">m002</option>
					<option value="m003">m003</option>
				</select>
<!-- 					<input class="content" id="content" type="text" name="meetroomId" -->
<!-- 						placeholder="회의실번호 입력"> -->
				</div>
				<hr>
				
				<div class="domain">
					<h5 class="zTree-h5">예약일자</h5>
				</div>
				<div class="domain">
					<input class="date" id="startDt" type="date" name="reservStartDt" >
					<select class="" name="startTime" id="startTime" onchange="dateChange();">
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
					</select>
					<select class="" name="endTime" id="endTime" onchange="timeChange();">
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
					</select>
				</div>
				<hr>
			</form>
			<button class="btn btn-outline-info" type="button" onclick="click_ok();" style="margin-top: 10px; float: right;">예약</button>
		</div>
	</div>
</body>
</html>

