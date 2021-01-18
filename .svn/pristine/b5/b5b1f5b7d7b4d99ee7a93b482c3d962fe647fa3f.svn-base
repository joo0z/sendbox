 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="/admin2form/vendor/bootstrap/js/bootstrap.js"></script>Custom styles for this template -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#zipcodeBtn').on('click',function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            console.log(data);
	            $('#addr1').val(data.roadAddress);
	            $('#zipcode').val(data.zonecode);
	            
	            
	        }
	    }).open();
	})
	
	
	$('#insertbtn').on('click', function() {
			if ($('#empId').val() == '') {
				alert("사원번호를 입력하세요");
			} else if ($('#empNm').val() == '') {
				alert("이름을 입력하세요");
			} else if ($('#password').val() == '') {
				alert("비밀번호를 입력하세요");
			} else if ($('#empHp').val() == '') {
				alert("핸드폰 번호를 입력하세요");
			} else if ($('#bankAcctNo').val() == '') {
				alert("계좌를 입력하세요");
			}else if ($('#deptId').val() == '') {
				alert("부서를 입력하세요");
			}else if ($('#jobtitleId').val() == '') {
				alert("직급을 입력하세요");
			}else if ($('#idcheck').html() == '') {
				alert("중복체크를 해주세요");
			} else {
				$('#frm').submit();
			}
			
		})
		// 	$('#insertbtn').on('click', function(){
		// 		$('#frm').submit();
		// 	})
