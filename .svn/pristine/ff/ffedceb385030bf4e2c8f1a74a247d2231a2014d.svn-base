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
	<title>전체 투표함</title>
	
	
	
	
	<style type="text/css">
	
		.votePostNum{
			width: 7%;
			text-align: center;
		}
		.votePostTitle{
			width: 33%;
		}
		.votePostStatus{
			width: 10%;
			text-align: center;
		}
		.votePostWriter{
			width: 8%;
			text-align: center;
		}
		.votePostJobTitle{
			width: 6%;
			text-align: center;
		}
		.votePostDept{
			width: 8%;
			text-align: center;
		}
		.votePostTeam{
			width: 8%;
			text-align: center;
		}
		.votePostDate{
			width: 10%;
			text-align: center;
		}
		 
                            
		.votePostTitleLineTr{
	    	background: #303A71;
	    }
		.votePostLineTr:hover {
			background: #C3C5D2;
		}
		.dataTables_filter{
			vertical-align: top;
		}
		
		
		.modal-content {
			width: 600px;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		.front{
			text-align: right;
			font-family: 'Nanum Gothic', sans-serif;
		}
		input::placeholder, textarea::placeholder {
		  color: gray;
		  font-size: 15px;
		}
			
		table {
		    width: 100%;
		    border-collapse: collapse;
	  	}
	  	.trBottomLine th, .trBottomLine td{
		    padding: 10px;
	  	}
	  	.in {
	  		background: rgba(0, 0, 0, 0.2);
	  	}
		.voteItemClass{
			width: 200px;
		}
		#voteItemAddBtn{
			height: 30px;
	  		vertical-align: top;
	  		width: 30px;
	  		padding-top: 0px;
	  		padding-left: 0px;
	  		padding-right: 0px;
		}
		.voteItemSubBtn{
			height: 30px;
	  		font-size: 20px;
	  		vertical-align: top;
	  		width: 30px;
	  		padding-left: 0px;
	  		padding-right: 0px;
		}
		.voteItemAddedInfo{
			margin-top: 15px;
		}
		
		
		
		input{
			border-left-width:0;
			border-right-width:0;	
			border-top-width:0;
			border-bottom-width:1;
		}
		textarea {
			border-left-width:0;
			border-right-width:0;	
			border-top-width:0;
			border-bottom-width:1;
		}
		
		
		
		
		#title{
			width: 250px;
			border-bottom-color: gray;
			background: none;
		}
		#cont{
			width: 250px;
		}
		
		#votePostInsertTable{
			margin-left: 15%;
		}
		.emptyLineTR{
			height: 30px;
		}
		input[type=date]{
			width: 250px;
			text-align: center;
		}
		.votePostInsertPageTd{
			padding-left: 5%;
			font-size: 15px;
		}
		table i{
			font-size: 20px;
		}
	</style>
	
	<script type="text/javascript">
		
		$(function(){
			
			// 검색
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
				document.location = "/vote/votePostListView?recordCountPerPage="+recordCnt;
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
						searchKeyword = "ING"
					}
					if(searchKeyword == "채택"){
						searchKeyword = "COM"
					}
					if(searchKeyword == "철회"){
						searchKeyword = "CAN"
					}
					if(searchKeyword == "마감"){
						searchKeyword = "END"
					}
				}
				document.location = "/vote/votePostListView?recordCountPerPage="+recordCnt+"&searchCondition="+searchCondition+"&searchKeyword="+searchKeyword;
			});
			
			
			
			

			// 항목의 최대갯수
			var itemlimitCount = 5;
			
			// 투표생성
			$("#votePostCreatBtn").on("click", function(){
	        	voteItemTF = true;
	        	voteStartDtTF = true;
	        	
	        	// 투표 제목 확인
	        	if($("#title").val() == ""){
	        		alert("투표 제목을 작성해주세요.");
	        	}
	        	
	        	// 투표 항목 확인
	        	var voteItemLen = $(".voteItemAddedInfo").length;
	        	for(var i=0; i<voteItemLen; i++){
	        		var text = $(".voteItemAddedInfo:eq("+i+")").find(".voteItemClass").val();
					if(text == ""){
						voteItemTF = false;
						alert("투표항목을 작성해주세요.");
		        		break;
					}
	        	}
	        	
	        	// 투표 날짜 확인
	        	var startDT = $("#votePostSD").val();
	        	var endDT = $("#votePostED").val();
	        	if(startDT == ""){
	        		voteItemTF = false;
	        		alert("투표 시작 날짜를 선택해주세요");
	        	}
	        	if(endDT == ""){
	        		voteItemTF = false;
	        		alert("투표 종료 날짜를 선택해주세요");
	        	}
	        	if(startDT > endDT){
	        		voteItemTF = false;
	        		alert("투표 시작날짜는 종료날짜보다 앞에 있어야 합니다.");
	        		$("#votePostSD").val("");
	        		$("#votePostED").val("");
	        	}
	        	if(voteItemTF == true){
	        		$("#votePostInsertForm").attr("action", "/vote/createVotePost");
	        		$("#votePostInsertForm").attr("method", "post");
	        		$("#votePostInsertForm").submit();
	        	}
	        });
	        
	        $("#backBtn").on("click", function(){
	        	document.location = "/vote/votePostListView";
	        });
	        
	        var itemCount = 1;
	        // 항목 추가 버튼 클릭 함수
	        $("#voteItemAddBtn").on("click", function(){
	        	if(itemCount < itemlimitCount){
	        		var tagInfo = "";
		        	tagInfo += "<div class='voteItemAddedInfo addedVoteItemClass'>";
		        	tagInfo += "	● <input type='text' name='voteItemInfo' class='voteItemClass' placeholder='항목을 추가해주세요.'/>";
		        	tagInfo += "	<button type='button' class='btn btn-danger voteItemSubBtn'>￣</button>";
		        	tagInfo += "</div>";
		        	$("#voteItemCountBtnTD").append(tagInfo);
		        	itemCount++;
	        	}else{
	        		alert("항목은 5개 이하로 작성해주세요.");
	        	}
	        });
	        
	        // 항목 제거 버튼 클릭 함수
	        $("#voteItemCountBtnTD").on("click", ".voteItemSubBtn", function(){
	        	$(this).parents(".voteItemAddedInfo").remove();
	        	itemCount--;
	        });
	        
	        // 초기화 버튼 클릭 함수
	        $("#resetter").on("click", function(){
	        	$("#title").val("");
	        	$("#cont").val("");
	        	$("#votePostSD").val("");
	        	$("#votePostED").val("");
	        	$(".voteItemClass").val("");
	        	$(".addedVoteItemClass").remove();
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-person-booth" style="margin-left: 10px;"></i>&nbsp&nbsp 전체 투표함</h2>
                    
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
												<option value="emp_nm">작성자</option>
												<option value="vote_post_st">진행상태</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<i class="fas fa-search" style="display: inline;"></i>검색 : 
											<input type="text" id="searched" name="searchKeyword" class="form-control form-control-sm" style="width: 200px; display: inline;">
											<button type="button" id="btnSearch" class="btn" style="display:inline; background: #303A71; color: white;">검색</button>
											&nbsp;&nbsp;
										</div>
									</div>
								</div>
                            	<br>
                           
                            	<!-- table show line -->
                                <table class="table" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="votePostTitleLineTr" style="color: white;">
                                            <th class="votePostNum">NO</th>
                                            <th class="votePostTitle" style="text-align: center;">제목</th>
                                            <th class="votePostWriter">작성자</th>
                                            <th class="votePostJobTitle">직급</th>
                                            <th class="votePostDept">부서명</th>
                                            <th class="votePostTeam">팀명</th>
                                            <th class="votePostDate">등록일</th>
                                            <th class="votePostStatus">진행상태</th>
                                        </tr>
                                    </thead>
                                    <tbody id="CommuBoardTableBody">
                                    
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
														
														<c:if test="${votePostList.get(i).votePostSt == 'COM'}">
															<span style="color: green;">채택됨</span>
														</c:if>
														<c:if test="${votePostList.get(i).votePostSt == 'CAN'}">
															<span style="color: red;">철회됨</span>
														</c:if>
														<c:if test="${endDtNum >= toDay and votePostList.get(i).votePostSt == 'ING'}">
															<span style="color: blue">진행중</span>
														</c:if>
														<c:if test="${endDtNum < toDay and votePostList.get(i).votePostSt == 'ING'}">
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
														<a href="/vote/votePostListView?pageIndex=1&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" 
														aria-controls="dataTable" class="page-link">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="/vote/votePostListView?pageIndex=${pagination.currentPageNo-1}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }" 
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
																	href="/vote/votePostListView?pageIndex=${i}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
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
														 href="/vote/votePostListView?pageIndex=${pagination.currentPageNo+1}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
															<i class="fas fa-angle-right"></i>
														</a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_next">
														<a aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link"
														 href="/vote/votePostListView?pageIndex=${pagination.getTotalPageCount()}&recordCountPerPage=${pagination.recordCountPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
											
											
											
											
										</ul>
									</div>
								</div>
							</div>
							
							
							
							
							
							
							<input type="button" id="insertVotePostBtn" class="btn" value="투표작성" 
								   data-toggle="modal" data-target="#votePostCreateModal" 
								   style="display:inline; float: right; background: #303A71; color: white;">
							
							
							<!-- post vote insert modal -->
							<div class="modal fade" id="votePostCreateModal" tabindex="-1" role="dialog" aria-labelledby="votePostCreateModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="votePostCreateModalLabel">투표 생성</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <div align="center">
							        
							        
							        	<jsp:useBean id="sysdate" class="java.util.Date" />
										<fmt:formatDate value="${sysdate}" pattern="yyyy-MM-dd" var="today"/>
										 
							        	<form id="votePostInsertForm">
											<input type="hidden" name="vPCToken" value="vPCToken" />
						                    <table id="votePostInsertTable" width="100%" cellspacing="0">
						                    	<tr><td colspan="2" class="votePostInsertPageTd">질문 작성</td></tr>
						                    	<tr class="trBottomLine">
						                    		<td class="front"><i class="far fa-lightbulb"></i></td>
						                    		<td>
							                    		<input type="text" id="title" name="votePostTitle" autofocus maxlength="30" minlength="1" 
							                    			   style="margin-left: 10px;" 
							                    			   placeholder="질문을 작성해주세요.">
						                    		</td>
						                    	</tr>
						                    	
						                    	<tr class="emptyLineTR"></tr>
						                    	<tr><td colspan="2" class="votePostInsertPageTd">내용 작성</td></tr>
												<tr class="trBottomLine">
						                    		<td class="front"><i class="fas fa-pen-alt"></i></td>
													<td>
														<textarea id="cont" name="votePostCont" cols="50" rows="2" 
																  style="font-size: 15px; margin-left: 10px; resize: none;"
																  placeholder="내용을 작성해주세요."></textarea>
													</td>
												</tr>
												
												<tr class="emptyLineTR"></tr>
												<tr><td colspan="2" class="votePostInsertPageTd">항목 추가</td></tr>
												<tr class="trBottomLine">
						                    		<td class="front"><i class="fas fa-pen-alt"></i></td>
													<td id="voteItemCountBtnTD">
														● <input type="text" name="voteItemInfo" class="voteItemClass"
																 placeholder="항목을 추가해주세요." />
														<button type="button" class="btn btn-info" id="voteItemAddBtn">╉</button>
													</td>
												</tr>  
												
												<tr class="emptyLineTR"></tr>
												<tr><td colspan="2" class="votePostInsertPageTd">시작날짜 설정</td></tr>
												<tr class="trBottomLine">
						                    		<td class="front"><i class="far fa-calendar-alt"></i></td>
													<td><input id="votePostSD" type="date" min="${today }" name="votePostStartDt"/></td>
												</tr>
												<tr class="emptyLineTR"></tr>
												<tr><td colspan="2" class="votePostInsertPageTd">마감날짜 설정</td></tr>
												<tr class="trBottomLine">
						                    		<td class="front"><i class="far fa-calendar-alt"></i></td>
													<td><input id="votePostED" type="date" min="${today }" name="votePostEndDt"/></td>
												</tr>
												
												<tr class="emptyLineTR"></tr>
											</table>
										</form>
							        	
							        </div>
							      </div>
							      <div class="modal-footer">
							      	<input type="button" id="votePostCreatBtn" class="btn btn-success" value="등록" style="display:inline; float: right;">
									<input type="reset" id="resetter" class="btn btn-warning" value="초기화" style="display:inline; float: right; margin-right: 10px;">
							      </div>
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
