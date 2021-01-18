<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>내 작성 투표함</title>
	
	
	
	
	<style type="text/css">
	
	
		.votePostListLineTr{
			text-align: center;
		}
		.votePostNum{
			width: 8%;
		}
		.votePostTitle{
			width: 35%;
			text-align: left;
		}
		.votePostWriter{
			width: 7%;
		}
		.votePostJobTitle{
			width: 10%;
		}
		.votePostDept{
			width: 10%;
		}
		.votePostTeam{
			width: 10%;
		}
		.votePostDate{
			width: 10%;
		}
		.votePostStatus{
			width: 10%;
		}
		
		.votePostTitleLineTr{
	    	background: #303A71;
	    }
		.votePostLineTr:hover {
			background: #C3C5D2;
		}
		#votePostListTableBody{
			text-align: center;
		}
		
	</style>
	
	<script type="text/javascript">
		
		$(function(){
			
			$('#recordCnt').val("${pagination.recordCountPerPage}");
			$("#searched").val("${searchKeyword}");
			if("${searchKeyword}" == "ING"){
				$("#searched").val("진행");
			}
			if("${searchKeyword}" == "COM"){
				$("#searched").val("채택");
			}
			if("${searchKeyword}" == "CAN"){
				$("#searched").val("철회");
			}
			if("${searchKeyword}" == "END"){
				$("#searched").val("마감");
			}
			
			console.log("searchCondition = " + "${searchCondition}");
			if("${searchCondition}" == ""){
				$("#searchCondition").val("vote_post_title")
			}else{
				$("#searchCondition").val("${searchCondition}");				
			}
			
			
			
			$('#recordCnt').on('change', function(){
				console.log('record changed');
				console.log($(this).val());
				recordCnt = $(this).val();
				document.location = "/vote/myVotePostListView?recordCountPerPage="+recordCnt;
			});
			
			
			$("#searchCondition").on("change", function(){
				if($(this).val() == "vote_post_st"){
					$("#searched").attr("placeholder", "진행,채택,철회,마감 중 선택");
				}else{
					$("#searched").attr("placeholder", "");
				}
			});
			
			
			
			$('#btnSearch').on('click', function(){
				console.log('searching...');
				var recordCnt = $("#recordCnt").val();
				var searchCondition = $('#searchCondition').val();
				var searchKeyword = $('#searched').val();
				
				if(searchCondition == "vote_post_st"){
					if(searchKeyword == "진행"){
						searchKeyword = "ING";
					}
					if(searchKeyword == "채택"){
						searchKeyword = "COM";
					}
					if(searchKeyword == "철회"){
						searchKeyword = "CAN";
					}
					if(searchKeyword == "마감"){
						searchKeyword = "END"
					}
				}
				document.location = "/vote/myVotePostListView?recordCountPerPage="+recordCnt+"&searchCondition="+searchCondition+"&searchKeyword="+searchKeyword;
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-person-booth" style="margin-left: 10px;"></i>&nbsp&nbsp 내 작성 투표함</h2>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</a></h6>
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
													<option class="cnt" value="5" selected>5개씩 보기</option>
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
											<select id="searchCondition" name="searchCondition" 
											class="custom-select custom-select-sm form-control form-control-sm" style="width: 100px;">
												<option value="vote_post_title" selected>제목</option>
												<option value="vote_post_st">진행상태</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<i class="fas fa-search" style="display: inline;"></i>검색 : 
											<input type="text" id="searched" name="searchKeyword" class="form-control form-control-sm" style="width: 200px; display: inline;">
											<button type="button" id="btnSearch" class="btn btn-primary" style="display:inline;">검색</button>
											&nbsp;&nbsp;
										</div>
									</div>
								</div>
								
                            	<br>
                            
                            	<!-- table show line -->
                                <table class="table" width="100%" cellspacing="0">
                                    <thead style="text-align: center;">
                                        <tr class="votePostTitleLineTr" style="color: white;">
                                            <th>NO</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>직급</th>
                                            <th>부서명</th>
                                            <th>팀명</th>
                                            <th>등록일</th>
                                            <th>진행상태</th>
                                        </tr>
                                    </thead>
                                    <tbody id="votePostListTableBody">
                                    
                                  		<c:choose>
											
                                  			<c:when test="${votePostList.size() > 0}">
	                                   			<c:forEach var="i" begin="0" end="${votePostList.size()-1}" step="1">
												<tr class="votePostLineTr">
													<td class="votePostNum">${i + 1 + votePostFrontNum}</td>
													<td class="votePostTitle">
														<a href="/vote/votePostView?myORall=${myORall }&votePostSeq=${votePostList.get(i).votePostSeq}">${votePostList.get(i).votePostTitle }</a>
													</td>
													<td class="votePostWriter">${votePostList.get(i).empNm }</td>
													<td class="votePostJobTitle">${empTitleList.get(i) }</td>
													<td class="votePostDept">${empDeptInfoList.get(i).deptName }</td>
													<td class="votePostTeam">${empDeptInfoList.get(i).teamName }</td>
													<td class="votePostDate">
														${votePostList.get(i).votePostDt }
													</td>
													<td class="votePostStatus">
													
														<jsp:useBean id="now" class="java.util.Date" />
														<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="date"/>
														
														<fmt:parseNumber value="${date }" var="toDay"></fmt:parseNumber>
														<fmt:parseNumber value="${votePostList.get(i).votePostEndDt }" var="endDtNum"></fmt:parseNumber>
														
														<c:if test="${endDtNum >= toDay}">
															<c:if test="${votePostList.get(i).votePostSt == 'ING'}">
																<span style="color: blue;">진행중</span>
															</c:if>
															<c:if test="${votePostList.get(i).votePostSt == 'COM'}">
																<span style="color: green;">채택완료</span>
															</c:if>
															<c:if test="${votePostList.get(i).votePostSt == 'CAN'}">
																<span style="color: red;">투표철회</span>
															</c:if>
														</c:if>
														<c:if test="${endDtNum < toDay}">
															<span style="color: gray;">마감</span>
														</c:if>
													</td>
													
												</tr>
												</c:forEach>
                                  			</c:when>
                                  			
                                  			<c:otherwise>
                                  				<tr>
													<td colspan="8" style="text-align: center;">데이터 없음</td>
												</tr>
                                  			</c:otherwise>
                                  		
                                  		</c:choose>
		                                   	
                                   	
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
										
										
										
											<!-- 좌측 이동 네비게이션 -->
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
												<c:when test="${votePostList.size() > 0}">
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/vote/myVotePostListView?pageIndex=1&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" 
														aria-controls="dataTable" class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/vote/myVotePostListView?pageIndex=${pagination.currentPageNo-1}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" 
														aria-controls="dataTable" class="page-link">
															<i class="fas fa-angle-left"></i>
														</a>
													</li>
												</c:when>
												
											</c:choose>
											
											
											
											
											
											<c:choose>
											
												<c:when test="${votePostList.size() > 0 }">
													<c:forEach begin="${pagination.getFirstPageNoOnPageList() }" end="${pagination.getLastPageNoOnPageList() }" step="1" var="i">
														<c:choose>
															<c:when test="${pagination.currentPageNo == i }">
																<li class="paginate_button page-item active">
																	<a aria-controls="dataTable" class="page-link">${i }</a>
																</li>
															</c:when>
															<c:otherwise>
																<li class="paginate_button page-item">
																	<a aria-controls="dataTable" class="page-link"
																	href="/vote/myVotePostListView?pageIndex=${i}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
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
											
											
											
											
											
											
											
											
											
											<!-- 우측 이동 네비게이션 -->
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
														<a aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link"
														 href="/vote/myVotePostListView?pageIndex=${pagination.currentPageNo+1}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link"
														 href="/vote/myVotePostListView?pageIndex=${pagination.getTotalPageCount()}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
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
