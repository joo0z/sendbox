<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>스케줄 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <script src="https://code.jquery.com/jquery-1.12.4.js"></script> <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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
	var a = $('#content').val();
	var b = $('#schedId').val();
	var c = $('#startDt').val()+" "+$('#startTime').val();
	var d = $('#endDt').val()+" "+$('#endTime').val();
	var e = $('#startTime').val();
	var f = $('#endTime').val();
	$.ajax({
		data : {"content" : a,
			"schedId" :b,
			"startDt" : c,
			"endDt" : d,
			"startTime" : e,
			"endTime" : f
		},
		url : "/updateSchedule",
		type : "POST",
		dataType : "json",
		success : function(data) {
			opener.parent.location.reload();
			window.close();
		}
	});
};

	$(function() {
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			yearSuffix : "년",
			monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'10', '11', '12' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ]
		});
		$("#startDt").datepicker();
		$("#endDt").datepicker();
		$("#startDt").datepicker('getDate' );
		$("#endDt").datepicker('getDate','yy-mm-dd');
	});
</script>
</head>

<body>
<div class="container" style="margin: 5%;">
  <h2>부서 스케줄 수정</h2>
 <br>
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td>내용</td>
        <td>
        <input id="content" type="text" value="${schedule.content }">
        </td>
      </tr>
      <tr>
        <td>시작일시</td>
        <td><input id="startDt" class="date" type="text" value="${schedule.startDt }">
        <select class="" name="startTime" id="startTime" onchange="timeChange()">
			<c:if test="${schedule.startTime=='09:00'}">
				<option value="09:00" selected="selected">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='10:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00" selected>10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='11:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00" selected>11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='12:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00" selected>12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='13:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00" selected>13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='14:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00" selected>14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='15:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00" selected>15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='16:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00" selected>16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='17:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00" selected>17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.startTime=='18:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00" selected>18:00</option>
			</c:if>
		</select>
        </td>
      </tr>
      <tr>
        <td>종료일시</td>
        <td>
        <input type="text" id="endDt" class="date" value="${schedule.endDt }">
        <select class="" name="endTime" id="endTime" onchange="timeChange()">
			<c:if test="${schedule.endTime=='09:00'}">
				<option value="09:00" selected="selected">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='10:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00" selected>10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='11:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00" selected>11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='12:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00" selected>12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='13:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00" selected>13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='14:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00" selected>14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='15:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00" selected>15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='16:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00" selected>16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='17:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00" selected>17:00</option>
				<option value="18:00">18:00</option>
			</c:if>
			<c:if test="${schedule.endTime=='18:00'}">
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00" selected>18:00</option>
			</c:if>
		</select>
        
        </td>
        
      </tr>
    </tbody>
  </table>
  <input id="schedId" type="hidden" value="${schedule.schedId }">
  <input type="button" class="btn btn-outline-primary" value="수정" style="float: right; margin-right: 10px;" onclick="click_ok();">
</div>
</body>
</html>

