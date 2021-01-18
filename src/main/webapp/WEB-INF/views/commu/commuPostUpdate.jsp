<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시글 작성</title>


    <!-- Custom styles for this template -->
<!--     <link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet"> -->

    <!-- Custom styles for this page -->
    <link href="/admin2form/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap core JavaScript-->
<!--     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
    
<script>
    $(document).ready(function() {
    	
		var fileCount = 1;
    	var fileCumulativeNumber = 5;
    	
    	var dbFileLen = parseInt('${commuBoardFileList.size()}');
    	
        $('#summernote').summernote();
        
        
        
        // 파일선택 - 추가
        $("#fileAddTD").on("click", ".fileAddBtn", function(){
        	
        	if(fileCount + dbFileLen < fileCumulativeNumber){
	        	var tag = '<div class="col-sm-10 fileDiv" style="margin-bottom : 5px;">';
	        	tag += '<input type="file" name="file">';
	        	tag += ' <input class="btn btn-primary fileAddBtn" type="button" value="+" style="outline: 0; border: 0; color: white; font-size:15px;">';
	        	tag += ' <input class="btn btn-primary fileSubBtn" type="button" value="-" style="width : 32px; outline: 0; border: 0; color: white; font-size:15px; background: red;">';
	        	tag += '</div>';
	        	$("#fileAddTD").append(tag);
	        	fileCount++;
        	}else{
        		alert("파일등록은 5개까지입니다.")
        	}
        });
        
     	// 파일선택 - 삭제
        $("#fileAddTD").on("click", ".fileSubBtn", function(){
        	$(this).parents(".fileDiv").remove();
        });
        
        
     	
     	// my db file list
        $("#DBfileDivParent").on("click", ".DBfileSubBtn", function(){
        	
        	var fileId = $(this).parents(".DBfileDivChild").data("fileid");
        	var tag = '<input type="hidden" id="'+fileId+'" name="delFile" value="'+fileId+'" />';
        	
        	$("#deleteDBFileDiv").append(tag);
        	
        	$(this).parents(".DBfileDivChild").remove();
        });
        
     	// 뒤로 가기
        $("#backBtn").on("click", function(){
        	document.location = "/commu/commuBoardList?commuSeq=${commuBoard.commuSeq}";
        });
        
        
     	
     	$("#updateBtn").on("click", function(){
     		$("#postUpdateForm").submit();
     	});
     	
     	
    });
</script>
<style>
	
	.note-editable{
		height: 350px;
	}
	.vl {
	  float : left;
	  text-align: center;
	}
	#d1{
	  border-left: 2px solid gray;
	}
	
	.front{
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
	}
		
	table {
    width: 100%;
    border-top: 3px solid #858796;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #858796;
    padding: 10px;
  }
  .in {
   background: rgba(0, 0, 0, 0.2);
  }
		
		
</style>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid"  style="max-width: 90%;">
                    <!-- Page Heading -->
                    <h2 class="h3 mb-2 text-gray-800" style="display: inline;"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px; "></i>&nbsp&nbsp 게시글 수정</h2>
                    <span style="margin-left: 10px; font-size: 0.9em;">*해당 커뮤니티의 게시글을 작성합니다.</span>
                    <hr>
                    <br>
                    
                    
                    
                    <!-- summernote -->
					<form action="/commu/updatePost" method="post" id="postUpdateForm" enctype="multipart/form-data">
						
	                    <table  width="100%" cellspacing="0">
	                    	<tr>
	                    		<td class="front">제목</td>
	                    		<td><input type="text" id="tit" name="boardTitle" autofocus maxlength="30" minlength="1" style="margin-left: 10px; width: 90%;" value="${commuBoard.boardTitle }"></td>
	                    	</tr>
							<tr>
								<td class="front"><i class="fas fa-fw fa-paperclip" style="margin-left: 10px;"></i>첨부파일</td>
								<td id="fileAddTD">
								
									<!-- db에서 파일 가져오기 -->
									<div id="DBfileDivParent" class="col-sm-10 DBfileAddedDiv" style="margin-bottom : 5px;">
										<c:if test="${commuBoardFileList.size() > 0}">
											<c:forEach var="i" begin="0" end="${commuBoardFileList.size()-1}" step="1">
												<div class="DBfileDivChild" data-fileid="${commuBoardFileList.get(i).attachfileSeq }">
													<span>${commuBoardFileList.get(i).realfilename }</span>
													&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input class="btn btn-primary DBfileSubBtn" type="button" value="-" 
													style="width : 32px; outline: 0; border: 0; color: white; font-size:15px; background: red;">
												</div>
											</c:forEach>
										</c:if>
									</div>
									
									<!-- 파일 추가하기 -->
									<div class="col-sm-10 fileDiv" style="margin-bottom : 5px;">
										<input type="file" name="file">
										<input class="btn btn-primary fileAddBtn" type="button" value="+" 
											style="outline: 0; border: 0; color: white; font-size:15px;">
									</div>
								</td>
							</tr>
							<tr >
								<td colspan="2">
								 	<textarea id="summernote" name="boardCont">${commuBoard.boardCont }</textarea>
								</td>
							</tr>
						</table>
					 	<br>
					 	<input type="hidden" name="boardSeq" value="${commuBoard.boardSeq }" />
					 	<input type="button" id="updateBtn" class="btn btn-outline-success" value="등록" style="display:inline; float: right;">
					 	<input id="backBtn" type="button" class="btn btn-outline-primary" value="목록" style="display:inline;margin-right : 10px; float: left;">
					 	
					 	
					 	<div id="deleteDBFileDiv"></div>
					 	
					 	
					</form>
					
					
					
					
				<!-- End summernote -->
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

    
</body>
