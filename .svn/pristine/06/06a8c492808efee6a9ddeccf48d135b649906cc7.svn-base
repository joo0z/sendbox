<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<c:set var="registerFlag" value="${noticeVO.noticeSeq eq 0 ? '작성' : '수정'}"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지글 ${registerFlag}</title>

    <!-- Custom fonts for this template -->
<!--     <link href="/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->

    <!-- Custom styles for this template -->
<!--     <link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet"> -->

    <!-- Custom styles for this page -->
    <link href="/admin2form/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
<!--     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
    
	<script>
    $(document).ready(function() {
    	
        $('#cont').summernote();
        
        // 초기화 버튼
        $('#resetter').on('click', function(){
     	   $('#cont').summernote('reset');
        });

        
        fileSlotCnt = parseInt("${noticeFileList.size()+1}");
        console.log("파일슬롯 : "+fileSlotCnt);
        // 최대 첨부파일 수
    	maxFileSlot = 5;
        $('#fileDiv').on('click', '#btnMinus', function(){
     	   if(fileSlotCnt >= 1){
     		   fileSlotCnt-=1;
     		   console.log(fileSlotCnt);
     		   $(this).prev().prev().attr('name', 'deleteFile')
				
     	   } 
     	   console.log("minus clicked!!");
     	   $(this).prev().remove();
     	   $(this).remove();
        })
        
         $('#btnPlus').on('click', function(){
    	   if(maxFileSlot <= fileSlotCnt){
    		   alert("파일은 총 "+maxFileSlot+"개 까지만 첨부가능합니다.");
    	   }
    	   else{
			   fileSlotCnt++;
	    	   console.log("click!!");
	    	   console.log(fileSlotCnt);
	    	   var html = '<br><input type="file" name="realfilename">'
	    	   				+'<button type="button" id="btnMinus" class="btn btn-primary" style="margin-left: 5px; outline: 0; border: 0;">'
								+'<i class="fas fa-fw fa-minus" style="color: white; font-size:10px;"></i>'
							+'</button>';
	    	   $(this).parent().append(html);    		   
    	   }
    	   
       });
        
       $('#sub').on('click', function(){
    	   
    	   if($("#sub").val() == '작성'){
    		  $("#form").attr("action", "/noticeInsert");
    	   }
    	   if($("#sub").val() == '수정'){
    		  $("#form").attr("action", "/noticeUpdate");
    	   }
       });  
        
    });
  	</script>
<style>
	
	#cont{
		height: 350px;
		width: 100%;
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
	.note-editable{
	height: 350px;
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
                    <h2 class="h3 mb-2 text-gray-800" style="display: inline;"><i class="fas fa-fw fa-bullhorn" style="margin-left: 10px; "></i>&nbsp&nbsp공지 ${registerFlag } </h2>
                    <span style="margin-left: 10px; font-size: 0.9em;">*공지를  ${registerFlag }합니다.</span>
                    <hr>
                    <br>
                    <!-- summernote -->
					<form:form commandName="noticeVO" method="post" action="" enctype="multipart/form-data" id="form">
                    <table  width="100%" cellspacing="0">
                    	<tr>
                    		<td class="front">제목</td>
                    		<td><form:input path="title" maxlength="30" cssStyle="margin-left: 10px; width: 90%;"/></td>
                    	</tr>
						<tr>
							<td class="front"><i class="fas fa-fw fa-paperclip" style="margin-left: 10px;"></i>첨부파일</td>
							
							<c:if test="${registerFlag =='작성' }">
							<td>
								<input type="file" name="realfilename">
												<button type="button" id="btnPlus" class="btn btn-primary" style="outline: 0; border: 0;">
													<i class="fas fa-fw fa-plus" style="color: white; font-size:10px;"></i>
												</button>
												</td>
							</c:if>
							<c:if test="${registerFlag =='수정' }">
								<td>
									<div id="fileDiv" class="col-sm-10 fileDiv">
										<input type="hidden" value="${noticeVO.noticeSeq }" name="noticeSeq">
											<c:if test="${noticeFileList.size() > 0}">
												<c:forEach var="files" items="${noticeFileList}" varStatus="status">
														<input type="hidden" value="${files.attachfileSeq }" id="deleteFile" name="realfilename"> 
														<label>${files.realfilename }</label>
														<button type="button" id="btnMinus" class="btn btn-primary" style="outline: 0; border: 0;">
															<i class="fas fa-fw fa-minus" style="color: white; font-size:10px;"></i>
														</button>
														<br>
												</c:forEach>
											</c:if>
											<div id="plus"></div>
											<c:if test="${noticeFileList.size() == 5}">
												<button type="button" id="btnPlus" class="btn btn-primary" style="outline: 0; border: 0;">
													<i class="fas fa-fw fa-plus" style="color: white; font-size:10px;"></i>
												</button>
											</c:if>
											<c:if test="${noticeFileList.size() < 5}">
												<input type="file" name="realfilename">
												<button type="button" id="btnPlus" class="btn btn-primary" style="outline: 0; border: 0;">
													<i class="fas fa-fw fa-plus" style="color: white; font-size:10px;"></i>
												</button>
											</c:if>
									</div>
								</td>
							</c:if>
						</tr>
						<tr >
							<td colspan="2">
<%-- 							 <textarea id="summernote" name="cont">${noticeVO.cont }</textarea> --%>
							 	<form:textarea path="cont" id="cont"/>
							</td>
						</tr>
					</table>
					 	<br>
					 	<input type="submit" id="sub" class="btn btn-outline-secondary" value="${registerFlag}" style="display:inline; float: right;">
					 	<input type="reset" id="resetter" class="btn btn-outline-secondary" value="초기화" style="display:inline; margin-right : 10px; float: right;">
					 	<input onclick="history.back()" type="button" class="btn btn-outline-secondary" value="뒤로" style="display:inline;margin-right : 10px; float: right;">
					</form:form>
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