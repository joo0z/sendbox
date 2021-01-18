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

    <title>내 연차</title>

    <!-- Custom styles for this page -->
    <link href="/admin2form/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	
	<!-- Bootstrap core JavaScript-->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
	
	<!-- Custom fonts for this template -->
    <link href="/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
	

<script>
   
    
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
		width: 200px;
	}
		
	table {
	    width: 100%;
	    border-collapse: collapse;
  	}
  	th, td {
	    padding: 10px;
  	}
  	
  	th{
  		background: #EAEAEA;
  	}
  	
  	
  	#myVacateInfoTable span{
  		font-size: 20px;
  	}
  	.spanB{
  		color: blue;
  	}
  	.spanC{
  		color: green;
  	}
  	
  	
  	
  	
  	
  	
  	.myvacateInfo{
   		font-weight: bold;
   		text-align: center;
   	}
   	#myVacateInfoTable .myvacateInfo{
   		font-size: 20px;
   	}
   	.myvacateInfo.UDT{
   		color: blue;
   	}
   	.myvacateInfo.NUDT{
   		color: green;
   	}
   	
   	
   	
   	
   	.myvacateInfo.number{
  		width: 10%;
  	}
  	.myvacateInfo.name{
  		width: 25%;
  	}
  	#vacateKindsInfoTbody .myvacateInfo.useCnt{
  		width: 15%;
  		color: blue;
  	}
  	.myvacateInfo.useChck{
  		width: 15%;
  	}
  	td.myvacateInfo.vacateMenu{
  		width: 35%;
  		text-align: left;
  	}
  	th.myvacateInfo.lestReason{
  		text-align: center;
   	}



  	.myvacateInfo.gubun{
  		width: 10%;
  	}
  	.myvacateInfo.lestDt{
  		width: 25%;
  	}
  	#myVacateListTbody .myvacateInfo.lestCnt{
  		width: 15%;
  		color: blue;
  	}
  	.myvacateInfo.lestChck{
  		width: 15%;
  	}
  	td.myvacateInfo.lestReason{
  		width: 35%;
  		text-align: left;
  	}
  	.myVacateBtn{
  		margin-top: 5px;
  	}
  	
  	
  	
  	
  	
  	#vacateKindsInfoTbody{
  		font-size: 12px;
  	}
  	#myVacateListTbody{
  		font-size: 12px;
  	}
</style>

<script type="text/javascript">
	$(function(){
		
		// 휴가 작성 버튼 클릭
		$("#reportInsertVacate").on("click", function(){
			
			var myVacateResultDt = $("#myVacateResultDt").val();
			if(myVacateResultDt > 0){
				$("#reportVacateForm").attr("action", "/report/settingView");
				$("#reportVacateForm").attr("method", "post");
				$("#reportVacateForm").submit();
			}else{
				alert("남은 휴가 잔여일이 없습니다.")
			}
		});
		
		
		// 휴가 기록 조회 날짜 선택
		$(".selectMyVacateInfoCal").on("change", function(){
			var yearInfo = $("#selYear").val();
			
			$.ajax({
				url		: "/vacate/selectMyVacateInfoCal",
				data	: { yearInfo : yearInfo},
				dataType: "json",
				method	: "post",
				success	: function(data){
					console.log(data)
					
					var empVacateList = data.empVacateList;
					var tempText = "";
					
					if(empVacateList != null && empVacateList.length > 0){
						$.each(empVacateList, function(i, v){
							
							var startDt = (empVacateList[i].vacateStartDt).split(" "); 
							var endDt = (empVacateList[i].vacateEndDt).split(" "); 
							
							tempText += "<tr>";
							tempText += "	<td class='front myvacateInfo gubun'>"+empVacateList[i].vacateTypeName+"</td>";
							tempText += "	<td class='front myvacateInfo lestDt'>"+startDt[0]+" ~ "+endDt[0]+"</td>";
							tempText += "	<td class='front myvacateInfo lestCnt'>"+empVacateList[i].vacateDayCnt+"</td>";
							tempText += "	<td class='front myvacateInfo lestChck'>승인</td>";
							tempText += "	<td class='front myvacateInfo lestReason'>"+empVacateList[i].vacateReason+"</td>";
							tempText += "</tr>";
						});
					}else{
	            		tempText += "<tr>";
	            		tempText += "	<td colspan='6' class='front myvacateInfo useChck'>휴가를 사용한 기록이 없습니다.</td>";
	            		tempText += "</tr>";
					}
					$("#myVacateListTbody").html(tempText)
				},
				error	: function(error){
					alert("error code : ", error.status);
				}
			})
		});
		
	});
</script>





