<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>업무게시판</title>

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
   
   .table-responsive{
      height : auto;
   }
   
   #historytable tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  #historytable tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
  
  #reMail{
     background-color : #132679e0;
     color : white;
     border: none;
  }
  
  #delete{
   margin-left : 10px;
     background-color : #132679e0;
     color : white;
     border: none;
  }
  
  #delete:hover {
   background-color: white;
   color : #132679e0;
   border: 1px solid;
   border-color : #132679e0;
}
  #reMail:hover {
   background-color: white;
   color : #132679e0;
   border: 1px solid;
   border-color : #132679e0;
}

  #mailListBtn{
     background-color : #132679e0;
     color : white;
     border: none;
  }
  
  #mailListBtn:hover {
   background-color: white;
   color : #132679e0;
   border: 1px solid;
   border-color : #132679e0;
}


</style>

<script>

   $(function(){
      
      $('#delete').on('click',function(){
         var mailSeq = ${param.mailSeq }
         var result = confirm("메일을 삭제하시겠습니까 ?");
         if(result){
            $.ajax({
               url : "/mail/delete",
               method : "post",
               data : {
                  mailSeq : mailSeq
               },
               success : function(data) {
                  window.location.href = "/mail/list";
               }
            })
         }
      })
      
      $('#mailListBtn').on('click',function(){
         var mailSeq = ${param.mailSeq }
         $.ajax({
            url : "/mail/back",
            method : "post",
            data : {
               mailSeq : mailSeq
            },
            success : function(res){
               window.location.href = res.url;
            }
         })
      })
      
      var mailSeq = $('#mailSeq').val()
      var sender = $('#sender').val()
      var receiver = $('#receiver').val()
      var parentmailId = $('#parentmailId').val()
      
      
      $("#reMail").on('click',function(){
         window.location.href = "/mail/write?mailSeq=${mailVO.parentmailId}&sender=${mailVO.sender}";
      })
      
      $.ajax({
         
         
         url : "/mail/history",
         method : "post",
         data : {
            parentmailId : parentmailId
         },
         success : function(res){
        	 
            var html = "";
            
            if(res.MailList.length > 1){
               
               html += "<h5 style='color : black;'><strong>주고받은 메일</strong></h5>";
               html += "<table id='historytable' style='color : black;'>";
               
            for(var i=0;i<res.MailList.length;i++){
               
               var mail = res.MailList[i]

                   if(("${EMP.empId}" == mail.sender && mail.mailSt.indexOf("SY") != -1) ||
                		   ("${EMP.empId}" == mail.receiver && mail.mailSt.indexOf("RY") != -1)){
                	   
				   html += "<tr><td style='width : 70px;'>";

                   if(mail.mailCnt == "Y"){
                      html += "<i class='fas fa-envelope-open' style='color: black;'></i>";
                   } else {
                      html += "<i class='far fa-envelope' style='color: black;'></i>";
                   }
                   
                   html += "</td><td style='width : 200px;'>";
                   html += mail.sender + "@sendbox.com　　|";
                   html += "</td><td style='width : 500px;'>";
                   
               if("${param.mailSeq}"== (mail.mailSeq)){
                      if("${EMP.empId}" == mail.sender){
                         html += "　　<a href='/mail/detail?mailSeq="
                         html += mail.mailSeq
                         html += "' style='color : black;'>✔[보낸메일함]";
                      } else {
                         html += "　　<a href='/mail/detail?mailSeq="
                            html += mail.mailSeq
                            html += "' style='color : black;'>✔[받은메일함]";
                      }
               } else {
                      if("${EMP.empId}" == mail.sender){
                         html += "　　<a href='/mail/detail?mailSeq="
                         html += mail.mailSeq
                         html += "'>[보낸메일함]";
                      } else {
                         html += "　　<a href='/mail/detail?mailSeq="
                            html += mail.mailSeq
                            html += "'>[받은메일함]";
                      }
               }
               
                   html += mail.title;
                   html += "</a></td><td style='width : 200px;'>" ;
                   html += mail.mailSendTime;
                   html += "</td></tr>";
            } 
                   }
            
            html+="</table>";
            
            $('#mailHistory').html(html)
               
            }
            
            
         }
      })
   })

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
                <div class="container-fluid" style="width : 80%;">
                    <!-- Page Heading -->
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text" style="padding-left: 20px;">${mailVO.title }</h6>
                        </div>
                        <input type="hidden" value="${mailVO.mailSeq }" id="mailSeq">
                        <input type="hidden" id="receiver" value="${mailVO.receiver }">
                        <input type="hidden" id="sender" value="${mailVO.sender }">
                        <input type="hidden" id="parentmailId" value="${mailVO.parentmailId }">
                        <div class="card-header py-3">
                                  <h6 class="m-0 font-weight-bold text-dark" style="padding-left: 20px;">
                                        보낸사람 : ${mailVO.sender }@naver.com<br>
                                  </h6>
                        </div>
                        
                          <div class="card-header py-3">
                                  <h6 class="m-0 font-weight-bold text-dark" style="padding-left: 20px;">
                                  첨부파일 : 
                                        <c:forEach items="${mailFileList }" var="files">
                                           <a href="/mail/fileDown?attachfileSeq=${files.attachfileSeq }" id="profileDownBtn">${files.realfilename }<br></a>
                                        </c:forEach>
                                  </h6>
                          </div>
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                                     ${mailVO.content }
                            
                   <div id="mailHistory" style="margin-top : 100px;">
<!--                      대화내용 들어올곳                    -->
                   </div>         
                            </div>
                  </div>
                    </div>
               <button type="button" class="btn btn-outline-primary" style="margin-bottom : 20px; float : left;" id="mailListBtn">목록</button>
<button type="button" class="btn btn-outline-primary" style="margin-bottom : 20px; float: right;" id="delete">삭제</button>
<button type="button" class="btn btn-outline-primary" style="margin-bottom : 20px; float: right;" id="reMail">답장</button>
                    
<!--                </form> -->
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

</html>