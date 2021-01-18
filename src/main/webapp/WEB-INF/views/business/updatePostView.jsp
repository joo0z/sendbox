<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>업무보고서 수정</title>


    <!-- Custom styles for this page -->
    <link href="/admin2form/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
<!--     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
    
	<script>
    $(document).ready(function() {
    	fileSlotCnt = "${busiPostVo.busiFileList.size()+1}";	//초기 슬롯 수
    	maxFileSlot = 5;										//최대 슬롯 수
    	delList = "";											//지워지는 파일의 시퀀스 값
   		idx = 0;
        $('#summernote').summernote();
       /*  
        $('#sender').on('click', function(){
        	$('form').submit();
        });
        
       $('#canceler').on('click', function(){
    	   document.location = "/selectPost";
       }); */
       
       $('#btnPlus').on('click', function(){
    	   if(maxFileSlot <= fileSlotCnt){
    		   alert("파일은 총 "+maxFileSlot+"개 까지만 첨부가능합니다.");
    	   }
    	   else{
    		   idx++;
			   fileSlotCnt++;
	    	   console.log("click!!");
	    	   console.log(fileSlotCnt);
	    	   var html = 
	    		   '<table class="fileTable newFileTable">'
							+'<tr>'
								+'<td class="newFileTd" width="50%"><input type="file" name="realfilename['+idx+']"></td>'
								+'<td class="newFileTd minusbuttonTd">'
									+'<button type="button" class="btn btn-primary btnMinus" style="margin-left: 5px; outline: 0; border: 0;">'
										+'<i class="fas fa-fw fa-minus" style="color: white; font-size:10px;"></i>'
									+'</button>'
								+'</td>'
							+'</tr>'
						+'</table>';
	    	   $(this).parents('div.col-sm-10').append(html);    		   
    	   }
    	   
       })
       
       $('div.col-sm-10').on('click', 'button.btn.btn-primary.btnMinus', function(){
    	   if(fileSlotCnt > 1){
    		   fileSlotCnt--;
    		   idx--;
    	   }
    	   
    	   if($(this).parents('table').attr('class') == 'fileTable' ){
    		   var fileSeq = $(this).parents('tr').data('fileseq');
    		   delList += fileSeq + " ";
    		   $('input[name="delListString"]').val(delList);
    	   }
    	   $(this).parents('table.fileTable').remove();
       })
       
       
      
      //summernote modal title 과 close 버튼 위치 변경 
       title = $('h4.modal-title');
   		for(var i = 0; i< title.length; i++){
   			$(title[i]).insertBefore($(title[i]).prev());
   		}
       /* for(var i = 0; i < $('h4.modal-title').length; i++){
    	   var html = $('h4.modal-title')[i];
    	   console.log("summernote modal title : "+ html);
    	   $('div.modal-header')[i].prepend(html);
       }  */
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
	    border-bottom: 3px solid #858796;
	    border-collapse: collapse;
	    margin-bottom : 5px;
	  	}
	  th, td {
	     border-bottom: 1px solid #858796;
	  }
	  
	   td.fileTd, .newFileTd{
	  	border : none;
	  } 
	   table.fileTable, .newFileTable{
	  	border : none;
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
                    <h2 class="h3 mb-2 text-gray-800" style="display: inline;"><i class="fas fa-fw fa-users-cog" style="margin-left: 10px; "></i>&nbsp;&nbsp;게시글 수정</h2>
                    <hr>
                    <br>
                    <!-- summernote -->
					<form:form id="busiPostForm" commandName="busiPostVo" method="post" enctype="multipart/form-data">
						<form:hidden id="pageIndex" path="pageIndex"/>
                    	<form:hidden path="recordCountPerPage"/>
	                    <form:hidden path="searchCondition"/>
	                    <form:hidden path="searchKeyword"/>
	                    <form:hidden id="postSeq" path="postSeq"/>
	                                              게시글아이디: ${busiPostVo.postSeq }
	                    <input type="hidden" id="parentpostId" name="parentpostId" value="${busiPostVo.parentpostId }">
	                    <!-- <form:hidden id="parentpostId" path="parentpostId"/> -->
	                    <form:hidden id="boardId" path="boardId"/>
	                    <input type="hidden" name="uploadtoken" value="updatePost"> 
						<input type="hidden" name="delListString" value="">
						<%-- <input type="hidden" name="postSeq" value="${busiPostMap.busiPost.postSeq }"> --%>
	                    <table  width="100%" cellspacing="0">
	                    	<tr>
	                    		<td class="front">제목</td>
	                    		<!-- <td><span autofocus maxlength="30" minlength="1" style="margin-left: 10px; width: 90%;"><b>테스트글입니다.</b></span></td> -->
		                    	<td>
		                    		<%-- <input type="text" id="tit" name="title" value="${busiPostMap.busiPost.title}" maxlength="100" minlength="1" style="border : none; background: none; margin-left: 10px; width: 90%;"> --%>
		                    		<form:input id="tit" path="title" maxlength="100" minlength="1" cssStyle="border : none; background: none; margin-left: 10px; width: 90%;"/>
		                    	</td>
	                    	</tr>
							<tr>
								<td class="front"><i class="fas fa-fw fa-paperclip" style="margin-left: 10px;"></i>첨부파일</td>
								<td>
									<div class="col-sm-10">
										<c:forEach items="${busiPostVo.busiFileList }" var="busiFile" varStatus="status">
											<table class="fileTable">
												<tr data-fileseq="${busiFile.attachfileSeq }">
													<td class="fileTd"><a href="/postFileDownload?attachfileSeq=${busiFile.attachfileSeq }"> • ${busiFile.realfilename }</a></td>
													<td class="fileTd" width="50%">
														<button type="button"  class="btn btn-primary btnMinus" style="margin-left: 5px; outline: 0; border: 0;">
															<i class="fas fa-fw fa-minus" style="color: white; font-size:10px;"></i>
														</button>
													</td>
												</tr>
											</table>								
										</c:forEach>
										<c:if test="${busiPostVo.busiFileList.size() < 5 }">
										추가파일
											<table class="fileTable newFileTable">
												<tr>
													<td class="newFileTd"><input type="file" name="realfilename[0]"></td>
													<td class="newFileTd" width="50%">
														<button type="button" id="btnPlus" class="btn btn-primary" style="margin-left: 5px; outline: 0; border: 0;">
															<i class="fas fa-fw fa-plus" style="color: white; font-size:10px;"></i>
														</button>
													</td>
												</tr>
											</table>
										</c:if>
									</div>
								</td>
							</tr>
							<tr >
								<td colspan="2">
								 	<%-- <textarea id="summernote" name="content">${busiPostMap.busiPost.content }</textarea> --%>
								 	<form:textarea id="summernote" path="content"></form:textarea>
								</td>
							</tr>
						</table>
						 	<br>
						 	<button type="button" onclick="javascript:updatePost()" id="sender" class="btn btn-outline-secondary" style="display:inline; float: right;">수정</button>
						 	<button type="button" onclick="javascript:postViewPage()" id="canceler" class="btn btn-outline-secondary" style="display:inline; margin-right : 10px; float: right;">취소</button>
						 	<button type="button" onclick="javascript:postListPage()" class="btn btn-outline-secondary" style="display:inline;margin-right : 10px; float: left;">목록으로</button>
					</form:form>
					<script>
					
						function updatePost(){
							var form = document.getElementById('busiPostForm');
							form.action = "/updatePost";
							form.submit();
						}
						
						function postViewPage(){
							var form = document.getElementById('busiPostForm');
							form.action = "/selectPost";
							form.submit();
						}
						
						function postListPage(){
							var form = document.getElementById('busiPostForm');
							form.action = "/selectPostList";
							form.submit();
						}
					</script>
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

</html>