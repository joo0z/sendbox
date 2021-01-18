<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

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
			$('.typeId').val(typeId);
		}
		
		apprKind = "${approvLineVo.apprKind}"
		
		if(apprKind == ''){
			console.log('null');
			$('#approvLineDiv').hide();
		}
		//결재선 입력 버튼
		$('#writeBtn').on('click', function(){		
			$('#writeReportForm').submit();
		
		})
		//양식 설정시 스크립트
		$('img.typeIcon').on('click', function(){
			$('.typeIcon').css({"border" : "none"});
			$('.fa-check-circle').css({'visibility' : 'hidden'});
			$(this).css({"border" : "3px solid blue"});
			$(this).prev().css({'visibility' : 'visible'});
			var typeId = $(this).parents('td').data('typeid');
			console.log(typeId);
			$('#approvLineDiv').show();
			window.scrollTo(0,document.body.scrollHeight);
			$('.typeId').val(typeId);
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
			var html = $('#addEmpInfotbody').find('tr');
			console.log('tbody tr : '+html);
			for(var i = 0; i<html.length;i++){
				htmlList.push(html[i]);
			}
			console.log(htmlList);
			
			var approvTrNum = $('.approvTr').length;
			for(var i = 0; i< htmlList.length; i++){
				console.log("i점검 : "+i);
				var dept = $(htmlList[i]).find('.dept').text();
				var jobtitle = $(htmlList[i]).find('.jobtitle').text();
				var currname = $(htmlList[i]).find('.currname').text();
				var currid = $(htmlList[i]).find('.currname').data('currid');
				
				
				var step = approvTrNum + i +1;
				console.log("step 점검 :"+step);
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
			
			if($('.approvTr').length == 0){
				var html = '<tr><td colspan="5">결재라인을 추가해주세요</td></tr>';
				$('#approvLineResult').html(html);
			}
			
			$('input:checkbox').prop('checked', false);
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
		
		/*궁리*/
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
					$('.apprKind').val($('#newName').val());
					$('#newName').val('');
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
		
		$('#listEmpty').on('click', function(){
			console.log('clicked!!!!');
			$('#approvLineResult').empty();
			
			var html = '<tr><td colspan="5">결재라인을 추가해주세요</td></tr>';
			$('#approvLineResult').html(html);
			
			
		});
		
	});
	

</script>
<script>
	
		$(function(){
			
			$.ajax({
				url		: "/busiTree/businessTreeEmpDept",
				dataType: "json",
				method	: "post",
				success	: function(data){
					
					console.log("data : ", data);
					//조직도 자료
					var businessTreeList = data.businessTreeList;
					
					var TreeViewTag = "";
					
										for(var top=0; top<businessTreeList.length; top++){
											console.log(businessTreeList[top].upperDeptId);
						//사장인경우
						if(businessTreeList[top].upperDeptId == null){
							TreeViewTag += "	<li>";
							TreeViewTag += "		<span>"+businessTreeList[top].deptName+"</span>";
							TreeViewTag += "		<ul>";
							TreeViewTag += "			<li class='clickAddName' data-jobid="+businessTreeList[top].jobtitleId+" data-currid="+businessTreeList[top].empId+">"+businessTreeList[top].empNm+"["+businessTreeList[top].jobtitle+"]</li>";
							TreeViewTag += "		</ul>";
							
							var busiTop = businessTreeList[top].deptId;
							
							for(var i=0; i<businessTreeList.length; i++){
								
								if(businessTreeList[i].upperDeptId == busiTop){
									
									var busiBu = businessTreeList[i].deptId;
									
									TreeViewTag += "	<li>";
									TreeViewTag += "		<span>"+businessTreeList[i].deptName+"</span>";
									TreeViewTag += "		<ul>";
									TreeViewTag += "			<li class='clickAddName' data-jobid="+businessTreeList[i].jobtitleId+" data-currid="+businessTreeList[i].empId+">"+businessTreeList[i].empNm+"["+businessTreeList[i].jobtitle+"]</li>";
									TreeViewTag += "		</ul>";
									
									for(var j=0; j<businessTreeList.length; j++) {
										
										if(businessTreeList[j].upperDeptId == busiBu){
											var busiTeam = businessTreeList[j].deptId;
											
											TreeViewTag += "			<ul>";
											TreeViewTag += "				<li>";
											TreeViewTag += "					<span>"+businessTreeList[j].deptName+"</span>";
											TreeViewTag += "					<ul>";
											
											var teamCnt = 0;
											for(var k=0; k<businessTreeList.length; k++) {
												if(businessTreeList[k].deptId == busiTeam) {
													TreeViewTag += "				<li class='clickAddName' data-jobid="+businessTreeList[k].jobtitleId+" data-currid="+businessTreeList[k].empId+">"+businessTreeList[k].empNm+"["+businessTreeList[k].jobtitle+"]</li>";
													teamCnt++;
												}
											}
											j += teamCnt;
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
					$("#gray").append(TreeViewTag);
					$("#gray").treeview({collapsed: true});
				},
				error	: function(error){
					alert("error code : "+error.status);
				}
			});
			
			
			// 사원이 선택한 사원정보를 hidden 태그에 저장
			$("#gray").on("click", ".clickAddName", function(){
				$('.clickAddName').css({'color' : 'gray'});
				$(this).css({'color' : 'red'});
				$("#addEmpInfoId").val($(this).data('currid'));
				$("#addEmpInfoName").val($(this).text().split('[')[0]);
				$("#addEmpInfoDept").val($(this).parent().prev().text());
				$("#addEmpInfoJobtitle").val($(this).text().split('[')[1].split(']')[0]);
				$("#addEmpInfoJobId").val($(this).data('jobid'));
				
			});
			
			
			// add 버튼 클릭 액션
			$("#AddEmpBtn").on("click", function(){
				
				if($(".hiddenInfo").val() != ""){
					var addEmpTag = "";
					var addEmpInfoId = $("#addEmpInfoId").val()
					var addEmpInfoName = $("#addEmpInfoName").val()
					var addEmpInfoDept = $("#addEmpInfoDept").val()
					var addEmpInfoJobtitle = $("#addEmpInfoJobtitle").val()
					var addEmpInfoJobId = $("#addEmpInfoJobId").val()

					addEmpTag += "<tr class='addEmpInfotr' clicked=''>";
					addEmpTag += "<td class='addEmpInfoSpan dept'>"+addEmpInfoDept+"</td>";
					addEmpTag += "<td data-jobid="+addEmpInfoJobId+" class='addEmpInfoSpan jobtitle'>"+addEmpInfoJobtitle+"</td>";
					addEmpTag += "<td data-currid="+addEmpInfoId+" class='addEmpInfoSpan currname'>"+addEmpInfoName+"</td>";
					addEmpTag += "</tr>";
					$("#jojikdoSelectDiv table tbody").append(addEmpTag);
					$(".hiddenInfo").val("");
					$('.clickAddName').css({'color' : 'gray'});
				}else{
					alert("결재자를 선택해주세요.");
				}
				
			});
			
			
			isClicked = false;
			
			// remove 버튼 클릭 액션
			$("#addEmpInfotbody").on("click", "tr", function(){
				if($(this).attr('clicked') == ''){
					$(this).attr('clicked', 'clicked');
					$(this).css({'color' : 'red'});
				}else{
					$(this).attr('clicked', '');
					$(this).css({'color' : 'gray'});
				}
			});
			$("#RemoveEmpBtn").on("click", function(){
				$(".addEmpInfotr[clicked='clicked']").remove();
			});
			
			
			
			// 직급 정렬 버튼 클릭 액션
			$("#sortBtn").on("click", function(){
				
				var approveEmpList = $("#addEmpInfotbody .addEmpInfotr");
				console.log(approveEmpList);
				
				for(var i = 0; i< approveEmpList.length; i++){
					console.log($(approveEmpList[i]).find('td.jobtitle').data('jobid'));
				}
				
				// job title sorting
				for(var i=0; i<approveEmpList.length-1;){
					
					var tmpJobTitleId = $(approveEmpList[i]).find('.jobtitle').data('jobid');
					console.log("jobid : "+tmpJobTitleId);
					
					if(tmpJobTitleId > $(approveEmpList[i+1]).find('.jobtitle').data('jobid')){
						var temp = approveEmpList[i+1];
						approveEmpList[i+1] = approveEmpList[i];
						approveEmpList[i] = temp;
						i = 0;
					}else{
						i++;
					}
				}
				//정렬 후
				// refresh painting
				$("#addEmpInfotbody").empty();
				for(var i=0; i<approveEmpList.length; i++){
					$("#addEmpInfotbody").append(approveEmpList[i]);
				}
			});
			
			
			
			// 결재 라인 정보 부모 창에 넘기기
			/* $("#addAproveLineBtn").on("click", function(){
				if($("#jojikdoSelectDiv").text() != ""){
					var apprList = $("#jojikdoSelectDiv").text().split(".");
					var approveListInfo = [];
					for(var i=0; i<apprList.length-1; i++){
						approveListInfo.push(apprList[i]);
					}
					alert(approveListInfo);
				}else{
					alert("결재자를 추가해주세요");
				}
			}); */
			
		});
	
		
	</script>




</body>
</html>