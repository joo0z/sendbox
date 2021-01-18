<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
   <title>SENDBOX</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
<link rel="icon" type="image/png" href="/loginform/images/icons/s.png"/>
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/bootstrap/css/bootstrap.min.css">
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/fonts/iconic/css/material-design-iconic-font.min.css">
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/animate/animate.css">
<!--===============================================================================================    -->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/css-hamburgers/hamburgers.min.css">
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/animsition/css/animsition.min.css">
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/select2/select2.min.css">
<!--===============================================================================================    -->
   <link rel="stylesheet" type="text/css" href="/loginform/vendor/daterangepicker/daterangepicker.css">
<!--=============================================================================================== -->
   <link rel="stylesheet" type="text/css" href="/loginform/css/util.css">
   <link rel="stylesheet" type="text/css" href="/loginform/css/main.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/js.cookie-2.2.1.min.js"></script>
<script>

	$(function(){
	
		if (Cookies.get("REMEMBERME") == "Y") {
				$('#empId').attr('class','input100 has-val');
				$('#empId').val(Cookies.get("EMPID"));
				$('input[type=checkbox]').prop('checked', true);
			}

		$('#loginBtn').on('click', function() {
			empId = $('#empId').val()
			password = $('#password').val()

			if ($('#customCheck').is(":checked")) {
				Cookies.set("REMEMBERME", "Y");
				
				Cookies.set("EMPID", $('#empId').val());
			} else {
				Cookies.remove("REMEMBERME");
				Cookies.remove("USERNM");
			}

			$.ajax({
				url : "/login/process",
				data : {
					empId : empId,
					password : password
				},
				method : "post",
				success : function(data) {
					if (data.msg == "O") {
						location.href = "/main";
					} else {
						$('#loginFail').text(data.msg)
						$('#empId').val('')
						$('#password').val('')
					}
				}
			});
		})
	})
</script>   
</head>


<body>
   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100 p-b-20">
         <form class="user" id="loginfrm" method="post">
<!--             <form class="login100-form validate-form"> -->
               <span class="login100-form-title p-b-70" style="font-size:4.0em;">
                  SENDBOX
               </span>
 
               <div class="wrap-input100 validate-input m-t-85 m-b-35">
                  <input class="input100" type="text" name="empId"  id="empId">
                  <span class="focus-input100" data-placeholder="ID"></span>
               </div>

               <div class="wrap-input100 validate-input m-b-50">
                  <input class="input100" type="password" name="password" id="password">
                  <span class="focus-input100" data-placeholder="Password"></span>
               </div>
				<span id="loginFail" style="color : red;">
                </span>
                
                  <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                          <input type="checkbox"  class="custom-control-input" id="customCheck">
                          <label  class="custom-control-label" for="customCheck">Remember
                              Me</label>
                      </div>
                  </div>
                
                
                
<!--                <div class="container-login100-form-btn"> -->
                  <input type="button" id="loginBtn" class="login100-form-btn" style="background-color: #002C91;" value="Login">
                     
<!--                </div> -->
		</form>
               <ul class="login-more p-t-50" style="margin-left: 25%;">
                  <li class="m-b-8">
                     <a href="/findIdView" class="txt2">
                       	 아이디 찾기 
                     </a>
                     <span class="txt2">/</span>
                     <a href="/findPwView" class="txt2">
                       	비밀번호 찾기
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
<!--=============================================================================================== -->
   <script src="/loginform/vendor/animsition/js/animsition.min.js"></script>
<!--=============================================================================================== -->
   <script src="/loginform/vendor/bootstrap/js/popper.js"></script>
   <script src="/loginform/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--=============================================================================================== -->
   <script src="/loginform/vendor/select2/select2.min.js"></script>
<!--=============================================================================================== -->
   <script src="/loginform/vendor/daterangepicker/moment.min.js"></script>
   <script src="/loginform/vendor/daterangepicker/daterangepicker.js"></script>
<!--========================================================ㅊ======================================= -->
   <script src="/loginform/vendor/countdowntime/countdowntime.js"></script>
<!--=============================================================================================== -->
   <script src="/loginform/js/main.js"></script>

</body>
</html>