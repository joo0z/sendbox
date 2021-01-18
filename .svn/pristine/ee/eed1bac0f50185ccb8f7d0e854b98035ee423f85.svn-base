<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet" href="/css/organChartCSS/screen.css" />
<link rel="stylesheet" href="/css/organChartCSS/jquery.treeview.css" />
<style>
	img.typeIcon{
		
		width : 200px;
		height :200px;
		border : 2px solid black;
		margin-right : 30px;
	
	}
	
	table{
		text-align :center;
		display : inline-block;
		margin-right : 50px;
		width : 700px;
	}
	
	td, th{
	width : 200px;
	height : 50px;
	}
	
	button{
		margin-left : 20px;
	}
	
	#typeTable{
		text-align : center;
	}
	
	div.modal-body{
		height : 100px;
	}
	
	div.loadApprDiv{
		width : 800px;
		height : 700px;
	}
	
	input[type=checkbox]{
		width : 18px;
		height : 18px;
		vertical-align: middle;
	}

</style>

<script>
	$(function(){
		
		console.log("${approvLineVo.empId}");
		console.log("${approvLineVo.typeId}");
		console.log("${approvLineVo.apprKind}");
		
		//전체 선택 / 해제 변수
		isChecked = false;
		//approverList = new Array();
		
		if("${approvLineVo.typeId != ''}"){
			td = $('td[data-typeid="${approvLineVo.typeId}"]');
			td.find('img.typeIcon').css({"border" : "3px solid blue"});
			td.find('i.fa-check-circle').css({'visibility' : 'visible'});
			window.scrollTo(0,document.body.scrollHeight);
			var typeId = "${approvLineVo.typeId}";
			$('#typeId').val(typeId);
		}
		
		apprKind = "${approvLineVo.apprKind}"
		
		if(apprKind == ''){
			console.log('null');
			$('#approvLineDiv').hide();
		}
		//결재선 입력 버튼
		$('#writeBtn').on('click', function(){		
			document.location = "/report/insertReport"
		
		})
		//양식 설정시 스크립트
		$('img.typeIcon').on('click', function(){
			$('.typeIcon').css({"border" : "2px solid black"});
			$('.fa-check-circle').css({'visibility' : 'hidden'});
			$(this).css({"border" : "3px solid blue"});
			$(this).prev().css({'visibility' : 'visible'});
			var typeId = $(this).parents('td').data('typeid');
			console.log(typeId);
			$('#approvLineDiv').show();
			window.scrollTo(0,document.body.scrollHeight);
			$('#typeId').val(typeId);
		})
		
		//불러오기 버튼
		$("#btnLoad").on('click', function(){
			$('#approvLineForm').submit();
		})
		//양삭 재설정 버튼
		$('#btnScrollUp').on('click', function(){
			window.scrollTo(100,document.body);
		})
		
		//전체 선택/해제
		$('#checkAll').on('click', function(){
			if(isChecked == false){
				$('.apprLineCheck').prop('checked', true);
				isChecked = true;
			}else{
				$('.apprLineCheck').prop('checked', false);
				isChecked = false;			
			}
		})
		
		//결재자 추가
		$('#addApprover').on('click', function(){
			var htmlList = new Array();
			var html = $('input:checkbox.approverCheck:checked').parents('tr');
			for(var i = 0; i<html.length;i++){
				htmlList.unshift(html[i]);
			}
			console.log(htmlList);
			
			var approvTrNum = $('.approvTr').length;
			for(var i = 0; i< htmlList.length; i++){
				console.log("i점검 : "+i);
			/* 	var approver =  {
					dept : "",
					jobtitle : "",
					currid  : "",
					currname : "",
					nextid : "",
					nextname : "",
					step : ""	
				} */
				var dept = $(htmlList[i]).find('.dept').text();
				var jobtitle = $(htmlList[i]).find('.jobtitle').text();
				var currname = $(htmlList[i]).find('.currname').text();
				var currid = $(htmlList[i]).find('.currname').data('currid');
				
				/* if(i == html.length - 1 ){
					approver.nextid = $(htmlList[i]).find('.currname').data('currid');
					approver.nextname = $(htmlList[i]).find('.currname').text();		
				}else{
					approver.nextid = $(htmlList[i+1]).find('.currname').data('currid');
					approver.nextname = $(htmlList[i+1]).find('.currname').text();					
				} */
				
				var step = approvTrNum + i +1;
				console.log("step 점검 :"+step);
				/* approverList.push(approver); */
				var code = "";
				code += "<tr class='approvTr'>"
							+"<td><input type='checkbox' class='apprLineCheck'></td>"
							+"<td class='step'>"+step+"</td>"
							+"<td class='dept'>"+dept+"</td>"
							+"<td class='jobtitle'>"+jobtitle+"</td>"		
							+"<td class='currEmpId' data-currid="+currid+">"+currname+"</td>"
							+"</tr>"
				if($('.approvTr').length == 0){
					$('#approvLineResult').empty();
				}			
							
				$('#approvLineResult').append(code);
			}
			
			$('.approverCheck').prop('checked', false);
			/* for(var i in approverList){
				var dept = approverList[i].dept;
				var jobtitle = approverList[i].jobtitle;
				var currname = approverList[i].currname;
				var currid = approverList[i].currid;
				var step = approverList[i].step;
			}
			console.log(approverList);
		/* 	for(var i = 0; i < text.length; i++){
				console.log(text[i]);
				//$('#approvLineResult').append(html[i]);
			} */
		})
		
		
		//결재자 삭제
		$('#deleteApprover').on('click', function(){
		
			var approvTr = $('.approvTr');
			var checkedItem = $('input:checkbox.apprLineCheck:checked').parents('tr');
			var step  = new Array();
			for(var i = 0; i < checkedItem.length; i++){
				step.unshift( parseInt($(checkedItem[i]).find('td.step').text()));
			}
			console.log(checkedItem);
			console.log(step);
			
			for(var i=0; i < step.length; i++){
				console.log(step[i]);
				var index = step[i];
				
				for(var j = step[i]; j < approvTr.length ; j++){
					console.log("loop!!");
					var num = parseInt($('.approvTr').eq(j).find('td.step').text())-1;
					console.log(num);
					$('.approvTr').eq(j).find('td.step').text(num);
				}
			}
			
			for(var i = 0; i< checkedItem.length; i++){
				$(checkedItem[i]).remove();
			}
		})
		
		//결재선 순서 변경(올리기)
		$('#upApprovLine').on('click', function(){
			var checkedItem = $('input:checkbox.apprLineCheck:checked').parents('tr');
			var step  = new Array();
			for(var i = 0; i < checkedItem.length; i++){
				step.unshift(checkedItem[i]);
			}
			console.log($(step[0]).prev());
			//처음이 포함 될때
			
			for(var i = 0; i< step.length; i++){
				if($(step[i]).prev().length != 0 && $(step[i]).prev().find('.apprLineCheck').prop('checked') == false){
					var temptext = $(step[i]).prev().find('.step').text();
					$(step[i]).prev().find('.step').text($(step[i]).find('.step').text());
					$(step[i]).find('.step').text(temptext);
					$(step[i]).insertBefore($(step[i]).prev());
				}
			}
		})
		
		//결재선 순서 변경(내리기)
		$('#downApprovLine').on('click', function(){
			var checkedItem = $('input:checkbox.apprLineCheck:checked').parents('tr');
			var step  = new Array();
			for(var i = 0; i < checkedItem.length; i++){
				step.push(checkedItem[i]);
			}
			console.log($(step[0]).next());
			//끝이 포함 될때
			
			for(var i = 0; i< step.length; i++){
				if($(step[i]).next().length != 0 && $(step[i]).next().find('.apprLineCheck').prop('checked') == false){
					var temptext = $(step[i]).next().find('.step').text();
					$(step[i]).next().find('.step').text($(step[i]).find('.step').text());
					$(step[i]).find('.step').text(temptext);
					$(step[i]).insertAfter($(step[i]).next());
				}
			}
		})
		
		//해제 텍스트 클릭시 체크 박스 모두 해제
		deselect = function(){
			$('.apprLineCheck').prop('checked', false);	
		}
		
		
		$('#btnSave').on('click', function(){
			
			var approvTrList = $('.approvTr');
			var param = {};
			for(var i=0; i < approvTrList.length; i++){
				param['approvLineList['+i+'].apprStep'] = $(approvTrList[i]).find('td.step').text();
				param['approvLineList['+i+'].apprCurrEmp'] = $(approvTrList[i]).find('td.currEmpId').data('currid');
				param['approvLineList['+i+'].empId'] = "${EMP.empId}";
				param['approvLineList['+i+'].apprKind'] = $('#newName').val();
				var j = i+1 == approvTrList.length ? i : i+1;
				param['approvLineList['+i+'].apprNextEmp'] = $(approvTrList[j]).find('td.currEmpId').data('currid');
			}
			
			$.ajax({
				url : '/report/saveApprovLine',
				data : param,
				type : 'post',
				dataType: 'json',
				success : function(res){
					$('#approvLineName').val($('#newName').val());
					alert(res.message);
				}
			});
			$('#saveApprovLineModal').modal('hide');
			console.log(param);
			
			
			
			
		})
		
		$('#loadApprovLineList').on('click', function(){
			$.ajax({
				url : '/report/loadApprovLine',
				data : {empId : "${EMP.empId}"},
				type : 'post',
				success : function(res){
					$('#approvLineTemplate').html(res);
				}
			});
		});
		
	});


