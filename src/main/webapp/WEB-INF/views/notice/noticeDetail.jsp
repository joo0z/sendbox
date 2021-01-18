<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>업무게시판</title>

<!-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--       rel="stylesheet"> -->

<style type="text/css">
	a{
		color: #858796;
	}
	#dataTable_filter{
		float: right;
	}
	#dataTable_filter{
		
	}
	label {
		width: 200px;
	}
</style>

<script>
$(document).ready(function(){
	$("#deleteBtn").on("click", function() {
		if (confirm("삭제하시겠습니까?") == true){    //확인
			document.location = "/noticeDelete?noticeSeq=${noticeSeq }";
		 }else{   //취소
		     return false;
		 }
	});
	$("#updateBtn").on("click", function() {
		document.location = "/noticeUpdateView?noticeSeq=${noticeSeq }";
	});
	$("#back").on("click", function() {
		document.location = "/notice";
	});
});	

</script>
</head>

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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px;"></i>&nbsp&nbsp공지게시판</h2>
                    <br>
                    <!-- DataTales Example -->
<%--                     <form action="/noticeUpdateView?noticeSeq="${notice.noticeSeq }> --%>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <c:forEach items="${NoticeList }" var="notice">
                            	<c:if test="${notice.noticeSeq == noticeSeq}">
	 	                           <h6 class="m-0 font-weight-bold text-info"><i class="fas fa-fw fa-check-circle" style="margin-left: 10px;"></i>&nbsp ${notice.title}</h6>
                            	</c:if>
                           	</c:forEach>
                        </div>
                        <div class="card-header py-3">
                            <c:forEach items="${NoticeList }" var="notice">
                            	<c:if test="${notice.noticeSeq == noticeSeq}">
	 	                           <h6 class="m-0 font-weight-bold text-dark" style="padding-left: 20px;">
	 	                           		${notice.empId} ｜ <fmt:formatDate value="${notice.updDt }" pattern="yyyy-MM-dd hh:mm"/>
	 	                           </h6>
                            	</c:if>
                           	</c:forEach>
                        </div>
                        
	                       <div class="card-header py-3">
	                           <c:forEach items="${noticeFileList }" var="files">
	                           	<c:if test="${files.noticeSeq == noticeSeq}">
	 	                           <h6 class="m-0 font-weight-bold text-dark" style="padding-left: 20px;" >
	 	                           		<a href="/noticeFileDownload?attachfileSeq=${files.attachfileSeq }" id="profileDownBtn" >${files.realfilename }</a>
	 	                           </h6>
	                           	</c:if>
	                          	</c:forEach>
	                       </div>
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
	                            <c:forEach items="${NoticeList }" var="notice">
	                            	<c:if test="${notice.noticeSeq == noticeSeq}">
	                            		${notice.cont}
	                            	</c:if>
	                           	</c:forEach>
                            </div>
                            <c:if test="${EMP.deptId == '0000' || EMP.deptId == '0002'}">
							<!-- 삭제버튼  -->
							<input type="button" id="deleteBtn" class="btn btn-outline-secondary" value="삭제" style="display:inline; float: right;">
							<!-- 수정버튼  -->
							<input type="button" id="updateBtn" class="btn btn-outline-secondary" value="수정" style="display:inline; float: right; margin-right: 10px;">
                            </c:if>
							<!-- 목록버튼  -->
							<input id="back" type="button" class="btn btn-outline-secondary" value="목록" style="display:inline;margin-right : 10px; float: right;">
						</div>
                    </div>
<!-- 					</form> -->
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
<!--     <a class="scroll-to-top rounded" href="#page-top"> -->
<!--         <i class="fas fa-angle-up"></i> -->
<!--     </a> -->

    <!-- Core plugin JavaScript-->
    <script src="/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
<!--     <script src="/admin2form/js/sb-admin-2.min.js"></script> -->

    <!-- Page level plugins -->
    <script src="/admin2form/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/admin2form/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/admin2form/js/demo/datatables-demo.js"></script>

</body>

</html>