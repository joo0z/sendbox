<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">



    <title>SENDBOX</title>
   <link rel="stylesheet" type="text/css" href="/loginform/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/fonts/iconic/css/material-design-iconic-font.min.css">

    <!-- Custom fonts for this template-->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript">
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
	$('#find').on('click',function(){
		var empNm = $('#empNm').val()
		var empHp = $('#empHp').val()
		if(empNm == ''){
			alert('이름을 입력해주세요')
			$('#empNm').focus()
		} else if(empHp == ''){
			alert('핸드폰번호를 입력해주세요')
			$('#empHp').focus()
		} else {
			$.ajax({
				url : "/findId",
				data : {
					empNm : empNm,
					empHp : empHp
				},
				method : "post",
				success : function(data) {
					if(data.check == null){
						$('#result').html(data.result).css("color","red");
					} else {
						$('#result').html("사원님의 아이디는 " + data.result + " 입니다.").css("color","black");
					}
					$('#myModal').show();
				}
			});
		}
	})
})

		function close_pop() {
			$('#result').val('')
             $('#myModal').hide();
        };

</script>

<style>
.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }


</style>
</head>

<body class="bg-gradient">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
                                        <p class="mb-4">이름, 핸드폰번호를 입력해주세요</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="empNm" aria-describedby="emailHelp" placeholder="이름" name="empNm"><br>
                                            <input type="text" class="form-control form-control-user"
                                                id="empHp" aria-describedby="emailHelp" placeholder="핸드폰 번호"
                                                onkeyup="inputPhoneNumber(this);"  maxlength="13" name="empHp">
                                        </div>
                                        <div id="find">
                                        <a href="#" class="btn btn-primary btn-user btn-block">
                                            	찾기
                                        </a>
                                        </div>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/login/view">로그인</a>&nbsp/
                                        <a class="small" href="/findPwView"> 비밀번호 찾기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="/admin2form/vendor/jquery/jquery.min.js"></script>
    <script src="/admin2form/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/admin2form/js/sb-admin-2.min.js"></script>


<div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">아이디 찾기 결과</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br><span id="result"></span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
</div>

</body>

</html>