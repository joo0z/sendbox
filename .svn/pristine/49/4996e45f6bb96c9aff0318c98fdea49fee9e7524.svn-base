<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<c:set var="registerFlag" value="${param.mailSeq eq null ? '0' : '1'}"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메일 작성</title>

    <!-- Custom fonts for this template -->
    <link href="/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
<!--     <link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet"> -->


<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	
    <!-- Custom styles for this page -->
    <link href="/admin2form/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
	<!-- 글씨체 -->
<!--     <link rel="preconnect" href="https://fonts.gstatic.com"> -->
<!-- 	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap" rel="stylesheet"> -->
    
    <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function close_pop() {
		$('#result').val('')
		$('#myModal').hide();
	};

	$(document)
			.ready(
					function() {

						$('#summernote').summernote();

						// 초기화 버튼
						$('#resetter').on('click', function() {
							$('#summernote').summernote('reset');
						});

						fileSlotCnt = 1;
						// 최대 첨부파일 수
						maxFileSlot = 5;
						$('#fileDiv').on('click', '#btnMinus', function() {
							if (fileSlotCnt > 1) {
								fileSlotCnt--;
								console.log(fileSlotCnt);
							}
							console.log("minus clicked!!");
							$(this).prev().prev().remove();
							$(this).prev().remove();
							$(this).remove();
						})

						$('#btnPlus')
								.on(
										'click',
										function() {
											if (maxFileSlot <= fileSlotCnt) {
												alert("파일은 총 " + maxFileSlot
														+ "개 까지만 첨부가능합니다.");
											} else {
												fileSlotCnt++;
												console.log("click!!");
												var html = '<br><input type="file" name="realfilename">'
														+ '<button type="button" id="btnMinus" style="margin-left: 5px; outline: 0; border: 0;">'
														+ '<i class="fas fa-fw fa-minus" style="color: black; font-size:10px;"></i>'
														+ '</button>';
												$(this).parent().append(html);
											}

										})

						// 등록
						$('#insertBtn').on('click', function() {
							$('form').submit();
						});

					});
</script>
<style>
.note-editable {
	height: 350px;
}

.vl {
	float: left;
	text-align: center;
}

#d1 {
	border-left: 2px solid gray;
}

.front {
	text-align: center;
}

table {
	width: 100%;
	border-top: 3px solid #858796;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #858796;
	padding: 10px;
}
</style>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid" style="max-width: 90%;">
					<!-- Page Heading -->
					<!-- summernote -->
					<form action="/mailSend" method="post"
						enctype="multipart/form-data" name="mailfrm">
						<table width="100%" cellspacing="0">
							<tr>
								<td class="front">받는 사람 <input type="hidden" id="sender"
									name="sender" value="${EMP.empId }">
								<input type="hidden" id = "parentmailId" name="parentmailId" value="${param.mailSeq }"> 
								</td>
								<td>
								
								
								<c:forEach items="${receiverList }" var="receiver">
									<input class="form-control" readonly id="receiver"
										name="receiver" value="${receiver }@sendbox.com" autofocus
										maxlength="30" minlength="1"
										style="margin-left: 10px; width: 25%; margin-bottom : 5px;">
								</c:forEach>
									
									</td>
							</tr>
							<tr>
								<td class="front">제목</td>
								<td><input type="text" name="title" autofocus
									maxlength="30" minlength="1"
									style="margin-left: 10px; width: 90%;"></td>
							</tr>


							<tr>
								<td class="front"><i class="fas fa-fw fa-paperclip"
									style="margin-left: 10px;"></i>첨부파일</td>
								<td>
									<div id="fileDiv" class="col-sm-10">
										<input type="file" name="realfilename">
										<button type="button" id="btnPlus"
											style="outline: 0; border: 0;">
											<i class="fas fa-fw fa-plus"
												style="color: black; font-size: 10px;"></i>
										</button>
									</div>
								</td>
							</tr>


							<tr>
								<td colspan="2"><textarea id="summernote" name="content"></textarea>
								</td>
							</tr>
						</table>
						<br> <input type="button" id="insertBtn"
							class="btn btn-outline-secondary alamnBtnClass"
							data-alamntype="mail" value="전송"
							style="display: inline; float: right;"> <input
							onclick="history.back()" type="button"
							class="btn btn-outline-secondary" value="목록"
							style="display: inline; margin-right: 10px; float: right;">
					</form>
					<!-- End summernote -->
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
<!-- 	<a class="scroll-to-top rounded" href="#page-top"> <i -->
<!-- 		class="fas fa-angle-up"></i> -->
<!-- 	</a> -->


	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 24pt;">아이디 찾기 결과</span></b></span>
			</p>
			<p style="text-align: center; line-height: 1.5;">
				<br>
				<span id="result"></span>
			</p>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
			</div>
		</div>

	</div>

</body>

</html>