<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>



<!-- 사원의 사인정보, 불러오기용  -->
<c:set var="empSign" value="${reportVo.signInfo}"/>

<!-- 반려 사유 표시  -->
<c:forEach items="${reportVo.approvalList }" var="approval" varStatus="status">
	<c:if test="${approval.approvResult == 'N' }">
		<c:set var="approvText" value="${approval.approvText }"/>
	</c:if>
</c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.document-editor__toolbar{
		width : 800px;
	}
	.editor{
		height : 400px;
	
	}
	
	.writer{
		border : 1px solid gray;
		width : 800px;
		text-align: center;
		margin-left: 20%;
		color: black;
	}
	
	.ck.ck-widget__selection-handler {
	  display: none;
	}

	.ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-blurred > figure,
	.ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-focused > figure {
	  margin: 16px 0;
	}
	
	.document-editor__toolbar{
		margin-left: 20%;
	}
	.signResult{
		margin: 0px 0px 0px 0px;
		width : 90px;
		height : 50px;
	}
	
	td.labeltd{
		width : 239px;
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
		padding: 0px 0px 0px 0px;
		height : 50px;
	}
	#declineReport{
		margin: 5px;
	}
	#insertReport, #showList{
		background-color: #003366;
		color:white;
		margin: 5px;
	
	}
	
	#reinsertReport{
		background-color: #f6c23e;
		color:white;
		margin: 5px;
	}
	
	.reinsert-modal{
		width : 70%;
	}
	
	#resultMsg{
		color : red;
		font-size : 15px;
		font-weight: bold;
	}
	
	

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>


