<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩Carousel</title>
<style>
.carousel-inner>.carousel-item>img { 
	height: 700px;
}
.container-fluid{
	width: 90%;
}
h5,p{
	color: red;
}
.btn{
	font-weight: bold;
}


</style>
</head>
<body>
	<script> $('.carousel').carousel({ 
		interval: 2000 //기본 5초 
		}) 
		</script>
	<div style="margin: 10px;">
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/noticeguide'">공지사항</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/taskguide'">업무</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/signguide'">전자결재</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/commuguide'">커뮤니티</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/facemeetguide'">화상회의</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/mypageguide'">마이페이지</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/mailguide'">메일</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/alarmguide'">알림</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/memoguide'">스티커메모</button>
	<button type="button" class="btn btn-defalut" style="background-color: white;" onclick="location.href='/addrguide'">주소록</button>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100"
					src="/images/mainguide.JPG"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>메인화면</h5>
				</div>
			</div>
			<!-- / 슬라이드 쇼 끝 -->
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<!-- <span>Previous</span> -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<!-- <span>Next</span> -->
			</a>
			<!-- / 화살표 버튼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
<!-- 				<li data-target="#demo" data-slide-to="1"></li> -->
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
	</div>
</body>
</html>

