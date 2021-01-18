<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>


<!-- 사원의 사인정보, 불러오기용  -->
<c:set var="empSign" value="${reportVo.signInfo}"/>
<fmt:parseDate value="${reportVo.startDt }" pattern="yyyy-MM-dd" var="startDate"/>
<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDt"/>
<fmt:parseDate value="${reportVo.endDt }" pattern="yyyy-MM-dd" var="endDate"/>
<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDt"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.document-editor__toolbar{
	width:95%;
	}
	.editor{
		height : 600px;
	
	}
	
	.writer{
		border : 1px solid gray;
		width : 800px;
		text-align: center;
		margin-left: 20%;
		color: black;
		
	
	}
	
	.signResult{
		width : 150px;
		height : 50px;
	}
	
	td.labeltd{
		width : 200px;
		border-right: 1px solid gray;
		text-align : center;
		background: lightgray;
	}
	td.datatd{
		text-align: left;
		padding-left : 20px;
	}
	
	#approvLineTable{
		width : 100%;
		height : 100px;
		text-align: center;
	}
	
	
	input{
		border : none;
		background : none;
	}
	
	.logoTitle{
		text-align : center;
		font-size : 20px;
		font-weight : bold;
	}
	
	.sign{
		height : 50px;
	}
	#insertReport{
		background-color: #003366;
		color:white;
		margin: 5px;
	
	}
	#btnCancel{
	 	margin: 5px;
	}
	
	.vacatType{
		margin-left: 10px;
	}
	
	.errormsg{
		color : red;
		font-size : 15px;
		float : right;
		vertical-align: text-bottom;
	}
	
	.dt{
		float:none;
	}
	
	.subworker{
		color : blue;
	}
	

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>

