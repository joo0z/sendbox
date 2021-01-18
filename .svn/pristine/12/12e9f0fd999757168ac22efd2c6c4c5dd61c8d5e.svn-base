<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>투표 게시글</title>

    <!-- Custom styles for this page -->
    <link href="/admin2form/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<!-- Custom fonts for this template -->
    <link href="/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
	
	
		
	<!-- 도넛 차트 라인 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous">
	</script> 
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  -->
<!-- 		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"  -->
<!-- 		crossorigin="anonymous"> -->
<!-- 	</script> -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script> 
	$(function(){
		
		var itemLen = parseInt("${voteItemNmList.size()}");		// 해당 투표 게시글의 선택가능한 투표항목 갯수
		var voteItemNameList = "${voteItemNmList}";				// 해당 투표 게시글의 투표항목 이름
		var voteItemCodeList = "${voteItemCodeList}";			// 해당 투표 게시글의 투표항목 번호
		
		var empVoteCodeList = "${empVoteCodeList}";				// 해당 투표 게시글에 사원들이 투표한 투표항목번호 리스트
		var empVoteEmpIdList = "${empVoteEmpIdList}";			// 해당 투표 게시글에 투표한 사원id 리스트
		
		// voteItemNameList ==> voteItemNameArr // 목록 이름 리스트
		var tempVoteItemName1 = voteItemNameList.split("[");
		var tempVoteItemName2 = tempVoteItemName1[1].split("]");
		var voteItemNameArr = tempVoteItemName2[0].split(", ");
		console.log("목록 이름 리스트 ==> ", voteItemNameArr);
		
		// voteItemCodeList ==> voteItemCodeArr // 목록 번호 리스트
		var tempVoteItemCode1 = voteItemCodeList.split("[");
		var tempVoteItemCode2 = tempVoteItemCode1[1].split("]");
		var voteItemCodeArr = tempVoteItemCode2[0].split(", ");
		console.log("목록 번호 리스트 ==> ", voteItemCodeArr);
		
		
		var empVoteItemCodeArr = [];	// 모든 사원의 선택항목 리스트
		var empVoteEmpIdArr = []		// 투표한 사원id 리스트
		if(empVoteCodeList != ""){
			
			// empVoteCodeList ==> empVoteCodeArr // 모든 사원의 선택항목 리스트
			var tempEmpVoteItemSeq1 = empVoteCodeList.split("[");
			var tempEmpVoteItemSeq2 = tempEmpVoteItemSeq1[1].split("]");
			empVoteItemCodeArr = tempEmpVoteItemSeq2[0].split(", ");
			console.log("모든 사원의 선택항목 리스트 ==>",empVoteItemCodeArr);
			
			// empVoteEmpIdList ==> empVoteEmpIdArr // 투표한 사원id 리스트
			var tempEmpVoteEmpId1 = empVoteEmpIdList.split("[");
			var tempEmpVoteEmpId2 = tempEmpVoteEmpId1[1].split("]");
			empVoteEmpIdArr = tempEmpVoteEmpId2[0].split(", ");
			console.log(empVoteEmpIdArr);
		}
		
		var colorarray = ["#333333", "#00FF99", "#00CCFF", "#FF9933", "#9933FF", " #473E3F"];
		var dataList = [];
		var labelList = [];
		var bgColorList = [];
		
		if(empVoteItemCodeArr.length > 0){	// 해당 투표 게시글의 투표리스트가 0이상인 경우 실행
			
			var itemCountList = [];
			
			// 해당 투표 게시글에 투표한 사원들의 투표 정보 리스트
			for(var item=0; item<itemLen; item++){
				var itemCount = 0;
				for(var reple=0; reple<empVoteItemCodeArr.length; reple++){
					if(voteItemCodeArr[item] == empVoteItemCodeArr[reple]){
						itemCount++;
					}
				}
				// 해당 목록의 갯수를 태그요소의 text에 지정
				var tagId = "#"+voteItemCodeArr[item];
				var percent = (itemCount/empVoteItemCodeArr.length*100).toFixed(2);
				$(tagId).text(percent);
				dataList.push(itemCount);
				itemCountList.push(itemCount);
			}
			
			// 해당 투표 게시글의 항목 리스트
			for(var i=0; i<itemLen; i++) {
				labelList.push(voteItemNameArr[i]);	// item name
				bgColorList.push(colorarray[i]);	// item color
			}
			
			var bestItem = "";
			var worstItem = "";
			var itemNmList = voteItemNameArr.slice();
			var BWArr = itemCountList.slice();
			for(var i=0; i<BWArr.length-1;){
				if(parseInt(BWArr[i]) > parseInt(BWArr[i+1])){
					
					var temp1 = BWArr[i];
					BWArr[i] = BWArr[i+1];
					BWArr[i+1] = temp1;
					
					var temp2 = itemNmList[i];
					itemNmList[i] = itemNmList[i+1];
					itemNmList[i+1] = temp2;
					i = 0;
				}else{
					i++;
				}
			}
			$("#bestItem").text(itemNmList[BWArr.length-1]);
			$("#worstItem").text(itemNmList[0]);
		}else{
			// 해당 투표 게시글에 투표한 사원들의 투표 정보 리스트
			for(var item=0; item<itemLen; item++){
				// 해당 목록의 갯수를 태그요소의 text에 지정
				var tagId = "#"+voteItemCodeArr[item];
				$(tagId).text(0);
				dataList.push(0);
			}
			dataList.push(1);
			
			// 해당 투표 게시글의 항목 리스트
			for(var i=0; i<itemLen; i++) {
				labelList.push(voteItemNameArr[i]);	// item name
				bgColorList.push(colorarray[i]);	// item color
			}
		}
		
		dataInfo = {
			datasets: [{ 
				backgroundColor: bgColorList, 
				data: dataList,
			}], // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
			labels: labelList,
		}
		console.log("임시 data : ", dataInfo)
		
		// 도넛형 차트 
		var ctx2 = document.getElementById("myChart2"); 
		var myDoughnutChart = new Chart(ctx2, { 
			type: 'doughnut', 
			data: dataInfo, 
			options: {
				responsive: false,
				maintainAspectRatio: false,
		    	tooltips: {
			        displayColors: false,
				},
		        legend: { display: true },
		      	cutoutPercentage: 50,
			},
		});
		
		
		
		
		
		// 목록 페이지로 이동
		$("#backBtn").on("click", function(){
			var myORall = "${param.myORall}";
			if(myORall == "all"){
				document.location = "/vote/votePostListView";
			}else if(myORall == "my"){
				document.location = "/vote/myVotePostListView";
			}
		});
		
		// 댓글 작성
		$("#voteRepleInsertBtn").on("click", function(){
			var voteRepleCont = $("#voteRepleContent").val();
			if(voteRepleCont != ""){
				$("#voteRepleWriteForm").attr("action", "/vote/voteRepleRegist");
				$("#voteRepleWriteForm").attr("method", "post");
				$("#voteRepleWriteForm").submit();
			}else{
				alert("댓글 내용을 입력해주세요.")
			}
		});
		
		// 항목 라디오 버튼 클릭 ==> 항목 선택
		$("#voteItemTableView").on("click", ".voteItemTR",  function(){
			$(".voteItemTR").find("td").css("backgroundColor", "white");
			$(".voteItemTR").find(".checkedImgClass").attr("src", "/images/checkImg/unchecked_re.png");
			
			$(this).find(".inputRadioVoteItem").prop("checked", true);
			$(this).find("td").css("backgroundColor", "Lightyellow");
			$(this).find(".checkedImgClass").attr("src", "/images/checkImg/checked_re.png");
		});
		
		// 선택한 항목을 controller에 전달
		$("#voteEmpInsertBtn").on("click", function(){
			var empVoteTF = false;
			var voteItemCode = $(".inputRadioVoteItem:checked").parents(".voteItemTR").data("voteitemcode");
			for(var i=0; i<empVoteEmpIdArr.length; i++){
				if("${EMP.empId}" == empVoteEmpIdArr[i]){
					empVoteTF = true;
					break;
				}
			}
			
			// 투표를 아직 하지 않은 사원일 경우 실행
			if(empVoteTF == false){
				
				var voteEmpId = "${votePost.empId}";
				var empId = "${EMP.empId}";
				
				// 채팅알람을 모든인원의 알람테이블에 저장(insert)
				// 투표를 생성한 본인에게는 알람이 가지 않도록 처리
				if(voteEmpId == empId){
				}else{
					var alarm_cont = "voteEmp" + ":+:" + "${EMP.empNm}님이 투표를 하셨습니다.";
	    			console.log(alarm_cont);
	    			
	    			var voteEmpAlarmLink = "/vote/votePostView?myORall=all&votePostSeq=${votePost.votePostSeq}";
	    			$.ajax({
	    				url		: "/alarm/alarmPostInsert",
	    				data	: { receiverId 		: '${votePost.empId}',
	    							alarmCont 		: alarm_cont,
	    							alarmLinkCont	: voteEmpAlarmLink },
	    				dataType: "json",
	    				method	: "post",
	    				success	: function(data){
	    					sendMessage("voteEmp" + "," + "${EMP.empId}" + "," + "${votePost.empId}" + "," + "투표" + "," + "투표작성입니다.");
	    				},
	    				error	: function(error){ alert("error : " + error.status); }
	    			});
				}
    			
    			$("#voteItemCode").val(voteItemCode);
				$("#votePostSeq").val("${votePost.votePostSeq}");
				$("#votePostEmpInsertForm").attr("method", "post");
				$("#votePostEmpInsertForm").attr("action", "/vote/voteEmpInsert");
				$("#votePostEmpInsertForm").submit();
			}else{
				alert("이미 한번 투표하셨습니다.");
				$("#VoteEmpInsertModal").modal("hide");
			}
		});
		
		// 투표 철회 액션 함수
		$("#cancelVotePostBtn").on("click", function(){
			var myORall = "${param.myORall}";
			document.location = "/vote/votePostCancel?myORall="+myORall+"&votePostSeq=${votePost.votePostSeq}";
		});
		
		// 투표 채택 액션 함수
		$("#compVotePostBtn").on("click", function(){
			var myORall = "${param.myORall}";
			document.location = "/vote/votePostCompleate?myORall="+myORall+"&votePostSeq=${votePost.votePostSeq}";
		});
	});
	</script>	
	
 
