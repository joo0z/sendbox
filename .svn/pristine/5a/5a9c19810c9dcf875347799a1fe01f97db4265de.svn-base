<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	@font-face {
  font-family: 'LotteMartHappy';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff') format('woff');
}

@font-face {
  font-family: 'LotteMartHappy';
  font-style: normal;
  font-weight: 700;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff') format('woff');
}

.lottemarthappy * {
 font-family: 'LotteMartHappy', sans-serif;
}

</style>

<script>

$(function(){
	
	$('#year').val(${param.year})
	$('#month').val(${param.month})
	console.log('${param.month}');
	var month = '${param.month}';
	$('option[value='+month+']').prop('selected', true);
	
	
	
	$('#searchBtn').on('click',function(){
		
		var year = $('#year option:selected').val()
		var month = $('#month option:selected').val()
		
		location.href = "/salary/manage?year=" + year + "&month=" + month;
		
		
	})
	
	$('#calBtn').on('click',function(){
		
		var year = $('#year option:selected').val()
		var month = $('#month option:selected').val()
		
		location.href = "/salary/calculation?year=" + year + "&month=" + month;
	})
	
	$('#excel').on('click',function(){
		var year = $('#year option:selected').val()
		var month = $('#month option:selected').val()
		location.href = "/salary/excel?year=" + year + "&month=" + month;
	})
})


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
                    <h2 class="h3 mb-2 text-gray-800">💰&nbsp&nbsp급여관리</h2>
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
<!--                         <div class="card-header py-3"> -->
<!--                             <h6 class="m-0 font-weight-bold text-primary"> <a target="_blank" href="#"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</a></h6> -->
<!--                         </div> -->
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                            
                            
								<select class="form-control" name="year" id="year"
									style="width: 100px; float: left; margin: 5px;">
									<c:forEach var="i" begin="2018" step="1" end="${yy }">
										<option value="${i }">${i }년</option>
									</c:forEach>
								</select> 
								
								<select class="form-control" name="month" id="month"
									style="width: 100px; float: left; margin: 5px;">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
								<input id="searchBtn" type="button" value="검색" style="margin-top : 5px; height : 38px;">
                                <table class="table table-bordered" id=""  cellspacing="0">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직급</th>
                                            <th>지급액</th>
                                            <th>지급일자</th>
                                            <th>지급여부</th>
                                        </tr>
                                    </thead>
                                    <tbody id="reportList" style="text-align: center;">
                                    
                                    <c:forEach items="${salaryList }" var="sal">
                                    	<tr>
                                    		<td>${sal.empNm}</td>
                                    		<td>${sal.deptName }</td>
                                    		<td>${sal.jobtitleNm }</td>
                                    		<td style="text-align: right;">${sal.salaryAmt } 원</td>
                                    		<td>${sal.salaryDt }</td>
                                    		<td>${sal.salarySt }</td>
                                    	</tr>
                                    </c:forEach>
                                    
                                     <c:if test="${fn:length(salaryList) == 0 }">
                                         <tr>
                                            <td colspan="6" style="text-align: center;">
                                            	해당 월의 지급 내역이 없습니다.
                                            	<br>
                                            	<input id="calBtn" type="button" value="월급 산정" style="margin-top : 5px; height : 38px;">
                                            	</td>
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
									
									 <c:if test="${fn:length(salaryList) != 0 }">
											<button type="button" id="excel" class="btn btn btn-success" style="float: right;">엑셀 다운로드 및 지급</button>
									 </c:if>
									
									
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
														<a href="/salary/manage?year=${year }&month=${month }" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/salary/manage?year=${year }&month=${month }&pageIndex=${pagination.currentPageNo-1}" aria-controls="dataTable"  class="page-link">
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
															<a href="/salary/manage?year=${year }&month=${month }&pageIndex=${i}" aria-controls="dataTable"  class="page-link">${i }</a>
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
														<a href="/salary/manage?year=${year }&month=${month }&pageIndex=${pagination.currentPageNo+1}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/salary/manage?year=${year }&month=${month }&pageIndex=${pagination.getTotalPageCount()}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
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