<script src="/ckeditor5/build/ckeditor.js"></script>
	<script>
	$(function(){
		
		const typeId = "${reportVo.typeId}";
		
		
		if(typeId == "T4"){
			$('#endDt').prop('readonly', true);
			$('#startDt').on('change', function(){
				const date = $(this).val();
				console.log(date);
				$('#endDt').val(date);
			})		
		}
		
		
		
		$('#endDt').on('change',function(){
			var startDt = $('#startDt').val()
			var endDt = $('#endDt').val()
			console.log(startDt)
			console.log(endDt)
			if(endDt < startDt){
				alert('종료날짜가 시작날짜보다 빠릅니다')
				$('#endDt').val('')
			}
		})
			DecoupledDocumentEditor
			.create( document.querySelector( '.editor' ), {

				toolbar: {
					items: [
						'exportPdf',
						'exportWord',
						'CKFinder',
						'pageBreak',
						'heading',
						'|',
						'fontSize',
						'fontFamily',
						'|',
						'bold',
						'italic',
						'underline',
						'strikethrough',
						'highlight',
						'fontColor',
						'fontBackgroundColor',
						'specialCharacters',
						'|',
						'alignment',
						'|',
						'numberedList',
						'bulletedList',
						'|',
						'indent',
						'outdent',
						'|',
						'horizontalLine',
						'code',
						'codeBlock',
						'htmlEmbed',
						'todoList',
						'link',
						'blockQuote',
						'imageUpload',
						'insertTable',
						'|',
						'undo',
						'redo'
					]
				},
				language: 'ko',
				image: {
					toolbar: [
						'imageTextAlternative',
						'imageStyle:full',
						'imageStyle:side'
					]
				},
				table: {
					contentToolbar: [
						'tableColumn',
						'tableRow',
						'mergeTableCells',
						'tableCellProperties',
						'tableProperties'
					]
				},
				licenseKey: '',
				
				exportPdf : {
					
						stylesheets: [
							'/css/ckeditorinsertpdfstyle.css'
						],
						 fileName: '${reportVo.reportId}.pdf',
					
						dataCallback: ( editor ) => {
							var html = $('#tab').html();
							//pdf 전환 시 툴바 영역 제거 해야함. 
							//html.replace('<div class="document-editor__toolbar"></div>', '');
							console.log(html);
							var content = editor.getData();
							var tail = $('.tail').html();
							return html + tail;
						}
				},
				
			} )
			.then( editor => {
				window.editor = editor;
		
				
				// Set a custom container for the toolbar.
				document.querySelector( '.document-editor__toolbar' ).appendChild( editor.ui.view.toolbar.element );
				document.querySelector( '.ck-toolbar' ).classList.add( 'ck-reset_all' );
				
				
				/* const docFrag = editor.model.change( writer => {
					const p1 = writer.createElement( 'paragraph' );
					const p2 = writer.createElement( 'paragraph' );
					const blockQuote = writer.createElement( 'blockQuote' );
					const docFrag = writer.createDocumentFragment();
	
					writer.append( p1, docFrag );
					writer.append( blockQuote, docFrag );
					writer.append( p2, blockQuote );
					writer.insertText( 'foo', p1 );
					writer.insertText( 'bar', p2 );
	
					return docFrag;
				} );
	 */
				// insertContent() does not have to be used in a change() block. It can, though,
				// so this code could be moved to the callback defined above.
				/* editor.model.insertContent( docFrag ); */
				
				
				const content = '${reportVo.content}';
				const viewFragment = editor.data.processor.toView( content );
				const modelFragment = editor.data.toModel( viewFragment );

				editor.model.insertContent( modelFragment );
	
			} )
			.catch( error => {
				console.error( 'Oops, something went wrong!' );
				console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
				console.warn( 'Build id: ywtaruz06pdl-6v1em39f6r66' );
				console.error( error );
			} );
			
			
		
		fileSlotCnt = 1;
    	maxFileSlot = 5;
    	
    	 $('#btnPlus').on('click', function(){
      	   if(maxFileSlot <= fileSlotCnt){
      		   alert("파일은 총 "+maxFileSlot+"개 까지만 첨부가능합니다.");
      	   }
      	   else{
  			   fileSlotCnt++;
  	    	   console.log("click!!");
  	    	   var html =  "<tr>"
  								+"<td>첨부파일</td>"
			  					+"<td>"
			  						+"<div class='col-sm-10 fileDiv'>"
			  							+"<input type='file' name=fileList["+(fileSlotCnt-1)+"]>"
			  							+"<button type='button' class='btn btn-primary btnMinus' style='outline: 0; border: 0;'>"
			  								+"<i class='fas fa-fw fa-minus' style='color: white; font-size:10px;'></i>"
			  							+"</button>"
			  						+"</div>"
			  					+"</td>"
			  				+"</tr>";
  	    	   $(this).parents('table').append(html);
  	    	   
      	   }
      	   
         });
         
         $('#fileTable').on('click', '.btnMinus', function(){
      	   if(fileSlotCnt > 1){
      		   fileSlotCnt--;
      		   console.log(fileSlotCnt);
      	   }
      	   $(this).parents('tr').remove();
		   
         })
	
		$('#btnLoadSign').on('click', function(){
			$('#signDiv').empty();
			var signInfo = "${empSign}";
			console.log(signInfo);
			var html = '결과 : <img id="signImg" src='+signInfo+' alt="사원서명">';
			//모달창 내 사인 결과 화면
			$('#signDiv').html(html);
		})
		
		$('#btnCancel').on('click', function(){
        	 document.location = "/report/settingView?empId=${EMP.empId}";
         })
		
        // 기안 등록
        $('#btnSave').on('click', function(){
        
	       var isVacateInsert = false;
	       if("${reportVo.typeId}" == "T2"){
	     	  var startDt = $("#startDt").val();
	     	  var endDt = $("#endDt").val();
	     	  
	     	  console.log("시작일 : ", startDt);
	     	  console.log("종료일 : ", endDt);
	     	  
	     	  $.ajax({
					url		: "/vacate/isInsertVacateInfo",
					dataType: "json",
					async	: false,
					data	: { vacateStartDt : startDt,
								vacateEndDt	: endDt},
					method	: "post",
					success	: function(data){
						var empVacateInfo = data.empVacateInfo;
						console.log("empVacateInfo = ", empVacateInfo);
						console.log(empVacateInfo.length);
						
						if(empVacateInfo.length > 0){
							isVacateInsert = true;
						}
					},
					error	: function(xhr){
					}
	     	  });
	       }
	       console.log(isVacateInsert);
	       if(isVacateInsert == true){
	    	   
				alert("이미 이번달에 휴가를 신청하셨습니다.");
				$("#insertReportModal").modal("hide");
				return;
	       }else{
	    	   
	    	   /* ==================================================================================== */
	           // 다음 결재자에게 결재알람 보내기
	           // 해당 기안의 최종승인이 완료시 알림기능
	 	       var empId = "${EMP.empId}";						// 로그인한 사원
	 	       var approverLineTemp = "${apprCurrNextEmpList}";	// 해당 기안의 결재자 리스트 정보
	 	       var reportId = "${reportVo.reportId}";			// 해당 기안의 기안id
	 	       var reportTitle = $("#reportTitle").val();		// 해당 기안의 기안 제목
	 	    	
	 	        console.log("결재자 리스트 정보 : ", approverLineTemp);
	 	        
	 	        // 결재자 정보 받아오기
	 	        var temp1 = approverLineTemp.split("[");
	 	        var temp2 = temp1[1].split("]");
	 	        
	 	        var apprInfoTemp = temp2[0].split(", ");
	 	        var nextApproverTemp = apprInfoTemp[0].split(":~:");
	 	        var nextApprover = nextApproverTemp[0];
	 	        var repNext_AlarmText = "reportTitle="+reportTitle;
	   		    var repNext_AlarmLink = "reportId="+reportId;
	   		    var alarm_cont = "repNext:+:결재할 기안이 있습니다.";
                
	   		    console.log("첫번째 결재자 = ", nextApprover);
	   		    console.log("알람 내용 = ", alarm_cont);
	   		    console.log("알람 링크 = ", repNext_AlarmLink);
	   		    
	   		    // 해당 기안서의 다음 결재자가 휴가를 갔는지 확인
	   		    // 휴가를 갔다면 해당 결재자의 대리결재자 정보를 가져오기
	 	  	    $.ajax({
	 		  	   url		: "/alarm/alarmPostInsert",
	 		  	   data	: { receiverId 		: nextApprover,
	 		  	 			alarmCont 		: alarm_cont,
	 		  	 			alarmLinkCont	: repNext_AlarmLink },
	 		  	   dataType: "json",
	 		  	   method	: "post",
	 		  	   success	: function(data){
	 		  	 	  sendMessage("repNext" + "," + empId + "," + nextApprover + "," + repNext_AlarmText + "," + repNext_AlarmLink);				  
	 		  	   },
	 		  	   error	: function(xhr){ alert("error : " + xhr.status); }
	 		    });	
	           /* ==================================================================================== */
	         	
	         	
	           var dataUrl = $('#signImg').attr('src');
    		   var signResult = '<img class="signResult" src='+dataUrl+' alt="공란">';
    		   $('.sign').eq(0).html(signResult);
    		   $("#signInfo").val(dataUrl);
    	   	   $('#reportContent').val(editor.getData());
           	   $('#reportForm').submit();
	       }
        });
         
        // 휴가 종류 선택 radio 버튼
       	$(".vacatType").prop("checked", false);

        $(".vacatTypeText").on("click", function(){
        	$(".vacatType").prop("checked", false);
        	$(this).parents(".vacatTypeLine").find(".vacatType").prop("checked", true);
        });
        
        
        $('#reportForm').on('keydown click', function(){
        	$(".errormsg").hide();
        	$(".error").hide();
        })
        
        
        
        
	})
	
	
	
	</script>
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
	    var dataUrl = canvas.toDataURL();
	    var html = '결과 : <img id="signImg" src='+dataUrl+' alt="사원서명">';
	    $('#signDiv').empty();
	    $('#signDiv').append(html);
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
	  
	});