</head>


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="date"/>

<fmt:parseNumber value="${date }" var="toDay"></fmt:parseNumber>
<fmt:parseNumber value="${votePost.votePostEndDt }" var="endDtNum"></fmt:parseNumber>
						
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
                    <h2 class="h3 mb-2 text-gray-800" style="display: inline;">
                    <i class="fas fa-vote-yea" style="margin-left: 10px; "></i>&nbsp&nbsp ${votePost.votePostTitle } </h2>
                    <br><br>
					<div class="card shadow mb-4">


				
						<c:if test="${votePost.votePostSt == 'COM'}">
							<div class="ribbon-wrapper">
								<div class="ribbon-front" 
								     style="background: #52BE80; font-size: 25px; color: white;">
									<!-- ribbon text goes here -->
									&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;
									COMPLETE
								</div>
								<div class="ribbon-edge-topleft" style="border-color: transparent #229954 transparent transparent;"></div>
								<div class="ribbon-edge-topright" style="border-color: transparent transparent transparent #229954;"></div>
								<div class="ribbon-edge-bottomleft" style="border-color: transparent #229954 transparent transparent;"></div>
								<div class="ribbon-edge-bottomright" style="border-color: transparent transparent transparent #229954;"></div>
								<div class="ribbon-back-left"></div>
								<div class="ribbon-back-right"></div>
							</div>
						</c:if>
						<c:if test="${votePost.votePostSt == 'CAN'}">
							<div class="ribbon-wrapper">
								<div class="ribbon-front" 
									 style="background: #EC7063; font-size: 25px; color: white;">
									<!-- ribbon text goes here -->
									&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;
									CANCEL
								</div>
								<div class="ribbon-edge-topleft" style="border-color: transparent #CB4335 transparent transparent;"></div>
								<div class="ribbon-edge-topright" style="border-color: transparent transparent transparent #CB4335;"></div>
								<div class="ribbon-edge-bottomleft" style="border-color: transparent #CB4335 transparent transparent;"></div>
								<div class="ribbon-edge-bottomright" style="border-color: transparent transparent transparent #CB4335;"></div>
								<div class="ribbon-back-left"></div>
								<div class="ribbon-back-right"></div>
							</div>
						</c:if>
						<c:if test="${votePost.votePostSt == 'ING' and endDtNum < toDay}">
							<div class="ribbon-wrapper">
								<div class="ribbon-front" 
									 style="background: #CACFD2; font-size: 25px; color: white;">
									<!-- ribbon text goes here -->
									&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;
									DEADLINE
								</div>
								<div class="ribbon-edge-topleft" style="border-color: transparent #A6ACAF transparent transparent;"></div>
								<div class="ribbon-edge-topright" style="border-color: transparent transparent transparent #A6ACAF;"></div>
								<div class="ribbon-edge-bottomleft" style="border-color: transparent #A6ACAF transparent transparent;"></div>
								<div class="ribbon-edge-bottomright" style="border-color: transparent transparent transparent #A6ACAF;"></div>
								<div class="ribbon-back-left"></div>
								<div class="ribbon-back-right"></div>
							</div>
						</c:if>
					
					
					
					
					
					
						<!-- 상단 화면 (투표정보) -->
						<table id="votePostInfoTable">
							<tr class="voteTopAndCenterLine">
								<td class="votePostViewLeft">
								
									<table id="votePostInfoViewTable" style="border-radius: 0px 20px 20px 20px;">
										
										<tr class="votePostTitleLine" style="font-size: 12px; text-align: center; height: 10%;">
											<td style="width: 20%;">투표상태 : 
												
												<c:if test="${votePost.votePostSt == 'COM'}">
													<span style="color: white; background: green; border-radius: 20%; padding: 5px;">채택됨</span>
												</c:if>
												<c:if test="${votePost.votePostSt == 'CAN'}">
													<span style="color: white; background: red; border-radius: 20%; padding: 5px;">철회됨</span>
												</c:if>
												<c:if test="${endDtNum >= toDay and votePost.votePostSt == 'ING'}">
													<span style="color: white; background: blue; border-radius: 30%; padding: 5px;">진행중</span>
												</c:if>
												<c:if test="${endDtNum < toDay and votePost.votePostSt == 'ING'}">
													 <span style="color: white; background: gray; border-radius: 20%; padding: 5px;">마감</span>
												</c:if>
											</td>
											<td style="width: 15%;">진행자 : ${votePost.empNm }</td>
											<td style="width: 30%; margin-left: 2px;">
												기간 : 
												<fmt:parseDate value="${votePost.votePostStartDt }" var="startDt" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${startDt }" pattern="yy-MM-dd"/>
												 ~ <fmt:parseDate value="${votePost.votePostEndDt }" var="endDt" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${endDt }" pattern="yy-MM-dd"/>
											</td>
											<td style="width: 15%;">참여자 : 
												<c:choose>
													<c:when test="${empVoteList != null}">
													${empVoteList.size() } 명
													</c:when>
													<c:otherwise>
													0 명
													</c:otherwise>
												</c:choose>
											</td>
											<td style="width: 20%;"></td>
										</tr>
										<tr style="color: black;">
											<td colspan="5">
												<table style="height: 90%; width: 90%; margin-left: auto; margin-right: auto;">
													<tr>
														<td style="padding-left: 10%; padding-right: 10%; border-radius: 20px; background: #F1F1F1; width: 95%;">
															<span style="font-size: 20px;">${votePost.votePostCont }</span>
														</td>
													</tr>
													<tr style="height: 10px;"></tr>
													<tr>
														<td style="padding-left: 10%; border-radius: 20px; background: #F1F1F1;  width: 95%;">
															<span>현재 투표상태</span><br>
															<span>다수의 사원이 <span id="bestItem"></span> 의견을(를) 지지합니다.<br>소수의 사원이 <span id="worstItem"></span> 의견을(를) 지지합니다.</span>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							
							
								<td class="votePostViewRight" style="width: 45%;">
								
									<div class="card-body" style="width: 100%; padding-left: 1px;">
										<div class="table-responsive" style="width: 100%;">
											<div class="card" style="width: 450px; margin-left: 10%;"> 
												<div class="card-body"> 
													<canvas id="myChart2" width="400" height="300"></canvas> 
												</div>
											</div>
											<div>
												<!-- 투표목록 뷰 -->
												<c:forEach items="${voteItemList }" var="voteItem">
													<div style="font-size: 15px; margin-left: 10%;">
														${voteItem.voteItemNm } : <span id="${voteItem.voteItemCode}"></span> %
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								
								
								</td>
							</tr>
						</table>
					</div>


										
					<input type="hidden" name="votePostSeq" value="${votePost.votePostSeq }"/>
				 	<input type="hidden" name="votePostTitle" value="${votePost.votePostTitle }"/>
				 	
				 	<br><br>
				 	<input id="backBtn" type="button" class="btn btn-left" value="목록" 
				 			style="display:inline; margin-right: 10px; float: left; background: #104467; color: white;"/>
				 	<div style="margin-right: 10%;">
					 	<c:if test="${votePost.votePostSt == 'ING'}">
						 	<c:if test="${EMP.empId == votePost.empId and endDtNum >= toDay}">
							 	<input type="button" data-toggle="modal" data-target="#delVotePostModal" class="btn btn-danger" value="투표 철회" style="float: right; margin-left: 10px;"/>
							 	<input type="button" id="compVotePostBtn" class="btn btn-success" value="투표채택" style="float: right;"/>
						 	</c:if>
						 	<c:if test="${votePost.votePostSt != 'COM' and votePost.votePostSt != 'CAN' and endDtNum >= toDay}">
							 	<input type="button" id="voteEmpModalBtn" data-toggle="modal" data-target="#VoteEmpInsertModal" class="btn btn-primary" value="투표하기" style="float: right; margin-right: 10px;"/>
						 	</c:if>
					 	</c:if>
				 	</div>	
					<br><br><br>
					
	                <div id="repleDivParent">
	                	<div id="repleDivHeader"><span>댓글 목록</span></div>
						<div id="repleDivBody" style="margin-left: 3%;">
						
							<c:if test="${voteRepleList.size() > 0 and voteRepleList != null}">
							
							
							
								<c:forEach var="i" begin="0" end="${voteRepleList.size()-1}" step="1">
									<div class="showVoteRepleDiv" 
										style="color: black; background: #F1F1F1; 
										border-radius: 20px; padding: 20px; font-size: 15px; font-family: inherit;
										width: 90%;">
										<input type="hidden" class="repleSeq" name="repleSeq" value="${voteRepleList.get(i).voteRepleSeq }" />
										${voteRepleList.get(i).empNm } ${commuRepleEmpTitleList.get(i) }
										<div style="float: right;">
											작성일자 : ${voteRepleList.get(i).voteRepleDt }
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<c:if test="${voteRepleList.get(i).empId == EMP.empId}">
												<c:if test="${voteRepleList.get(i).voteRepleSt == 'Y' }">
													<button type="button" class="btn btn-danger delRepleBtn" 
													 data-toggle="modal" data-target="#delVoteRepleModal"
													style="float: right; margin-right: 5px; margin-top: -5px;">삭제</button>											
												</c:if>
											</c:if>
										</div>
										
										<br><br>
										<c:choose>
											<c:when test="${voteRepleList.get(i).voteRepleSt == 'Y'}">
												<span>${voteRepleList.get(i).voteRepleCont }</span>
											</c:when>
											<c:when test="${voteRepleList.get(i).voteRepleSt == 'N'}">
												<span>삭제된 댓글 입니다.</span>
											</c:when>
										</c:choose>
									</div>
									<br>
								</c:forEach>
								
								
								
								
							</c:if>
							
							
						</div>
	                	<hr>
	                	
	                	
	                	
	                	
	                	<!-- 사원이 해당 투표 게시글에 투표했을 경우 DB에 저장함과 동시에 알람 전송 -->
	                	<form id="votePostEmpInsertForm">
							<input type="hidden" name="myORall" value="${param.myORall}"/>
	                		<input type="hidden" id="votePostSeq" name="votePostSeq" />
	                		<input type="hidden" id="voteItemCode" name="voteItemCode" />
	                	</form>
	                	
	                	<!-- 사원의 해당 투표 게시글에 댓글 작성시 액션 -->
						<form id="voteRepleWriteForm">
							<input type="hidden" name="myORall" value="${param.myORall}"/>
							<input type="hidden" name="votePostSeq" value="${votePost.votePostSeq }"/>
							<div id="writeVoteRepleDiv" style="margin-left: 3%;">
								<textarea id="voteRepleContent" name="voteRepleCont" rows="3" cols="10" style="resize: none;"></textarea>
								<button type="button" id="voteRepleInsertBtn" class="btn"style="background-color: white;">등록</button>
							</div>
						</form>
	                	<hr>
	                	
	                </div>
	                
	                
	                
	                
	                <!-- post vote Modal -->
					<div class="modal fade" id="VoteEmpInsertModal" tabindex="-1" role="dialog" aria-labelledby="VoteEmpInsertModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="VoteEmpInsertModalLabel">투표하기</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <div align="center">
					        	<div style="text-align: center;">투표 목록</div>
					        	<br><br>
					        	<table id="voteItemTableView">
						        	<c:forEach var="i" begin="0" end="${voteItemList.size()-1}" step="1">
									<tr class="voteItemTR" data-voteitemcode="${voteItemList.get(i).voteItemCode }" 
										style="padding: 20px;">
						        		<td class="voteItemNmTd">${voteItemList.get(i).voteItemNm }</td>
						        		<td class="voteItemRadioBtnTd" style="width: 20px;">
							        		<input type="radio" class="inputRadioVoteItem" name="voteItem" value="test" />
							        		<img class="checkedImgClass" src="/images/checkImg/unchecked_re.png"/>
						        		</td>
					        		</tr>
						        	</c:forEach>
					        	</table>
					        	<br><br><br><br>
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="voteEmpInsertBtn" class="btn btn-success">투표</button>
					        <button type="button" class="btn" data-dismiss="modal" style="background: #104467; color: white;">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
	                
	                
	                
	                
	                
	                
	                
	                
	                
	                
	                
	                <!-- votePost delete Modal -->
					<div class="modal fade" id="delVotePostModal" tabindex="-1" role="dialog" aria-labelledby="delVotePostModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="delVotePostModalLabel">투표 철회</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <div align="center">
					        	<p>정말로 투표를 철회하시겠습니까?</p>
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="cancelVotePostBtn" class="btn btn-danger">철회</button>
					        <button type="button" class="btn" data-dismiss="modal" style="background: #104467; color: white;">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					
					<!-- reple delete Modal -->
					<div class="modal fade" id="delVoteRepleModal" tabindex="-1" role="dialog" aria-labelledby="delVoteRepleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="delVoteRepleModalLabel">댓글 삭제</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <div align="center">
					        	<p>정말로 댓글을 삭제하시겠습니까?</p>
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="delVoteRepleBtn" class="btn btn-danger">삭제</button>
					        <button type="button" class="btn" data-dismiss="modal" style="background: #104467; color: white;">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
				
				
				
				
				
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


	
<style>
	.front{
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
		width: 200px;
	}
		
	#votePostInfoTable {
	  width: 100%;
	  border-collapse: collapse;
	}
	#votePostViewLeft{
		width: 100%;
	}
	#votePostInfoViewTable{
		width: 100%;
		height: 500px;
	}
	.votePostTitleLine td{
		height: 10px;
	}
	#voteRepleInsertBtn{
		height: 75px;
		font-size: 20px;
		vertical-align: top;
	}
	#voteRepleContent{
		width: 85%;
	}
	.showVoteRepleDiv{
		margin-bottom: 2px;
		width: 98%;
	}
	
	#voteImg{
		width: 50px;
		height: 50px;
	}
	 	
	 	
	 	
	.inputRadioVoteItem {
		display:none;
	}
	#voteItemTableView{
		width: 80%; 
		background: white;
	}
	#voteTopAndCenterLine{
		width: 500px;
	}
	.card{
		width: 90%;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/* ribbon style */
	.ribbon-wrapper {
		position: relative;
	}
 	.ribbon-front {
		background-color: #ccf;	height: 40px;
		width: 104%;
		position: relative;
		left:-20px;
		z-index: 2;
	    margin-top: 20px;
	}

	.ribbon-front,
	.ribbon-back-left,
	.ribbon-back-right{
		-moz-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
		-khtml-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
		-webkit-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
		-o-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
	}

	.ribbon-edge-topleft,
	.ribbon-edge-topright,
	.ribbon-edge-bottomleft,
	.ribbon-edge-bottomright {
		position: absolute;
		z-index: 1;
		border-style:solid;
		height:0px;
		width:0px;
	}

	.ribbon-edge-bottomleft,
	.ribbon-edge-bottomright {
		top: 40px;
	}
	
	
	.ribbon-edge-topleft,
	.ribbon-edge-bottomleft {
		left: -20px;
		border-color: transparent #99c transparent transparent;
	}

	.ribbon-edge-topleft {
		top: -10px;
		border-width: 10px 20px 0 0;
	}
	.ribbon-edge-bottomleft {
		border-width: 0 20px 0px 0;
	}


	
	.ribbon-edge-topright,
	.ribbon-edge-bottomright {
		left: 100px;
		border-color: transparent transparent transparent #99c;
	}
	

	.ribbon-edge-topright {
		top: -10px;
		border-width: 10px 0 0 20px;
	}
	.ribbon-edge-bottomright {
		border-width: 0 0 0px 20px;
	}

	.ribbon-back-left {
		position: absolute;
		top: -10px;
		left: 0px;
		width: 0px;
		height: 40px;
		z-index: 0;
	}

	.ribbon-back-right {
		position: absolute;
		top: -10px;
		right: 0px;
		width: 0px;
		height: 40px;
		z-index: 0;
	}

	.ribbon-edge-topright, .ribbon-edge-bottomright{
		left: 100%;
	}
	.ribbon-edge-topleft, .ribbon-edge-topright{
		margin-top: 20px;
	}
	.ribbon-front{
		width: calc(100% + 40px);
	}
</style>
	
