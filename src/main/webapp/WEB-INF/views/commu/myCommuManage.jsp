<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<style>
	.commu_img{
		width: 100px;
		height: 50px;
		margin: 0px;
	}
	.commu_img:hover {
		box-shadow: 0 1px 10px rgba(0,0,0,2);
		cursor:pointer;
		background:#000000;
	  	opacity:inherit;
		transition:all .2s linear;
		transform:scale(1);	
	}
</style>


<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script>
	$(function(){
		
		$(".commu_img").on("click", function(){
			var commuSeq = $(this).attr("id");
			document.location = "/commu/commuBoardList?commuSeq="+commuSeq;
		});
		
		
		$("#createCommu").on("click", function(){
			document.location = "/commu/createCommuView";
		});
		

		$("#tb").on("click", ".commuSt", function(){
			var commuNmHidden = $(this).parents(".trTag").find(".commuNmHidden").val();
			var commuStHidden = $(this).parents(".trTag").find(".commuStHidden").val();
			var commuSt = $(this).parents(".trTag").find(".useSelect").val();
			var commuSeq = $(this).parents(".trTag").find(".commuSeqHidden").val();
			var commuNm = $(this).parents(".trTag").find(".commuNm").val();
			
			if(commuStHidden == commuSt && commuNmHidden == commuNm){
				alert("변경하지 않았습니다.")
			}else{
				alert("변경하였습니다.")
				document.location = "/commu/updateCommu?commuSeq="+commuSeq+"&commuSt="+commuSt+"&commuNm="+commuNm;
			}
		});
		
	})
</script>
	
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-users" style="margin-left: 10px;"></i>&nbsp&nbsp 내 커뮤니티 관리</h2>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</h6>
                        </div>
                        <div class="card-body">
                        
                        
                            <div class="table-responsive" style="overflow: hidden;">
                            
                            
                                <table class="table table-bordered" width="100%" cellspacing="0">
									<thead>
										<tr>
											<td>커뮤니티 아이콘</td>
											<td>커뮤니티 이름</td>
											<td>커뮤니티 생성자</td>
											<td>사용여부</td>
										</tr>
									</thead>
									<tbody id="tb">
										<c:choose>
											<c:when test="${commuList.size() > 0}">
												<c:forEach items="${commuList }" var="commuVO">
													<tr class="trTag" style="height : 10px;">
														<td>
															<img class="commu_img" alt="${commuVO.commuNm }" id="${commuVO.commuSeq }" 
															src="/commu/commuIconView?commuSeq=${commuVO.commuSeq }" >
														</td>
														<td><input type="text" class="commuNm" value="${commuVO.commuNm }" /></td>
														<td>${commuVO.empId }</td>
														<td>
															<select class="useSelect" name="CommuUse" style="height: 35px;">
																<c:choose>
																	<c:when test="${commuVO.commuSt eq 'Y'}">
																		<option value="Y" selected="selected">사용</option>
																		<option value="N">미사용</option>									
																	</c:when>
																	<c:when test="${commuVO.commuSt eq 'N'}">
																		<option value="Y">사용</option>
																		<option value="N" selected="selected">미사용</option>	
																	</c:when>
																</c:choose>
															</select>
															<input type="button" class="btn btn-warning commuSt" value="수정" style="vertical-align: top;"/>
															<input type="hidden" class="commuStHidden" value="${commuVO.commuSt }" />
															<input type="hidden" class="commuSeqHidden" value="${commuVO.commuSeq }" />
															<input type="hidden" class="commuNmHidden" value="${commuVO.commuNm }" />
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr class="trTag" style="height : 10px;">
													<td colspan="4" style="text-align: center;">
														관리중인 커뮤니티가 존재하지 않습니다.
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								
								<!-- 커뮤니티 생성 버튼 -->
								<input type="button" id="createCommu" class="btn btn-success" value="커뮤니티 생성" style="display:inline; float: right;">
								
								
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
    
</body>    
    
    
    
    
    
    