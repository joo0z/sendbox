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
			document.location = "/commu/commuBoard?commuSeq="+commuSeq;
		});
		
		
		$("#addBoard").on("click", function(){

			var boardKindTitle = $("#addboardName").val()
			if(boardKindTitle == "" || boardKindTitle == " "){
				alert("게시판의 이름을 작성해주세요.")
			}else{
				$("#addForm").submit();
			}
		});
		
		$("#createCommu").on("click", function(){
			
			var commuIcon = $("#file").val();
			var commuNm = $("#commuNm").val();
			
			if(commuIcon == '' || commuNm == ''){
				alert("커뮤니티 아이콘 또는 이름을 작성해주세요.")
			}else{
				$("#createCommuForm").submit();
			}
		});
		
	});
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px;"></i>&nbsp&nbsp 커뮤니티 생성</h2>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</h6>
                        </div>
                        <div class="card-body">
                        
                        
                            <div class="table-responsive" style="overflow: hidden;">
                            
                            	<form id="createCommuForm" action="/commu/createCommu" method="post" enctype="multipart/form-data">
	                                <table class="table table-bordered" width="100%" cellspacing="0">
										<tr>
											<td>* 커뮤니티 아이콘</td>
											<td><input type="file" id="file" name="file" /></td>
										</tr>
										<tr>
											<td>* 커뮤니티 이름</td>
											<td><input type="text" id="commuNm" name="commuNm" /></td>
										</tr>
										
									</table>
									
									<!-- 커뮤니티 생성 버튼 -->
									<input type="button" id="createCommu" class="btn btn-success" value="생성" style="display:inline; float: right;">
                            	</form>
								
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
    
    
    
    
    
    