</script>
	
</head>

<body>
	<h2>문서 작성</h2>
	<hr>
	<div class="writer">
		<form:form id="reportForm" commandName="reportVo"  action="/report/insertReport" method="post" enctype="multipart/form-data">
			<form:hidden path="typeId"/>
			<form:hidden path="reportSt"/>
			<form:hidden path="apprKind"/>
			<input type="hidden" name="empId" value="${EMP.empId}">
			<form:hidden path="approver"/>
			<input type="hidden" id="reportContent" name="content" value=""/>
			<input type="hidden" id="signInfo" name="signInfo" value="" style="width : 100%;">
			
			<input type="hidden" name="uploadtoken" value="uploadchecking" >
			
			<div id="tab">
				<div id="approvLineDiv"style="width: 100%; height: 10%;">
					<table id="approvLineTable" border="1" style="float: right; width: 400px;">
						<colgroup>
							<col width="30px">
							<c:forEach begin="0" end="${reportVo.approvLineList.size() }">
								<col width="150px">
							</c:forEach>							
						</colgroup>
					
						<tr>
						  	<th rowspan="5" style="background: lightgray;">결<br>재</th>
							<th>담당<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="signInfo"/></th>
							<c:set value="${reportVo.approvLineList.size() }" var="approvLineSize"/>
							<c:if test="${approvLineSize > 1 }">
								<c:forEach begin="0" end="${approvLineSize -2 }">
									<th>검토</th>
								</c:forEach>
							</c:if>
							<th>승인</th>
						</tr>	
			
						<tr>
							<!-- 작성자  -->
							<td>${EMP.empNm }</td>
							<!-- 결재라인상 사원들  -->
							<c:forEach items="${reportVo.approvLineList }" var="approvLine" varStatus="status">
								<td>${approvLine.currEmpNm }&nbsp;${approvLine.currJobNm }</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach begin="0" end="${approvLineSize }" var="i" varStatus="status">
								<td class="sign">
									<c:if test="${reportVo.reportSignList[i].signInfo != null && reportVo.reportSignList[i].signInfo != ''}">
										<img class="signResult" src="${reportVo.reportSignList[i].signInfo }" alt="공란">																																					
									</c:if>
								</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="date">12</td>
							<td class="date">13</td>
						</tr>
						<tr>
							<td class = "date">
								<fmt:parseDate value="${reportVo.reportDt }" pattern="yyyy-MM-dd" var="date"/>
								<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
							</td>
							<c:forEach begin="0" end="${approvLineSize-1 }" var="j">
								<td class = "date">
									<c:if test="${reportVo.approvalList[j].approvDt != null && reportVo.approvalList[j].approvDt != ''}">
										<fmt:parseDate value="${reportVo.approvalList[j].approvDt }" pattern="yyyy-MM-dd" var="date"/>
										<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>																																			
									</c:if>
								</td>
							</c:forEach>
						</tr>
	
				</table>
				
				
				</div>
				<div style="width: 100%;">
				
				</div>			
				<table id="reportInfo" border="1" style="width: 100%;">
					<colgroup>
							<col width="15%"/>
							<col width="35%"/>
							<col width="15%"/>
							<col width="37%"/>
					</colgroup>
				
					<tr>
						<td class="labeltd">문서타입</td>
						<td class="datatd">
						<c:if test="${reportVo.typeId=='T1'}">기안서</c:if>
						<c:if test="${reportVo.typeId=='T2'}">휴가</c:if>
						<c:if test="${reportVo.typeId=='T3'}">월차</c:if>
						<c:if test="${reportVo.typeId=='T4'}">반차</c:if>
						<c:if test="${reportVo.typeId=='T5'}">사직서</c:if>
