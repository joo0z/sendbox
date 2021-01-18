<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SENDBOX</title>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">

<style type="text/css">
	a{
		color: #858796;
	}
	label {
		width: 200px;
	}
</style>

<script>
$(document).ready(function(){
	$('#reportList .dataTr').on('click',function(){
		var reportId =$(this).data("a");
		$('#reportId').val(reportId);
		$('#reportViewForm').submit();
 		
	});
	
	$('#recordCnt').change(function(){
		var recordCountPerPage = $("#recordCnt option:selected").val();
		console.log($("#recordCnt option:selected").val());
		document.location = "/report/approvListView?recordCountPerPage="+recordCountPerPage;
	})
});	

</script>
</head>

<body id="page-top">
	<form id="reportViewForm" action="/report/reportView" method="post">
		<input type="hidden" id="reportId" name="reportId" value="">
	</form>

    <!-- Page Wrapper -->
    <div id="wrapper">


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">


                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h2 class="h3 mb-2 text-gray-800"><i class="far fa-file-alt" style="margin-left: 10px;"></i>&nbsp;&nbsp;결재대기문서
                    </h2>
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
<!--                         <div class="card-header py-3"> -->
<!--                             <h6 class="m-0 font-weight-bold text-primary"> <a target="_blank" href="#"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</a></h6> -->
<!--                         </div> -->
						<div class="approverType" style="text-align : right; padding-right: 20px;">
							<br>
							<%-- 원근무자 : ${subWorker.empId } --%>
							<form:form id="approvListForm" commandName="reportVo" method="post">
								<label style="width:80px;"><i class="fas fa-user-circle"></i><span>결재자 :</span></label>
								<form:select id="subEmpIdSelect" path="subEmpId" cssClass="custom-select custom-select-sm form-control form-control-sm" cssStyle="width: 100px;" onchange="javascript:changeApprover()">
									<c:choose>
										<c:when test="${subWorker == null }">
											<form:option value="" label="${EMP.empNm}"/>
										</c:when>
										<c:otherwise>
											<c:if test="${subWorker.subEmpAuthLv > 0}">
												<form:option value="" label="${EMP.empNm}"/>
											</c:if>
											<form:option value="${subWorker.empId}" label="${subWorker.empNm }"/>						
										</c:otherwise>							
									</c:choose>		
								</form:select>
							</form:form>
							<script type="text/javascript">
								function changeApprover(){
									var form = document.getElementById('approvListForm');
									form.action = '/report/approvListView';
									form.submit();
								}
							</script> 
						</div>
						
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                           
                                <table class="table table-bordered" id=""  cellspacing="0" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th>문서번호</th>
                                            <th>기안자</th>
                                            <th>제목</th>
                                            <th>기안일자</th>
                                            <th>문서분류</th>
                                            <th>기안상태</th>
                                        </tr>
                                    </thead>
                                    <tbody id="reportList" style="text-align: center;">
                                      <c:forEach items="${reportList}" var="list"> 
                                        <tr class="dataTr" class="dataTr" data-a="${list.reportId }">
                                            <td>${list.reportId }</td>
                                            <td>${list.empNm } ${list.jobtitleNm }</td>
                                            <td>${list.title }</td>
                                            <td>${list.reportDt }</td>
                                            <td>
	                                            ${list.typeNm }
                                            </td>
                                            <td>
                                            <c:choose>
                                            	<c:when test="${list.reportSt =='W'}">대기</c:when>
                                            	<c:when test="${list.reportSt =='Y'}">승인</c:when>
                                            	<c:when test="${list.reportSt =='ing'}">진행</c:when>
                                            	<c:when test="${list.reportSt =='N'}">거절</c:when>
                                            	<c:otherwise>퇴사</c:otherwise>
                                            </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    
                                   <c:if test="${fn:length(reportList) == 0 }">
                                         <tr>
                                            <td colspan="6" style="text-align: center;">서류가 없습니다</td>
                                         </tr>
                                   </c:if>
                                        
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
									<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
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
														<a href="/report/approvListView" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/report/approvListView?pageIndex=${pagination.currentPageNo-1}" aria-controls="dataTable"  class="page-link">
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
															<a href="/report/approvListView?pageIndex=${i}" aria-controls="dataTable"  class="page-link">${i }</a>
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
														<a href="/report/approvListView?pageIndex=${pagination.currentPageNo+1}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/report/approvListView?pageIndex=${pagination.getTotalPageCount()}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
							</div>   
                            
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
    <script src="/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/admin2form/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/admin2form/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/admin2form/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/admin2form/js/demo/datatables-demo.js"></script>

</body>

</html>