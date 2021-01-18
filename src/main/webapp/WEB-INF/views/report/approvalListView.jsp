<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<style type="text/css">
	a{
		color: #858796;
	}
	#dataTable_filter{
		width: 200px;
		float: right;
	}
	#dataTable_filter{
		
	}
	label {
		width: 200px;
	}
</style>
<script src="/js/js.cookie-2.2.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#recordCnt').val("${busiBoard.recordCountPerPage}");
	$('#searchCondition').val("${busiBoard.searchCondition}");
	$('#searched').val("${busiBoard.searchKeyword}");
	
	console.log($('#recordCnt').val());
	
	$('#recordCnt').on('change', function(){
		console.log('record changed');
		console.log($(this).val());
		recordCnt = $(this).val();
		Cookies.set("recordCountPerPage", recordCnt);
		document.location = "/selectPostList?boardId=${busiBoard.boardId}";
	});
	
	
	$('#btnSearch').on('click', function(){
		console.log('searching...');
		searchCondition = $('#searchCondition').val();
		searchKeyword = $('#searched').val();
		Cookies.set("searchCondition", searchCondition);
		Cookies.set("searchKeyword", searchKeyword);
		cookie.set("searchKey", cookies.get('searchKeyword'));
		document.location = "/selectPostList?boardId=${busiBoard.boardId}";	
	})
	
	
	$("#insertBtn").on("click", function() {
		document.location = "/insertPostView?boardId=${busiBoard.boardId}";
	});
	
	document.cookie = 'escaped=%u5317';
	document.cookie = 'default=%E5%8C%97';
	// 쿠키 인코딩 컨버터 리더
	var cookies = Cookies.withConverter({
	  read: function (value, name) {
	    if (name === 'escaped') {
	      return unescape(value)
	    }
	  }
	})
	
	console.log(cookies.get('escaped')) // 北
	console.log(cookies.get('default')) // 北
	console.log(cookies.get()) // { escaped: '北', default: '北' }
	
	//쿠키 인코딩 컨버터 라이터
	var cookie = Cookies.withConverter({
		  write: function (value, name) {
		    return value;
		  }
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-fw fa-users-cog" style="margin-left: 10px;"></i>&nbsp;&nbsp;${busiBoard.boardNm }</h2>
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"> <a target="_blank" href="#"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px;"></i>&nbsp;공지사항 숙지하고 업무에 임해주세요.</a></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                            	<div class="row">
										<input type="hidden" name="boardId" value="${busiBoard.boardId }">
										<div class="col-sm-12 col-md-6">
											<div class="dataTables_length" id="dataTable_length">
														<label>
															<i class="fas fa-th-large"></i>
															<select id="recordCnt" name="recordCountPerPage" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
																<option class="cnt" value="5" selected>5개씩 보기</option>
																<option class="cnt" value="10">10개씩 보기</option>
																<option class="cnt" value="15">15개씩 보기</option>
																<option class="cnt" value="20">20개씩 보기</option>
															</select>
														</label>
													</div>
												</div>
												 <div class="col-sm-12 col-md-6">
													<div id="dataTable_filter" class="dataTables_filter">
															<label>
															검색조건 : 
																<select id="searchCondition" name="searchCondition" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
																	<option value="title" selected>제목</option>
																	<option value="emp_id">기안자</option>
																</select>
																<span><i class="fas fa-search"></i>
																검색 : <input value="" type="text" id="searched" name="searchKeyword" class="form-control form-control-sm" aria-controls="dataTable">
																	 <button type="button" id="btnSearch" class="btn btn-light" style="display:inline; float: right;">검색</button>
																</span>
															</label>
													</div>
												</div>
									</div>
								
                                <table class="table table-bordered" width="100%" cellspacing="0" >
                                    <thead>
                                        <tr>
                                        	<th>번호</th>
                                            <th>기안번호</th>
                                            <th>제목</th>
                                            <th>기안자</th>
                                            <th>부서명</th>
                                            <th>기안일자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                     <%--   <c:forEach items="${busiPostList }" var="busiPost" varStatus="status"> --%>
						                    <tr>
		                                        <%-- <td>${pagination.getFirstRecordIndex()+status.index+1}</td> --%>
		                                        <td>1</td>
		                                        <td>RPT20201207-0001</td>
	                                            <%-- <c:choose>
	                                            	<c:when test="${busiPost.postSt == 'Y'}">
			                                            <td><a href="/selectPost?postSeq=${busiPost.postSeq }">${busiPost.title.replaceAll(' ','&nbsp;')}</a></td>	                                            	
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<td>삭제된 게시글입니다.</td>
	                                            	</c:otherwise>
	                                            </c:choose> --%>
	                                            <td>2020년 11월 비품 추가 구매</td>
	                                            <td>김길동</td>
	                                            <td>개발과</td>
	                                            <td>2020.12.07</td>
	                                            <%-- <td>
	                                            	<fmt:parseDate value="${busiPost.regDt }" pattern="yyyy-MM-dd HH:mm:ss" var="regDt"/>
	                                            	<fmt:formatDate value="${regDt }" pattern="yyyy-MM-dd HH:mm:ss"/>                                            		
	                                            </td> --%>
	                                        </tr>
	                                        
	                                        <tr>
	                                        	<td>2</td>
	                                        	<td>RPT202021207-0002</td>
	                                        	<td>알파 프로젝트 예산 확대 요청</td>
	                                        	<td>유길동</td>
	                                        	<td>개발과</td>
	                                        	<td>2020.12.07</td>
	                                        </tr>
	                                                         
                                     <%--    </c:forEach> --%>
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
														<a href="/selectPostList?boardId=${busiBoard.boardId}" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/selectPostList?boardId=${busiBoard.boardId}&pageIndex=${pagination.currentPageNo-1}" aria-controls="dataTable"  class="page-link">
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
															<a href="/selectPostList?boardId=${busiBoard.boardId}&pageIndex=${i}" aria-controls="dataTable"  class="page-link">${i }</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${pagination.currentPageNo == pagination.getTotalPageCount()}">
													<li class="paginate_button page-item next disabled" id="dataTable_next">
														<a href="#" aria-controls="dataTable" class="page-link">
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
														<a href="/selectPostList?boardId=${busiBoard.boardId}&pageIndex=${pagination.currentPageNo+1}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/selectPostList?boardId=${busiBoard.boardId}&pageIndex=${pagination.getTotalPageCount()}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
							</div>
                            
							<!-- 글작성버튼 -->
							<input type="button" id="insertBtn" class="btn btn-light" value="글작성" style="display:inline; float: right;">
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