</script>
<!-- 문서 양식 설정 화면  -->
		<div id="typeDiv">
			<h2>문서 양식 선택</h2>
			<hr>
			
			<div id="typeTable">
				<table>
					<c:set var="unit" value="4"/>
					<c:forEach begin="0" end="${reportTypeList.size()/unit }" var="i" step="1">
						<tr>
							<c:set var="endPoint" value="${i * unit + unit -1 }"/>
							<c:forEach begin="${i * unit }" end="${endPoint >= reportTypeList.size()-1 ? reportTypeList.size()-1 : endPoint }" step="1" var="j">
								<td data-typeid="${reportTypeList[j].typeId }">
									<label><i class="fas fa-check-circle" style="margin: 0px; float: left; position: relative; top : 30px; left: 15px; z-index:2; visibility: hidden;"></i><img class="typeIcon" alt="${reportTypeList[j].typeNm }" src="/images/123.png"></label><br>
									<span>${reportTypeList[j].typeNm }</span>
								<td>
							</c:forEach>
						</tr>				
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 결재선 설정 메뉴바  -->
		<div id="approvLineDiv">
			<h2>결재선 설정</h2>
			<button type="button" id="btnScrollUp" style="float : right;">양식 재설정</button>
			<br>
			<hr>
			<div style="border : 2px solid black; text-align: center;">
					결재라인명 :&nbsp;
					<input type="text" id="approvLineName" name="apprKind" value="${approvLine[0].apprKind }" readonly>
					<!-- Button trigger modal -->
					<button type="button" id="saveApprovLine" class="btn btn-primary" data-toggle="modal" data-target="#saveApprovLineModal">
					  저장
					</button>
					<button type="button" id="loadApprovLineList" class="btn btn-primary" data-toggle="modal" data-target="#loadApprovLineModal">
					  불러오기
					</button>
					
					<button type="button" id="upApprovLine">⇧</button>
					<button type="button" id="downApprovLine">⇩</button>
					
					<button type="button" id="addApprover">결재자 추가</button>
					<button type="button" id="deleteApprover">삭제</button>
					
				<form action="">
					
				</form>
			</div>
			<br>
			<!-- 결재선 결과 화면  -->
			<div style="border : 2px solid black; text-align: center;">
				<br>
				<table id="approvLinetable" border="1" style="vertical-align: top;">
					<thead>
						<tr>
							<th>전체 선택/<a href="javascript:deselect()">해제</a>
							&nbsp;<input type="checkbox" id="checkAll" ></th>
							<th>순서</th>
							<th>부서명</th>
							<th>직급</th>
							<th>결재자</th>
						</tr>
					</thead>
					<tbody id="approvLineResult">
						
						<c:if test="${approvLine == null }">
							<tr><td colspan="5">결재라인을 추가해주세요</td></tr>
						</c:if>
						
						<c:forEach items="${approvLine }" var="apprLine">
							<tr class="approvTr">
								<td><input type="checkbox" class="apprLineCheck"></td>
								<td class="step">${apprLine.apprStep }</td>
								<td class="dept">${apprLine.currDeptNm }</td>
								<td class="jobtitle">${apprLine.currJobNm }</td>
								<td class="currEmpId" data-currid="${apprLine.apprCurrEmp}">${apprLine.currEmpNm }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- 조직도 이용 결재선 추가 화면  -->
				<table border="1">

					<thead>
						<tr>
						<th>부서</th>
						<th>직급</th>
						<th>이름</th>	
						<th>선택</th>									
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="dept">개발팀</td>
							<td class="jobtitle">팀장</td>
							<td data-currid="emp1000" class="currname">김길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
					
						<tr>
							<td class="dept">인사과</td>
							<td class="jobtitle">과장</td>
							<td data-currid="emp1001" class="currname">고길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
						
						<tr>
							<td class="dept">기획팀</td>
							<td class="jobtitle">팀장</td>
							<td data-currid="emp1002" class="currname">신길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
						
						<tr>
							<td class="dept">영업관리팀</td>
							<td class="jobtitle">팀장</td>
							<td data-currid="emp1003" class="currname">유길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
					
						<tr>
							<td class="dept">개발/기획부</td>
							<td class="jobtitle">부장</td>
							<td data-currid="emp1004" class="currname">이길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
						
						<tr>
							<td class="dept">영업부</td>
							<td class="jobtitle">부장</td>
							<td data-currid="emp1005" class="currname">구길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
						
						<tr>
							<td class="dept">총무과</td>
							<td class="jobtitle">과장</td>
							<td data-currid="emp1006" class="currname">박길동</td>
							<td><input type="checkbox" class="approverCheck"></td>
						</tr>
						
					</tbody>
				</table>
			</div>
						
			<br>
			<div style="float: right;"><input type="button" id="writeBtn" value="문서 작성"></div>
						
			<div style="display: inline-block; float : left;">
			</div>
		
		
			<!-- 결재라인 저장 Modal -->
			<div class="modal fade" id="saveApprovLineModal" tabindex="-1" role="dialog" aria-labelledby="saveApprovLineTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="saveApprovLineTitle">결재라인 저장</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" style="vertical-align: middle;">
			        	 새 이름 설정 : <input type="text" id="newName" value="">
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="btnSave" class="btn btn-primary">저장</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
		
			<!-- 결재라인 불러오기 Modal -->
			<div class="modal fade bd-example-modal-lg" id="loadApprovLineModal" tabindex="-1" role="dialog" aria-labelledby="loadApprovLineTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="loadApprovLineTitle">결재라인 불러오기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body loadApprDiv" style="overflow : auto;">
			      	<form:form id="approvLineForm" commandName="approvLineVo" action="/report/settingView" method="post" >
		      			<input type="hidden"  name="empId" value="${EMP.empId}">
		      			<input type="hidden" id="typeId" name="typeId" value="${approvLineVo.typeId }">
		      			<div id="approvLineTemplate">
		      				
		      			</div>
		      		</form:form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="btnLoad" class="btn btn-primary">불러오기</button>
			        <button type="button" class="btn btn-secondary btnCancel" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>		
		</div>