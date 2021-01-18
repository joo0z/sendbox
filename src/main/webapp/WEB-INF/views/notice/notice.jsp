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
	.custom-select-sm{
		display: none;
	}
	.paging_simple_numbers{
		display: none;
	}
</style>

<script>
$(document).ready(function(){
	$("#insertBtn").on("click", function() {
		document.location = "/noticeInsertView";
	});
	
	$('#recordCnt').change(function(){
		var recordCountPerPage = $("#recordCnt option:selected").val();
		console.log($("#recordCnt option:selected").val());
		document.location = "/notice?recordCountPerPage="+recordCountPerPage;
	})
	
	$('.fa-bullhorn').on('click', function(){
		$(this).animate({'left': -1*$(this).width()});  
	})
	
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
                <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px; "></i>&nbsp&nbsp공지게시판</h2>
                <br>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</h6>
                    </div>
                    <div class="card-body"> 	
                        <div class="table-responsive" style="overflow: hidden;">
							<!-- 검색  -->
							<div class="row">
							<!--
									<div class="col-sm-12 col-md-6">
										<div class="dataTables_length" id="dataTable_length">
												<i class="fas fa-th-large" style="display: inline;"></i>
											<label>
												<select id="recordCnt" name="recordCountPerPage" aria-controls="dataTable" class="custom-select form-control form-control-sm">
													<option>보기</option>
													<option value="5">5개씩 보기</option>
													<option value="10">10개씩 보기</option>
													<option value="15">15개씩 보기</option>
													<option value="20">20개씩 보기</option>
												</select>
											</label>
										</div>
									</div>
							--> 
									 <div class="col-sm-27 col-md-12">
										<div id="dataTable_filter" class="dataTables_filter">
											<i class="fas fa-search"></i>
											<label>
												<span>
												 	<input placeholder="" type="search" id="searched" class="form-control form-control-sm" aria-controls="dataTable">
												</span>
											</label>
													<input type="button" class="btn btn-outline-light text-dark" value="검색">
										</div>
									</div>
								</div>
							
                            <table class="table table-bordered" id="" width="100%" cellspacing="0" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${NoticeList }" var="notice">
	                                     <tr>
	                                         <td>${notice.noticeSeq }</td>
	                                         <td style="text-align: left;"><a href="/noticeDetail?noticeSeq=${notice.noticeSeq }">${notice.title }</a></td>
	                                         <td>${notice.empId } <input type="hidden" name="empId" value="${notice.empId }"></td>
	                                         <td>
											 <fmt:formatDate value="${notice.updDt }" pattern="yyyy-MM-dd"/>
											 </td>
	                                     </tr>
                                   	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- 페이징 처리  -->
                            <div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
									</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate" id="dataTable_paginate">
										<ul class="pagination">
											<c:choose>
												<c:when test="${pagination.currentPageNo == 1 }">
													<li class="paginate_button page-item previous disabled" id="dataTable_previous">
														<a href="#" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous disabled" id="dataTable_previous">
														<a href="#" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-left"></i>
														</a>
													</li>
												
												</c:when>
												<c:otherwise>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/notice" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/notice?pageIndex=${pagination.currentPageNo-1}" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-left"></i>
														</a>
													</li>
												</c:otherwise>
											
											
											</c:choose>
											<c:forEach begin="${pagination.getFirstPageNoOnPageList() }" end="${pagination.getLastPageNoOnPageList() }" step="1" var="i">
												<c:choose>
													<c:when test="${pagination.currentPageNo == i }">
														<li class="paginate_button page-item active">
															<a aria-controls="dataTable"  class="page-link">${i }</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item">
															<a href="/notice?pageIndex=${i}" aria-controls="dataTable"  class="page-link">${i }</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${pagination.currentPageNo == pagination.getTotalPageCount()}">
													<li class="paginate_button page-item next disabled" id="dataTable_next">
														<a href="#" aria-controls="dataTable" " class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next disabled" id="dataTable_next">
														<a href="#" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/notice?pageIndex=${pagination.currentPageNo+1}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/notice?pageIndex=${pagination.getTotalPageCount()}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
							</div>
                        
                        
                        
                        
			<!-- 글작성버튼  인사팀, 사장 작성-->
			<c:if test="${EMP.deptId == '0000' || EMP.deptId == '0002'}">
				<input type="button" id="insertBtn" class="btn btn-light" value="글작성" style="display:inline; float: right;">
			</c:if>
		</div>
                </div>

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
<!--     <script src="/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script> -->

    <!-- Custom scripts for all pages-->
<!--     <script src="/admin2form/js/sb-admin-2.min.js"></script> -->

    <!-- Page level plugins -->
    <script src="/admin2form/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/admin2form/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/admin2form/js/demo/datatables-demo.js"></script>

</body>

</html>