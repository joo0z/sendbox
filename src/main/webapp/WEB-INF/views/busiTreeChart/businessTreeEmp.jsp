<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
	<title>jQuery treeview</title>

	<link rel="stylesheet" href="/css/organChartCSS/jquery.treeview.css" />
	<link rel="stylesheet" href="/css/organChartCSS/screen.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="/js/organChartJS/jquery.treeview.js"></script>

	
	<style type="text/css">
		#OrganChartDiv{
			width: 550px;
			height: 300px;
			margin: auto;
		}
		#jojikdo{
			display: inline-block;
			border: 1px solid black; 
			width: 200px; 
			height: 300px; 
			overflow: auto; 
		}
		#selectButtonDiv{
			text-align: center;
			float: right; 
			border: 1px solid black; 
			width: 100px;
			height: 300px;
			margin-right: 20px;
		}
		#selectButtonDiv input{
			width: 80px;
			height: 30px;
			margin-top: 10px;
		}
		#jojikdoSelectDiv{
			float: right; 
			border: 1px solid black; 
			width: 200px;
			height: 300px; 
		}
		#addAproveLineBtn{
			margin-top: 10px;
			float: right;
			height: 30px;
		}
	</style>
	
	
	<script>
	
		$(function(){
			
			$.ajax({
				url		: "/busiTree/businessTreeEmpDept",
				dataType: "json",
				method	: "post",
				success	: function(data){
					
					console.log("data : ", data);
					var businessTreeList = data.businessTreeList;
					
					var TreeViewTag = "";
					
					for(var i=0; i<businessTreeList.length; i++){
						
						if(businessTreeList[i].upperDeptId == '0000'){
							
							var busiBu = businessTreeList[i].deptId;
							
							TreeViewTag += "	<li>";
							TreeViewTag += "		<span>"+businessTreeList[i].deptName+"</span>";
							TreeViewTag += "		<ul>";
							TreeViewTag += "			<li class='clickAddName'>"+businessTreeList[i].empNm+"["+businessTreeList[i].jobtitle+"]</li>";
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
											TreeViewTag += "				<li class='clickAddName'>"+businessTreeList[k].empNm+"["+businessTreeList[k].jobtitle+"]</li>";
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
					$("#gray").append(TreeViewTag);
					$("#gray").treeview({collapsed: true});
				},
				error	: function(error){
					alert("error code : "+error.status);
				}
			});
			
			
			// 사원이 선택한 사원정보를 hidden 태그에 저장
			$("#gray").on("click", ".clickAddName", function(){
				$("#addEmpInfoHidden").val($(this).text())
			});
			
			
			
			// add 버튼 클릭 액션
			$("#AddEmpBtn").on("click", function(){
				
				if($("#addEmpInfoHidden").val() != ""){
					var addEmpTag = "";
					var addEmpInfo = $("#addEmpInfoHidden").val()
					addEmpTag += "<div class='addEmpInfoDiv'>";
					addEmpTag += "<span class='addEmpInfoSpan'>"+addEmpInfo+"</span>";
					addEmpTag += ".";
					addEmpTag += "</div>";
					$("#jojikdoSelectDiv").append(addEmpTag);
					$("#addEmpInfoHidden").val("");	
				}else{
					alert("결재자를 선택해주세요.");
				}
				
			});
			
			
			
			
			// remove 버튼 클릭 액션
			$("#jojikdoSelectDiv").on("click", ".addEmpInfoSpan", function(){
				$(this).attr('clicked', 'clicked');
			});
			$("#RemoveEmpBtn").on("click", function(){
				$(".addEmpInfoSpan[clicked='clicked']").parents(".addEmpInfoDiv").remove();
			});
			
			
			
			// 직급 정렬 버튼 클릭 액션
			$("#sortBtn").on("click", function(){
				var approveEmpList = $("#jojikdoSelectDiv").text().split(".");
				var sendApproveInfo = [];
				for(var i=0; i<approveEmpList.length-1; i++){
					var jobTitle = ((approveEmpList[i].split("["))[1]).split("]")[0]
					var jobLevel = 0;
					if(jobTitle == "부장"){
						jobLevel = 4;
					}else if(jobTitle == "팀장"){
						jobLevel = 3;
					}else if(jobTitle == "대리"){
						jobLevel = 2;
					}else if(jobTitle == "사원"){
						jobLevel = 1;
					}
					sendApproveInfo.push(approveEmpList[i] + ":+:" + jobLevel);
				}
				console.log(sendApproveInfo);
				
				
				// job title sorting
				for(var i=0; i<sendApproveInfo.length-1;){
					
					var tmpJobTitle = sendApproveInfo[i].split(":+:")[1];
					if(tmpJobTitle < sendApproveInfo[i+1].split(":+:")[1]){
						var temp = sendApproveInfo[i+1];
						sendApproveInfo[i+1] = sendApproveInfo[i];
						sendApproveInfo[i] = temp;
						i = 0;
					}else{
						i++;
					}
				}
				console.log(sendApproveInfo);
				
				// refresh painting
				$("#jojikdoSelectDiv").text("");
				var addEmpTag = "";
				for(var i=0; i<sendApproveInfo.length; i++){
					addEmpTag += "<div class='addEmpInfoDiv'>";
					addEmpTag += "<span class='addEmpInfoSpan'>"+sendApproveInfo[i].split(":+:")[0]+"</span>.";
					addEmpTag += "</div>";
				}
				$("#jojikdoSelectDiv").append(addEmpTag);
			});
			
			
			
			// 결재 라인 정보 부모 창에 넘기기
			$("#addAproveLineBtn").on("click", function(){
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
			});
		});
	
		
	</script>

</head>
<body>

	<br><br>

	<div id="main">
		<input type="hidden" id="addEmpInfoHidden" />
		<input type="hidden" id="approveEmpListInfo" />
		<div id="OrganChartDiv">
		
		
			<!-- 조직도 div -->
			<div id="jojikdo">
				<!-- 조직도 전체 -->
				<ul id="gray" class="treeview-gray"></ul>
			</div>
			
			
			<!-- selected empList div -->
			<div id="jojikdoSelectDiv"></div>
			
			
			
			<!-- select button div -->
			<div id="selectButtonDiv">
				<input type="button" id="AddEmpBtn" value="add" />
				<input type="button" id="RemoveEmpBtn" value="remove" />
				<input type="button" id="sortBtn" value="sort" />
			</div>
			
			<input type="button" id="addAproveLineBtn" value="결재라인등록" />
			
		</div>


	</div>

</body>
</html>