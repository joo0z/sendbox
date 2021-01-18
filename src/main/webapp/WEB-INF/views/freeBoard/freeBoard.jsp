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
	<title>자유게시판</title>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
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
	#subscriptBtn{
		background: white;
		color: blue;
		border: 0px none white;
	}
	#starBtn:hover {
		background-size: 1.5em;
	}
	
	#BookMark:hover{
		color: #ffe812;
	}
	
	.boardNum{
		width: 7%;
		text-align: center;
	}
    .freeBoardLinkInfo{
    	width: 60%;
    	text-align: left;
    }
    .boardWriter{
    	width: 15%;
    }
    .boardDate{
    	width: 15%;
    }
    #title{
    	text-align: none;
    }
    
    .btn-info {
    color: #fff;
    background-color: #36b9cc;
    border-color: #36b9cc;
	}
	
	.titleLineTr{
    	background: #303A71;
    }
	.freeBoardLineTr:hover {
		background: #C3C5D2;
	}
	
</style>



<script>

      $(document).ready(function() {
		
		
		$("#insertFreePostBtn").on("click", function(){
			document.location = "/freeBoard/freePostInsertView";
		});
		
		$("#subscriptBtn").on("click", function(){
			$(this).css({background : "blue", color : "white"});
		});
		
		$("#FreeBoardTableBody").on("click", ".delBoard", function(){
			
// 			var boardSt = $(this).data("freeboardst");
// 			var postSeq = $(this).data("postseq");
			
// 			if(boardSt == "Y"){
// 				document.location = "/freeboard/freePostView?postSeq="+postSeq;
// 			}else{
				alert("이미 삭제된 게시글 입니다.");
// 			}
			
		});
		
		$('#recordCnt').val("${pagination.recordCountPerPage}");
		
		
		$('#recordCnt').change(function(){
			var recordCountPerPage = $("#recordCnt option:selected").val();
			console.log($("#recordCnt option:selected").val());
			document.location = "/freeBoard/freeBoardList?recordCountPerPage="+recordCountPerPage;
		});
		
		
		if(${param.searchCondition == 'title'}){
			$('#searchType').val('title')
		} else if(${param.searchCondition == 'sender'}){
			$('#searchType').val('emp_nm')
		}
		
		if(${param.searchKeyword != ''}){
			$('#searchKeyword').val("${param.searchKeyword}")		
		}
		
		$('#btnSearch').on('click',function(){
			var searchCondition = $('#searchType option:selected').val()
			var searchKeyword = $('#searchKeyword').val()
			
			var i = 0;
			
			location.href = "/freeBoard/freeBoardList?searchCondition=" +searchCondition+ "&searchKeyword=" + searchKeyword;
			
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-fw fa-pencil-alt" style="margin-left: 10px;"></i>&nbsp&nbsp자유게시판
                    
	                    <!-- subscript button area -->
                    </h2>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</h6>
                        </div>
                        <div class="card-body">
                        
                        
                            <div class="table-responsive" style="overflow: hidden;">
                            
                            	<div class="row">
                            	
                            	<!-- search line -->
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_length" id="dataTable_length">
											<i class="fas fa-th-large" style="display: inline;"></i>
											<label>
												<select id="recordCnt" name="recordCountPerPage" aria-controls="dataTable" 
												class="custom-select custom-select-sm form-control form-control-sm">
													<option class="cnt" value="5">5개씩 보기</option>
													<option class="cnt" value="10">10개씩 보기</option>
													<option class="cnt" value="15">15개씩 보기</option>
													<option class="cnt" value="20">20개씩 보기</option>
												</select>
											</label>
										</div>
									</div>
									
									<div class="col-sm-12 col-md-7"  style="display: inline-block;">
										<div id="" class="dataTables_filter" style="float: right;">
											검색조건 :
											<select class="form-control" name="type" style="width : 100px; height : 30px; font-size:14px; display: inline;" id="searchType">
					                        	<option value="title">제목</option>
					                        	<option value="emp_nm">작성자</option>  
					                        </select>
					                        &nbsp;&nbsp;&nbsp;&nbsp;
					                        <i class="fas fa-search" style="display: inline;"></i>검색 : 
					                        <input type="text" placeholder="검색 키워드를 입력해주세요" style="width: 200px; height : 31px; font-size:14px; display: inline;margin-bottom:7px;" 
					                        		class="form-control" id="searchKeyword">
					                        <button type="button" id="btnSearch" class="btn btn-primary" style="display:inline;">검색</button>
											&nbsp;&nbsp;
					                     </div>
					                 </div>
                            
                                <table class="table table-bordered"  width="100%" cellspacing="0" style="text-align: center;">
                                    <thead>
                                        <tr class="titleLineTr" style=" color: white;">
                                            <th>NO</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일자</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody id="FreeBoardTableBody">
                                    
                                  		<c:choose>
                                  		
                                  			<c:when test="${freeBoardList.size() > 0}">
	                                   			<c:forEach var="i" begin="0" end="${freeBoardList.size()-1}" step="1">
												<tr class="freeBoardLineTr">
													<td class="boardNum">${i + 1}</td>
													<td class="freeBoardLinkInfo">
													<c:choose>
														<c:when test="${freeBoardList.get(i).postSt == 'Y'}">
															<a href="/freeboard/freePostView?postSeq=${freeBoardList.get(i).postSeq}">${freeBoardList.get(i).title }</a>
														</c:when>
														<c:when test="${freeBoardList.get(i).postSt == 'N'}">
															<a href="#" class="delBoard">삭제된 게시글 입니다.</a>														
														</c:when>
													</c:choose>
													</td>
													
													<td class="boardWriter">${freeBoardList.get(i).empNm }</td>
													<td class="boardDate">${freeBoardList.get(i).regDt }</td>
												</tr>
												</c:forEach>
                                  			</c:when>
                                  			
                                  			<c:otherwise>
                                  				<tr>
													<td colspan="4">데이터 없음</td>
												</tr>
                                  			</c:otherwise>
                                  		
                                  		</c:choose>
		                                   	
                                   	
									</tbody>
                                </table>
                            </div>
                            
                            
                            
                            
                            
<!--                             페이징 처리  -->
                            <div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
									</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate" id="dataTable_paginate">
										<ul class="pagination">
										
<!-- 											좌측 이동 네비게이션 -->
											<c:choose>
												<c:when test="${pagination.currentPageNo == 1 or pagination.currentPageNo == null}">
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
												<c:when test="${freeBoardList.size() > 0}">
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/freeBoard/freeBoardList?recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/freeBoard/freeBoardList?pageIndex=${pagination.currentPageNo-1}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-left"></i>
														</a>
													</li>
												</c:when>
												
											</c:choose>
											
											
											<c:choose>
											
												<c:when test="${freeBoardList.size() > 0 }">
													<c:forEach begin="${pagination.getFirstPageNoOnPageList() }" end="${pagination.getLastPageNoOnPageList() }" step="1" var="i">
														<c:choose>
															<c:when test="${pagination.currentPageNo == i }">
																<li class="paginate_button page-item active">
																	<a aria-controls="dataTable"  class="page-link">${i }</a>
																</li>
															</c:when>
															<c:otherwise>
																<li class="paginate_button page-item">
																	<a href="/freeBoard/freeBoardList?&pageIndex=${i}&recordCountPerPage=${pagination.recordCountPerPage }
																	&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" aria-controls="dataTable" class="page-link">
																	${i }</a>
																</li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li class="paginate_button page-item active">
														<a aria-controls="dataTable"  class="page-link">1</a>
													</li>
												</c:otherwise>
											
											</c:choose>
											
											
											
											
											
											
											
											
											
<!-- 											우측 이동 네비게이션 -->
											<c:choose>
												<c:when test="${pagination.currentPageNo == pagination.getTotalPageCount()}">
													<li class="paginate_button page-item next disabled" id="dataTable_next">
														<a href="#" aria-controls="dataTable" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next disabled" id="dataTable_next">
														<a href="#" aria-controls="dataTable" class="page-link">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												
												
												</c:when>
												<c:otherwise>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/freeBoard/freeBoardList?&pageIndex=${pagination.currentPageNo+1}&recordCountPerPage=${pagination.recordCountPerPage }
														&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="/freeBoard/freeBoardList?pageIndex=${pagination.getTotalPageCount()}&recordCountPerPage=${pagination.recordCountPerPage }
														&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
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
							<input type="button" id="insertFreePostBtn" class="btn btn-info" value="글작성" style="display:inline; float: right;">
						</div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
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