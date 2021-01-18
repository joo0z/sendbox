 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="/admin2form/vendor/bootstrap/js/bootstrap.js"></script>Custom styles for this template -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (var i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	
	
$(document).ready(function(){
	
	var empDeptId = ${emp.deptId };
// 	var length = empDeptId.length
	var empDeptId2 = leadingZeros(empDeptId,4)
// 	alert(empDeptId2)
// 	alert(empDeptId)
	
	$('#deptId').val(empDeptId2);
	
	$('#jobtitleId2').val(${emp.jobtitleId});
	
	$('#zipcodeBtn').on('click',function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            console.log(data);
	            $('#addr1').val(data.roadAddress);
	            $('#zipcode').val(data.zonecode);
	        }
	    }).open();
	})

	$('#updatebtn').on('click', function(){
		$('#frm').submit();
	})
	
})

</script>

<script>
		$(document).ready(function(){
			// picture input의 파일 변경시 이벤트 
			$("#picture").change(function(){
			   readURL(this);
			});

			$("#cancelBtn").on('click',function(){
				document.location="/empManage";
			})
		});
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
			  
				reader.onload = function (e) {
					$('#pictureViewImg').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

			 
		
	</script>
<title>Insert title here</title>
</head>
<body>


	<div class="card shadow mb-3" style="width: 70%; margin-left: 10%; ">
		<div class="card-header py-3">
		<i class="fas fa-fw fa-user-lock" style="font-size: 20px;"></i>
			<h6 style="width: 100px; display: inline;" class="m-0 font-weight-bold text-default" >사원 정보 수정</h6>
		</div>
		
		
		
		<form  id="frm" action="${pageContext.request.contextPath}/updateEmp" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table" id="dataTable" width="100%"
					cellspacing="0">
					<tbody>
						<tr>
							<td rowspan="15">
							
								<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix" style="text-align: center; width:100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 150px; margin: 0 auto;">
												<img id="pictureViewImg" src="${pageContext.request.contextPath}/profileImgView?empId=${emp.empId}" style="width:100%; height:100%;"/>
											</div>
											<br>
											<div class="mailbox-attachment-info">
												<div class="input-group input-group-sm">
<!-- 													<input id="picture" class="form-control" -->
<!-- 														   type="file" name="picture" accept=".gif, .jpg, .png" style="height:37px;"/> -->
												</div>
											</div>
										</div>
										<br />
									</div>
							
							
							
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="empNm" type="text" class="form-control" id="empNm" value="${emp.empNm }" readonly>	
								</div>
							</td>
						</tr>
						<tr>
							<td>사원번호</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="empId" type="text" class="form-control" id="empId" value="${emp.empId }" readonly >	
								</div>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="password" type="password" class="form-control" id="password" placeholder="********" value="${emp.password }" readonly>	
								</div>
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="empHp" type="text" class="form-control" id="empHp"  value="${emp.empHp }" readonly>	
								</div>
							
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
							
							<div class="col-8 input-group-sm" style="float: left;">
								<input name="addr1" type="text" class="form-control" id="addr1"  readonly value="${emp.addr1 }" style="float: left;" >
							</div>
							</td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td>
							<div class="col-sm-8 input-group-sm" style="float: left;">
							<input name="addr2" type="text" class="form-control" id="addr2" value="${emp.addr2 }" readonly>	
							</div></td>
							
						</tr>
						<tr>
							<td>우편번호</td>
							<td>
							<div class="col-sm-8 input-group-sm" style="float: left;">
							<input name="zipcode" type="text" class="form-control" id="zipcode"  readonly value="${emp.zipcode }">
							</div>
								
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>외부메일</td> -->
<!-- 							<td> -->
<!-- 								<div class="col-sm-8 input-group-sm" style="float: left;"> -->
<%-- 								<input name="empMail" type="text" class="form-control" id="empMail"  value="${emp.empMail }" readonly>	 --%>
<!-- 								</div> -->
							
<!-- 							</td> -->
<!-- 						</tr> -->
						<tr>
							<td>계좌</td>
							<td>
						
							<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="bankAcctNo" type="text" class="form-control" id="bankAcctNo"  value="${emp.bankAcctNo }" readonly>	
								</div>
								
								</td>
						</tr>
						
						<tr>
							<td>부서</td>
							<td>
								<div class="col-sm-4 input-group-sm" style="float: left;">
<%-- 								<input name="deptId" type="text" class="form-control" id="deptId"value="${emp.deptId }">	 --%>
								<select class="form-control" name="deptId" id="deptId">
									<c:forEach items="${deptList }" var="dept">
										<option value="${dept.deptId }">${dept.deptName }</option>
									</c:forEach>
								</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>직급</td>
							<td>
								
								<div class="col-sm-4 input-group-sm" style="float: left;">
								<select class="form-control" name="jobtitleId" id="jobtitleId2">
									<c:forEach items="${jobList }" var="job">
										<option value="${job.jobtitleId }">${job.jobtitleNm }</option>
									</c:forEach>
								</select>
							</div>
							</td>
						</tr>
						
<!-- 						<tr> -->
<!-- 							<td>직속상사</td> -->
<!-- 							<td> -->
<!-- 								<div class="col-sm-8 input-group-sm" style="float: left;"> -->
<%-- 								<input name="managerId" type="text" class="form-control" id="managerId" value="${emp.managerId }">	 --%>
<!-- 								</div> -->
							
<!-- 							</td> -->
<!-- 						</tr> -->
						
<!-- 						<tr> -->
<!-- 							<td>권한레벨</td> -->
<!-- 							<td> -->
<!-- 								<div class="col-sm-8 input-group-sm" style="float: left;"> -->
<%-- 								<input name="authLv" type="text" class="form-control" id="authLv"  value="${emp.authLv }">	 --%>
<!-- 								</div> -->
							
<!-- 							</td> -->
<!-- 						</tr> -->
	
					</tbody>
				</table>
				
				
				<input type="button" id="cancelBtn" class="btn btn-outline-secondary" value="취소" style="float: right; margin-right: 10px;" onclick="location.href='/mypage'">
				<input type="button" id="updatebtn" class="btn btn-outline-primary" value="수정" style="float: right; margin-right: 10px;">
			</div>
		</div>
		
		</form>
	</div>
	
	
	




</body>
