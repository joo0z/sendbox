<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
   
   <script>

$(function() {
    
   
    var lindwidth = 2;
   
   
     window.requestAnimFrame = (function(callback) {
       return window.requestAnimationFrame ||
         window.webkitRequestAnimationFrame ||
         window.mozRequestAnimationFrame ||
         window.oRequestAnimationFrame ||
         window.msRequestAnimaitonFrame ||
         function(callback) {
           window.setTimeout(callback, 1000 / 60);
         };
     })()
     
     
     
     
     var canvas = document.getElementById("sig-canvas");
     var ctx = canvas.getContext("2d");
     ctx.strokeStyle = "#222222";
     ctx.lineWidth = lindwidth;

     var drawing = false;
     var mousePos = {
       x: 0,
       y: 0
     };
     var lastPos = mousePos;
     
     
     
     

     canvas.addEventListener("mousedown", function(e) {
       drawing = true;
       lastPos = getMousePos(canvas, e);
     }, false);

     canvas.addEventListener("mouseup", function(e) {
       drawing = false;
     }, false);

     canvas.addEventListener("mousemove", function(e) {
       mousePos = getMousePos(canvas, e);
     }, false);

     // Add touch event support for mobile
     canvas.addEventListener("touchstart", function(e) {

     }, false);

     canvas.addEventListener("touchmove", function(e) {
       var touch = e.touches[0];
       var me = new MouseEvent("mousemove", {
         clientX: touch.clientX,
         clientY: touch.clientY
       });
       canvas.dispatchEvent(me);
     }, false);

     canvas.addEventListener("touchstart", function(e) {
       mousePos = getTouchPos(canvas, e);
       var touch = e.touches[0];
       var me = new MouseEvent("mousedown", {
         clientX: touch.clientX,
         clientY: touch.clientY
       });
       canvas.dispatchEvent(me);
     }, false);

     canvas.addEventListener("touchend", function(e) {
       var me = new MouseEvent("mouseup", {});
       canvas.dispatchEvent(me);
     }, false);

     function getMousePos(canvasDom, mouseEvent) {
       var rect = canvasDom.getBoundingClientRect();
       return {
         x: mouseEvent.clientX - rect.left,
         y: mouseEvent.clientY - rect.top
       }
     }

     function getTouchPos(canvasDom, touchEvent) {
       var rect = canvasDom.getBoundingClientRect();
       return {
         x: touchEvent.touches[0].clientX - rect.left,
         y: touchEvent.touches[0].clientY - rect.top
       }
     }

     function renderCanvas() {
       if (drawing) {
         ctx.moveTo(lastPos.x, lastPos.y);
         ctx.lineTo(mousePos.x, mousePos.y);
         ctx.stroke();
         lastPos = mousePos;
       }
     }

     // Prevent scrolling when touching the canvas
     document.body.addEventListener("touchstart", function(e) {
       if (e.target == canvas) {
         e.preventDefault();
       }
     }, false);
     document.body.addEventListener("touchend", function(e) {
       if (e.target == canvas) {
         e.preventDefault();
       }
     }, false);
     document.body.addEventListener("touchmove", function(e) {
       if (e.target == canvas) {
         e.preventDefault();
       }
     }, false);

     (function drawLoop() {
       requestAnimFrame(drawLoop);
       renderCanvas();
     })();

     function clearCanvas() {
      // 픽셀 정리
       ctx.clearRect(0, 0, canvas.width, canvas.height);
       // 컨텍스트 리셋
       ctx.beginPath();
     }
     
     
     
     
     // Set up the UI
     var sigImage = document.getElementById("sig-image");
     var clearBtn = document.getElementById("sig-clearBtn");
     var submitBtn = document.getElementById("sig-submitBtn");
     
     
     clearBtn.addEventListener("click", function(e) {
       clearCanvas();
       $('#signImg').remove();
     }, false);
     
     
     submitBtn.addEventListener("click", function(e) {
       var dataUrl = canvas.toDataURL();
       // 간략 url
       var html = '결과 : <img id="signImg" src='+dataUrl+' alt="사원서명">';
       $('#signDiv').empty();
       $('#signDiv').append(html);
       $('.signResult').attr('src', dataUrl);
       $("#signInfo").val(dataUrl);
       $('#reportContent').val(editor.getData());

     }, false);

   });
   
   $('#btnLoadSign').on('click', function(){
         var signInfo = "${reportVo.signInfo}";
         var html = '결과 : <img id="signImg" src='+signInfo+' alt="사원서명">';
         $('#signDiv').empty();
         $('#signDiv').append(html);
         $('.signResult').attr('src', signInfo);
         $("#signInfo").val(signInfo);
      })

</script>
</head>
<body>

<div style="float : right;">
         <button type="button" id="insertReport" class="btn btn-primary" data-toggle="modal" data-target="#insertReportModal">
               작성완료
         </button>
         <button type="button" class="btn btn-secondary" id="btnCancel">작성취소</button>
      </div>





<!-- 결재라인 저장 Modal -->
         <div class="modal fade" id="insertReportModal" tabindex="-1" role="dialog" aria-labelledby="insertReportTitle" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="insertReportTitle">서명</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body" style="vertical-align: middle;">
                    <table>
                       <tr><td>
                          <!-- Content -->
                        <div class="container">
                           <div class="row">
                              <div class="col-md-12">
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                  <canvas id="sig-canvas" width="300" height="160" style="border: 1px solid black;">
                                     Get a better browser, bro.
                                  </canvas>
                               </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                   <button type="button" id="btnLoadSign" class="btn btn-primary" style="float : left;">불러오기</button>
                                 <button class="btn btn-primary" id="sig-submitBtn" style="float: right;">적용</button>
                                 <button class="btn btn-default" id="sig-clearBtn" style="float : right;">지우기</button>
                              </div>
                           </div>
                        </div>
   
                        <div id="signDiv">
                           결과 :
                        </div>
                       </td></tr>
                    
                    </table>
                    
               </div>
               <div class="modal-footer">
                 <button type="button" id="btnSave" class="btn btn-primary">등록</button>
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
               </div>
             </div>
           </div>
         </div>

</body>
</html>