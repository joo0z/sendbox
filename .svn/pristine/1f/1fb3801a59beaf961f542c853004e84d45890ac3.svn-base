<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시글 작성</title>



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
    	
        $('#summernote').summernote();
        
        
        $("#fileAddTD").on("click", ".fileAddBtn", function(){
        	
        	if(fileCount < fileCumulativeNumber){
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
        
        
        $("#fileAddTD").on("click", ".fileSubBtn", function(){
        	fileCount--;
        	$(this).parents(".fileDiv").remove();
        });
        
        
        $("#postInsertBtn").on("click", function(){
        	if ($("#tit").val() == "" ) {
        		alert("제목을 입력해주세요.");
        	} else {
	        	$("#postInsertForm").submit();
        	}
        });
        
        $("#backBtn").on("click", function(){
        	document.location = "/freeBoard/freeBoardList";
        });
        
        $('#resetter').on('click', function(){
     	   $('#summernote').summernote('reset');
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
  	#postInsertBtn {
    color: #fff;
    background-color: #1cc88a;
    border-color: #1cc88a;
    }
    
	#resetter {
    color: #fff;
    background-color: #f6c23e;
    border-color: #f6c23e;
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
                    <h2 class="h3 mb-2 text-gray-800" style="display: inline;"><i class="fas fa-fw fa-pen-alt" style="margin-left: 10px; "></i>&nbsp게시글 작성</h2>
                    <span style="margin-left: 10px; font-size: 0.9em;">*자유게시판 입니다.</span>
                    <hr>
                    <br>
                    <!-- summernote -->
					<form id="postInsertForm" action="/freeBoard/insertPost" method="post" enctype="multipart/form-data">
                    <table  width="100%" cellspacing="0">
                    	<tr>
                    		<td class="front" >제목</td>
                    		<td><input type="text" id="tit" name="title" autofocus maxlength="30" minlength="1" style="margin-left: 10px; width: 90%;"></td>
                    	</tr>
						<tr>
							<td class="front"><i class="fas fa-fw fa-paperclip" style="margin-left: 10px;"></i>첨부파일</td>
							<td id="fileAddTD">
								<div class="col-sm-10 fileDiv" style="margin-bottom : 5px;">
									<input type="file" name="file">
									<input class="btn btn-primary fileAddBtn" type="button" value="+" 
										style="outline: 0; border: 0; color: white; font-size:15px;">
<!-- 									<input class="btn btn-primary fileSubBtn" type="button" value="-"  -->
<!-- 										style="width : 32px; outline: 0; border: 0; color: white; font-size:15px; background: red;"> -->
								</div>
							</td>
						</tr>
						<tr >
							<td colspan="2">
							 	<textarea id="summernote" name="cont"></textarea>
							</td>
						</tr>
					</table>
					
					
					 	<br>
					 	<input type="button" id="postInsertBtn" class="btn btn-outline-secondary"
					 	value="등록" style="display:inline; float: right;">
					 	
					 	<input type="reset" id="resetter" class="btn btn-outline-secondary"
					 	value="초기화" style="display:inline; margin-right : 10px; float: right;">
					 	
					 	<input id="backBtn" type="button" class="btn btn-outline-secondary"
					 	value="목록" style="display:inline;margin-right : 10px; float: left; background: #3C5087; color: white;">
					 	
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
