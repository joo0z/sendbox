<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5,maximum=0.5, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>sendbox</title>
    
    
    
	<!-- commonLib  -->
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/admin2form/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/admin2form/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/admin2form/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin2form/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/admin2form/js/sb-admin-2.min.js"></script>
    
    
    
    
    
    
    
	<script src='https://meet.jit.si/external_api.js'></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			var nickName = "${EMP.empNm}" + " " + "${jobTitleName}"
			document.body.style.zoom = "70%";
			
			const domain = 'meet.jit.si';
			const options = {
			    roomName: "${faceChatRoomId}",
			    width: 700,
			    height: 700,
			    userInfo: {
			        displayName: nickName
			    },
			    parentNode: document.querySelector('#meet')
			};
			const api = new JitsiMeetExternalAPI(domain, options);
		});
		
	</script>
	
</head>




<body>
	
	<div id="meet"></div>

</body>
</html>