// 		var deptId = "";
// 		var jobtitleId = "";
// 		$('#deptId').change(function(){
// 			deptId = $("#deptId option:selected").val();
// 			console.log(deptId);
// 		})
// 		$('#jobtitleId').change(function(){
// 			jobtitleId = $("#jobtitleId option:selected").val();
// 			console.log(jobtitleId);
// 		})
		
		
		
		
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

		
		function inputPhoneNumber(obj) {
		    var number = obj.value.replace(/[^0-9]/g, "");
		    var phone = "";
		    if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
		
		$(function(){
			$('#idcheck').on('click',function(){
				var empId = $('#empId').val()
				if(empId == ''){
					alert('아이디를 입력해주세요')
					$('#empId').focus()
				}else {
					$.ajax({
						url : "/IdCheck",
						data : {
							empId : empId,
						},
						method : "post",
						success : function(data) {
							if(data.check == null){
								$('#chk').html(data.result).css("color","#199894b3");
							} else {
								$('#chk').html(data.result).css("color","#f82a2aa3");
								$('#empId').val('')
							}
						}
					});
				}
			})
		})
		
		
		
			 
		
	</script>
<title>Insert title here</title>
</head>
<body>


	<div class="card shadow mb-3" style="width: 70%; margin-left: 10%; ">
		<div class="card-header py-3">
		<i class="fas fa-fw fa-user-lock" style="font-size: 20px;"></i>
			<h6 style="width: 100px; display: inline;" class="m-0 font-weight-bold text-default" >사원 등록</h6>
		</div>
		
		
		
		<form  id="frm" action="${pageContext.request.contextPath}/insertEmp" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table" id="dataTable" width="100%"
					cellspacing="0">
					<tbody>
						<tr>
							<td rowspan="14">
							
								<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix" style="text-align: center; width:100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 150px; margin: 0 auto;">
												<img id="pictureViewImg" src="${pageContext.request.contextPath}/profileImgView" style="width:100%; height:100%;"/>
											</div>
											<br>
											<div class="mailbox-attachment-info">
												<div class="input-group input-group-sm">
													<input id="picture" class="form-control"
														   type="file" name="picture" accept=".gif, .jpg, .png" style="height:37px;"/>
												</div>
											</div>
										</div>
										<br />
									</div>
							
							
							
							</td>
						</tr>
						<tr>
							<td>사원번호</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
									<input name="empId" type="text" class="form-control" id="empId" placeholder="사원번호" required>
								</div>
								<div class="col-sm-4 input-group-sm" style="float: right;">
									<button id="idcheck" type="button" class="btn btn-secondary btn-sm btn-append">중복체크</button>
								</div>
								<div>
								<span id="chk"></span></div>	
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="empNm" type="text" class="form-control" id="empNm" placeholder="이름" >	
								</div>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="password" type="password" class="form-control" id="password" placeholder="********"  >	
								</div>
							</td>
						</tr>
						
						<tr>
							<td>핸드폰 번호</td>
							<td>
								<div class="col-sm-8 input-group-sm" style="float: left;">
									<input type="text" name="empHp" class="form-control form-control-user"
                                                id="empHp" aria-describedby="emailHelp" placeholder="핸드폰 번호"
                                                onkeyup="inputPhoneNumber(this);"  maxlength="13">
								</div>
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
							
							<div class="col-8 input-group-sm" style="float: left;">
								<input name="addr1" type="text" class="form-control" id="addr1" placeholder="주소" readonly style="float: left;">
							</div>
							<div class="col-sm-4 input-group-sm" style="float: right;">
							
							<button id="zipcodeBtn" type="button" class="btn btn-secondary btn-sm btn-append">주소검색</button>
							</div>
							</td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td>
							<div class="col-sm-8 input-group-sm" style="float: left;">
							<input name="addr2" type="text" class="form-control" id="addr2" placeholder="상세주소" >	
							</div></td>
							
						</tr>
						<tr>
							<td>우편번호</td>
							<td>
							<div class="col-sm-8 input-group-sm" style="float: left;">
							<input name="zipcode" type="text" class="form-control" id="zipcode" placeholder="우편번호" readonly>
							</div>
								
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>외부메일</td> -->
<!-- 							<td> -->
<!-- 								<div class="col-sm-8 input-group-sm" style="float: left;"> -->
<!-- 								<input name="empMail" type="text" class="form-control" id="empMail" placeholder="외부메일" >	 -->
<!-- 								</div> -->
							
<!-- 							</td> -->
<!-- 						</tr> -->
						<tr>
							<td>계좌</td>
							<td>
						
							<div class="col-sm-8 input-group-sm" style="float: left;">
								<input name="bankAcctNo" type="text" class="form-control" id="bankAcctNo" placeholder="ex) 국민 12345-152-12345"  >	
								</div>
								
								</td>
						</tr>
						<tr>
							<td>부서</td>
							<td>
								<div class="col-sm-4 input-group-sm" style="float: left;">
								<select class="form-control" name="deptId" id="deptId">
									<c:forEach items="${deptList}" var="dept">
									    <option value="${dept.deptId}">${dept.deptName}</option>
									</c:forEach>
								 </select>
								
								</div>
							</td>
						</tr>
						<tr>
							<td>직급</td>
							<td>
						
							<div class="col-sm-4 input-group-sm" style="float: left;">
								<select class="form-control" name="jobtitleId" id="jobtitleId">
								    <option value="0">사원</option>
								    <option value="1">대리</option>
								    <option value="2">팀장</option>
								    <option value="3">부장</option>
								    <option value="4">사장</option>
								  </select>
								</div>
								</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>직속상사번호</td> -->
<!-- 							<td> -->
						
<!-- 							<div class="col-sm-8 input-group-sm" style="float: left;"> -->
<!-- 								<input name="managerId" type="text" class="form-control" id="managerId" placeholder="직속상사번호"  >	 -->
<!-- 								</div> -->
								
<!-- 							</td> -->
<!-- 						</tr> -->
						
<!-- 						<tr> -->
<!-- 							<td>권한레벨</td> -->
<!-- 							<td> -->
						
<!-- 							<div class="col-sm-8 input-group-sm" style="float: left;"> -->
<!-- 								<input name="authLv" type="text" class="form-control" id="authLv" placeholder="권한레벨"  >	 -->
<!-- 								</div> -->
								
<!-- 								</td> -->
<!-- 						</tr> -->
	
					</tbody>
				</table>
				
				
				<input type="button" id="cancelBtn" class="btn btn-outline-secondary" value="취소" style="float: right; margin-right: 10px;" onclick="location.href='/empManage'">
				<input type="button" id="insertbtn" class="btn btn-outline-primary" value="등록" style="float: right; margin-right: 10px;">
			</div>
		</div>
		
		</form>
	</div>
	
	
	




</body>
