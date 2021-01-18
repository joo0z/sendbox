<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <script type="text/javascript" src="/js/js.cookie-2.2.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SENDBOX</title>

    <!-- Custom fonts for this template-->
    <link href="/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/admin2form/css/sb-admin-2.min.css" rel="stylesheet">
    

<script>

	$(function(){
	
		if (Cookies.get("REMEMBERME") == "Y") {
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

<body class="bg-gradient-default">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-7 col-md-7">

                <div class="card o-hidden border-0 shadow-lg my-4">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div><img style="width: 130%; height:80%; margin-top: 10%;" src="/images/123.png"></div>
                            <div class="col-lg-9" style="margin-left:12%;">
                                <div class="p-3">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-5">로그인</h1>
                                    </div>
                                    <form class="user" id="loginfrm" method="post">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="empId"
                                                id="empId" aria-describedby="emailHelp"
                                                placeholder="Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="password" placeholder="Password" name="password">
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
                                        <input type="button" value="로그인" id="loginBtn" class="btn btn-primary btn-user btn-block">
                                        <hr>
                                    </form>
                                    <div class="text-center">
                                        <a class="small" href="/findIdView">아이디 찾기</a>&nbsp/
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

</body>

</html>