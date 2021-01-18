<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>업무게시판</title>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">

<style type="text/css">
	a{
		color: #858796;
	}
	#dataTable_filter{
		width: 200px;
		float: right;
	}
	label {
		width: 200px;
	}
</style>

<script>
$(document).ready(function(){
	$("#insertBtn").on("click", function() {
		document.location = "/insertNotice";
	});
});	

</script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">


                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h2 class="h3 mb-2 text-gray-800"><i class="fas fa-fw fa-money-check-alt" style="margin-left: 10px;"></i>&nbsp&nbsp급여 조회</h2>
                    <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
<!--                         <div class="card-header py-3"> -->
<!--                             <h6 class="m-0 font-weight-bold text-primary"> <a target="_blank" href="#"><i class="fas fa-fw fa-head-side-cough-slash" style="margin-left: 10px;"></i>&nbsp업무시간 마스크는 필수입니다.</a></h6> -->
<!--                         </div> -->
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                                <table class="table table-bordered"  cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>지급일자</th>
                                            <th>급여액</th>
                                            <th>상세조회</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2020-11-10</td>
                                            <td>300만원</td>
                                            <td>상세조회</td>
                                        </tr>
                                        <tr>
                                            <td>2020-10-10</td>
                                            <td>상세조회</td>
                                            <td>상세조회</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
						</div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
<!--     <a class="scroll-to-top rounded" href="#page-top"> -->
<!--         <i class="fas fa-angle-up"></i> -->
<!--     </a> -->

    <!-- Core plugin JavaScript-->
    <script src="/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/admin2form/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/admin2form/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/admin2form/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/admin2form/js/demo/datatables-demo.js"></script>

</body>

</html>