<%-- 						<form:input path="typeId"  readonly="true"/> --%>
						</td>
						
						<td class="labeltd">수신</td>
						<td class="datatd">아무개</td>
					</tr>
					
					<tr>
						<td class="labeltd">문서번호</td>
						<td class="datatd"><form:input path="reportId"  readonly="true"/></td>
						
						<td class="labeltd">참조</td>
						<td class="datatd">홍길동</td>
					
					</tr>
					
					<tr>
						<td class="labeltd">작성일시</td>
						<td class="datatd">
							<fmt:parseDate var="reportDt" value="${reportVo.reportDt }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${reportDt }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						
						<td class="labeltd">공람</td>
						<td class="datatd">X</td>
						
					</tr>
					<tr>
						<td class="labeltd">작성자</td>
						<td class="datatd" style="padding: 0px;" colspan="3">
							<table style="width: 100%; text-align: center;">
									<colgroup>
										<col width="20%" align="center"/>
										<col width="30%"/>
										<col width="20%" align="center"/>
										<col width="30%"/>
									</colgroup>
									<tr>
										<td style="background: lightgray; border: 1px solid black;">사번</td>
										<td style="border: 1px solid black;">${EMP.empId }</td>
										<td style="background: lightgray; border: 1px solid black;">소속</td>
										<td style="border: 1px solid black;">${EMP.deptId }</td>
									</tr>
									<tr>
										<td style="background: lightgray; border: 1px solid black;">직급</td>
										<td style="border: 1px solid black; ">${EMP.jobtitleId }</td>
										<td style="background: lightgray; border: 1px solid black;">이름</td>
										<td style="border: 1px solid black;">${EMP.empNm }</td>
									</tr>
								</table>
						</td>
					</tr>
					
					<!-- <tr>
						<td class="labeltd">결재</td>
						<td class="datatd">
								
						</td>
					</tr> -->
					
					<tr>
						<td class="labeltd">제목</td>
						<td class="datatd" colspan="3">
							<form:input id="reportTitle" path="title" cssStyle="width : 100%; border : 1px solid gray; background : white;"/><br>
							<form:errors cssClass="errormsg" path="title" />
						</td>
					</tr>
					
					<c:choose>
						<c:when test="${reportVo.typeId=='T5'}">
							<input type="hidden" id="reportOptCode" name="reportOptCode" value="quitComp" />
							<tr>
								<td class="labeltd">시행일자</td>
								<td align="center" colspan="3">
									<input type="date" name="startDt"><br>
									<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="startDt"/>
								</td>
							</tr>
						</c:when>
						<c:when test="${reportVo.typeId == 'T1' }">
							<tr>
								<td class="labeltd">시행일자</td>
								<td align="center" colspan="3">
									<input type="date" name="startDt"><br>
									<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="startDt"/>
								</td>
							</tr>						
						</c:when>
						
						<c:when test="${reportVo.typeId == 'T2'}">
							<input type="hidden" id="reportOptCode" name="reportOptCode" value="vacatType" /> 
							<tr>
								<td class="labeltd">휴가종류</td>
								<td colspan="3"> 
									<form:errors cssClass="errormsg" path="reportOptCont"/>
									<span class="vacatTypeLine">
										<input class="vacatType" type="radio" name="reportOptCont" value="VTC-001" /> 
										<span class="vacatTypeText">연차</span>
									</span>
									<span class="vacatTypeLine">
										<input class="vacatType" type="radio" name="reportOptCont" value="VTC-003" />
										<span class="vacatTypeText">출산휴가</span>
									</span>
									<span class="vacatTypeLine">
										<input class="vacatType" type="radio" name="reportOptCont" value="VTC-004" /> 
										<span class="vacatTypeText">경조</span>
									</span>
									<span class="vacatTypeLine">
										<input class="vacatType" type="radio" name="reportOptCont" value="VTC-005" /> 
										<span class="vacatTypeText">공가</span>
									</span>
									<span class="vacatTypeLine">
										<input class="vacatType" type="radio" name="reportOptCont" value="VTC-006" /> 
										<span class="vacatTypeText">병가</span>
									</span>
								</td>
							</tr>
							
							
							<tr>
								<td class="labeltd">기간
								</td>
								<td align="center" colspan="3">
									<table>
										<tr>
											<td align="center">
												
												<input type="date" name="startDt" id="startDt"><br>
												<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="startDt"/>
											</td>
											<td align="center">&nbsp;~&nbsp;</td>
											<td align="center">	
												<input type="date" name="endDt" id="endDt"><br>
												<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="endDt"/>
											</td>										
										</tr>
									</table>
								</td>
							</tr>
							
						</c:when>
						
						
						<c:otherwise>
							<tr>
								<td class="labeltd">기간</td>
								<td align="center" colspan="3">
									<table>
										<tr>
											<td align="center">
												<input type="date" name="startDt" id="startDt"><br>
												<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="startDt"/>
											</td>
											<td align="center">&nbsp;~&nbsp;</td>
											<td align="center">	
												<input type="date" name="endDt" id="endDt"><br>
												<form:errors cssStyle="color: red; font-size: 15px;" cssClass="error" path="endDt"/>
											</td>										
										</tr>
									</table>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${reportVo.typeId == 'T4'}">
							<tr>
								<td class="labeltd">오전 /오후</td>
								<td colspan="3">
									<input type="hidden" id="reportOptCode" name="reportOptCode"  value="halfVacat"/>
									<input type="radio" class="halfVacateInfo" name="reportOptCont" value="오전"/>오전
									&nbsp;&nbsp;
									<input type="radio" class="halfVacateInfo" name="reportOptCont" value="오후"/>오후
									<form:errors cssClass="errormsg" path="reportOptCont"/>
								</td>
							</tr>
					</c:if>
					
					<c:if test="${reportVo.typeId !='T1' && reportVo.typeId != 'T5'}">
						<tr>
							<td class="labeltd">대리결재자</td>
							<td class="datatd" colspan="3">
								<input type="hidden" name="subEmpId" id="subEmpId" value="">
								<input type="text" name="subEmpNm" style="width : 100px; text-align: right;" id="subWorkerName" value="" readonly>
								<input type="text" style="width : 100px;" id="subWorkerJobtitle" value="" readonly>
								
								<button class="subworkerBtn btn btn-secondary" type="button" id="searchSubWorker" onclick="javascript:showModal()">
					  				<i class="fas fa-plus"></i>
								</button>
								<script>
								function showModal(){
									var startDt = $('#startDt').val();
									var endDt = $('#endDt').val();
									if(startDt == null || startDt == '' || endDt == null || endDt == ''){
										alert("휴가 날짜를 입력해주세요.");
									}else{
										$('#searchSubWorkerModal').modal('show');
									}
								}
								</script>	
							</td>
						</tr>
					</c:if>
					
					<tr>
						<td class="labeltd">상세내용</td>
							<td class="datatd" colspan="3">
								<div class="document-editor__toolbar"></div>
								<div class="editor"></div>
								<form:errors cssClass="errormsg" path="content"/>
							</td>
					</tr>
			</table>
			<script>
				$(function(){
					$('input:radio[value="${reportVo.reportOptCont}"]').prop('checked', true);
					$('#startDt').val("${startDt}");
					$('#endDt').val("${endDt}");
				})
			</script>
			
			
			
			</div><!-- /tab  -->

		
				
				
				
				<hr>
				<div class="tail">
					<table style="width : 100%;" id="fileTable">
						<tr>
							<td>첨부파일</td>
							<td>
								<div id="fileDiv" class="col-sm-10">
									<input type="file" name="fileList[0]">
									<button type="button" id="btnPlus" class="btn btn-primary" style="outline: 0; border: 0;">
										<i class="fas fa-fw fa-plus" style="color: white; font-size:10px;"></i>
									</button>
								</div>
							</td>
						</tr>
					</table>
				
				<br>
					
				<p class="logoTitle">SENDBOX</p>
				</div>	<!-- /tail  -->
		
		</form:form>
		<div style="float : right;">
			<button type="button" id="insertReport" class="btn" data-toggle="modal" data-target="#insertReportModal">
					작성완료
			</button>
			<button type="button" class="btn btn-secondary" id="btnCancel">작성취소</button>
		</div>
			
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
											<h4>사인을 입력해주세요</h4>
											<hr>
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
			
			<!-- 대결자 modal  -->
				<div class="modal fade" id="searchSubWorkerModal" tabindex="-1" role="dialog" aria-labelledby="searchSubWorkerTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="searchSubWorkerTitle">대결자(대리결재자) 지정</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body" style="vertical-align: middle;">
				        	<div id="jojikdo">
									<!-- 조직도 전체 -->
									<ul id="gray" class="treeview-gray" style="overflow: auto; height: 500px;">
									
									</ul>
							</div>
							<script>
							
							$('#searchSubWorkerModal').on('shown.bs.modal', function(){
								workTree();
							});
						
							function workTree(){
								
								var startDt = $('#startDt').val();
								var endDt = $('#endDt').val();
								
									$.ajax({
										url		: "/busiTree/businessTreeEmpDept",
										data : {"startDt" : $('#startDt').val(),
												"endDt" : $('#endDt').val()	
											   },
										dataType: "json",
										method	: "post",
										success	: function(data){
											
											console.log("business data : ", data.businessTreeList);
											//조직도 자료
											var businessTreeList = data.businessTreeList;
											
											var TreeViewTag = "";
											
																for(var top=0; top<businessTreeList.length; top++){
																	console.log(businessTreeList[top].upperDeptId);
												//사장인경우
												if(businessTreeList[top].upperDeptId == null){
													TreeViewTag += "	<li>";
													TreeViewTag += "		<span>&nbsp;&nbsp;"+businessTreeList[top].deptName+"</span>";
													TreeViewTag += "		<ul>";
													TreeViewTag += "			<li class='clickAddName' data-jobid="+businessTreeList[top].jobtitleId+" data-currid="+businessTreeList[top].empId+" data-statuscode="+businessTreeList[top].statusCode+" data-empnm="+businessTreeList[top].empNm+" data-jobtitlenm="+businessTreeList[top].jobtitle+">&nbsp;&nbsp;"+businessTreeList[top].empNm+"["+businessTreeList[top].jobtitle+"]";
													if(businessTreeList[top].statusCode == 'T'){
														TreeViewTag += "&nbsp;<span style='color : green;'>가능</span>";
													}
													if(businessTreeList[top].statusCode == 'F'){
														TreeViewTag += "&nbsp;<span style='color : red;'>불가능</span>";														
													}
													TreeViewTag +="</li>";
													TreeViewTag += "		</ul>";
													
													var busiTop = businessTreeList[top].deptId;
													
													for(var i=0; i<businessTreeList.length; i++){
														
														if(businessTreeList[i].upperDeptId == busiTop){
															
															var busiBu = businessTreeList[i].deptId;
															
															console.log("busiBu = ", busiBu);
															
															TreeViewTag += "	<li>";
															TreeViewTag += "		<span>&nbsp;&nbsp;"+businessTreeList[i].deptName+"</span>";
															TreeViewTag += "		<ul>";
															TreeViewTag += "			<li class='clickAddName' data-jobid="+businessTreeList[i].jobtitleId+" data-currid="+businessTreeList[i].empId+" data-statuscode="+businessTreeList[i].statusCode+" data-empnm="+businessTreeList[i].empNm+" data-jobtitlenm="+businessTreeList[i].jobtitle+">&nbsp;&nbsp;"+businessTreeList[i].empNm+"["+businessTreeList[i].jobtitle+"]";
															if(businessTreeList[i].statusCode == 'T'){
																TreeViewTag += "&nbsp;<span style='color : green;'>가능</span>";
															}
															if(businessTreeList[i].statusCode == 'F'){
																TreeViewTag += "&nbsp;<span style='color : red;'>불가능</span>";														
															}
															
															TreeViewTag += "</li>";
															TreeViewTag += "		</ul>";
															
															for(var j=0; j<businessTreeList.length; j++) {
																
																
																if(businessTreeList[j].upperDeptId == busiBu){
																	var busiTeam = businessTreeList[j].deptId;
																	
																	
																	console.log("busiTeam1 = ", busiTeam);
																	
																	TreeViewTag += "			<ul>";
																	TreeViewTag += "				<li>";
																	TreeViewTag += "					<span>&nbsp;&nbsp;"+businessTreeList[j].deptName+"</span>";
																	TreeViewTag += "					<ul>";
																	
																	var teamCnt = 0;
																	for(var k=0; k<businessTreeList.length; k++) {
																		if(businessTreeList[k].deptId == busiTeam) {
																			console.log("busiTeam2 = ", busiTeam);
																			TreeViewTag += "				<li class='clickAddName' data-jobid="+businessTreeList[k].jobtitleId+" data-currid="+businessTreeList[k].empId+" data-statuscode="+businessTreeList[k].statusCode+" data-empnm="+businessTreeList[k].empNm+" data-jobtitlenm="+businessTreeList[k].jobtitle+">&nbsp;&nbsp;"+businessTreeList[k].empNm+"["+businessTreeList[k].jobtitle+"]";
																			if(businessTreeList[k].statusCode == 'T'){
																				TreeViewTag += "&nbsp;<span style='color : green;'>가능</span>";
																			}
																			if(businessTreeList[k].statusCode == 'F'){
																				TreeViewTag += "&nbsp;<span style='color : red;'>불가능</span>";														
																			}
																			TreeViewTag += "</li>";
																			teamCnt++;
																		}
																	}
																	j = (j-1)+teamCnt;
																	TreeViewTag += "				</ul>";
																	TreeViewTag += "			</li>";
																	TreeViewTag += "		</ul>";
																}
															}
															TreeViewTag += "	</li>";
														}
													}
													TreeViewTag += "	</li>";
												}
												
											}
											$("#gray").html(TreeViewTag);
											$("#gray").treeview({collapsed: false});
										},
										error	: function(error){
											alert("error code : "+error.status);
										}
									});
								
							}
							
							$('.treeview-gray').on('click', '.clickAddName', function(){
								var check ='<i class="fas fa-check checkIcon" style="float : right; margin-right : 100px; color: lightgreen;"></i>';
								if($(this).data('statuscode') == 'T'){
									$('.checkIcon').remove();
									$('.subworker').removeClass('subworker');
									$(this).append(check);
									$(this).addClass('subworker');
								}else{
									alert("해당 인원은 지정 불가능합니다.");
								}
							})
							
							function addSubWorker(){
								var subworkerId = $(".subworker").data('currid');
								var subworkerNm = $('.subworker').data('empnm');
								var subworkerJobtitle = $('.subworker').data('jobtitlenm');
								
								$('#subEmpId').val(subworkerId);
								$('#subWorkerName').val(subworkerNm);
								$('#subWorkerJobtitle').val(subworkerJobtitle);
								$('#searchSubWorkerModal').modal('hide');
							}
							
							
							
							</script>
							
							
				      </div>
				      <div class="modal-footer">
				        <button type="button" id="btnAdd" class="btn btn-primary" onclick="javascript:addSubWorker()">추가</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
			
</body>