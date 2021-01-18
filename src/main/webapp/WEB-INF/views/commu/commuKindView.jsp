<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<style>
	.commu_img{
		width: 200px;
		height: 150px;
	}

	
	
	@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
	figure.snip1432 {
	  font-family: 'Raleway', Arial, sans-serif;
	  color: #fff;
	  position: relative;
	  overflow: hidden;
	  margin: 10px;
	  min-width: 200px;
	  max-width: 200px;
	  width: 100%;
	  background: #000000;
	  color: #ffffff;
	  text-align: left;
	}
	figure.snip1432 * {
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box;
	  -webkit-transition: all 0.6s ease;
	  transition: all 0.6s ease;
	}
	figure.snip1432 img {
	  opacity: 0.8;
	  width: 100%;
	  vertical-align: top;
	  -webkit-transition: opacity 0.35s;
	  transition: opacity 0.35s;
	}
	figure.snip1432 figcaption {
	  position: absolute;
	  bottom: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	}
	figure.snip1432 figcaption > div {
	  height: 50%;
	  overflow: hidden;
	  width: 100%;
	  position: relative;
	}
	figure.snip1432 h2,
	figure.snip1432 h3 {
	  margin: 0;
	  position: absolute;
	  left: 0;
	  padding: 0 30px;
	  text-transform: uppercase;
	}
	figure.snip1432 h2 {
	  font-weight: 900;
	  top: 0;
	}
	figure.snip1432 h3 {
	  font-size: 1em;
	  bottom: 0;
	  font-weight: 500;
	}
	figure.snip1432 h3:nth-of-type(2) {
	  opacity: 0;
	  -webkit-transform: translateY(150%);
	  transform: translateY(150%);
	}
	figure.snip1432 a {
	  left: 0;
	  right: 0;
	  top: 0;
	  bottom: 0;
	  position: absolute;
	}
	figure.snip1432:hover img,
	figure.snip1432.hover img {
	  opacity: 0.3;
	  -webkit-filter: grayscale(100%);
	  filter: grayscale(100%);
	}
	figure.snip1432:hover figcaption h3:first-of-type,
	figure.snip1432.hover figcaption h3:first-of-type {
	  -webkit-transform: translateY(150%);
	  transform: translateY(150%);
	  opacity: 0;
	}
	figure.snip1432:hover figcaption h3:nth-of-type(2),
	figure.snip1432.hover figcaption h3:nth-of-type(2) {
	  opacity: 1;
	  -webkit-transform: translateY(0%);
	  transform: translateY(0%);
	}
	.snip1432{
		border-radius: 10%;
		margin-left: 100px;;
	}
	
	
</style>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h2 class="h3 mb-2 text-gray-800">
						<i class="fas fa-broadcast-tower" style="margin-left: 10px;"></i>&nbsp&nbsp COMMUNITY
					</h2>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">
								<i class="fas fa-fw fa-head-side-cough-slash"
									style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</a>
							</h6>
						</div>
						<div class="card-body">
							<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
							<script>
								$(function(){
									
									$(".snip1432").on("click", function(){
										var commuSeq = $(this).data("commuinfo");
										document.location = "/commu/commuBoardList?commuSeq="+commuSeq;
									});
								});
							</script>




							<p>Favorites</p>
							<c:forEach items="${commuBKMKList }" var="commuBKMK">
								<figure class="snip1432" style="display: inline-block;"
									data-commuinfo="${commuBKMK.commuSeq }">
									<img class="commu_img" alt="${commuBKMK.commuNm }"
										id="${commuBKMK.commuSeq }"
										src="${pageContext.request.contextPath }/commu/commuIconView?commuSeq=${commuBKMK.commuSeq }">
									<figcaption>
										<div>
											<h3></h3>
											<h3>${commuBKMK.commuNm }</h3>
										</div>
										<div>
											<h2></h2>
										</div>
									</figcaption>
									<a href="#"></a>
								</figure>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>





							<br>
							<p>All</p>
							<c:forEach items="${commuList }" var="commuVO">
								<figure class="snip1432" data-commuinfo="${commuVO.commuSeq }"
									style="display: inline-block;">
									<img class="commu_img" alt="${commuVO.commuNm }"
										id="${commuVO.commuSeq }"
										src="${pageContext.request.contextPath }/commu/commuIconView?commuSeq=${commuVO.commuSeq }">
									<figcaption>
										<div>
											<h3></h3>
											<h3>${commuVO.commuNm }</h3>
										</div>
										<div>
											<h2></h2>
										</div>
									</figcaption>
									<a href="#"></a>
								</figure>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


