 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		$('#updatebtn').on('click',function(){
			window.location.href="/updateEmp?empId=${emp.empId}";
		})	
		
		$('#cancelbtn').on('click',function(){
			window.location.href="/empManage";
		})	
	})
	


</script>
</head>
<body>


	<div class="card shadow mb-3" style="width: 70%; margin-left: 10%; ">
		<div class="card-header py-3">
		<i class="fas fa-fw fa-user-lock" style="font-size: 20px;"></i>
			<h6 style="width: 100px; display: inline;" class="m-0 font-weight-bold text-default" >사원 정보</h6>
		</div>
		
		
		
		<form>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table" id="dataTable" width="100%"
						cellspacing="0">
						<tbody>
							<tr>
								<td rowspan="13"><img id="men" src="${pageContext.request.contextPath}/profileImgView?empId=${emp.empId}" style="width:150px; height:200px; overflow: hidden; margin: 10%; "></td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${emp.empNm}</td>
							</tr>
							<tr>
								<td>사원번호</td>
								<td>${emp.empId}</td>
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
<!-- 							<tr> -->
<!-- 								<td>외부메일</td> -->
<%-- 								<td>${emp.empMail}</td> --%>
<!-- 							</tr> -->
							<tr>
								<td>계좌</td>
								<td>${emp.bankAcctNo}</td>
							</tr>
							<tr>
								<td>부서</td>
								<td>
								${emp.deptId}
<%-- 	                                <c:if test="${emp.deptId==0000 }">사장님</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0001 }">SI</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0002 }">인사팀</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0003 }">SI 1팀</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0004 }">SI 2팀</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0005 }">SM 1팀</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0006 }">인사 1팀</c:if> --%>
<%-- 	                                <c:if test="${emp.deptId==0007 }">인사 2팀</c:if> --%>
                                </td>
							</tr>
							<tr>
								<td>직속상사</td>
								<td>${emp.managerId}</td>
							</tr>
							<tr>
								<td>직급</td>
								<td>
								${emp.jobtitleId}
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${emp.jobtitleId == 0 }"> 사원</c:when> --%>
<%-- 									<c:when test="${emp.jobtitleId == 1 }"> 대리</c:when> --%>
<%-- 									<c:when test="${emp.jobtitleId == 2 }"> 팀장</c:when> --%>
<%-- 									<c:when test="${emp.jobtitleId == 3 }"> 부장</c:when> --%>
<%-- 									<c:when test="${emp.jobtitleId == 4 }"> CEO</c:when> --%>
<%-- 								</c:choose> --%>
								</td>
							</tr>
		
						</tbody>
					</table>
					<input id="cancelbtn" type="button" class="btn btn-outline-info" value="목록" style="float: right; margin-left: 5px;" >
					<input id="updatebtn" type="button" class="btn btn-outline-secondary" value="수정" style="float: right;" >
				</div>
			</div>
		</form>
	</div>
	
	
	




</body>