</head>
<jsp:useBean id="now" class="java.util.Date" />
<body id="page-top">


    <!-- Page Wrapper -->
    <div id="wrapper">
    
    
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        
        
            <!-- Main Content -->
            <div id="content">
            
                 <!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h2 class="h3 mb-2 text-gray-800"><i class="far fa-calendar-alt" style="margin-left: 10px;"></i>&nbsp&nbsp내 연차</h2>
					<br>
					<div class="card shadow mb-4">
						<div class="card-body">
	                    	<!-- 휴가내역 -->
							<table style="width:100%; text-align: center;" id="myVacateInfoTable" class="table" cellspacing="0">
		                    	<fmt:formatDate value="${now }" pattern="yyyy" var="date"/>
		                    	<tr style="border : 1px solid #e3e6f0;">
		                    		<td>년도<br><br><span class="spanA">${date }년</span></td>
									<td>연차 할당일<br><br><span class="spanA">${myVacateDayCnt }일</span></td>
									<td>연차 사용일<br><br><span class="spanB">${myVacateUseCnt }일</span></td>
									<td>연차 잔여일<br><br><span class="spanC">${myVacateDayCnt - myVacateUseCnt}일</span></td>
		                    	</tr>
							</table>
							<button type="button" id="reportInsertVacate" class="btn btn-outline-info myVacateBtn" 
						 			style="float: right; margin-top: -5px; margin-bottom: 5px;">휴가신청</button>
						</div>
					</div>
                 	
                  	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
		                    
								<br>
								<input type="hidden" id="myVacateResultDt" value="${myVacateDayCnt - myVacateUseCnt}" />
								<div id="myVacateInfoListDiv">
									<h5>년도별 연차 사용내역</h5>
									<!-- search line -->
									<div class="row">
										<fmt:formatDate value="${now }" pattern="MM" var="month"/>
										<div class="col-sm-12 col-md-2">
											<div class="dataTables_length" id="dataTable_length">
												<select id="selYear" name="recordCountPerPage"
														aria-controls="dataTable" style="margin-bottom: 3px;"
														class="custom-select custom-select-sm form-control form-control-sm selectMyVacateInfoCal">
													<c:forEach var="i" begin="0" end="${yearStrList.size()-1}" step="1">
														<c:choose>
															<c:when test="${i != yearStrList.size()-1}">
																<option class="cnt" value="${yearStrList.get(i)}">${yearStrList.get(i)}년</option>
															</c:when>
															<c:otherwise>
																<option class="cnt" value="${yearStrList.get(i)}" selected="selected">${yearStrList.get(i)}년</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<table style="width:100%;" id="myVacateInfoListTable" class="table table-bordered">
				                    	<tr>
				                    		<th class="front myvacateInfo gubun">구분</th>
				                    		<th class="front myvacateInfo lestDt">휴가기간</th>
				                    		<th class="front myvacateInfo lestCnt">휴가일수</th>
				                    		<th class="front myvacateInfo lestChck">결재여부</th>
				                    		<th class="front myvacateInfo lestReason">휴가사유</th>
				                    	</tr>
				                    	<tbody id="myVacateListTbody">
				                    		<c:if test="${empVacateList.size() > 0}">
						                    	<c:forEach var="i" begin="0" end="${empVacateList.size()-1}" step="1">
						                    		<tr>
							                    		<td class="front myvacateInfo gubun">${empVacateList.get(i).vacateTypeName}</td>
							                    		<td class="front myvacateInfo lestDt">${empVacateList.get(i).vacateStartDt } ~ ${empVacateList.get(i).vacateEndDt }</td>
							                    		<td class="front myvacateInfo lestCnt">${empVacateList.get(i).vacateDayCnt }</td>
							                    		<td class="front myvacateInfo lestChck">승인</td>
							                    		<td class="front myvacateInfo lestReason">${empVacateList.get(i).vacateReason }</td>
						                    		</tr>
						                    	</c:forEach>
					                    	</c:if>
					                    	<c:if test="${empVacateList.size() == 0}">
					                    		<tr>
					                    			<td colspan="6" class="front myvacateInfo useChck">휴가를 사용한 기록이 없습니다.</td>
					                    		</tr>
					                    	</c:if>
				                    	</tbody>
									</table>
								</div>
								
								<br><br><br>
								
								<form id="reportVacateForm">
									<input type="hidden" name="empId" value="${EMP.empId}"/>
									<input type="hidden" name="reportVacatePath" value="vacatePage"/>
								</form>
								
								<h5>연차 설명</h5>
			                    <table style="width:100%;" id="vacateKindsInfoTable" class="table table-bordered">
			                    	<tr>
			                    		<th class="front myvacateInfo number">번호</th>
			                    		<th class="front myvacateInfo name">휴가명</th>
			                    		<th class="front myvacateInfo useCnt">연차차감</th>
			                    		<th class="front myvacateInfo useChck">사용여부</th>
			                    		<th class="front myvacateInfo vacateMenu">휴가설명</th>
			                    	</tr>
			                    	<tbody id="vacateKindsInfoTbody">
			                    	<!-- 휴가종류 -->
			                    	<c:if test="${vacatTypeList.size() > 0 and vacatTypeList != null}">
			                    		<c:forEach var="i" begin="0" end="${vacatTypeList.size()-1}" step="1">
			                    		<tr>
				                    		<td class="front myvacateInfo number">${i+1}</td>
				                    		<td class="front myvacateInfo name">${vacatTypeList.get(i).vacateTypeName }</td>
				                    		<td class="front myvacateInfo useCnt">${vacatTypeList.get(i).vacateTypeDayCnt }</td>
				                    		<td class="front myvacateInfo useChck">O</td>
				                    		<td class="front myvacateInfo vacateMenu">${vacatTypeList.get(i).vacateTypeManual }</td>
			                    		</tr>
			                    		</c:forEach>
			                    	</c:if>
			                    	</tbody>
								</table>
							
							
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
