 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">


	$(function(){
		
		
		
		$('#updatebtn').on('click',function(){
			window.location.href="/updatemypage?empId=${EMP.empId}";
		})	
		
		
		
		$('#insertSign').on('click',function(){
			
			$.ajax({
				url : "/sign/insert",
				method : "post",
				success : function(data) {
					if(data.SignVO.signInfo == null){
						var html = '현재 등록된 서명<br><img id="signImg" src="/images/nosign.png" alt="사원서명" style="width : 300px; height : 160px;">';
						$('#signDiv').empty();
						$('#signDiv').append(html);
// 						$('.signResult').attr('src', dataUrl);
// 						$("#signInfo").val(dataUrl);
// 						$('#reportContent').val(editor.getData());
					} else {
						var sign = data.SignVO.signInfo
						var html = '현재 등록된 서명<br><img id="signImg" src="'+sign +'" alt="사원서명" style="width : 300px; height : 160px;">';
						$('#signDiv').empty();
						$('#signDiv').append(html);
					}
				}
			});
		})
	})
	
	$(function() {
		$('#btnSave').on('click',function(){
			var src = $('#signImg').attr("src")
			$('#signInfo').val(src)
			$('#updateSignForm').submit();
		})
   
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
       
     }, false);
     
     
     
     submitBtn.addEventListener("click", function(e) {
    	 
		var dataUrl = canvas.toDataURL();
		var html = '변경할 서명<br><img id="signImg" src='+dataUrl+' alt="사원서명" style="width : 300px; height : 160px;">';
		$('#signDiv').empty();
		$('#signDiv').append(html);
		clearCanvas();
//        $('.signResult').attr('src', dataUrl);
//        $("#signInfo").val(dataUrl);
//        $('#reportContent').val(editor.getData());
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


	<div class="card shadow mb-3" style="width: 70%; margin-left: 10%; ">
		<div class="card-header py-3">
		<i class="fas fa-fw fa-user-lock" style="font-size: 20px;"></i>
			<h6 style="width: 100px; display: inline;" class="m-0 font-weight-bold text-default" >나의 정보</h6>
		</div>
		
		
		
		<form>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table" id="dataTable" width="100%"
						cellspacing="0">
						<tbody>
							<tr>
								<td rowspan="9"><img id="men" src="${pageContext.request.contextPath}/profileImgView?empId=${EMP.empId}" style="width:150px; height:200px; overflow: hidden; margin: 10%; "></td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${EMP.empNm}</td>
							</tr>
							<tr>
								<td>사원번호</td>
								<td>${EMP.empId}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${emp.empHp}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${emp.addr1}</td>
							</tr>
							<tr>
								<td>상세 주소</td>
								<td>${emp.addr2}</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>${emp.zipcode}</td>
							</tr>
							<tr>
								<td>계좌</td>
								<td>${emp.bankAcctNo}</td>
							</tr>
		
						</tbody>
					</table>
					<input id="updatebtn" type="button" class="btn" value="수정" style="float: right; background-color: #132679e0; color:white;" >
					<button type="button" id="insertSign" class="btn"
					data-toggle="modal" data-target="#insertSignModal" style="float: left; background-color: #132679e0; color:white;">서명 관리</button>

				</div>
			</div>
		</form>
	</div>
	
	
	<div class="modal fade" id="insertSignModal" tabindex="-1" role="dialog" aria-labelledby="insertReportTitle" aria-hidden="true">
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
		                           <div id="signDiv">
		                       	   </div>
                                  <canvas id="sig-canvas" width="300" height="160" style="border: 1px solid black;">
                                     Get a better browser, bro.
                                  </canvas>
                               </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <button class="btn btn-primary" id="sig-submitBtn" style="float: right;">적용</button>
                                 <button class="btn btn-default" id="sig-clearBtn" style="float : right;">지우기</button>
                              </div>
                           </div>
                        </div>
   
                       </td></tr>
                    
                    </table>
                    
               </div>
               <form action="/sign/update" method="post" id="updateSignForm">
               <div class="modal-footer">
               	 <input type="hidden" value="" id="signInfo" name="signInfo">
               	 <input type="hidden" value="${EMP.empId }" name="empId">
                 <button type="button" id="btnSave" class="btn btn-primary">등록</button>
                 <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
               </div>
               </form>
             </div>
           </div>
         </div>




</body>
