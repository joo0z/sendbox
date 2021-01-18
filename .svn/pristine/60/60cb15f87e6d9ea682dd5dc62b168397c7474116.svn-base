<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
   <title>SENDBOX</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="/loginform/images/icons/favicon.ico"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/select2/select2.min.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/loginform/css/util.css">
   <link rel="stylesheet" type="text/css" href="/loginform/css/main.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/js.cookie-2.2.1.min.js"></script>
<script>
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
	
	$('#codeCheck').hide();
	
	
	$('#find').on('click',function(){
		var empId = $('#empId').val()
		var empHp = $('#empHp').val()
		if(empId == ''){
			alert('아이디를 입력해주세요')
			$('#empId').focus()
		} else if(empHp == ''){
			alert('핸드폰번호를 입력해주세요')
			$('#empHp').focus()
		} else {
			$.ajax({
				url : "/findPw",
				data : {
					empId : empId,
					empHp : empHp
				},
				method : "post",
				success : function(data) {
					if(data.check == null){
						$('#result').html(data.result).css("color","red");
					} else {
						$('#result').html(data.result).css("color","black");
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


<body>
   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100 p-b-20">
         <form class="user" id="loginfrm" method="post">
<!--             <form class="login100-form validate-form"> -->
               <span class="login100-form-title p-b-10" style="font-size:2.0em; font-weight: bold;">
                  		비밀번호 찾기
               </span>
               <span class="login70-form-title p-b-10" style=" font-weight: bold; margin-left: 20%;">
                  		아이디, 핸드폰번호를 입력해주세요
               </span>
               <div class="wrap-input100 validate-input m-t-85 m-b-35">
                  <input class="input100" type="text" name="empId"  id="empId">
                  <span class="focus-input100" data-placeholder="아이디"></span>
               </div>

               <div class="wrap-input100 validate-input m-b-50">
                  <input class="input100" type="text" name="empHp" id="empHp" onkeyup="inputPhoneNumber(this);"  maxlength="13">
                  <span class="focus-input100" data-placeholder="핸드폰 번호" ></span>
               </div>
                 <div id="find">
                     <a href="#" class="login100-form-btn">
                         	찾기
                     </a>
                 </div>
<!--                  <input type="button" id="loginBtn" class="login100-form-btn" style="background-color: #002C91;" value="Login"> -->
                     
		</form>
               <ul class="login-more p-t-50" style="margin-left: 25%;">
                  <li class="m-b-8">
                     <a href="/login/view" class="txt2">
                       	로그인
                     </a>
                     <span class="txt2">/</span>
                     <a href="/findIdView" class="txt2">
                       	아이디 찾기
                     </a>
                  </li>

               </ul>
<!--             </form> -->
         </div>
      </div>
   </div>

   <div id="dropDownSelect1"></div>
   
<!--===============================================================================================-->
   <script src="/loginform/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="/loginform/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="/loginform/vendor/bootstrap/js/popper.js"></script>
   <script src="/loginform/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="/loginform/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
   <script src="/loginform/vendor/daterangepicker/moment.min.js"></script>
   <script src="/loginform/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="/loginform/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
   <script src="/loginform/js/main.js"></script>
   
   
   <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">비밀번호 찾기 결과</span></b></span></p>
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