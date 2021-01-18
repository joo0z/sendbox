<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<style>
	
	#deptManagementBtn{
		float: right;
		margin-right: 5%;
		background: #1e2c54;
		color: white;
		vertical-align: top;
		margin-top: -5px;
	}
	#deptBtnDiv{
		margin-top: 5px;
		margin-bottom: 2px;
	}
	#jojikdo{
		border: 1px solid black;
		width: 200px;
		height: 250px; 
		overflow: auto;
		float: left;
		margin-left: 8%;
	}
	#addDeptDiv{
		border: 1px solid black;
		float: left;
		width: 50%;
		height: 250px;
		margin-left: 10%;
		padding: 10px;
	}
</style>




<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/orgchart/2.1.10/css/jquery.orgchart.css" integrity="sha512-wlRlwEPGS5q/QcJ1YiHSUsapGaQGgwt4tJbmV4T+NX2XH14Vp385/PtaW27r1YmB0I5ThIx412MloXPnfcif2Q==" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/orgchart/2.1.10/js/jquery.orgchart.js" integrity="sha512-Og26KyueYWeZgYpezqWlxa+td8Rqrx+Lw4wEdtewnYdb9Wt/IGBcuQl/i8HloEOxsaH4BM4XcVNldHRnDjrBOw==" crossorigin="anonymous"></script>
<script>
	$(function(){
		
		$.ajax({
			url		: "/dept/deptManageTree",
			dataType: "json",
			method	: "post",
			success	: function(data){
				
				var busiTreeList = data.busiTreeList;
				var deptTreeList = data.deptTreeList;
				console.log("busiTreeList = ", busiTreeList);
				console.log("deptTreeList = ", deptTreeList);
				
				var deptTreeListLeftView = deptTreeList.slice();
				deptTreeView(deptTreeListLeftView);
				
				var ceoDept = "";
				for(var top=0; top<deptTreeList.length; top++){
					//사장인경우
					if(deptTreeList[top].upperDeptId == null){
						ceoDept = deptTreeList[top].deptName;
						break;
					}
				}
				var teamCnt = 0;
				busiOrgChart = [];
				var busiTop = deptTreeList[0].deptId;
				for(var i=1; i<deptTreeList.length; i++){
					
					if(deptTreeList[i].upperDeptId == busiTop){
						var busiBu = deptTreeList[i].deptId;
						
						var businame = deptTreeList[i].deptName;
						var busiheader = deptTreeList[i].deptHeadId; // 사원번호 전부 가져온 다음 일치하는 id의 사원이름을 표시(나중에)
						
						
						// 부장 사원의 이름
						var busiheaderName = "";
						for(var k=0; k<busiTreeList.length; k++){
							if(busiheader == busiTreeList[k].empId){
								busiheaderName = busiTreeList[k].empNm;
								break;
							}
						}
						
						teamOrgChart = [];
						for(var j=1; j<deptTreeList.length; j++) {
							
							if(deptTreeList[j].upperDeptId == busiBu){
								teamCnt++;
								var teamname = deptTreeList[j].deptName;
								var teamheader = deptTreeList[j].deptHeadId; // 사원번호 전부 가져온 다음 일치하는 id의 사원이름을 표시(나중에)
								
								// 팀장 사원의 이름
								var teamheaderName = "";
								for(var k=0; k<busiTreeList.length; k++){
									if(teamheader == busiTreeList[k].empId){
										teamheaderName = busiTreeList[k].empNm;
										break;
									}
								}
								
								var teamInfo = {'name'  : teamname,
												'title' : teamheaderName };
								teamOrgChart.push(teamInfo);
							}
						}
						if(teamCnt > 0){
							var busiInfo = { 'name'	    : businame,
								   	 		 'title'    : busiheaderName,
								   	 		 'children' : teamOrgChart };
							busiOrgChart.push(busiInfo);
						}else{
							var busiInfo = { 'name'	    : businame,
						   	 		 		 'title'    : busiheaderName };
							busiOrgChart.push(busiInfo);
						}
					}
				}
				var deptData = {
				  'name': ceoDept,
				  'title': 'CEO',
				  'children': busiOrgChart 
				};
				console.log("deptData = ", deptData);

				$('#chart-container').orgchart({
				  'data' : deptData,
				  'depth': 3,
				  'nodeContent': 'title'
				});
			},
			error	: function(error){
				alert("error code : "+error.status);
			}
		});
		
		
      	
		
		
		
		
		
		
		
		
		
      	$("#deptCreatBtn").on("click", function(){
      		
      		$("#addDeptForm").attr("action", "/dept/creatDept");
      		$("#addDeptForm").attr("method", "post");
      		$("#addDeptForm").submit();
      	});
		
      	
      	
      	
      	
		
		
		
		function deptTreeView(deptTreeListLeftView){
			//조직도 자료
			var deptTreeList = deptTreeListLeftView;
			
			var TreeViewTag = "";
			
			for(var top=0; top<deptTreeList.length; top++){
				console.log(deptTreeList[top].upperDeptId);
				//사장인경우
				if(deptTreeList[top].upperDeptId == null){
					TreeViewTag += "	<li>";
					TreeViewTag += "		<span>"+deptTreeList[top].deptName+"</span>";
					
					var busiTop = deptTreeList[top].deptId;
					
					for(var i=0; i<deptTreeList.length; i++){
						
						if(deptTreeList[i].upperDeptId == busiTop){
							
							var busiBu = deptTreeList[i].deptId;
							
							TreeViewTag += "	<li>";
							TreeViewTag += "		<span>"+deptTreeList[i].deptName+"</span>";
							TreeViewTag += "			<ul>";
							
							for(var j=0; j<deptTreeList.length; j++) {
								
								if(deptTreeList[j].upperDeptId == busiBu){
									var busiTeam = deptTreeList[j].deptId;
									
									TreeViewTag += "				<li>";
									TreeViewTag += "					<span>"+deptTreeList[j].deptName+"</span>";
									TreeViewTag += "				</li>";
								}
							}
							TreeViewTag += "			</ul>";
							TreeViewTag += "	</li>";
						}
					}
					TreeViewTag += "	</li>";
				}
			}
			$("#gray").append(TreeViewTag);
			$("#gray").treeview({
				collapsed: false
			});
		}
		
		
		
	});