<script src="/ckeditor5/build/ckeditor.js"></script>
	<script>
	$(function(){
			DecoupledDocumentEditor
			.create( document.querySelector( '.editor' ), {

				toolbar: {
					items: [
						'exportPdf',
						'exportWord',
					]
				},
				language: 'ko',
				licenseKey: '',
				
				exportPdf : {
					
					stylesheets: [
						'/css/ckeditorpdfstyle.css'
					],
					 fileName: '${reportVo.reportId}.pdf',
					dataCallback: ( editor ) => {
						var head = $('#head').html();
						//var content = editor.getData();
						var tail = $('div.tail').html();
						return head + tail;
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
	
				// insertContent() does not have to be used in a change() block. It can, though,
				// so this code could be moved to the callback defined above.
				editor.model.insertContent( docFrag );
				 */
				
				const content = '${reportVo.content}';
				const viewFragment = editor.data.processor.toView( content );
				const modelFragment = editor.data.toModel( viewFragment );

				editor.model.insertContent( modelFragment );
				
				editor.isReadOnly = true;
			} )
			.catch( error => {
				console.error( 'Oops, something went wrong!' );
				console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
				console.warn( 'Build id: ywtaruz06pdl-6v1em39f6r66' );
				console.error( error );
			} );
			
	});
	
	</script>
	
</head>

<body data-editor="DecoupledDocumentEditor" data-collaboration="false">


	
	<h2>문서 조회</h2>
	<hr>
	<div class="document-editor__toolbar"></div>
	<div class="writer">
		<form:form id="reportForm" commandName="reportVo" action="/report/approve" method="post" enctype="multipart/form-data" >
			<form:hidden path="pageIndex"/>
			<form:hidden path="pageUnit"/>
			<form:hidden path="searchCondition"/>
			<form:hidden path="searchKeyword"/>
			<form:hidden path="typeId"/>
			<input type="hidden" id="reportSt" name="reportSt" value="${reportVo.reportSt}"/>
			<form:hidden path="apprKind"/>
			<input type="hidden" name="empId" value="${EMP.empId}">
			<input type="hidden" name="nextApprover" value="${reportVo.nextApprover }">
			<form:hidden id="approver" path="approver"/>
			<!-- 기안 사인 저장용 사인정보  -->
			<input type="hidden" id="signInfo" name="signInfo" value="">
			<!-- 결재 결과  -->
			<input type="hidden" id="approvResult" name="approvResult" value="">
			<!-- 반려 사유 -->
			<input type="hidden" id="approvText" name="approvText" value="">
			<input type="hidden" id="uploadtoken" name="uploadtoken" value="uploadchecking">
			<c:if test="${reportVo.reportSt == 'N' }">
				<h4 style="color : red;">반려 문서</h4>			
				<c:if test="${approvText != null && approvText != '' }">				
					<h5 style="color : red;">사유-${approvText}</h5>			
				</c:if>
			</c:if>
			<div id="head">
				<div id="approvLineDiv"style="width: 100%; height: 10%;">
					<table id="approvLineTable" border="1" style="float: right; width: 400px;">
						<colgroup>
							<col width="30px">
							<c:forEach begin="0" end="${reportVo.approvLineList.size() }">
								<col width="90px">
							</c:forEach>							
						</colgroup>
									
							<tr>
								<th rowspan="5" style="background: lightgray;">결<br>재</th>	
								<th>담당</th>
								
								<c:set value="${reportVo.approvLineList.size() }" var="approvLineSize"/>
								
								<c:if test="${approvLineSize > 1 }">
									<c:forEach begin="0" end="${approvLineSize -2 }">
										<th>검토</th>
									</c:forEach>
								</c:if>
								
								<th>승인</th>
							</tr>	
		
						
							<tr>
								<!-- 기안자  -->
								<td>${reportVo.empNm}</td>
								<!-- 기안라인상 사원들  -->
								<c:forEach items="${reportVo.approvLineList }" var="approvLine" varStatus="status">
									<td>
										${approvLine.currJobNm }&nbsp;${approvLine.currEmpNm }
										 <%--  <c:if test="${reportVo.approvalList[status.index].oringApprover != null }">

										  
										  </c:if>
										 --%>
										
										
										
										
										<c:if test="${subWorker != null }">
											<c:if test="${approvLine.apprCurrEmp == subWorker.empId}">
												/대결자 : ${subWorker.subEmpNm }&nbsp;${subWorker.subJobNm}
											</c:if>													
										</c:if>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<%-- <c:set var="tempTdSignLenPer" value="${100/(approvLineSize+1)}"></c:set> --%>
								<c:forEach begin="0" end="${approvLineSize }" var="i" varStatus="status">
									<td class="sign">
										<c:if test="${reportVo.reportSignList[i].signInfo != null && reportVo.reportSignList[i].signInfo != ''}">
											<img class="signResult" src="${reportVo.reportSignList[i].signInfo }" alt="공란">																																					
										</c:if>
									</td>
								</c:forEach>
							</tr>
							<!-- 대리결재자  -->
							<!-- <tr>
								<td class="date">12</td>
								<td class="date">13</td>
							</tr> -->
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

				<div style="width:100%">
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
							
							<!-- <td class="labeltd">수신</td>
							<td class="datatd">아무개</td> -->
							
						</tr>
						<tr>
							<td class="labeltd">문서번호</td>
							<td class="datatd"><form:input path="reportId"  readonly="true"/></td>
							
							<!-- <td class="labeltd">참조</td>
							<td class="datatd">홍길동</td> -->
						</tr>
	
						<tr>
							<td class="labeltd">작성일시</td>
							<td class="datatd">
								<fmt:parseDate var="reportDt" value="${reportVo.reportDt }" pattern="yyyy-MM-dd HH:mm"/>
								<fmt:formatDate value="${reportDt }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							
							<!-- <td class="labeltd">공람</td>
							<td class="datatd">X</td> -->
							
							
						</tr>
						
						<tr>
							<td class="labeltd">작성자</td>
							<td class="datatd" style="padding: 0px;" colspan="3">
								<table style="width: 100%; text-align: center; border: 1px solid lightgray;">
									<colgroup>
										<col width="20%" align="center"/>
										<col width="30%"/>
										<col width="20%" align="center"/>
										<col width="30%"/>
									</colgroup>
									<tr>
										<td style="background: lightgray; border: 1px solid lightgray;">사번</td>
										<td style="border: 1px solid lightgray;">${reportVo.empId }</td>
										<td style="background: lightgray; border: 1px solid lightgray;">소속</td>
										<td style="border: 1px solid lightgray;">${reportVo.deptName }</td>
									</tr>
									<tr>
										<td style="background: lightgray; border: 1px solid lightgray;">직급</td>
										<td style="border: 1px solid lightgray; ">${reportVo.jobtitleNm }</td>
										<td style="background: lightgray; border: 1px solid lightgray;">이름</td>
										<td style="border: 1px solid lightgray;">${reportVo.empNm }</td>
									</tr>
								</table>	
							</td>
						</tr>
						
						<%-- <tr>
							<td class="labeltd">결재</td>
							<td class="datatd">
									<table id="approvLineTable" border="1">
										<thead>
											<tr>
												<th>담당</th>
												
												<c:set value="${reportVo.approvLineList.size() }" var="approvLineSize"/>
												
												<c:if test="${approvLineSize > 1 }">
													<c:forEach begin="0" end="${approvLineSize -2 }">
														<th>검토</th>
													</c:forEach>
												</c:if>
												
												<th>승인</th>
											</tr>	
										</thead>
										<tbody>
											<tr>
												<!-- 기안자  -->
												<td>${reportVo.empNm}</td>
												<!-- 기안라인상 사원들  -->
												<c:forEach items="${reportVo.approvLineList }" var="approvLine" varStatus="status">
													<td>
														${approvLine.currEmpNm }&nbsp;${approvLine.currJobNm }
														  <c:if test="${reportVo.approvalList[status.index].oringApprover != null }">
		
														  
														  </c:if>
														
														
														
														
														<c:if test="${subWorker != null }">
															<c:if test="${approvLine.apprCurrEmp == subWorker.empId}">
																/대결자 : ${subWorker.subEmpNm }&nbsp;${subWorker.subJobNm}
															</c:if>													
														</c:if>
													</td>
												</c:forEach>
											</tr>
											<tr>
												<c:set var="tempTdSignLenPer" value="${100/(approvLineSize+1)}"></c:set>
												<c:forEach begin="0" end="${approvLineSize }" var="i" varStatus="status">
													<td class="sign" style="width: ${tempTdSignLenPer}%">
														<c:if test="${reportVo.reportSignList[i].signInfo != null && reportVo.reportSignList[i].signInfo != ''}">
															<img class="signResult" src="${reportVo.reportSignList[i].signInfo }" alt="공란">																																					
														</c:if>
													</td>
												</c:forEach>
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
										</tbody>
									</table>
							</td>
						</tr> --%>
						
						<tr>
							<td class="labeltd">제목 </td>
							<td class="datatd" colspan="3"><form:input path="title"  readonly="true" cssStyle="width: 90%;"/></td>
						</tr>
						
						<c:choose>
							<c:when test="${reportVo.typeId=='T5'}"></c:when>
							<c:when test="${reportVo.typeId == 'T1' }">
								<tr>
									<td class="labeltd">시행일자 </td>
									<td class="datatd" colspan="3">
										<form:hidden path="startDt"/>
										<fmt:parseDate value="${reportVo.startDt}" var="startDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${startDt }" pattern="yyyy-MM-dd"/>									
									</td>
								</tr>						
							</c:when>
							
							<c:when test="${reportVo.typeId == 'T2'}">
								<form:hidden id="reportOptCode" path="reportOptCode"/>
								<form:hidden id="reportOptCont" path="reportOptCont"/> 
								<tr>
									<td class="labeltd">휴가종류</td>
									<td class="datatd" colspan="3">
										<span class="vacatTypeLine">
											<form:input path="vacatTypeName" readonly="true"/>
										</span>
									</td>
								</tr>
								
								<tr>
									<td class="labeltd">기간 </td>
									<td class="datatd" colspan="3">
										<form:hidden path="startDt"/>
										<fmt:parseDate value="${reportVo.startDt}" var="startDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${startDt }" pattern="yyyy-MM-dd"/>
										
										&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
										
										<form:hidden path="endDt"/>
										<fmt:parseDate value="${reportVo.endDt}" var="endDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${endDt }" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
								
							</c:when>
							
							<c:otherwise>
								<tr>
									<td class="labeltd">기간 </td>
									<td class="datatd" colspan="3">
										<form:hidden path="startDt"/>
										<fmt:parseDate value="${reportVo.startDt}" var="startDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${startDt }" pattern="yyyy-MM-dd"/>
										
										&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
										
										<form:hidden path="endDt"/>
										<fmt:parseDate value="${reportVo.endDt}" var="endDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${endDt }" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<c:if test="${reportVo.typeId == 'T4'}">
								<tr>
									<td class="labeltd">오전 /오후 </td>
									<td colspan="3">
										<form:input path="reportOptCont" readonly="true"/>
									</td>
								</tr>
						</c:if>
						
						<c:if test="${reportVo.typeId !='T1' && reportVo.typeId != 'T5'}">
							<tr>
								<td class="labeltd">대리결재자</td>
								<td class="datatd" colspan="3">
									<form:hidden path="subEmpId" readonly="true"/>	
									<form:input path="subEmpNm" readonly="true"/>
								</td>
							</tr>
						</c:if>
						
						
						<tr>
							<td class="labeltd">상세내용</td>
							<td class="datatd" colspan="3">
								<div class="editor"></div>
							</td>
						</tr>
						
						
						
				</table>
				
				</div>
			
			
		</div><!-- /head  -->
		
		<div class="tail">
			<table style="width : 100%; border : 1px solid black; border-top: none;" id="fileTable">
					<c:forEach items="${reportVo.reportFileList }" var="reportFile" varStatus="status">
					<tr>
						<c:if test="${status.index == 0 }">
							<td rowspan="${reportVo.reportFileList.size() }" class="labeltd">
								첨부
							</td>
						</c:if>
						<td class="datatd">
							<div id="fileDiv" class="col-sm-10">
								<button type="button" class="btnDown" class="btn btn-primary" style="outline: 0; border: 0;">
									<i class="fas fa-download" style="color: #1e2c54; font-size:20px;"></i>
								</button>
								<span><a href="/report/reportFileDownload?attachfileSeq=${reportFile.attachfileSeq }"> ${reportFile.realfilename }</a></span>
							</div>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		
			<br>
			
		<p class="logoTitle">SENDBOX</p>
		</div>	<!-- /tail  -->
		<form:hidden path="content" id="reportContent"/>
		</form:form>
		
		<c:if test="${reportVo.reportSt == 'N' && EMP.empId == reportVo.empId}">
			<div style="float : right;">
				<button type="button" id="reinsertReport" class="btn" data-toggle="modal" data-target="#reinsertReportModal">
						재기안
				</button>
			</div>

			<div class="modal fade" id="reinsertReportModal" tabindex="-1" role="dialog" aria-labelledby="reinsertReportTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content reinsert-modal">
				      <div class="modal-header">
				        <h5 class="modal-title" id="reinsertReportTitle">사원인증</h5>
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
												<h6>비밀번호를 입력해주세요</h6>
												<hr>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
										 		<input type="text" id="reportPass" style="border : 1px solid lightgray;" onkeydown="javascript:hideMsg()">
										 	</div>
										</div>
										<div class="row">
											<div class="col-md-12" id="resultMsg">
												<!-- <p id="resultMsg">결과 : 비밀번호가 일치하지 않습니다</p> -->
										 	</div>
										</div>
									</div>
				        		</td></tr>
				        	</table>
				      </div>
				      <div class="modal-footer">
				        <button type="button" id="btnOk" class="btn btn-primary" onclick="javascript:reinsert()">확인</button>
				        <script>
				        	function reinsert(){
				        		var passInput = document.getElementById('reportPass').value;
				        		var pass = "${EMP.password}";
				        		const msgHtml = '<p id="passMsg">결과 : 비밀번호가 일치하지 않습니다</p>';
				        		var form = document.getElementById('reportForm');
				        		if(passInput === pass){
				        			document.getElementById('approver').value = '';
				        			form.action = '/report/insertReportView';
				        			form.submit();
				        		}else{
				        			document.getElementById('resultMsg').innerHTML = msgHtml;	
				        		}
				        	}
				        	
				        	function hideMsg(){
				        		const msg = document.getElementById('passMsg');
				        		if(msg != null){
				        			msg.style.display = "none";
				        		}
				        	}
				        </script>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
		</c:if>
		
		<c:set var="isInApprovLine" value="false"/>
		
		<c:forEach items="${reportVo.approvLineList }" var="approvLine">
			<c:choose>
				<c:when test="${subWorker != null }">
					<c:if test="${approvLine.apprCurrEmp == EMP.empId || approvLine.apprCurrEmp == subWorker.empId}">
						<c:set var="isInApprovLine" value="true"/>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${approvLine.apprCurrEmp == EMP.empId }">
						<c:set var="isInApprovLine" value="true"/>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 대리 결재자가 결재한 리스트도 가져와야 함. 대리 결재 기간 동안 한거   -->
		<c:if test="${isInApprovLine == true }">
			<c:set var="isInApproval" value="false"/>
			<c:forEach items="${reportVo.approvalList }" var="approval" >
				<c:if test="${approval.empId == EMP.empId}">
					<c:set var="isInApproval" value="true"/>
				</c:if>
			</c:forEach>
		</c:if>
		
		<div style="float : left;">
			<button type="button" id="showList" class="btn" onclick="javascript:listView()">
					목록으로
			</button>
			<script>
				function listView(){
					const menuLocation = "${menuLocation}";
					url = "";
					if(menuLocation != ""){
						if(menuLocation == "reportWait" || menuLocation == "reporting" 
							|| menuLocation == "approvWait" || menuLocation == "complete"
							|| menuLocation == "decline" || menuLocation == "approvFin"){
							url = document.getElementById(menuLocation).getAttribute('href');
						}else{
							url = document.getElementById("reportWait").getAttribute('href');
						}
					}else{
						url = document.getElementById("reportWait").getAttribute('href');
					}
					
					const form = document.getElementById('reportForm');
					form.action = url;
					form.approver.value = "";
					console.log(form.action);
					form.submit();
				}
			</script>
		</div>
		
		<c:if test="${isInApproval == false}">
		
			<div style="float : right;">
				<button type="button" id="insertReport" class="btn" data-toggle="modal" data-target="#approveReportModal">
						결재처리
				</button>
				<button type="button" id="declineReport" class="btn btn-danger" data-toggle="modal" data-target="#declineReportModal">반려처리</button>
			</div>
			
			<!-- 결재라인 저장 Modal -->
				<div class="modal fade" id="approveReportModal" tabindex="-1" role="dialog" aria-labelledby="approveReportTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="approveReportTitle">서명</h5>
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
				        <button type="button" id="btnApprove" class="btn btn-primary">승인</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- 반려 modal  -->
				<div class="modal fade" id="declineReportModal" tabindex="-1" role="dialog" aria-labelledby="declineReportTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="declineReportTitle">반려</h5>
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
												<h4>반려사유를 입력해주세요</h4>
												<hr>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<input type="text" id="declineText" value="" style="border : 1px solid gray" >
										 	</div>
										</div>
										<div class="row">
											<div class="col-md-12">
											</div>
										</div>
									</div>
				        		</td></tr>
				        	</table>
				        	
				      </div>
				      <div class="modal-footer">
				        <button type="button" id="btnDecline" class="btn btn-primary">반려</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				
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
					  
					  //지우기
					  clearBtn.addEventListener("click", function(e) {
					    clearCanvas();
					    $('#signImg').remove();
					  }, false);
					  
					  //적용
					  
					  //사인 불러오기
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
					
				       
				       //승인
				      $('#btnApprove').on('click', function(){
			    		// 해당 기안의 최종승인이 완료시 알림기능
				    	var aprover = "${reportVo.approver}";				// 현 결재자
				    	var empId = "${EMP.empId}";							// 로그인한 사원
				    	var approverLineTemp = "${apprCurrNextEmpList}";	// 해당 기안의 결재자 리스트 정보
				    	var reportId = "${reportVo.reportId}";				// 해당 기안의 기안id
				    	var reportTitle = "${reportVo.title}";				// 해당 기안의 기안 제목
				    	
				    	console.log("결재자 리스트 정보 : ", approverLineTemp);
				    	
				    	// 최종 결재자 정보 받아오기
				    	var temp1 = approverLineTemp.split("[");
				    	var temp2 = temp1[1].split("]");
				    	var apprInfoTemp = temp2[0].split(", ");
				    	var finalApproverTemp = apprInfoTemp[apprInfoTemp.length-1 ];
				    	var finamApprEmp = finalApproverTemp.split(":~:");
				    	
				    	console.log("*******************************************************");
				    	console.log("로그인한 사원 : ", empId);
		    			console.log("현재 결재자 : ", aprover);
		    			console.log("최종 결재자 : ", finamApprEmp[1]);
		    			console.log("*******************************************************");
		    			
		    			if(aprover == finamApprEmp[1]){
		    				// 알람 보내기
				    		var repCOMPLETE_AlarmText = "reportTitle="+reportTitle;
				    		var repCOMPLETE_AlarmLink = "reportId="+reportId;
				    		var alarm_cont = "repCOMPLETE:+:"+empId+" 님이 사원님의 기안을 승인하셨습니다.";
			    			$.ajax({
			    				url		: "/alarm/alarmPostInsert",
			    				data	: { receiverId 		: '${reportVo.empId}',
			    							alarmCont 		: alarm_cont,
			    							alarmLinkCont	: repCOMPLETE_AlarmLink },
			    				dataType: "json",
			    				method	: "post",
			    				success	: function(data){
			    					sendMessage("repCOMPLETE" + "," + empId + "," + "${reportVo.empId}" + "," + repCOMPLETE_AlarmText + "," + repCOMPLETE_AlarmLink);
			    				},
			    				error	: function(xhr){ alert("error : " + xhr.status); }
			    			});
		    			}else{
		    				// 다음 결재자 정보
			    			var nextApprover = "";
			    			for(var i=0; i<apprInfoTemp.length; i++){
			    				var apprEmpInfo = apprInfoTemp[i].split(":~:");
			    				if(aprover == apprEmpInfo[0]){
			    					nextApprover = apprEmpInfo[1];
			    					break;
			    				}
			    			}
			    			console.log("다음 결재자 : ", nextApprover);
				    		// 알람 보내기
				    		var repNext_AlarmText = "reportTitle="+reportTitle;
				    		var repNext_AlarmLink = "reportId="+reportId;
				    		var alarm_cont = "repNext:+:결재할 기안이 있습니다.";
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
		    			}
				    	var dataUrl = $('#signImg').attr('src');
				 	    var signResult = '<img class="signResult" src='+dataUrl+' alt="공란">';
				 	    var d = new Date(); 
				 	    var currentDate = d.getFullYear() + "-" + ( d.getMonth() + 1 ) + "-" + d.getDate();
				 	    $('.sign').eq("${reportVo.reportSignList.size()}").html(signResult);
				 	    $('.date').eq("${reportVo.reportSignList.size()}").html(currentDate);
				    	$('#reportForm').attr('commandName', 'approvalVo');
				    	$('#reportSt').val('ing');
				    	$("#approvResult").val('Y');
				 	    $("#signInfo").val(dataUrl);
				 	    
				      	$('#reportForm').submit();
				      });
				      
				      //반려
				      $('#btnDecline').on('click', function(){
				    	  
				    	// 해당 기안의 최종승인이 반려시 알림기능
				    	// 알람 보내기
				    	var reportId = "${reportVo.reportId}";				// 해당 기안의 기안id
				    	var reportTitle = "${reportVo.title}";				// 해당 기안의 기안 제목
				    	var empId = "${EMP.empId}";							// 로그인한 사원
				    	
			    		var repCan_AlarmText = "reportTitle="+reportTitle;
			    		var repCan_AlarmLink = "reportId="+reportId;
			    		var alarm_cont = "repCancel:+:기안이 반려되었습니다.";
		    			$.ajax({
		    				url		: "/alarm/alarmPostInsert",
		    				data	: { receiverId 		: "${reportVo.empId}",
		    							alarmCont 		: alarm_cont,
		    							alarmLinkCont	: repCan_AlarmLink },
		    				dataType: "json",
		    				method	: "post",
		    				success	: function(data){
		    					sendMessage("repCancel" + "," + empId + "," + "${reportVo.empId}" + "," + repCan_AlarmText + "," + repCan_AlarmLink);
		    				},
		    				error	: function(xhr){ alert("error : " + xhr.status); }
		    			});	
				    	
				    	$('#reportForm').attr('commandName', 'approvalVo');
				    	$("#approvResult").val('N');
				    	var decline = $('#declineText').val();
				    	$('#approvText').val(decline);
				      	$('#reportForm').submit();  	  
				      });
				      
				      
				
					});

</script>
				
				
				
				
				
				
				
				
		</c:if>

	
</div>	<!-- /writer  -->
	
</body>
</html>