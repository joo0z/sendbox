 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	$('#updatebtn').on('click', function(){
		if($('#password1').val()==''||$('#password2').val()==''){
			alert("비밀번호를 입력해주세요")
		}
		if($('#chk').text()=='비밀번호 일치함'){
			$('#frm').submit();
		}
		if($('#chk').text()=='비밀번호 일치하지 않음'){
			alert("비밀번호를 다시 입력해주세요");
		}
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
				document.location="/mypage?empId=${EMP.empId }";
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

		$(function(){
		    $('#password1').keyup(function(){
		      $('#chk').html('');
		    });

		    $('#password2').keyup(function(){

		        if($('#password1').val() != $('#password2').val()){
		          $('#chk').html('비밀번호 일치하지 않음');
		          $('#chk').css('color', '#f82a2aa3');
		        } else{
		          $('#chk').html('비밀번호 일치함');
		          $('#chk').css('color', '#199894b3');
		        }

		    });
		});
		
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
		

	</script>
<title>Insert title here</title>
</head>
<body>


	<div class="card shadow mb-3" style="width: 70%; margin-left: 10%; ">
		<div class="card-header py-3">
		<i class="fas fa-fw fa-user-lock" style="font-size: 20px;"></i>
			<h6 style="width: 100px; display: inline;" class="m-0 font-weight-bold text-default" >나의 정보</h6>
		</div>
		
		
		
		<form  id="frm" action="${pageContext.request.contextPath}/updatemypage" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table" id="dataTable" width="100%"
					cellspacing="0">
						<tbody>
							<tr>
								<td rowspan="11">

									<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix"
											style="text-align: center; width: 100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView"
												style="border: 1px solid green; height: 200px; width: 150px; margin: 0 auto;">
												<img id="pictureViewImg"
													src="${pageContext.request.contextPath}/profileImgView?empId=${EMP.empId}"
													style="width: 100%; height: 100%;" />
											</div>
											<br>
											<div class="mailbox-attachment-info">
												<div class="input-group input-group-sm">
													<input id="picture" class="form-control" type="file"
														name="picture" accept=".gif, .jpg, .png"
														style="height: 37px;" />
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
										<input name="empNm" type="text" class="form-control"
											id="empNm" placeholder="이름" value="${EMP.empNm }" readonly>
									</div>
								</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>
									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input name="empId" type="text" class="form-control"
											id="empId" placeholder="사원번호" value="${EMP.empId }" readonly>
									</div>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input name="password" type="password" class="form-control"
											id="password1" placeholder="비밀번호를 입력해주세요" required />
									</div>
								</td>
							</tr>

							<tr>
								<td>비밀번호 확인</td>
								<td>
									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input name="password2" type="password" class="form-control"
											id="password2" placeholder="비밀번호를 입력해주세요" required /> <span
											id="chk"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td>핸드폰 번호</td>
								<td>
									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input type="text" name="empHp"
											class="form-control form-control-user" id="empHp"
											aria-describedby="emailHelp" placeholder="핸드폰 번호"
											onkeyup="inputPhoneNumber(this);" maxlength="13"
											value="${emp.empHp }">
									</div>

								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>

									<div class="col-8 input-group-sm" style="float: left;">
										<input name="addr1" type="text" class="form-control"
											id="addr1" placeholder="주소" readonly value="${emp.addr1 }"
											style="float: left;">
									</div>
									<div class="col-sm-4 input-group-sm" style="float: right;">

										<button id="zipcodeBtn" type="button"
											class="btn btn-secondary btn-sm btn-append">주소검색</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td>
									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input name="addr2" type="text" class="form-control"
											id="addr2" placeholder="상세주소" value="${emp.addr2 }">
									</div>
								</td>

							</tr>
							<tr>
								<td>우편번호</td>
								<td>
									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input name="zipcode" type="text" class="form-control"
											id="zipcode" placeholder="우편번호" readonly
											value="${emp.zipcode }">
									</div>

								</td>
							</tr>
							<tr>
								<td>계좌</td>
								<td>

									<div class="col-sm-8 input-group-sm" style="float: left;">
										<input name="bankAcctNo" type="text" class="form-control"
											id="bankAcctNo" placeholder="ex) 국민 12345-152-12345"
											value="${emp.bankAcctNo }">
									</div>
								</td>
							</tr>

						</tbody>
					</table>
				
				
				<input type="button" id="cancelBtn" class="btn btn-outline-secondary" value="취소" style="float: right; margin-right: 10px;" onclick="location.href='/mypage'">
				<input type="button" id="updatebtn" class="btn btn-outline-primary" value="수정" style="float: right; margin-right: 10px;">
			</div>
		</div>
		
		</form>
	</div>
	
	
	




</body>