</script>
	
	
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
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-user-friends" style="margin-left: 10px;"></i>&nbsp&nbsp 부서현황</h2>
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                    
                    
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                            	<div id="deptBtnDiv">
	                            	<h5 style="float: left;">부서 조직도</h5>
									<button class="deptBtn btn" type="button" id="deptManagementBtn" 
			                            	data-toggle="modal" data-target="#deptManagementModal">부서관리</button> 
                            	</div>
		                        <br>
                            	<hr>
                            	
                                <!-- modal 조직도 이용  -->
								<div id="main">
	                            	<!-- 사내 부서 조직도 현황 View -->
	                            	<div id="chart-container"></div>
								</div>
								
								<br>
								
																
								
	                            <!-- modal 조직도 이용 Modal -->
								<div class="modal fade bd-example-modal-lg" id="deptManagementModal" tabindex="-1" role="dialog" aria-labelledby="deptManagementModalLine" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="deptManagementModalLine">부서관리</h5>
								        <button type="button" class="settingViewBtn close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true"><i class="fas fa-times"></i></span>
								        </button>
								      </div>
								      <div class="modal-body loadApprDiv" style="overflow : auto;">
								      	
								      	<div id="OrganChartDiv">
											<!-- 조직도 div -->
											<div id="jojikdo">
												<!-- 조직도 전체 -->
												<ul id="gray" class="treeview-gray"></ul>
											</div>
											
											<form id="addDeptForm">
												<div id="addDeptDiv">
													상위부서 : <select id="upperDeptId" name="upperDeptId">
															<c:forEach var="i" begin="0" end="${deptList.size()-1}" step="1">
																<c:if test="${deptList.get(i).deptId eq '0000' or deptList.get(i).upperDeptId eq '0000' }">
																	<option value="${deptList.get(i).deptId }">${deptList.get(i).deptName }</option>
																</c:if>
															</c:forEach>
															</select>
													<br><br>
													부서명 : <input type="text" id="deptName" name="deptName" />
													<br><br>
													담당사원 : <select name="deptHeadId">
															<c:forEach var="i" begin="0" end="${empList.size()-1}" step="1">
																<option value="${empList.get(i).empId }">${empDeptInfoList.get(i).deptName } | ${empList.get(i).empNm } ${empJobInfoList.get(i).jobtitleNm }</option>
															</c:forEach>
															</select>
													<br><br>
													<input type="hidden" id="jobTitleId" name="jobTitleId">
												</div>
											</form>
										</div>
								      	
								      </div>
								      <div class="modal-footer">
								        <button type="button" id="deptCreatBtn" class="settingViewBtn btn btn-success">부서등록</button>
								        <button type="button" id="btncancle" class="settingViewBtn btn btn-secondary btnCancel" data-dismiss="modal">취소</button>
								      </div>
								    </div>
								  </div>
								</div> 
	                                
	                                
	                                
	                                
	                                 	
                            </div>
						</div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

</body>




<style>

	#chart-container{
	}


	.orgchart{
		background: white;
		width: 80%;
	}
	
	.orgchart .lines{
		height: 50px;
	}
	.orgchart .lines .downLine{
		height: 50px;
	}
	
	
	
	.orgchart .lines .leftLine{
		border-color: #1e2c54;
	}
	.orgchart .lines .rightLine{
		border-color: #1e2c54;
	}
	.orgchart .lines .downLine{
		background: #1e2c54;
	}
	.orgchart .node .content{
		border:1px solid #1e2c54;
	}
	
	
	
	
	
	.orgchart .node .title{
		width: 150px;
    	height: 30px;
    	font-size: 15px;
	}
	.orgchart .node .content{
		height: 30px;
		font-size: 15px;
	}







	.orgchart .node .title{
        background-color: #1e2c54;
    }
    div.orgChart div.node.level1.special {
        background-color: white;
    }
    div.orgChart div.node.level2 {
        background-color: #cefbce;
    }
    div.orgChart div.node.level3 {
        background-color: #e0cefb;
    }
</style>



