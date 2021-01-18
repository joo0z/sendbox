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

	
	
	function dateChange(){
		startDt = $('#startDt').val()
		endDt = $('#endDt').val()
		
		console.log(startDt)
		console.log(endDt)
		
		if(startDt > endDt){
			alert('종료날짜가 시작날짜보다 빠름')
		}
	}
	
	function timeChange(){
		startDt = $('#startDt').val()
		endDt = $('#endDt').val()
		startDt += $('#startTime').val()
		endDt += $('#endTime').val()
		
		if(startDt > endDt){
			alert('종료 시간이 시작 시간보다 빠름')
		}
		
	}
	
	
// 	$(function() {
// 		$.datepicker.setDefaults({
// 			dateFormat : 'yy-mm-dd',
// 			showOtherMonths : true,
// 			showMonthAfterYear : true,
// 			changeYear : true,
// 			changeMonth : true,
// 			yearSuffix : "년",
// 			monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
// 					'10', '11', '12' ],
// 			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
// 					'9월', '10월', '11월', '12월' ],
// 			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
// 			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ]
// 		});
// 		$("#startDt").datepicker();
// 		$("#endDt").datepicker();
// 		$("#startDt").datepicker('setDate', 'today');
// 		$("#endDt").datepicker('setDate', 'today');
		
// 	});

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

// 		$.ajax({
// // 			data:JSON.stringify(data),
// 			data : {"scheduleData" : scheduleData},
// 			url : "/addSchedule",
// 			type : "POST",
// 			dataType : "json",
// // 			contentType : "application/json; charset=UTF-8",
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
			url : "/addSchedule",
			type : "POST",
			success : function(data) {
				opener.parent.location.reload();
				window.close();
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

</style>
</head>
<body>
	<div class="group" id="popupGroup">
		<div class="group-head">
			<h3 class="zTree-h1">일정 추가</h3>
		</div>
		<hr>
		<div class="group-body">
			<form id="scheduleData">
<!-- 				<div class="domain"> -->
					<h5 class="zTree-h3">내용</h5>
				<div class="top">
					<input class="content" id="content" type="text" name="content"
						placeholder="스케줄을 입력해주세요">
				</div>
<br>
				<div class="domain">
					<h5 class="zTree-h3">시작일자</h5>
				</div>
				<div class="domain">
					<input class="date" id="startDt" type="date" name="startDt" >
					<select class="" name="startTime" id="startTime">
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
				<br>
				<div class="domain">
					<h5 class="zTree-h3">종료일자</h5>
				</div>
				<div class="domain">
					<input class="date" id="endDt" type="date" name="endDt" onchange="dateChange()">
					<select class="" name="endTime" id="endTime" onchange="timeChange()">
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
			</form>
			<button class="btn btn-outline-info" type="button" onclick="click_ok();" style="margin-top: 10px; float: right;">확인</button>
		</div>
	</div>
</body>
</html>

