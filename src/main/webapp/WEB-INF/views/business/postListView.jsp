<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>업무보고</title>

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
<script>
$(document).ready(function(){
	
	/* $('#recordCnt').val("${busiBoard.recordCountPerPage}");
	$('#searchCondition').val("${busiBoard.searchCondition}");
	$('#searched').val("${busiBoard.searchKeyword}"); */

	
	/* $('#recordCnt').on('change', function(){
		console.log('record changed');
		console.log($(this).val());
		recordCnt = $(this).val();
		Cookies.set("recordCountPerPage", recordCnt);
		document.location = "/selectPostList?boardId=${busiBoard.boardId}";
	}); */
	
	
	/* $('#btnSearch').on('click', function(){
		console.log('searching...');
		searchCondition = $('#searchCondition').val();
		searchKeyword = $('#searched').val();
		Cookies.set("searchCondition", searchCondition);
		Cookies.set("searchKeyword", searchKeyword);
		cookie.set("searchKey", cookies.get('searchKeyword'));
		document.location = "/selectPostList?boardId=${busiBoard.boardId}";	
	}) */
	
	
/* 	$("#insertBtn").on("click", function() {
		document.location = "/insertPostView?boardId=${busiBoard.boardId}";
	}); */
	
	/* document.cookie = 'escaped=%u5317';
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
		}) */
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
           	<form:form id="busiBoardForm" commandName="busiBoardVo" method="post">
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h2 class="h3 mb-2 text-gray-800" style="padding: 10px;">
                    	<i class="fas fa-fw fa-users-cog" style="margin-left: 10px;"></i>
                    	&nbsp;&nbsp;
                    		<form:hidden id="pageIndex" path="pageIndex"/>
                    		<form:hidden path="recordCountPerPage"/>
                    		<form:hidden id="postSeq" path="postSeq"/>
                    		<form:select path="boardId" cssClass="form-control form-control-lg"  
                    					cssStyle="width: 15%; border: 0px solid white; background-color: transparent; display: inline-block;" 
                    					onchange="javascript:boardView()">
	                    		<form:options items="${busiBoardList }" itemLabel="boardNm" itemValue="boardId"/>                    			
                    		</form:select>
                    		<script>
                    			function boardView(){
                    				var form = document.getElementById('busiBoardForm');
                    				form.action = "/selectPostList";
                    				form.submit();
                    			}
                    		</script>
                    </h2>
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"> <a href="#"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px;"></i>&nbsp;공지사항 숙지하고 업무에 임해주세요.</a></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                            	<div class="row">
                    	
										<%-- <input type="hidden" name="boardId" value="${busiBoard.boardId }"> --%>
										<div class="col-sm-12 col-md-20">
											<div class="dataTables_length" id="dataTable_length">
												<i class="fas fa-th-large" style="display: inline; vertical-align: middle;"></i>
												<label>
													<form:select path="pageUnit" id="recordCnt" aria-controls="dataTable" cssClass="custom-select custom-select-sm form-control form-control-sm" onchange="javascript:boardView()">
														<form:option cssClass="cnt" value="5" label="5개씩 보기" />
														<form:option cssClass="cnt" value="10" label="10개씩 보기"/>
														<form:option cssClass="cnt" value="15" label="15개씩 보기"/>
														<form:option cssClass="cnt" value="20" label="20개씩 보기"/>
													</form:select>
												</label>
												<div id="searchbar" class="dataTables_filter" style="float : right;">
													검색조건 : 
													<form:select id="searchCondition" path="searchCondition" 
														cssClass="custom-select custom-select-sm form-control form-control-sm" cssStyle="width: 100px;">
														<form:option value="title" label="제목"/>
														<form:option value="emp_nm" label="작성자"/>
													</form:select>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<i class="fas fa-search" style="display: inline;"></i>검색 :
															<form:input path="searchKeyword" id="searched" cssClass="form-control form-control-sm" cssStyle="width: 200px; display: inline;"/> 
													<!-- <input type="text" id="searched" name="searchKeyword" class="form-control form-control-sm" style="width: 200px; display: inline;"> -->
															<button type="button" id="btnSearch" class="btn btn-primary" style="display:inline;" onclick="javascript:boardView()">검색</button>
													&nbsp;&nbsp;
												</div>
											</div>
										</div>
									</div>
									<br>
                                <table class="table table-bordered" cellspacing="0">
                                	<colgroup>
                                		<col width="10%">
                                		<col width="?">
                                		<col width="10%">
                                		<col width="10%">
                                		<col width="15%">                                	
                                		<col width="10%">
                                	</colgroup>
               
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>직급</th>
                                            <th>작성일자</th>
                                            <th>첨부파일</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center;">
	                                       <c:forEach items="${busiPostList }" var="busiPost" varStatus="status">
						                    <tr>
		                                        <td>${paginationInfo.getFirstRecordIndex()+status.index}</td>
	                                            <c:choose>
	                                            	<c:when test="${busiPost.postSt == 'Y'}">
			                                            <td style="text-align : left; padding-left:50px; cursor: pointer;" onclick="javascript:postView('${busiPost.postSeq}')"><a href="/selectPost?postSeq=${busiPost.postSeq }">${busiPost.title.replaceAll(' ','&nbsp;')}</a></td>	                                            	
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<td>삭제된 게시글입니다.</td>
	                                            	</c:otherwise>
	                                            </c:choose>
	                                            <td>${busiPost.empNm }</td>
	                                            <td>${busiPost.jobtitleNm}</td>
	                                            <td>
	                                            	<fmt:parseDate value="${busiPost.regDt }" pattern="yyyy-MM-dd HH:mm" var="regDt"/>
	                                            	<fmt:formatDate value="${regDt }" pattern="yyyy-MM-dd HH:mm"/>                                            		
	                                            </td>
	                                            <td>
	                                            	<c:choose>
	                                            		<c:when test="${busiPost.fileCnt == 0}">
			                                            	<i class="fas fa-times"></i>	                                            		
	                                            		</c:when>
	   													<c:otherwise>
			                                            	<i class="far fa-file-archive"></i>												
	   													</c:otherwise>                                         	
	                                            	</c:choose>
	                                            </td>
	                                        </tr>                
                                        </c:forEach>
                                        
                                       <c:if test="${fn:length(busiPostList) == 0 }">
                                         <tr>
                                            <td colspan="6" style="text-align: center;">게시글이 없습니다</td>
                                         </tr>
                                      </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <script>
	                            function postView(id){
	                            	var form = document.getElementById('busiBoardForm');
	                            	document.getElementById('postSeq').value = id;
	                            	form.action = "/selectPost";
	                            	form.submit();
	                            }
                            </script>
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
												<c:when test="${paginationInfo.currentPageNo == 1 }">
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
														<a href="javascript:pageView(1)" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="javascript:pageView('${paginationInfo.currentPageNo -1}')" aria-controls="dataTable"  class="page-link">
															<i class="fas fa-angle-left"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="${paginationInfo.getFirstPageNoOnPageList()}" end="${paginationInfo.getLastPageNoOnPageList()}" step="1" var="i">
												<c:choose>
													<c:when test="${paginationInfo.currentPageNo == i }">
														<li class="paginate_button page-item active">
															<a aria-controls="dataTable"  class="page-link">${i }</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item">
															<a href="javascript:pageView('${i}')" aria-controls="dataTable"  class="page-link">${i }</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${paginationInfo.currentPageNo == paginationInfo.getTotalPageCount()}">
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
														<a href="javascript:pageView('${paginationInfo.currentPageNo +1}')" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a href="javascript:pageView('${paginationInfo.getTotalPageCount()}')" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
							</div>
                            <script>
                            	function pageView(page){
                            		var form = document.getElementById('busiBoardForm')
                            		document.getElementById('pageIndex').value = page;
                            		form.action = "/selectPostList"
                            		form.submit();
                            	}
                            
                            </script>
                            <%-- <div class="row">
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
							</div> --%>
                            
							<!-- 글작성버튼 -->
							<button type="button" id="insertBtn" class="btn btn-light" style="display:inline; float: right;" onclick="javascript:insertPost()">글작성</button>
							<script>
								function insertPost(){
									var form = document.getElementById('busiBoardForm');
									form.setAttribute('commandName', 'busiPostVo')
									form.action = "/insertPostView";
									form.submit();
								}
							</script>
						</div>
                    </div>

                </div>
                <!-- /.container-fluid -->
			</form:form>
			<script>
			
			
			
			</script>
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